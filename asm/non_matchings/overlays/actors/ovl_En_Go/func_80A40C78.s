glabel func_80A40C78
/* 02708 80A40C78 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 0270C 80A40C7C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 02710 80A40C80 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 02714 80A40C84 848E01E0 */  lh      $t6, 0x01E0($a0)           ## 000001E0
/* 02718 80A40C88 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0271C 80A40C8C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02720 80A40C90 15C1002D */  bne     $t6, $at, .L80A40D48       
/* 02724 80A40C94 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 02728 80A40C98 3C0580A4 */  lui     $a1, %hi(func_80A406E0)    ## $a1 = 80A40000
/* 0272C 80A40C9C 24A506E0 */  addiu   $a1, $a1, %lo(func_80A406E0) ## $a1 = 80A406E0
/* 02730 80A40CA0 0C28F95C */  jal     func_80A3E570              
/* 02734 80A40CA4 AFA60024 */  sw      $a2, 0x0024($sp)           
/* 02738 80A40CA8 860F001C */  lh      $t7, 0x001C($s0)           ## 0000001C
/* 0273C 80A40CAC 24010090 */  addiu   $at, $zero, 0x0090         ## $at = 00000090
/* 02740 80A40CB0 8FA60024 */  lw      $a2, 0x0024($sp)           
/* 02744 80A40CB4 31F800F0 */  andi    $t8, $t7, 0x00F0           ## $t8 = 00000000
/* 02748 80A40CB8 53010004 */  beql    $t8, $at, .L80A40CCC       
/* 0274C 80A40CBC 8619020C */  lh      $t9, 0x020C($s0)           ## 0000020C
/* 02750 80A40CC0 10000021 */  beq     $zero, $zero, .L80A40D48   
/* 02754 80A40CC4 A60001E0 */  sh      $zero, 0x01E0($s0)         ## 000001E0
/* 02758 80A40CC8 8619020C */  lh      $t9, 0x020C($s0)           ## 0000020C
.L80A40CCC:
/* 0275C 80A40CCC 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 02760 80A40CD0 3C018016 */  lui     $at, %hi(gSaveContext+0x3e)
/* 02764 80A40CD4 13200004 */  beq     $t9, $zero, .L80A40CE8     
/* 02768 80A40CD8 3C098012 */  lui     $t1, %hi(gItemSlots+0x2d)
/* 0276C 80A40CDC A60001E0 */  sh      $zero, 0x01E0($s0)         ## 000001E0
/* 02770 80A40CE0 10000019 */  beq     $zero, $zero, .L80A40D48   
/* 02774 80A40CE4 A028E69E */  sb      $t0, %lo(gSaveContext+0x3e)($at)
.L80A40CE8:
/* 02778 80A40CE8 91297491 */  lbu     $t1, %lo(gItemSlots+0x2d)($t1)
/* 0277C 80A40CEC 3C028016 */  lui     $v0, %hi(gSaveContext+0x74)
/* 02780 80A40CF0 24010034 */  addiu   $at, $zero, 0x0034         ## $at = 00000034
/* 02784 80A40CF4 00491021 */  addu    $v0, $v0, $t1              
/* 02788 80A40CF8 9042E6D4 */  lbu     $v0, %lo(gSaveContext+0x74)($v0)
/* 0278C 80A40CFC 240A3058 */  addiu   $t2, $zero, 0x3058         ## $t2 = 00003058
/* 02790 80A40D00 3145FFFF */  andi    $a1, $t2, 0xFFFF           ## $a1 = 00003058
/* 02794 80A40D04 14410006 */  bne     $v0, $at, .L80A40D20       
/* 02798 80A40D08 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 0279C 80A40D0C 0C042DC8 */  jal     func_8010B720              
/* 027A0 80A40D10 A60A010E */  sh      $t2, 0x010E($s0)           ## 0000010E
/* 027A4 80A40D14 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 027A8 80A40D18 1000000B */  beq     $zero, $zero, .L80A40D48   
/* 027AC 80A40D1C A60B01E0 */  sh      $t3, 0x01E0($s0)           ## 000001E0
.L80A40D20:
/* 027B0 80A40D20 24010037 */  addiu   $at, $zero, 0x0037         ## $at = 00000037
/* 027B4 80A40D24 14410008 */  bne     $v0, $at, .L80A40D48       
/* 027B8 80A40D28 240C305C */  addiu   $t4, $zero, 0x305C         ## $t4 = 0000305C
/* 027BC 80A40D2C A60C010E */  sh      $t4, 0x010E($s0)           ## 0000010E
/* 027C0 80A40D30 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 027C4 80A40D34 0C042DC8 */  jal     func_8010B720              
/* 027C8 80A40D38 3185FFFF */  andi    $a1, $t4, 0xFFFF           ## $a1 = 0000305C
/* 027CC 80A40D3C 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 027D0 80A40D40 0C01DD76 */  jal     func_800775D8              
/* 027D4 80A40D44 A60D01E0 */  sh      $t5, 0x01E0($s0)           ## 000001E0
.L80A40D48:
/* 027D8 80A40D48 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 027DC 80A40D4C 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 027E0 80A40D50 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 027E4 80A40D54 03E00008 */  jr      $ra                        
/* 027E8 80A40D58 00000000 */  nop
