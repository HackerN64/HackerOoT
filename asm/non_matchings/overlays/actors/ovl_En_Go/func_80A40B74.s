glabel func_80A40B74
/* 02604 80A40B74 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 02608 80A40B78 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0260C 80A40B7C AFA50034 */  sw      $a1, 0x0034($sp)           
/* 02610 80A40B80 0C00BD04 */  jal     Actor_HasParent              
/* 02614 80A40B84 AFA40030 */  sw      $a0, 0x0030($sp)           
/* 02618 80A40B88 10400009 */  beq     $v0, $zero, .L80A40BB0     
/* 0261C 80A40B8C 8FA40030 */  lw      $a0, 0x0030($sp)           
/* 02620 80A40B90 240E0002 */  addiu   $t6, $zero, 0x0002         ## $t6 = 00000002
/* 02624 80A40B94 3C0580A4 */  lui     $a1, %hi(func_80A40C78)    ## $a1 = 80A40000
/* 02628 80A40B98 A48E01E0 */  sh      $t6, 0x01E0($a0)           ## 000001E0
/* 0262C 80A40B9C AC800118 */  sw      $zero, 0x0118($a0)         ## 00000118
/* 02630 80A40BA0 0C28F95C */  jal     func_80A3E570              
/* 02634 80A40BA4 24A50C78 */  addiu   $a1, $a1, %lo(func_80A40C78) ## $a1 = 80A40C78
/* 02638 80A40BA8 10000030 */  beq     $zero, $zero, .L80A40C6C   
/* 0263C 80A40BAC 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80A40BB0:
/* 02640 80A40BB0 8483001C */  lh      $v1, 0x001C($a0)           ## 0000001C
/* 02644 80A40BB4 24010090 */  addiu   $at, $zero, 0x0090         ## $at = 00000090
/* 02648 80A40BB8 A480020C */  sh      $zero, 0x020C($a0)         ## 0000020C
/* 0264C 80A40BBC 306300F0 */  andi    $v1, $v1, 0x00F0           ## $v1 = 00000000
/* 02650 80A40BC0 1461001A */  bne     $v1, $at, .L80A40C2C       
/* 02654 80A40BC4 3C0F8012 */  lui     $t7, %hi(gItemSlots+0x2d)
/* 02658 80A40BC8 91EF7491 */  lbu     $t7, %lo(gItemSlots+0x2d)($t7)
/* 0265C 80A40BCC 3C028016 */  lui     $v0, %hi(gSaveContext+0x74)
/* 02660 80A40BD0 24010037 */  addiu   $at, $zero, 0x0037         ## $at = 00000037
/* 02664 80A40BD4 004F1021 */  addu    $v0, $v0, $t7              
/* 02668 80A40BD8 9042E6D4 */  lbu     $v0, %lo(gSaveContext+0x74)($v0)
/* 0266C 80A40BDC 24180057 */  addiu   $t8, $zero, 0x0057         ## $t8 = 00000057
/* 02670 80A40BE0 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 02674 80A40BE4 14410009 */  bne     $v0, $at, .L80A40C0C       
/* 02678 80A40BE8 3C088012 */  lui     $t0, %hi(gItemSlots+0x2d)
/* 0267C 80A40BEC AFB80024 */  sw      $t8, 0x0024($sp)           
/* 02680 80A40BF0 A499020C */  sh      $t9, 0x020C($a0)           ## 0000020C
/* 02684 80A40BF4 91087491 */  lbu     $t0, %lo(gItemSlots+0x2d)($t0)
/* 02688 80A40BF8 8483001C */  lh      $v1, 0x001C($a0)           ## 0000001C
/* 0268C 80A40BFC 3C028016 */  lui     $v0, %hi(gSaveContext+0x74)
/* 02690 80A40C00 00481021 */  addu    $v0, $v0, $t0              
/* 02694 80A40C04 9042E6D4 */  lbu     $v0, %lo(gSaveContext+0x74)($v0)
/* 02698 80A40C08 306300F0 */  andi    $v1, $v1, 0x00F0           ## $v1 = 00000000
.L80A40C0C:
/* 0269C 80A40C0C 24010036 */  addiu   $at, $zero, 0x0036         ## $at = 00000036
/* 026A0 80A40C10 14410002 */  bne     $v0, $at, .L80A40C1C       
/* 026A4 80A40C14 24090026 */  addiu   $t1, $zero, 0x0026         ## $t1 = 00000026
/* 026A8 80A40C18 AFA90024 */  sw      $t1, 0x0024($sp)           
.L80A40C1C:
/* 026AC 80A40C1C 24010033 */  addiu   $at, $zero, 0x0033         ## $at = 00000033
/* 026B0 80A40C20 14410002 */  bne     $v0, $at, .L80A40C2C       
/* 026B4 80A40C24 240A0023 */  addiu   $t2, $zero, 0x0023         ## $t2 = 00000023
/* 026B8 80A40C28 AFAA0024 */  sw      $t2, 0x0024($sp)           
.L80A40C2C:
/* 026BC 80A40C2C 14600003 */  bne     $v1, $zero, .L80A40C3C     
/* 026C0 80A40C30 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 026C4 80A40C34 240B002C */  addiu   $t3, $zero, 0x002C         ## $t3 = 0000002C
/* 026C8 80A40C38 AFAB0024 */  sw      $t3, 0x0024($sp)           
.L80A40C3C:
/* 026CC 80A40C3C 44816000 */  mtc1    $at, $f12                  ## $f12 = 1.00
/* 026D0 80A40C40 C4800094 */  lwc1    $f0, 0x0094($a0)           ## 00000094
/* 026D4 80A40C44 C4840090 */  lwc1    $f4, 0x0090($a0)           ## 00000090
/* 026D8 80A40C48 8FA50034 */  lw      $a1, 0x0034($sp)           
/* 026DC 80A40C4C 46000005 */  abs.s   $f0, $f0                   
/* 026E0 80A40C50 460C2080 */  add.s   $f2, $f4, $f12             
/* 026E4 80A40C54 8FA60024 */  lw      $a2, 0x0024($sp)           
/* 026E8 80A40C58 460C0180 */  add.s   $f6, $f0, $f12             
/* 026EC 80A40C5C 44071000 */  mfc1    $a3, $f2                   
/* 026F0 80A40C60 0C00BD0D */  jal     func_8002F434              
/* 026F4 80A40C64 E7A60010 */  swc1    $f6, 0x0010($sp)           
/* 026F8 80A40C68 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80A40C6C:
/* 026FC 80A40C6C 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 02700 80A40C70 03E00008 */  jr      $ra                        
/* 02704 80A40C74 00000000 */  nop
