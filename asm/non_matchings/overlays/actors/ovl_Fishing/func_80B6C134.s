.rdata
glabel D_80B7B0A0
    .asciz "../z_fishing.c"
    .balign 4

glabel D_80B7B0B0
    .asciz "../z_fishing.c"
    .balign 4

glabel D_80B7B0C0
    .asciz "../z_fishing.c"
    .balign 4

.late_rodata
glabel D_80B7B3CC
    .float 670.0

glabel D_80B7B3D0
    .float 0.02

.text
glabel func_80B6C134
/* 02794 80B6C134 27BDFF90 */  addiu   $sp, $sp, 0xFF90           ## $sp = FFFFFF90
/* 02798 80B6C138 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 0279C 80B6C13C AFB10038 */  sw      $s1, 0x0038($sp)           
/* 027A0 80B6C140 AFB00034 */  sw      $s0, 0x0034($sp)           
/* 027A4 80B6C144 8C850000 */  lw      $a1, 0x0000($a0)           ## 00000000
/* 027A8 80B6C148 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 027AC 80B6C14C 3C0680B8 */  lui     $a2, %hi(D_80B7B0A0)       ## $a2 = 80B80000
/* 027B0 80B6C150 24C6B0A0 */  addiu   $a2, $a2, %lo(D_80B7B0A0)  ## $a2 = 80B7B0A0
/* 027B4 80B6C154 27A40058 */  addiu   $a0, $sp, 0x0058           ## $a0 = FFFFFFE8
/* 027B8 80B6C158 24070A0C */  addiu   $a3, $zero, 0x0A0C         ## $a3 = 00000A0C
/* 027BC 80B6C15C 0C031AB1 */  jal     Graph_OpenDisps              
/* 027C0 80B6C160 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 027C4 80B6C164 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 027C8 80B6C168 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 027CC 80B6C16C 35EF0024 */  ori     $t7, $t7, 0x0024           ## $t7 = DB060024
/* 027D0 80B6C170 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 027D4 80B6C174 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 027D8 80B6C178 3C030001 */  lui     $v1, 0x0001                ## $v1 = 00010000
/* 027DC 80B6C17C 00711821 */  addu    $v1, $v1, $s1              
/* 027E0 80B6C180 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 027E4 80B6C184 8C631DE4 */  lw      $v1, 0x1DE4($v1)           ## 00011DE4
/* 027E8 80B6C188 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 027EC 80B6C18C 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 027F0 80B6C190 00035040 */  sll     $t2, $v1,  1               
/* 027F4 80B6C194 000A5823 */  subu    $t3, $zero, $t2            
/* 027F8 80B6C198 24190040 */  addiu   $t9, $zero, 0x0040         ## $t9 = 00000040
/* 027FC 80B6C19C 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 02800 80B6C1A0 240C0010 */  addiu   $t4, $zero, 0x0010         ## $t4 = 00000010
/* 02804 80B6C1A4 240D0010 */  addiu   $t5, $zero, 0x0010         ## $t5 = 00000010
/* 02808 80B6C1A8 AFAD0028 */  sw      $t5, 0x0028($sp)           
/* 0280C 80B6C1AC AFAC0024 */  sw      $t4, 0x0024($sp)           
/* 02810 80B6C1B0 AFA90018 */  sw      $t1, 0x0018($sp)           
/* 02814 80B6C1B4 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 02818 80B6C1B8 AFAB001C */  sw      $t3, 0x001C($sp)           
/* 0281C 80B6C1BC AFB80010 */  sw      $t8, 0x0010($sp)           
/* 02820 80B6C1C0 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 02824 80B6C1C4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 02828 80B6C1C8 AFA20054 */  sw      $v0, 0x0054($sp)           
/* 0282C 80B6C1CC 00603025 */  or      $a2, $v1, $zero            ## $a2 = 00010000
/* 02830 80B6C1D0 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 02834 80B6C1D4 000338C0 */  sll     $a3, $v1,  3               
/* 02838 80B6C1D8 8FA80054 */  lw      $t0, 0x0054($sp)           
/* 0283C 80B6C1DC 3C18C3E1 */  lui     $t8, 0xC3E1                ## $t8 = C3E10000
/* 02840 80B6C1E0 3718EB32 */  ori     $t8, $t8, 0xEB32           ## $t8 = C3E1EB32
/* 02844 80B6C1E4 AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 02848 80B6C1E8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0284C 80B6C1EC 3C0FFA00 */  lui     $t7, 0xFA00                ## $t7 = FA000000
/* 02850 80B6C1F0 3C0180B8 */  lui     $at, %hi(D_80B7B3CC)       ## $at = 80B80000
/* 02854 80B6C1F4 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 02858 80B6C1F8 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 0285C 80B6C1FC AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 02860 80B6C200 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 02864 80B6C204 C42CB3CC */  lwc1    $f12, %lo(D_80B7B3CC)($at) 
/* 02868 80B6C208 3C01C1C0 */  lui     $at, 0xC1C0                ## $at = C1C00000
/* 0286C 80B6C20C 44817000 */  mtc1    $at, $f14                  ## $f14 = -24.00
/* 02870 80B6C210 3C06C416 */  lui     $a2, 0xC416                ## $a2 = C4160000
/* 02874 80B6C214 0C034261 */  jal     Matrix_Translate              
/* 02878 80B6C218 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0287C 80B6C21C 3C0180B8 */  lui     $at, %hi(D_80B7B3D0)       ## $at = 80B80000
/* 02880 80B6C220 C42CB3D0 */  lwc1    $f12, %lo(D_80B7B3D0)($at) 
/* 02884 80B6C224 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 02888 80B6C228 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 0288C 80B6C22C 44066000 */  mfc1    $a2, $f12                  
/* 02890 80B6C230 0C0342A3 */  jal     Matrix_Scale              
/* 02894 80B6C234 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 02898 80B6C238 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0289C 80B6C23C 3C09DA38 */  lui     $t1, 0xDA38                ## $t1 = DA380000
/* 028A0 80B6C240 35290003 */  ori     $t1, $t1, 0x0003           ## $t1 = DA380003
/* 028A4 80B6C244 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 028A8 80B6C248 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 028AC 80B6C24C AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 028B0 80B6C250 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 028B4 80B6C254 3C0580B8 */  lui     $a1, %hi(D_80B7B0B0)       ## $a1 = 80B80000
/* 028B8 80B6C258 24A5B0B0 */  addiu   $a1, $a1, %lo(D_80B7B0B0)  ## $a1 = 80B7B0B0
/* 028BC 80B6C25C 24060A26 */  addiu   $a2, $zero, 0x0A26         ## $a2 = 00000A26
/* 028C0 80B6C260 0C0346A2 */  jal     Matrix_NewMtx              
/* 028C4 80B6C264 AFA2004C */  sw      $v0, 0x004C($sp)           
/* 028C8 80B6C268 8FA3004C */  lw      $v1, 0x004C($sp)           
/* 028CC 80B6C26C 3C040600 */  lui     $a0, %hi(D_06003230)                ## $a0 = 06000000
/* 028D0 80B6C270 24843230 */  addiu   $a0, $a0, %lo(D_06003230)           ## $a0 = 06003230
/* 028D4 80B6C274 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 028D8 80B6C278 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 028DC 80B6C27C 00046100 */  sll     $t4, $a0,  4               
/* 028E0 80B6C280 000C6F02 */  srl     $t5, $t4, 28               
/* 028E4 80B6C284 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 028E8 80B6C288 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 028EC 80B6C28C 000D7080 */  sll     $t6, $t5,  2               
/* 028F0 80B6C290 3C0BDE00 */  lui     $t3, 0xDE00                ## $t3 = DE000000
/* 028F4 80B6C294 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 028F8 80B6C298 01EE7821 */  addu    $t7, $t7, $t6              
/* 028FC 80B6C29C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 02900 80B6C2A0 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 02904 80B6C2A4 8DEF6FA8 */  lw      $t7, %lo(gSegments)($t7)
/* 02908 80B6C2A8 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0290C 80B6C2AC 0081C024 */  and     $t8, $a0, $at              
/* 02910 80B6C2B0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 02914 80B6C2B4 01F8C821 */  addu    $t9, $t7, $t8              
/* 02918 80B6C2B8 03214821 */  addu    $t1, $t9, $at              
/* 0291C 80B6C2BC 3C0680B8 */  lui     $a2, %hi(D_80B7B0C0)       ## $a2 = 80B80000
/* 02920 80B6C2C0 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 02924 80B6C2C4 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 02928 80B6C2C8 24C6B0C0 */  addiu   $a2, $a2, %lo(D_80B7B0C0)  ## $a2 = 80B7B0C0
/* 0292C 80B6C2CC 27A40058 */  addiu   $a0, $sp, 0x0058           ## $a0 = FFFFFFE8
/* 02930 80B6C2D0 0C031AD5 */  jal     Graph_CloseDisps              
/* 02934 80B6C2D4 24070A35 */  addiu   $a3, $zero, 0x0A35         ## $a3 = 00000A35
/* 02938 80B6C2D8 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 0293C 80B6C2DC 8FB00034 */  lw      $s0, 0x0034($sp)           
/* 02940 80B6C2E0 8FB10038 */  lw      $s1, 0x0038($sp)           
/* 02944 80B6C2E4 03E00008 */  jr      $ra                        
/* 02948 80B6C2E8 27BD0070 */  addiu   $sp, $sp, 0x0070           ## $sp = 00000000
