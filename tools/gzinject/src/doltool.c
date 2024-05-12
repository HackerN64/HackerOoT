#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <string.h>

#include "doltool.h"
#include "gzinject.h"

void dol_parse_header(dol_hdr_t* hdr, uint8_t *data) {
    memcpy(hdr,data,sizeof(*hdr));

    for(int i=0;i<7;i++){
        hdr->text_size[i] = REVERSEENDIAN32(hdr->text_size[i]);
        hdr->text_offset[i] = REVERSEENDIAN32(hdr->text_offset[i]);
        hdr->text_loading[i] = REVERSEENDIAN32(hdr->text_loading[i]);
    }
    for(int i=0;i<11;i++){
        hdr->data_size[i] = REVERSEENDIAN32(hdr->data_size[i]);
        hdr->data_offset[i] = REVERSEENDIAN32(hdr->data_offset[i]);
        hdr->data_loading[i] = REVERSEENDIAN32(hdr->data_loading[i]);
    }
    hdr->bss_loading = REVERSEENDIAN32(hdr->bss_loading);
    hdr->bss_size = REVERSEENDIAN32(hdr->bss_size);
    hdr->entry = REVERSEENDIAN32(hdr->entry);
}

size_t dol_compute_size(dol_hdr_t* hdr){
    size_t max_end_offset = 0;
    for(int i=0;i<7;i++){
        if(hdr->text_offset[i] + hdr->text_size[i] > max_end_offset){
            max_end_offset = hdr->text_offset[i] + hdr->text_size[i];
        }
    }
    for(int i=0;i<11;i++){
        if(hdr->data_offset[i] + hdr->data_size[i] > max_end_offset){
            max_end_offset = hdr->data_offset[i] + hdr->data_size[i];
        }
    }
    return max_end_offset;
}

void dol_load(doltool_ctxt_t *ctxt, uint8_t **file_data, uint32_t *file_size){

    ctxt->file_data = file_data;
    ctxt->file_size = file_size;

    dol_parse_header(&ctxt->hdr,*(ctxt->file_data));

    for(int i=0;i<7;i++){
        if(ctxt->hdr.text_size[i]>0){
            ctxt->text_sections[i] = *(ctxt->file_data) + ctxt->hdr.text_offset[i];
        }
    }
    for(int i=0;i<11;i++){
        if(ctxt->hdr.data_size[i]>0){
            ctxt->data_sections[i] = *(ctxt->file_data) + ctxt->hdr.data_offset[i];
        }
    }
}

void dol_inject(doltool_ctxt_t *ctxt, uint8_t *text, size_t size, uint32_t loading_addr){
    int injection_idx = 0;
    size = addpadding(size,16);
    for(int i = 0;i<7;i++){
        if(ctxt->text_sections[i]) continue;
        injection_idx = i;
        ctxt->text_sections[i] = text;
        ctxt->hdr.text_loading[i] = loading_addr;
        ctxt->hdr.text_offset[i] = ctxt->hdr.data_offset[0];
        ctxt->hdr.text_size[i] = size;
        break;
    }
    for(int i=0;i<11;i++){
        if(ctxt->data_sections[i]){
            ctxt->hdr.data_offset[i] += ctxt->hdr.text_size[injection_idx];
        }else{
            break;
        }
    }
}

size_t dol_save(doltool_ctxt_t *ctxt){
    uint32_t text_sizes[7];
    uint32_t data_sizes[11];
    memcpy(text_sizes,ctxt->hdr.text_size,sizeof(ctxt->hdr.text_size));
    memcpy(data_sizes,ctxt->hdr.data_size,sizeof(ctxt->hdr.data_size));
    uint32_t totalsize = 0x100;
    for(int i=0;i<7;i++){
        totalsize += ctxt->hdr.text_size[i];
        ctxt->hdr.text_size[i] = REVERSEENDIAN32(ctxt->hdr.text_size[i]);
        ctxt->hdr.text_offset[i] = REVERSEENDIAN32(ctxt->hdr.text_offset[i]);
        ctxt->hdr.text_loading[i] = REVERSEENDIAN32(ctxt->hdr.text_loading[i]);
    }
    for(int i=0;i<11;i++){
        totalsize += ctxt->hdr.data_size[i];
        ctxt->hdr.data_size[i] = REVERSEENDIAN32(ctxt->hdr.data_size[i]);
        ctxt->hdr.data_offset[i] = REVERSEENDIAN32(ctxt->hdr.data_offset[i]);
        ctxt->hdr.data_loading[i] = REVERSEENDIAN32(ctxt->hdr.data_loading[i]);
    }
    ctxt->hdr.bss_loading = REVERSEENDIAN32(ctxt->hdr.bss_loading);
    ctxt->hdr.bss_size = REVERSEENDIAN32(ctxt->hdr.bss_size);
    ctxt->hdr.entry = REVERSEENDIAN32(ctxt->hdr.entry);

    uint8_t *new_data = malloc(totalsize);
    if(!new_data){
        perror("Could not allocate new dol");
        return 0;
    }
    memcpy(new_data,&ctxt->hdr,sizeof(ctxt->hdr));
    uint8_t *p = new_data + sizeof(ctxt->hdr);
    for(int i=0;i<7;i++){
        if(ctxt->text_sections[i]){
            memcpy(p,ctxt->text_sections[i],text_sizes[i]);
            p += text_sizes[i];
        }
    }
    for(int i=0;i<11;i++){
        if(ctxt->data_sections[i]){
            memcpy(p,ctxt->data_sections[i],data_sizes[i]);
            p += data_sizes[i];
        }
    }
    free(*(ctxt->file_data));
    *(ctxt->file_data) = new_data;
    if(ctxt->file_size){
        *(ctxt->file_size) = totalsize;
    }
    return totalsize;
}
