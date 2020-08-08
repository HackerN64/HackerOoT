.rdata
glabel D_809AAE10
    .asciz "../z_eff_ss_kirakira.c"
    .balign 4

glabel D_809AAE28
    .asciz "../z_eff_ss_kirakira.c"
    .balign 4

.late_rodata
glabel D_809AAE40
    .float 10000.0

.text
glabel func_809AA9AC
/* 0019C 809AA9AC 27BDFE20 */  addiu   $sp, $sp, 0xFE20           ## $sp = FFFFFE20
/* 001A0 809AA9B0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 001A4 809AA9B4 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 001A8 809AA9B8 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 001AC 809AA9BC AFA401E0 */  sw      $a0, 0x01E0($sp)           
/* 001B0 809AA9C0 AFA501E4 */  sw      $a1, 0x01E4($sp)           
/* 001B4 809AA9C4 84CE0056 */  lh      $t6, 0x0056($a2)           ## 00000056
/* 001B8 809AA9C8 3C01809B */  lui     $at, %hi(D_809AAE40)       ## $at = 809B0000
/* 001BC 809AA9CC C428AE40 */  lwc1    $f8, %lo(D_809AAE40)($at)  
/* 001C0 809AA9D0 448E2000 */  mtc1    $t6, $f4                   ## $f4 = 0.00
/* 001C4 809AA9D4 00C08025 */  or      $s0, $a2, $zero            ## $s0 = 00000000
/* 001C8 809AA9D8 3C06809B */  lui     $a2, %hi(D_809AAE10)       ## $a2 = 809B0000
/* 001CC 809AA9DC 468021A0 */  cvt.s.w $f6, $f4                   
/* 001D0 809AA9E0 24C6AE10 */  addiu   $a2, $a2, %lo(D_809AAE10)  ## $a2 = 809AAE10
/* 001D4 809AA9E4 24070101 */  addiu   $a3, $zero, 0x0101         ## $a3 = 00000101
/* 001D8 809AA9E8 46083283 */  div.s   $f10, $f6, $f8             
/* 001DC 809AA9EC E7AA01D8 */  swc1    $f10, 0x01D8($sp)          
/* 001E0 809AA9F0 8C910000 */  lw      $s1, 0x0000($a0)           ## 00000000
/* 001E4 809AA9F4 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFE5C
/* 001E8 809AA9F8 0C031AB1 */  jal     Graph_OpenDisps              
/* 001EC 809AA9FC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 001F0 809AAA00 27A40194 */  addiu   $a0, $sp, 0x0194           ## $a0 = FFFFFFB4
/* 001F4 809AAA04 8E050000 */  lw      $a1, 0x0000($s0)           ## 00000000
/* 001F8 809AAA08 8E060004 */  lw      $a2, 0x0004($s0)           ## 00000004
/* 001FC 809AAA0C 0C029E89 */  jal     SkinMatrix_SetTranslate              
/* 00200 809AAA10 8E070008 */  lw      $a3, 0x0008($s0)           ## 00000008
/* 00204 809AAA14 27A40154 */  addiu   $a0, $sp, 0x0154           ## $a0 = FFFFFF74
/* 00208 809AAA18 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 0020C 809AAA1C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00210 809AAA20 0C029DC1 */  jal     SkinMatrix_SetRotateRPY              
/* 00214 809AAA24 86070042 */  lh      $a3, 0x0042($s0)           ## 00000042
/* 00218 809AAA28 C7A001D8 */  lwc1    $f0, 0x01D8($sp)           
/* 0021C 809AAA2C 27A40114 */  addiu   $a0, $sp, 0x0114           ## $a0 = FFFFFF34
/* 00220 809AAA30 3C073F80 */  lui     $a3, 0x3F80                ## $a3 = 3F800000
/* 00224 809AAA34 44050000 */  mfc1    $a1, $f0                   
/* 00228 809AAA38 44060000 */  mfc1    $a2, $f0                   
/* 0022C 809AAA3C 0C029DA9 */  jal     SkinMatrix_SetScale              
/* 00230 809AAA40 00000000 */  nop
/* 00234 809AAA44 8FA501E0 */  lw      $a1, 0x01E0($sp)           
/* 00238 809AAA48 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0023C 809AAA4C 34211DA0 */  ori     $at, $at, 0x1DA0           ## $at = 00011DA0
/* 00240 809AAA50 27A40194 */  addiu   $a0, $sp, 0x0194           ## $a0 = FFFFFFB4
/* 00244 809AAA54 27A600D4 */  addiu   $a2, $sp, 0x00D4           ## $a2 = FFFFFEF4
/* 00248 809AAA58 0C029BE8 */  jal     SkinMatrix_MtxFMtxFMult              
/* 0024C 809AAA5C 00A12821 */  addu    $a1, $a1, $at              
/* 00250 809AAA60 27A400D4 */  addiu   $a0, $sp, 0x00D4           ## $a0 = FFFFFEF4
/* 00254 809AAA64 27A50154 */  addiu   $a1, $sp, 0x0154           ## $a1 = FFFFFF74
/* 00258 809AAA68 0C029BE8 */  jal     SkinMatrix_MtxFMtxFMult              
/* 0025C 809AAA6C 27A60094 */  addiu   $a2, $sp, 0x0094           ## $a2 = FFFFFEB4
/* 00260 809AAA70 27A40094 */  addiu   $a0, $sp, 0x0094           ## $a0 = FFFFFEB4
/* 00264 809AAA74 27A50114 */  addiu   $a1, $sp, 0x0114           ## $a1 = FFFFFF34
/* 00268 809AAA78 0C029BE8 */  jal     SkinMatrix_MtxFMtxFMult              
/* 0026C 809AAA7C 27A60054 */  addiu   $a2, $sp, 0x0054           ## $a2 = FFFFFE74
/* 00270 809AAA80 8E2302D0 */  lw      $v1, 0x02D0($s1)           ## 000002D0
/* 00274 809AAA84 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 00278 809AAA88 3C088013 */  lui     $t0, %hi(gMtxClear)
/* 0027C 809AAA8C 24780008 */  addiu   $t8, $v1, 0x0008           ## $t8 = 00000008
/* 00280 809AAA90 AE3802D0 */  sw      $t8, 0x02D0($s1)           ## 000002D0
/* 00284 809AAA94 2508DB20 */  addiu   $t0, %lo(gMtxClear)
/* 00288 809AAA98 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 0028C 809AAA9C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00290 809AAAA0 27A50054 */  addiu   $a1, $sp, 0x0054           ## $a1 = FFFFFE74
/* 00294 809AAAA4 AC790000 */  sw      $t9, 0x0000($v1)           ## 00000000
/* 00298 809AAAA8 0C029F9C */  jal     SkinMatrix_MtxFToNewMtx              
/* 0029C 809AAAAC AC680004 */  sw      $t0, 0x0004($v1)           ## 00000004
/* 002A0 809AAAB0 10400044 */  beq     $v0, $zero, .L809AABC4     
/* 002A4 809AAAB4 3C0ADA38 */  lui     $t2, 0xDA38                ## $t2 = DA380000
/* 002A8 809AAAB8 8E2302D0 */  lw      $v1, 0x02D0($s1)           ## 000002D0
/* 002AC 809AAABC 354A0003 */  ori     $t2, $t2, 0x0003           ## $t2 = DA380003
/* 002B0 809AAAC0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002B4 809AAAC4 24690008 */  addiu   $t1, $v1, 0x0008           ## $t1 = 00000008
/* 002B8 809AAAC8 AE2902D0 */  sw      $t1, 0x02D0($s1)           ## 000002D0
/* 002BC 809AAACC AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 002C0 809AAAD0 0C024F05 */  jal     func_80093C14              
/* 002C4 809AAAD4 AC6A0000 */  sw      $t2, 0x0000($v1)           ## 00000000
/* 002C8 809AAAD8 8E2302D0 */  lw      $v1, 0x02D0($s1)           ## 000002D0
/* 002CC 809AAADC 3C0CFA00 */  lui     $t4, 0xFA00                ## $t4 = FA000000
/* 002D0 809AAAE0 358C8080 */  ori     $t4, $t4, 0x8080           ## $t4 = FA008080
/* 002D4 809AAAE4 246B0008 */  addiu   $t3, $v1, 0x0008           ## $t3 = 00000008
/* 002D8 809AAAE8 AE2B02D0 */  sw      $t3, 0x02D0($s1)           ## 000002D0
/* 002DC 809AAAEC AC6C0000 */  sw      $t4, 0x0000($v1)           ## 00000000
/* 002E0 809AAAF0 860D0058 */  lh      $t5, 0x0058($s0)           ## 00000058
/* 002E4 809AAAF4 3C01425C */  lui     $at, 0x425C                ## $at = 425C0000
/* 002E8 809AAAF8 44818000 */  mtc1    $at, $f16                  ## $f16 = 55.00
/* 002EC 809AAAFC 448D9000 */  mtc1    $t5, $f18                  ## $f18 = 0.00
/* 002F0 809AAB00 860E005C */  lh      $t6, 0x005C($s0)           ## 0000005C
/* 002F4 809AAB04 860F0046 */  lh      $t7, 0x0046($s0)           ## 00000046
/* 002F8 809AAB08 46809120 */  cvt.s.w $f4, $f18                  
/* 002FC 809AAB0C 448E4000 */  mtc1    $t6, $f8                   ## $f8 = 0.00
/* 00300 809AAB10 860C0044 */  lh      $t4, 0x0044($s0)           ## 00000044
/* 00304 809AAB14 31F800FF */  andi    $t8, $t7, 0x00FF           ## $t8 = 00000000
/* 00308 809AAB18 0018CC00 */  sll     $t9, $t8, 16               
/* 0030C 809AAB1C 468042A0 */  cvt.s.w $f10, $f8                  
/* 00310 809AAB20 000C6E00 */  sll     $t5, $t4, 24               
/* 00314 809AAB24 3C0FFB00 */  lui     $t7, 0xFB00                ## $t7 = FB000000
/* 00318 809AAB28 46048183 */  div.s   $f6, $f16, $f4             
/* 0031C 809AAB2C 460A3482 */  mul.s   $f18, $f6, $f10            
/* 00320 809AAB30 4600940D */  trunc.w.s $f16, $f18                 
/* 00324 809AAB34 44088000 */  mfc1    $t0, $f16                  
/* 00328 809AAB38 00000000 */  nop
/* 0032C 809AAB3C 250900C8 */  addiu   $t1, $t0, 0x00C8           ## $t1 = 000000C8
/* 00330 809AAB40 312A00FF */  andi    $t2, $t1, 0x00FF           ## $t2 = 000000C8
/* 00334 809AAB44 86090048 */  lh      $t1, 0x0048($s0)           ## 00000048
/* 00338 809AAB48 014D7025 */  or      $t6, $t2, $t5              ## $t6 = 000000C8
/* 0033C 809AAB4C 01D94025 */  or      $t0, $t6, $t9              ## $t0 = 000000C8
/* 00340 809AAB50 312B00FF */  andi    $t3, $t1, 0x00FF           ## $t3 = 000000C8
/* 00344 809AAB54 000B6200 */  sll     $t4, $t3,  8               
/* 00348 809AAB58 010C5025 */  or      $t2, $t0, $t4              ## $t2 = FA0080C8
/* 0034C 809AAB5C AC6A0004 */  sw      $t2, 0x0004($v1)           ## 00000004
/* 00350 809AAB60 8E2302D0 */  lw      $v1, 0x02D0($s1)           ## 000002D0
/* 00354 809AAB64 246D0008 */  addiu   $t5, $v1, 0x0008           ## $t5 = 00000008
/* 00358 809AAB68 AE2D02D0 */  sw      $t5, 0x02D0($s1)           ## 000002D0
/* 0035C 809AAB6C AC6F0000 */  sw      $t7, 0x0000($v1)           ## 00000000
/* 00360 809AAB70 86180052 */  lh      $t8, 0x0052($s0)           ## 00000052
/* 00364 809AAB74 860C004E */  lh      $t4, 0x004E($s0)           ## 0000004E
/* 00368 809AAB78 8609004C */  lh      $t1, 0x004C($s0)           ## 0000004C
/* 0036C 809AAB7C 330E00FF */  andi    $t6, $t8, 0x00FF           ## $t6 = 00000000
/* 00370 809AAB80 86180050 */  lh      $t8, 0x0050($s0)           ## 00000050
/* 00374 809AAB84 318A00FF */  andi    $t2, $t4, 0x00FF           ## $t2 = 00000080
/* 00378 809AAB88 00095E00 */  sll     $t3, $t1, 24               
/* 0037C 809AAB8C 01CB4025 */  or      $t0, $t6, $t3              ## $t0 = 000000C8
/* 00380 809AAB90 000A6C00 */  sll     $t5, $t2, 16               
/* 00384 809AAB94 331900FF */  andi    $t9, $t8, 0x00FF           ## $t9 = 00000000
/* 00388 809AAB98 00194A00 */  sll     $t1, $t9,  8               
/* 0038C 809AAB9C 010D7825 */  or      $t7, $t0, $t5              ## $t7 = 000000C8
/* 00390 809AABA0 01E97025 */  or      $t6, $t7, $t1              ## $t6 = 000000C8
/* 00394 809AABA4 AC6E0004 */  sw      $t6, 0x0004($v1)           ## 00000004
/* 00398 809AABA8 8E2302D0 */  lw      $v1, 0x02D0($s1)           ## 000002D0
/* 0039C 809AABAC 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 003A0 809AABB0 246B0008 */  addiu   $t3, $v1, 0x0008           ## $t3 = 00000008
/* 003A4 809AABB4 AE2B02D0 */  sw      $t3, 0x02D0($s1)           ## 000002D0
/* 003A8 809AABB8 AC6C0000 */  sw      $t4, 0x0000($v1)           ## 00000000
/* 003AC 809AABBC 8E0A0038 */  lw      $t2, 0x0038($s0)           ## 00000038
/* 003B0 809AABC0 AC6A0004 */  sw      $t2, 0x0004($v1)           ## 00000004
.L809AABC4:
/* 003B4 809AABC4 3C06809B */  lui     $a2, %hi(D_809AAE28)       ## $a2 = 809B0000
/* 003B8 809AABC8 24C6AE28 */  addiu   $a2, $a2, %lo(D_809AAE28)  ## $a2 = 809AAE28
/* 003BC 809AABCC 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFE5C
/* 003C0 809AABD0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 003C4 809AABD4 0C031AD5 */  jal     Graph_CloseDisps              
/* 003C8 809AABD8 2407012D */  addiu   $a3, $zero, 0x012D         ## $a3 = 0000012D
/* 003CC 809AABDC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 003D0 809AABE0 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 003D4 809AABE4 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 003D8 809AABE8 03E00008 */  jr      $ra                        
/* 003DC 809AABEC 27BD01E0 */  addiu   $sp, $sp, 0x01E0           ## $sp = 00000000
