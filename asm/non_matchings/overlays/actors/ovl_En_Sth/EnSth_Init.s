.rdata
glabel D_80B0B4C0
    .asciz "\x1b[34m金スタル屋 no = %d\n\x1b[m"
    .balign 4

glabel D_80B0B4DC
    .asciz "金スタル屋 まだ 人間に戻れない \n"
    .balign 4

glabel D_80B0B500
    .asciz "\x1b[34m金スタル屋 まだ 人間に戻れない \n\x1b[m"
    .balign 4

glabel D_80B0B52C
    .asciz "bank_ID = %d\n"
    .balign 4

glabel D_80B0B53C
    .asciz "0"
    .balign 4

glabel D_80B0B540
    .asciz "../z_en_sth.c"
    .balign 4

.text
glabel EnSth_Init
/* 00008 80B07548 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 0000C 80B0754C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00010 80B07550 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00014 80B07554 AFA50034 */  sw      $a1, 0x0034($sp)           
/* 00018 80B07558 8485001C */  lh      $a1, 0x001C($a0)           ## 0000001C
/* 0001C 80B0755C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00020 80B07560 3C0480B1 */  lui     $a0, %hi(D_80B0B4C0)       ## $a0 = 80B10000
/* 00024 80B07564 2484B4C0 */  addiu   $a0, $a0, %lo(D_80B0B4C0)  ## $a0 = 80B0B4C0
/* 00028 80B07568 0C00084C */  jal     osSyncPrintf
              
/* 0002C 80B0756C AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00030 80B07570 8602001C */  lh      $v0, 0x001C($s0)           ## 0000001C
/* 00034 80B07574 8FA60024 */  lw      $a2, 0x0024($sp)           
/* 00038 80B07578 3C0F8016 */  lui     $t7, %hi(gSaveContext+0xd0)
/* 0003C 80B0757C 1440000D */  bne     $v0, $zero, .L80B075B4     
/* 00040 80B07580 0002C080 */  sll     $t8, $v0,  2               
/* 00044 80B07584 3C0E8016 */  lui     $t6, %hi(gSaveContext+0xd0)
/* 00048 80B07588 85CEE730 */  lh      $t6, %lo(gSaveContext+0xd0)($t6)
/* 0004C 80B0758C 29C10064 */  slti    $at, $t6, 0x0064           
/* 00050 80B07590 50200016 */  beql    $at, $zero, .L80B075EC     
/* 00054 80B07594 0006C840 */  sll     $t9, $a2,  1               
/* 00058 80B07598 0C00B55C */  jal     Actor_Kill
              
/* 0005C 80B0759C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00060 80B075A0 3C0480B1 */  lui     $a0, %hi(D_80B0B4DC)       ## $a0 = 80B10000
/* 00064 80B075A4 0C00084C */  jal     osSyncPrintf
              
/* 00068 80B075A8 2484B4DC */  addiu   $a0, $a0, %lo(D_80B0B4DC)  ## $a0 = 80B0B4DC
/* 0006C 80B075AC 1000003C */  beq     $zero, $zero, .L80B076A0   
/* 00070 80B075B0 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B075B4:
/* 00074 80B075B4 85EFE730 */  lh      $t7, %lo(gSaveContext+0xd0)($t7)
/* 00078 80B075B8 0302C021 */  addu    $t8, $t8, $v0              
/* 0007C 80B075BC 0018C040 */  sll     $t8, $t8,  1               
/* 00080 80B075C0 01F8082A */  slt     $at, $t7, $t8              
/* 00084 80B075C4 50200009 */  beql    $at, $zero, .L80B075EC     
/* 00088 80B075C8 0006C840 */  sll     $t9, $a2,  1               
/* 0008C 80B075CC 0C00B55C */  jal     Actor_Kill
              
/* 00090 80B075D0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00094 80B075D4 3C0480B1 */  lui     $a0, %hi(D_80B0B500)       ## $a0 = 80B10000
/* 00098 80B075D8 0C00084C */  jal     osSyncPrintf
              
/* 0009C 80B075DC 2484B500 */  addiu   $a0, $a0, %lo(D_80B0B500)  ## $a0 = 80B0B500
/* 000A0 80B075E0 1000002F */  beq     $zero, $zero, .L80B076A0   
/* 000A4 80B075E4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 000A8 80B075E8 0006C840 */  sll     $t9, $a2,  1               
.L80B075EC:
/* 000AC 80B075EC 3C0580B1 */  lui     $a1, %hi(D_80B0B430)       ## $a1 = 80B10000
/* 000B0 80B075F0 00B92821 */  addu    $a1, $a1, $t9              
/* 000B4 80B075F4 84A5B430 */  lh      $a1, %lo(D_80B0B430)($a1)  
/* 000B8 80B075F8 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 000BC 80B075FC 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 000C0 80B07600 10A10007 */  beq     $a1, $at, .L80B07620       
/* 000C4 80B07604 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 000C8 80B07608 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 000CC 80B0760C 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 000D0 80B07610 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 000D4 80B07614 00812021 */  addu    $a0, $a0, $at              
/* 000D8 80B07618 10000001 */  beq     $zero, $zero, .L80B07620   
/* 000DC 80B0761C 00403825 */  or      $a3, $v0, $zero            ## $a3 = 00000000
.L80B07620:
/* 000E0 80B07620 3C0480B1 */  lui     $a0, %hi(D_80B0B52C)       ## $a0 = 80B10000
/* 000E4 80B07624 2484B52C */  addiu   $a0, $a0, %lo(D_80B0B52C)  ## $a0 = 80B0B52C
/* 000E8 80B07628 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 000EC 80B0762C 0C00084C */  jal     osSyncPrintf
              
/* 000F0 80B07630 AFA70020 */  sw      $a3, 0x0020($sp)           
/* 000F4 80B07634 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 000F8 80B07638 3C0480B1 */  lui     $a0, %hi(D_80B0B53C)       ## $a0 = 80B10000
/* 000FC 80B0763C 2484B53C */  addiu   $a0, $a0, %lo(D_80B0B53C)  ## $a0 = 80B0B53C
/* 00100 80B07640 04E10006 */  bgez    $a3, .L80B0765C            
/* 00104 80B07644 3C0580B1 */  lui     $a1, %hi(D_80B0B540)       ## $a1 = 80B10000
/* 00108 80B07648 24A5B540 */  addiu   $a1, $a1, %lo(D_80B0B540)  ## $a1 = 80B0B540
/* 0010C 80B0764C 2406061C */  addiu   $a2, $zero, 0x061C         ## $a2 = 0000061C
/* 00110 80B07650 0C0007FC */  jal     __assert
              
/* 00114 80B07654 AFA70020 */  sw      $a3, 0x0020($sp)           
/* 00118 80B07658 8FA70020 */  lw      $a3, 0x0020($sp)           
.L80B0765C:
/* 0011C 80B0765C 3C0880B1 */  lui     $t0, %hi(func_80B08258)    ## $t0 = 80B10000
/* 00120 80B07660 25088258 */  addiu   $t0, $t0, %lo(func_80B08258) ## $t0 = 80B08258
/* 00124 80B07664 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 00128 80B07668 A20702A4 */  sb      $a3, 0x02A4($s0)           ## 000002A4
/* 0012C 80B0766C AE0802A0 */  sw      $t0, 0x02A0($s0)           ## 000002A0
/* 00130 80B07670 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 00134 80B07674 0C00B58B */  jal     Actor_SetScale
              
/* 00138 80B07678 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0013C 80B0767C 3C0580B0 */  lui     $a1, %hi(func_80B07878)    ## $a1 = 80B00000
/* 00140 80B07680 24A57878 */  addiu   $a1, $a1, %lo(func_80B07878) ## $a1 = 80B07878
/* 00144 80B07684 0C2C1D50 */  jal     func_80B07540              
/* 00148 80B07688 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0014C 80B0768C 24090006 */  addiu   $t1, $zero, 0x0006         ## $t1 = 00000006
/* 00150 80B07690 AE000134 */  sw      $zero, 0x0134($s0)         ## 00000134
/* 00154 80B07694 A60002B2 */  sh      $zero, 0x02B2($s0)         ## 000002B2
/* 00158 80B07698 A209001F */  sb      $t1, 0x001F($s0)           ## 0000001F
/* 0015C 80B0769C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B076A0:
/* 00160 80B076A0 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00164 80B076A4 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 00168 80B076A8 03E00008 */  jr      $ra                        
/* 0016C 80B076AC 00000000 */  nop
