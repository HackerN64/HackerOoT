.rdata

glabel D_8082FDB0
    .asciz "../z_kaleido_scope_PAL.c"
    .balign 4

glabel D_8082FDCC
    .asciz "../z_kaleido_scope_PAL.c"
    .balign 4

.text
glabel func_80826AEC
/* 132CC 80826AEC 3C0F8016 */  lui     $t7, %hi(gGameInfo)
/* 132D0 80826AF0 8DEFFA90 */  lw      $t7, %lo(gGameInfo)($t7)
/* 132D4 80826AF4 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 132D8 80826AF8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 132DC 80826AFC AFA40030 */  sw      $a0, 0x0030($sp)           
/* 132E0 80826B00 85F80F2E */  lh      $t8, 0x0F2E($t7)           ## 80160F2E
/* 132E4 80826B04 00807025 */  or      $t6, $a0, $zero            ## $t6 = 00000000
/* 132E8 80826B08 3C040001 */  lui     $a0, 0x0001                ## $a0 = 00010000
/* 132EC 80826B0C 0018CA00 */  sll     $t9, $t8,  8               
/* 132F0 80826B10 008E2021 */  addu    $a0, $a0, $t6              
/* 132F4 80826B14 3C020098 */  lui     $v0, %hi(_map_48x85_staticSegmentRomStart)
/* 132F8 80826B18 0338C823 */  subu    $t9, $t9, $t8              
/* 132FC 80826B1C 0019C8C0 */  sll     $t9, $t9,  3               
/* 13300 80826B20 24423000 */  addiu   $v0, %lo(_map_48x85_staticSegmentRomStart)
/* 13304 80826B24 8C84062C */  lw      $a0, 0x062C($a0)           ## 0001062C
/* 13308 80826B28 3C078083 */  lui     $a3, %hi(D_8082FDB0)       ## $a3 = 80830000
/* 1330C 80826B2C 24080D8B */  addiu   $t0, $zero, 0x0D8B         ## $t0 = 00000D8B
/* 13310 80826B30 AFA80010 */  sw      $t0, 0x0010($sp)           
/* 13314 80826B34 24E7FDB0 */  addiu   $a3, $a3, %lo(D_8082FDB0)  ## $a3 = 8082FDB0
/* 13318 80826B38 AFA20024 */  sw      $v0, 0x0024($sp)           
/* 1331C 80826B3C 03222821 */  addu    $a1, $t9, $v0              
/* 13320 80826B40 0C0006A8 */  jal     DmaMgr_SendRequest1              
/* 13324 80826B44 240607F8 */  addiu   $a2, $zero, 0x07F8         ## $a2 = 000007F8
/* 13328 80826B48 3C0A8016 */  lui     $t2, %hi(gGameInfo)
/* 1332C 80826B4C 8D4AFA90 */  lw      $t2, %lo(gGameInfo)($t2)
/* 13330 80826B50 8FA90030 */  lw      $t1, 0x0030($sp)           
/* 13334 80826B54 8FA20024 */  lw      $v0, 0x0024($sp)           
/* 13338 80826B58 854B0F2E */  lh      $t3, 0x0F2E($t2)           ## 80160F2E
/* 1333C 80826B5C 3C040001 */  lui     $a0, 0x0001                ## $a0 = 00010000
/* 13340 80826B60 00892021 */  addu    $a0, $a0, $t1              
/* 13344 80826B64 000B6200 */  sll     $t4, $t3,  8               
/* 13348 80826B68 018B6023 */  subu    $t4, $t4, $t3              
/* 1334C 80826B6C 8C84062C */  lw      $a0, 0x062C($a0)           ## 0001062C
/* 13350 80826B70 000C60C0 */  sll     $t4, $t4,  3               
/* 13354 80826B74 3C078083 */  lui     $a3, %hi(D_8082FDCC)       ## $a3 = 80830000
/* 13358 80826B78 240D0D8F */  addiu   $t5, $zero, 0x0D8F         ## $t5 = 00000D8F
/* 1335C 80826B7C 01822821 */  addu    $a1, $t4, $v0              
/* 13360 80826B80 24A507F8 */  addiu   $a1, $a1, 0x07F8           ## $a1 = 000007F8
/* 13364 80826B84 AFAD0010 */  sw      $t5, 0x0010($sp)           
/* 13368 80826B88 24E7FDCC */  addiu   $a3, $a3, %lo(D_8082FDCC)  ## $a3 = 8082FDCC
/* 1336C 80826B8C 240607F8 */  addiu   $a2, $zero, 0x07F8         ## $a2 = 000007F8
/* 13370 80826B90 0C0006A8 */  jal     DmaMgr_SendRequest1              
/* 13374 80826B94 24840800 */  addiu   $a0, $a0, 0x0800           ## $a0 = 00010800
/* 13378 80826B98 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 1337C 80826B9C 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 13380 80826BA0 03E00008 */  jr      $ra                        
/* 13384 80826BA4 00000000 */  nop
