glabel func_80A38054
/* 02D44 80A38054 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 02D48 80A38058 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 02D4C 80A3805C 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 02D50 80A38060 3C050600 */  lui     $a1, 0x0600                ## $a1 = 06000000
/* 02D54 80A38064 24A52280 */  addiu   $a1, $a1, 0x2280           ## $a1 = 06002280
/* 02D58 80A38068 AFA70018 */  sw      $a3, 0x0018($sp)
/* 02D5C 80A3806C 24840188 */  addiu   $a0, $a0, 0x0188           ## $a0 = 00000188
/* 02D60 80A38070 0C029490 */  jal     SkelAnime_ChangeAnimTransitionStop
/* 02D64 80A38074 3C06C080 */  lui     $a2, 0xC080                ## $a2 = C0800000
/* 02D68 80A38078 8FA70018 */  lw      $a3, 0x0018($sp)
/* 02D6C 80A3807C 3C01C080 */  lui     $at, 0xC080                ## $at = C0800000
/* 02D70 80A38080 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 02D74 80A38084 94EE0088 */  lhu     $t6, 0x0088($a3)           ## 00000088
/* 02D78 80A38088 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 02D7C 80A3808C 31CF0001 */  andi    $t7, $t6, 0x0001           ## $t7 = 00000000
/* 02D80 80A38090 51E00006 */  beql    $t7, $zero, .L80A380AC
/* 02D84 80A38094 A4F80318 */  sh      $t8, 0x0318($a3)           ## 00000318
/* 02D88 80A38098 44812000 */  mtc1    $at, $f4                   ## $f4 = -4.00
/* 02D8C 80A3809C A4E00318 */  sh      $zero, 0x0318($a3)         ## 00000318
/* 02D90 80A380A0 10000002 */  beq     $zero, $zero, .L80A380AC
/* 02D94 80A380A4 E4E40068 */  swc1    $f4, 0x0068($a3)           ## 00000068
/* 02D98 80A380A8 A4F80318 */  sh      $t8, 0x0318($a3)           ## 00000318
.L80A380AC:
/* 02D9C 80A380AC 84F9008A */  lh      $t9, 0x008A($a3)           ## 0000008A
/* 02DA0 80A380B0 A4E002FA */  sh      $zero, 0x02FA($a3)         ## 000002FA
/* 02DA4 80A380B4 24053999 */  addiu   $a1, $zero, 0x3999         ## $a1 = 00003999
/* 02DA8 80A380B8 A4F90032 */  sh      $t9, 0x0032($a3)           ## 00000032
/* 02DAC 80A380BC 0C00BE0A */  jal     Audio_PlayActorSound2

/* 02DB0 80A380C0 AFA70018 */  sw      $a3, 0x0018($sp)
/* 02DB4 80A380C4 8FA40018 */  lw      $a0, 0x0018($sp)
/* 02DB8 80A380C8 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 02DBC 80A380CC 3C0580A4 */  lui     $a1, %hi(func_80A380EC)    ## $a1 = 80A40000
/* 02DC0 80A380D0 24A580EC */  addiu   $a1, $a1, %lo(func_80A380EC) ## $a1 = 80A380EC
/* 02DC4 80A380D4 0C28D4C4 */  jal     func_80A35310
/* 02DC8 80A380D8 AC8802EC */  sw      $t0, 0x02EC($a0)           ## 000002EC
/* 02DCC 80A380DC 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 02DD0 80A380E0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 02DD4 80A380E4 03E00008 */  jr      $ra
/* 02DD8 80A380E8 00000000 */  nop
