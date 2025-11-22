#include <dirent.h>
#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include "doltool.h"
#include "gcm.h"

#define PATH_MAX 4096

uint32_t GCM_HEADER_SIZE = 0x2440;
uint32_t TGC_HEADER_SIZE = 0x8000;

#define MAX_FST_ENTRIES 10000
#define MAX_STRING_TABLE_SIZE 0x1000000

typedef struct {
    bool is_dir;
    int name_offset;
    int file_offset;
    int file_size;
    int parent_offset;
    int next_offset;
} fst_entry_t;

typedef struct {
    fst_entry_t *entries;
    int num_entries;
    char *string_table;
    int string_table_size;
} fst_t;

static int is_tgc(const char *name) {
    return strlen(name) > 4 && strcmp(name + strlen(name) - 4, ".tgc") == 0;
}

static int is_dir(const char *dirname, const char *filename) {
    char path[PATH_MAX];
    snprintf(path, sizeof(path), "%s%s", dirname, filename);
    struct stat s;
    if (stat(path, &s) != 0) {
        fprintf(stderr,"Could not stat %s\n", path);
        return 0;
    }
    return S_ISDIR(s.st_mode);
}

static void fst_init(fst_t *fst) {
    fst->entries = malloc(MAX_FST_ENTRIES * sizeof(fst_entry_t));
    fst->num_entries = 0;
    fst->string_table = malloc(MAX_STRING_TABLE_SIZE);
    fst->string_table_size = 0;
}

static int fst_add_file(fst_t *fst, const char *name) {
    if (fst->num_entries >= MAX_FST_ENTRIES) {
        fprintf(stderr,"Too many files\n");
        return 0;
    }
    if (fst->string_table_size + strlen(name) + 1 >= MAX_STRING_TABLE_SIZE) {
        fprintf(stderr,"String table too large\n");
        return 0;
    }

    fst_entry_t *entry = &fst->entries[fst->num_entries];
    entry->is_dir = false;
    entry->name_offset = fst->string_table_size;
    entry->file_offset = -1;
    entry->file_size = -1;

    strcpy(&fst->string_table[fst->string_table_size], name);
    fst->num_entries++;
    fst->string_table_size += strlen(name) + 1;
    return 1;
}

static int fst_add_dir(fst_t *fst, const char* parent, const char *name, int parent_offset) {
    DIR *dir;
    struct dirent *dirent;

    int i = fst->num_entries++;
    fst_entry_t *entry = &fst->entries[i];
    entry->is_dir = true;

    if (parent_offset == -1) {
        entry->name_offset = 0;
        entry->parent_offset = 0;
    } else {
        entry->name_offset = fst->string_table_size;
        entry->parent_offset = parent_offset;
        strcpy(&fst->string_table[fst->string_table_size], name);
        fst->string_table_size += strlen(name) + 1;
    }

    char dirname[PATH_MAX];
    if (strlen(parent) == 0 && strlen(name) == 0) {
        strcpy(dirname, "");
        dir = opendir(".");
    } else {
        snprintf(dirname, sizeof(dirname), "%s%s/", parent, name);
        dir = opendir(dirname);
    }
    if (!dir) {
        fprintf(stderr,"Could not open directory %s\n", dirname);
        return 0;
    }

    while ((dirent = readdir(dir)) != NULL) {
        if (dirent->d_name[0] == '.'
            || strcmp(dirent->d_name, "header.bin") == 0
            || strcmp(dirent->d_name, "apploader.img") == 0
            || strcmp(dirent->d_name, "main.dol") == 0) {
            continue;
        }

        if (is_dir(dirname, dirent->d_name) && !is_tgc(dirent->d_name)) {
            if (!fst_add_dir(fst, dirname, dirent->d_name, i)) {
                closedir(dir);
                return 0;
            }
        } else {
            if (!fst_add_file(fst, dirent->d_name)) {
                closedir(dir);
                return 0;
            }
        }
    }

    entry->next_offset = fst->num_entries;
    closedir(dir);
    return 1;
}

static void fst_destroy(fst_t *fst) {
    free(fst->entries);
    free(fst->string_table);
}

static size_t align(size_t offset, size_t alignment) {
  return (offset + alignment - 1) & ~(alignment - 1);
}

static int pack_gcm(FILE *f, const char *dirname, bool is_tgc, uint32_t start_offset, uint32_t *end_offset);

static int pack_file(FILE *f, const char *dirname, const char *name, uint32_t start_offset, uint32_t *end_offset) {
    char filename[PATH_MAX];
    snprintf(filename, sizeof(filename), "%s%s", dirname, name);
    if (verbose) {
        printf("Packing %s.\n", filename);
    }
    FILE *input = fopen(filename, "rb");
    if(!input){
        fprintf(stderr,"Could not open %s for reading\n",filename);
        return 0;
    }

    fseek(f, start_offset, SEEK_SET);
    uint8_t buffer[0x8000];
    size_t total = 0;
    size_t read;
    while ((read = fread(buffer, 1, sizeof(buffer), input)) > 0) {
        fwrite(buffer, 1, read, f);
        if (ferror(f)) {
            fprintf(stderr,"Could not write to gcm\n");
            fclose(input);
            return 0;
        }
        total += read;
    }

    fclose(input);
    *end_offset = start_offset + total;
    return 1;
}

static int pack_files(FILE *f, fst_t *fst, const char *dirname, int start, int end, uint32_t file_base_offset, uint32_t start_offset, uint32_t *end_offset) {
    *end_offset = start_offset;

    for (int i = start; i < end; i++) {
        fst_entry_t *entry = &fst->entries[i];
        const char *name = &fst->string_table[entry->name_offset];

        // Streaming audio files in particular must be aligned to 32 KiB
        start_offset = align(start_offset, 0x8000);

        if (entry->is_dir) {
            char subdirname[PATH_MAX];
            snprintf(subdirname, sizeof(subdirname), "%s%s/", dirname, name);
            if (!pack_files(f, fst, subdirname, i + 1, entry->next_offset, file_base_offset, start_offset, end_offset)) {
                return 0;
            }

            i = entry->next_offset - 1;
            start_offset = *end_offset;
        } else if (is_tgc(name)) {
            char subdirname[PATH_MAX];
            snprintf(subdirname, sizeof(subdirname), "%s%s/", dirname, name);
            if (!pack_gcm(f, subdirname, true, start_offset, end_offset)) {
                return 0;
            }

            entry->file_offset = start_offset - file_base_offset;
            entry->file_size = *end_offset - start_offset;
            start_offset = *end_offset;
        } else {
            if (!pack_file(f, dirname, name, start_offset, end_offset)) {
                return 0;
            }
            entry->file_offset = start_offset - file_base_offset;
            entry->file_size = *end_offset - start_offset;
            start_offset = *end_offset;
        }
    }

    return 1;
}

static int pack_gcm(FILE *f, const char *dirname, bool is_tgc, uint32_t start_offset, uint32_t *end_offset) {
    char path[PATH_MAX];
    uint8_t *gcm_header = malloc(GCM_HEADER_SIZE);
    if(!gcm_header){
        fprintf(stderr,"Could not allocate %d bytes for gcm header\n",GCM_HEADER_SIZE);
        return 0;
    }

    snprintf(path, sizeof(path), "%sheader.bin", dirname);
    FILE *header_file = fopen(path, "rb");
    if(!header_file){
        fprintf(stderr,"Could not open header.bin\n");
        free(gcm_header);
        return 0;
    }
    int bytesread = fread(gcm_header, 1, GCM_HEADER_SIZE, header_file);
    if (bytesread != GCM_HEADER_SIZE || ferror(header_file)) {
        fprintf(stderr,"Could not read header.bin\n");
        free(gcm_header);
        fclose(header_file);
        return 0;
    }
    fclose(header_file);

    struct stat sbuffer;
    snprintf(path, sizeof(path), "%sapploader.img", dirname);
    if (stat(path, &sbuffer) == -1) {
        fprintf(stderr,"Could not stat apploader.img\n");
        free(gcm_header);
        return 0;
    }
    uint32_t apploader_size = sbuffer.st_size;

    snprintf(path, sizeof(path), "%smain.dol", dirname);
    if (stat(path, &sbuffer) == -1) {
        fprintf(stderr,"Could not stat main.dol\n");
        free(gcm_header);
        return 0;
    }
    uint32_t dol_size = sbuffer.st_size;

    fst_t fst;
    fst_init(&fst);

    if (!fst_add_dir(&fst, dirname, "", -1)) {
        free(gcm_header);
        fst_destroy(&fst);
        return 0;
    }

    fseek(f, start_offset, SEEK_SET);
    uint32_t gcm_offset = 0;
    uint32_t fst_size = fst.num_entries * 0x0C + fst.string_table_size;

    uint32_t apploader_offset = GCM_HEADER_SIZE;
    uint32_t fst_offset = align(GCM_HEADER_SIZE + apploader_size, 0x100);
    uint32_t dol_offset = align(fst_offset + fst_size, 0x100);
    if (is_tgc) {
        uint8_t *tgc_header = malloc(TGC_HEADER_SIZE);
        if(!tgc_header){
            fprintf(stderr,"Could not allocate %d bytes for tgc header\n",TGC_HEADER_SIZE);
            free(gcm_header);
            fst_destroy(&fst);
            return 0;
        }

        memset(tgc_header, 0, TGC_HEADER_SIZE);
        *(uint32_t*)&tgc_header[0x00] = REVERSEENDIAN32((uint32_t)0xAE0F38A2);
        *(uint32_t*)&tgc_header[0x08] = REVERSEENDIAN32(TGC_HEADER_SIZE);
        *(uint32_t*)&tgc_header[0x0C] = REVERSEENDIAN32((uint32_t)0x00100000);
        *(uint32_t*)&tgc_header[0x10] = REVERSEENDIAN32(fst_offset + TGC_HEADER_SIZE);
        *(uint32_t*)&tgc_header[0x14] = REVERSEENDIAN32(fst_size);
        *(uint32_t*)&tgc_header[0x18] = REVERSEENDIAN32(fst_size);
        *(uint32_t*)&tgc_header[0x1C] = REVERSEENDIAN32(dol_offset + TGC_HEADER_SIZE);
        *(uint32_t*)&tgc_header[0x20] = REVERSEENDIAN32(dol_size);
        *(uint32_t*)&tgc_header[0x24] = REVERSEENDIAN32(TGC_HEADER_SIZE);
        *(uint32_t*)&tgc_header[0x28] = REVERSEENDIAN32(fst_offset - TGC_HEADER_SIZE);

        fwrite(tgc_header, 1, TGC_HEADER_SIZE, f);
        free(tgc_header);
        gcm_offset = TGC_HEADER_SIZE;
    }

    *(uint32_t*)&gcm_header[0x420] = REVERSEENDIAN32(dol_offset);
    *(uint32_t*)&gcm_header[0x424] = REVERSEENDIAN32(fst_offset);
    *(uint32_t*)&gcm_header[0x428] = REVERSEENDIAN32(fst_size);
    *(uint32_t*)&gcm_header[0x42C] = REVERSEENDIAN32(fst_size);
    fwrite(gcm_header, 1, GCM_HEADER_SIZE, f);
    free(gcm_header);

    uint32_t file_offset;
    if (!pack_file(f, dirname, "apploader.img", start_offset + gcm_offset + apploader_offset, &file_offset)) {
        fst_destroy(&fst);
        return 0;
    }

    if (!pack_file(f, dirname, "main.dol", start_offset + gcm_offset + dol_offset, &file_offset)) {
        fst_destroy(&fst);
        return 0;
    }

    if (!pack_files(f, &fst, dirname, 1, fst.num_entries, start_offset + gcm_offset, file_offset, &file_offset)) {
        fst_destroy(&fst);
        return 0;
    }

    fseek(f, start_offset + gcm_offset + fst_offset, SEEK_SET);
    for (int i = 0; i < fst.num_entries; i++) {
        fst_entry_t *entry = &fst.entries[i];
        uint8_t buffer[0x0C];
        memset(buffer, 0, sizeof(buffer));

        if (entry->is_dir) {
            *(uint32_t*)&buffer[0] = REVERSEENDIAN32(0x01000000 | entry->name_offset);
            *(uint32_t*)&buffer[4] = REVERSEENDIAN32(entry->parent_offset);
            *(uint32_t*)&buffer[8] = REVERSEENDIAN32(entry->next_offset);
        } else {
            *(uint32_t*)&buffer[0] = REVERSEENDIAN32(0x00000000 | entry->name_offset);
            *(uint32_t*)&buffer[4] = REVERSEENDIAN32(entry->file_offset);
            *(uint32_t*)&buffer[8] = REVERSEENDIAN32(entry->file_size);
        }
        fwrite(buffer, 1, sizeof(buffer), f);
    }
    fwrite(fst.string_table, 1, fst.string_table_size, f);
    fst_destroy(&fst);

    // Pad with zeroes if necessary
    uint32_t prev_file_offset = file_offset;
    file_offset = align(file_offset, 0x8000);
    if (file_offset != prev_file_offset) {
        fseek(f, file_offset - 1, SEEK_SET);
        fputc(0, f);
    }

    *end_offset = file_offset;
    return 1;
}

int create_gcm_archive(const char *dir, const char *output) {
    FILE *isofile = fopen(output, "wb");
    if(!isofile){
        fprintf(stderr,"Could not open %s iso file\n",output);
        return 0;
    }

    char cwd[1024];
    if (!getcwd(cwd, sizeof(cwd))) {
        fprintf(stderr,"Could not get current working directory\n");
        return 0;
    }

    if (chdir(dir) == -1) {
        fprintf(stderr,"Could not chdir to %s\n",dir);
        return 0;
    }

    uint32_t end_offset;
    if (!pack_gcm(isofile, "", false, 0, &end_offset)) {
        fclose(isofile);
        return 0;
    }

    fclose(isofile);
    if (chdir(cwd) == -1) {
        fprintf(stderr,"Could not chdir back to %s\n",cwd);
        return 0;
    }

    return 1;
}

static int extract_file(FILE *f, const char *dirname, const char *name, uint32_t offset, size_t size) {
    char filename[PATH_MAX];
    snprintf(filename, sizeof(filename), "%s%s", dirname, name);

    if (verbose) {
        printf("Writing %s.\n", filename);
    }

    FILE *outfile = fopen(filename, "wb");
    if(!outfile){
        fprintf(stderr,"Could not open %s for writing\n",filename);
        return 0;
    }

    uint8_t buffer[0x8000];
    fseek(f, offset, SEEK_SET);
    size_t read;
    while (size > 0) {
        read = fread(buffer, 1, size > sizeof(buffer) ? sizeof(buffer) : size, f);
        if (read == 0) {
            fprintf(stderr,"Could not read %s\n",filename);
            fclose(outfile);
            return 0;
        }
        fwrite(buffer, 1, read, outfile);
        if (ferror(outfile)) {
            fprintf(stderr,"Could not write to %s\n",filename);
            fclose(outfile);
            return 0;
        }
        size -= read;
    }

    fclose(outfile);
    return 1;
}

static int create_directory(const char *name) {
    if(mkdir(name, 0755)==-1 && errno != EEXIST) {
        fprintf(stderr,"Could not mkdir %s\n",name);
        return 0;
    }
    return 1;
}

static int extract_tgc(FILE *f, const char *dirname, uint32_t tgc_offset);

static int extract_gcm_files(FILE *f, const char *dirname, uint8_t *fst, const char *string_table, int start, int end, uint32_t file_base_offset) {
    for (int i = start; i < end; i++) {
        uint8_t *entry = fst + i * 0x0C;
        const char *name = &string_table[be32(entry) & 0x00FFFFFF];

        if (entry[0] == 0) { // file
            uint32_t offset = be32(entry + 4);
            uint32_t size = be32(entry + 8);

            if (is_tgc(name)) {
                char subdirname[PATH_MAX];
                snprintf(subdirname, sizeof(subdirname), "%s%s/", dirname, name);
                if (!create_directory(subdirname)) {
                    return 0;
                }

                if (!extract_tgc(f, subdirname, offset + file_base_offset)) {
                    return 0;
                }
            } else {
                if (!extract_file(f, dirname, name, offset + file_base_offset, size)) {
                    return 0;
                }
            }
        } else if (entry[0] == 1) { // directory
            uint32_t next_offset = be32(entry + 8);
            char subdirname[PATH_MAX];
            snprintf(subdirname, sizeof(subdirname), "%s%s/", dirname, name);
            if (!create_directory(subdirname)) {
                return 0;
            }

            if (!extract_gcm_files(f, subdirname, fst, string_table, i + 1, next_offset, file_base_offset)) {
                return 0;
            }
            i = next_offset - 1;
        } else {
            fprintf(stderr,"Invalid fst entry\n");
            return 0;
        }
    }

    return 1;
}

static int extract_gcm(FILE *f, const char *dirname, uint32_t gcm_offset, uint32_t fst_offset, uint32_t fst_size, uint32_t file_base_offset, uint32_t dol_offset) {
    if (!extract_file(f, dirname, "header.bin", gcm_offset, GCM_HEADER_SIZE)) {
        return 0;
    }

    uint32_t apploader_header_size = 0x20;
    uint8_t *apploader_header = malloc(apploader_header_size);
    if(!apploader_header){
        fprintf(stderr,"Could not allocate %d bytes for apploader header\n",apploader_header_size);
        return 0;
    }

    fseek(f, gcm_offset + GCM_HEADER_SIZE, SEEK_SET);
    int bytesread = fread(apploader_header, 1, apploader_header_size, f);
    if (bytesread != apploader_header_size || ferror(f)) {
        fprintf(stderr,"Could not read apploader header\n");
        free(apploader_header);
        return 0;
    }
    uint32_t apploader_size = be32(apploader_header + 0x14);
    uint32_t apploader_trailer_size = be32(apploader_header + 0x18);
    free(apploader_header);

    if (!extract_file(f, dirname, "apploader.img", gcm_offset + GCM_HEADER_SIZE, apploader_header_size + apploader_size + apploader_trailer_size)) {
        return 0;
    }

    uint32_t dol_header_size = sizeof(dol_hdr_t);
    uint8_t *dol_header = malloc(dol_header_size);
    if(!dol_header){
        fprintf(stderr,"Could not allocate %d bytes for dol header\n",dol_header_size);
        return 0;
    }

    fseek(f, dol_offset, SEEK_SET);
    bytesread = fread(dol_header, 1, dol_header_size, f);
    if (bytesread != dol_header_size || ferror(f)) {
        fprintf(stderr,"Could not read dol header\n");
        free(dol_header);
        return 0;
    }

    dol_hdr_t hdr;
    dol_parse_header(&hdr, dol_header);
    uint32_t dolsize = dol_compute_size(&hdr);
    free(dol_header);

    if (!extract_file(f, dirname, "main.dol", dol_offset, dolsize)) {
        return 0;
    }

    uint8_t *fst = malloc(fst_size);
    if(!fst){
        fprintf(stderr,"Could not allocate %d bytes for fst\n",fst_size);
        return 0;
    }

    fseek(f, fst_offset, SEEK_SET);
    bytesread = fread(fst, 1, fst_size, f);
    if (bytesread != fst_size || ferror(f)) {
        fprintf(stderr,"Could not read fst\n");
        free(fst);
        return 0;
    }

    uint32_t num_entries = be32(fst + 0x08);
    const char *string_table = (char*)&fst[num_entries * 0x0C];
    if (!extract_gcm_files(f, dirname, fst, string_table, 1, num_entries, file_base_offset)) {
        free(fst);
        return 0;
    }
    free(fst);

    return 1;
}

static int extract_tgc(FILE *f, const char *dirname, uint32_t tgc_offset) {
    uint32_t tgc_header_size = 0x38;
    uint8_t *tgc_header = malloc(tgc_header_size);
    if(!tgc_header){
        fprintf(stderr,"Could not allocate %d bytes for tgc header\n",tgc_header_size);
        return 0;
    }

    fseek(f, tgc_offset, SEEK_SET);
    int bytesread = fread(tgc_header, 1, tgc_header_size, f);
    if (bytesread != tgc_header_size || ferror(f)) {
        fprintf(stderr,"Could not read tgc header\n");
        free(tgc_header);
        return 0;
    }

    if (be32(tgc_header) != 0xAE0F38A2) {
        fprintf(stderr,"Invalid tgc file\n");
        free(tgc_header);
        return 0;
    }

    uint32_t gcm_offset = tgc_offset + be32(tgc_header + 0x8);
    uint32_t fst_offset = tgc_offset + be32(tgc_header + 0x10);
    uint32_t fst_size = be32(tgc_header + 0x14);
    uint32_t base_offset = tgc_offset + be32(tgc_header + 0x24) - be32(tgc_header + 0x34);
    uint32_t dol_offset = tgc_offset + be32(tgc_header + 0x1C);

    free(tgc_header);

    return extract_gcm(f, dirname, gcm_offset, fst_offset, fst_size, base_offset, dol_offset);
}

int extract_gcm_archive(const char *input, const char *outdir) {
    FILE *isofile = fopen(input, "rb");
    if(!isofile){
        fprintf(stderr,"Could not open %s iso file\n",input);
        return 0;
    }

    char cwd[1024];
    if (!getcwd(cwd, sizeof(cwd))) {
        fprintf(stderr,"Could not get current working directory\n");
        return 0;
    }

    if (chdir(outdir) == -1) {
        fprintf(stderr,"Could not chdir to %s\n",outdir);
        return 0;
    }

    uint8_t *data = (uint8_t*)malloc(GCM_HEADER_SIZE);
    if(!data){
        fprintf(stderr,"Could not allocate %d bytes for iso header\n",GCM_HEADER_SIZE);
        fclose(isofile);
        return 0;
    }

    int bytesread = fread(data, 1, GCM_HEADER_SIZE, isofile);
    if (bytesread != GCM_HEADER_SIZE || ferror(isofile)) {
        fprintf(stderr,"Could not read iso header\n");
        free(data);
        fclose(isofile);
        return 0;
    }

    if (be32(data + 0x1C) != 0xC2339F3D) {
        fprintf(stderr,"%s is an invalid iso file!\n",input);
        free(data);
        fclose(isofile);
        return 0;
    }

    uint32_t doloffset = be32(data + 0x420);
    uint32_t fstoffset = be32(data + 0x424);
    uint32_t fstsize = be32(data + 0x428);

    free(data);

    if (!extract_gcm(isofile, "", 0, fstoffset, fstsize, 0, doloffset)) {
        fclose(isofile);
        return 0;
    }

    fclose(isofile);
    if (chdir(cwd) == -1) {
        fprintf(stderr,"Could not chdir back to %s\n",cwd);
        return 0;
    }

    return 1;
}
