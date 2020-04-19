.rdata
glabel D_8090D6C0
    .asciz "../z_boss_ganon2.c"
    .balign 4

glabel D_8090D6D4
    .asciz "../z_boss_ganon2.c"
    .balign 4

.text
glabel func_808FD108
/* 001C8 808FD108 27BDFFB0 */  addiu   $sp, $sp, 0xFFB0           ## $sp = FFFFFFB0
/* 001CC 808FD10C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 001D0 808FD110 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 001D4 808FD114 AFA40050 */  sw      $a0, 0x0050($sp)           
/* 001D8 808FD118 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 001DC 808FD11C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 001E0 808FD120 00A12021 */  addu    $a0, $a1, $at              
/* 001E4 808FD124 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 001E8 808FD128 00062C00 */  sll     $a1, $a2, 16               
/* 001EC 808FD12C AFA7005C */  sw      $a3, 0x005C($sp)           
/* 001F0 808FD130 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 001F4 808FD134 00052C03 */  sra     $a1, $a1, 16               
/* 001F8 808FD138 00027100 */  sll     $t6, $v0,  4               
/* 001FC 808FD13C 01C27021 */  addu    $t6, $t6, $v0              
/* 00200 808FD140 000E7080 */  sll     $t6, $t6,  2               
/* 00204 808FD144 020E7821 */  addu    $t7, $s0, $t6              
/* 00208 808FD148 3C180001 */  lui     $t8, 0x0001                ## $t8 = 00010000
/* 0020C 808FD14C 030FC021 */  addu    $t8, $t8, $t7              
/* 00210 808FD150 8F1817B4 */  lw      $t8, 0x17B4($t8)           ## 000117B4
/* 00214 808FD154 93AA005F */  lbu     $t2, 0x005F($sp)           
/* 00218 808FD158 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0021C 808FD15C 0301C821 */  addu    $t9, $t8, $at              
/* 00220 808FD160 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 00224 808FD164 11400025 */  beq     $t2, $zero, .L808FD1FC     
/* 00228 808FD168 AC396FC0 */  sw      $t9, %lo(gSegments+0x18)($at)
/* 0022C 808FD16C 8E050000 */  lw      $a1, 0x0000($s0)           ## 00000000
/* 00230 808FD170 3C068091 */  lui     $a2, %hi(D_8090D6C0)       ## $a2 = 80910000
/* 00234 808FD174 24C6D6C0 */  addiu   $a2, $a2, %lo(D_8090D6C0)  ## $a2 = 8090D6C0
/* 00238 808FD178 AFA20048 */  sw      $v0, 0x0048($sp)           
/* 0023C 808FD17C 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 00240 808FD180 24070316 */  addiu   $a3, $zero, 0x0316         ## $a3 = 00000316
/* 00244 808FD184 0C031AB1 */  jal     Graph_OpenDisps              
/* 00248 808FD188 AFA50044 */  sw      $a1, 0x0044($sp)           
/* 0024C 808FD18C 8FA80044 */  lw      $t0, 0x0044($sp)           
/* 00250 808FD190 8FA90048 */  lw      $t1, 0x0048($sp)           
/* 00254 808FD194 3C05DB06 */  lui     $a1, 0xDB06                ## $a1 = DB060000
/* 00258 808FD198 8D0302C0 */  lw      $v1, 0x02C0($t0)           ## 000002C0
/* 0025C 808FD19C 00096100 */  sll     $t4, $t1,  4               
/* 00260 808FD1A0 01896021 */  addu    $t4, $t4, $t1              
/* 00264 808FD1A4 000C6080 */  sll     $t4, $t4,  2               
/* 00268 808FD1A8 246B0008 */  addiu   $t3, $v1, 0x0008           ## $t3 = 00000008
/* 0026C 808FD1AC 020C2021 */  addu    $a0, $s0, $t4              
/* 00270 808FD1B0 34A50018 */  ori     $a1, $a1, 0x0018           ## $a1 = DB060018
/* 00274 808FD1B4 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00278 808FD1B8 AD0B02C0 */  sw      $t3, 0x02C0($t0)           ## 000002C0
/* 0027C 808FD1BC 00812021 */  addu    $a0, $a0, $at              
/* 00280 808FD1C0 AC650000 */  sw      $a1, 0x0000($v1)           ## 00000000
/* 00284 808FD1C4 8C8D17B4 */  lw      $t5, 0x17B4($a0)           ## 000017B4
/* 00288 808FD1C8 3C068091 */  lui     $a2, %hi(D_8090D6D4)       ## $a2 = 80910000
/* 0028C 808FD1CC 24C6D6D4 */  addiu   $a2, $a2, %lo(D_8090D6D4)  ## $a2 = 8090D6D4
/* 00290 808FD1D0 AC6D0004 */  sw      $t5, 0x0004($v1)           ## 00000004
/* 00294 808FD1D4 8D0302D0 */  lw      $v1, 0x02D0($t0)           ## 000002D0
/* 00298 808FD1D8 2407031F */  addiu   $a3, $zero, 0x031F         ## $a3 = 0000031F
/* 0029C 808FD1DC 246E0008 */  addiu   $t6, $v1, 0x0008           ## $t6 = 00000008
/* 002A0 808FD1E0 AD0E02D0 */  sw      $t6, 0x02D0($t0)           ## 000002D0
/* 002A4 808FD1E4 AC650000 */  sw      $a1, 0x0000($v1)           ## 00000000
/* 002A8 808FD1E8 8C8F17B4 */  lw      $t7, 0x17B4($a0)           ## 000017B4
/* 002AC 808FD1EC 27A40034 */  addiu   $a0, $sp, 0x0034           ## $a0 = FFFFFFE4
/* 002B0 808FD1F0 AC6F0004 */  sw      $t7, 0x0004($v1)           ## 00000004
/* 002B4 808FD1F4 0C031AD5 */  jal     Graph_CloseDisps              
/* 002B8 808FD1F8 8E050000 */  lw      $a1, 0x0000($s0)           ## 00000000
.L808FD1FC:
/* 002BC 808FD1FC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 002C0 808FD200 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 002C4 808FD204 27BD0050 */  addiu   $sp, $sp, 0x0050           ## $sp = 00000000
/* 002C8 808FD208 03E00008 */  jr      $ra                        
/* 002CC 808FD20C 00000000 */  nop
