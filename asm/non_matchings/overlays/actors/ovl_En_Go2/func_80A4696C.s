.late_rodata
glabel D_80A48798
    .float 0.6

glabel D_80A4879C
    .float 0.4

glabel D_80A487A0
    .float 0.6

.text
glabel func_80A4696C
/* 03C3C 80A4696C 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 03C40 80A46970 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 03C44 80A46974 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 03C48 80A46978 AFA5003C */  sw      $a1, 0x003C($sp)           
/* 03C4C 80A4697C 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 03C50 80A46980 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 03C54 80A46984 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 03C58 80A46988 31CF001F */  andi    $t7, $t6, 0x001F           ## $t7 = 00000000
/* 03C5C 80A4698C A3AF0037 */  sb      $t7, 0x0037($sp)           
/* 03C60 80A46990 0C0295B2 */  jal     Animation_OnFrame              
/* 03C64 80A46994 8E05015C */  lw      $a1, 0x015C($s0)           ## 0000015C
/* 03C68 80A46998 50400024 */  beql    $v0, $zero, .L80A46A2C     
/* 03C6C 80A4699C C6020164 */  lwc1    $f2, 0x0164($s0)           ## 00000164
/* 03C70 80A469A0 8618001C */  lh      $t8, 0x001C($s0)           ## 0000001C
/* 03C74 80A469A4 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 03C78 80A469A8 8FA2003C */  lw      $v0, 0x003C($sp)           
/* 03C7C 80A469AC 3319001F */  andi    $t9, $t8, 0x001F           ## $t9 = 00000000
/* 03C80 80A469B0 17210018 */  bne     $t9, $at, .L80A46A14       
/* 03C84 80A469B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03C88 80A469B8 844807A0 */  lh      $t0, 0x07A0($v0)           ## 000007A0
/* 03C8C 80A469BC 24050003 */  addiu   $a1, $zero, 0x0003         ## $a1 = 00000003
/* 03C90 80A469C0 00084880 */  sll     $t1, $t0,  2               
/* 03C94 80A469C4 00495021 */  addu    $t2, $v0, $t1              
/* 03C98 80A469C8 0C024BE2 */  jal     Quake_Add              
/* 03C9C 80A469CC 8D440790 */  lw      $a0, 0x0790($t2)           ## 00000790
/* 03CA0 80A469D0 00022400 */  sll     $a0, $v0, 16               
/* 03CA4 80A469D4 AFA20030 */  sw      $v0, 0x0030($sp)           
/* 03CA8 80A469D8 00042403 */  sra     $a0, $a0, 16               
/* 03CAC 80A469DC 0C024B6B */  jal     Quake_SetSpeed              
/* 03CB0 80A469E0 2405C350 */  addiu   $a1, $zero, 0xC350         ## $a1 = FFFFC350
/* 03CB4 80A469E4 87A40032 */  lh      $a0, 0x0032($sp)           
/* 03CB8 80A469E8 24050008 */  addiu   $a1, $zero, 0x0008         ## $a1 = 00000008
/* 03CBC 80A469EC 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 03CC0 80A469F0 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 03CC4 80A469F4 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 03CC8 80A469F8 0C024B9C */  jal     Quake_SetQuakeValues              
/* 03CCC 80A469FC AFA4002C */  sw      $a0, 0x002C($sp)           
/* 03CD0 80A46A00 8FA4002C */  lw      $a0, 0x002C($sp)           
/* 03CD4 80A46A04 0C024B7C */  jal     Quake_SetCountdown              
/* 03CD8 80A46A08 24050010 */  addiu   $a1, $zero, 0x0010         ## $a1 = 00000010
/* 03CDC 80A46A0C 10000004 */  beq     $zero, $zero, .L80A46A20   
/* 03CE0 80A46A10 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
.L80A46A14:
/* 03CE4 80A46A14 0C2916C5 */  jal     func_80A45B14              
/* 03CE8 80A46A18 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 03CEC 80A46A1C 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
.L80A46A20:
/* 03CF0 80A46A20 00000000 */  nop
/* 03CF4 80A46A24 E6040168 */  swc1    $f4, 0x0168($s0)           ## 00000168
/* 03CF8 80A46A28 C6020164 */  lwc1    $f2, 0x0164($s0)           ## 00000164
.L80A46A2C:
/* 03CFC 80A46A2C 93AD0037 */  lbu     $t5, 0x0037($sp)           
/* 03D00 80A46A30 3C0F80A5 */  lui     $t7, %hi(D_80A48174)       ## $t7 = 80A50000
/* 03D04 80A46A34 4600118D */  trunc.w.s $f6, $f2                   
/* 03D08 80A46A38 000D7080 */  sll     $t6, $t5,  2               
/* 03D0C 80A46A3C 01CD7021 */  addu    $t6, $t6, $t5              
/* 03D10 80A46A40 000E7040 */  sll     $t6, $t6,  1               
/* 03D14 80A46A44 440C3000 */  mfc1    $t4, $f6                   
/* 03D18 80A46A48 01EE7821 */  addu    $t7, $t7, $t6              
/* 03D1C 80A46A4C 93A80037 */  lbu     $t0, 0x0037($sp)           
/* 03D20 80A46A50 1580000C */  bne     $t4, $zero, .L80A46A84     
/* 03D24 80A46A54 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03D28 80A46A58 85EF8174 */  lh      $t7, %lo(D_80A48174)($t7)  
/* 03D2C 80A46A5C 3C0180A5 */  lui     $at, %hi(D_80A48798)       ## $at = 80A50000
/* 03D30 80A46A60 C4308798 */  lwc1    $f16, %lo(D_80A48798)($at) 
/* 03D34 80A46A64 448F4000 */  mtc1    $t7, $f8                   ## $f8 = -0.00
/* 03D38 80A46A68 00000000 */  nop
/* 03D3C 80A46A6C 468042A0 */  cvt.s.w $f10, $f8                  
/* 03D40 80A46A70 46105482 */  mul.s   $f18, $f10, $f16           
/* 03D44 80A46A74 4600910D */  trunc.w.s $f4, $f18                  
/* 03D48 80A46A78 44192000 */  mfc1    $t9, $f4                   
/* 03D4C 80A46A7C 10000019 */  beq     $zero, $zero, .L80A46AE4   
/* 03D50 80A46A80 A61901FE */  sh      $t9, 0x01FE($s0)           ## 000001FE
.L80A46A84:
/* 03D54 80A46A84 C6100158 */  lwc1    $f16, 0x0158($s0)          ## 00000158
/* 03D58 80A46A88 00084880 */  sll     $t1, $t0,  2               
/* 03D5C 80A46A8C 01284821 */  addu    $t1, $t1, $t0              
/* 03D60 80A46A90 46101483 */  div.s   $f18, $f2, $f16            
/* 03D64 80A46A94 00094840 */  sll     $t1, $t1,  1               
/* 03D68 80A46A98 3C0A80A5 */  lui     $t2, %hi(D_80A48174)       ## $t2 = 80A50000
/* 03D6C 80A46A9C 01495021 */  addu    $t2, $t2, $t1              
/* 03D70 80A46AA0 854A8174 */  lh      $t2, %lo(D_80A48174)($t2)  
/* 03D74 80A46AA4 3C0180A5 */  lui     $at, %hi(D_80A4879C)       ## $at = 80A50000
/* 03D78 80A46AA8 C428879C */  lwc1    $f8, %lo(D_80A4879C)($at)  
/* 03D7C 80A46AAC 448A3000 */  mtc1    $t2, $f6                   ## $f6 = -0.00
/* 03D80 80A46AB0 3C0180A5 */  lui     $at, %hi(D_80A487A0)       ## $at = 80A50000
/* 03D84 80A46AB4 46803020 */  cvt.s.w $f0, $f6                   
/* 03D88 80A46AB8 C42687A0 */  lwc1    $f6, %lo(D_80A487A0)($at)  
/* 03D8C 80A46ABC 46080282 */  mul.s   $f10, $f0, $f8             
/* 03D90 80A46AC0 00000000 */  nop
/* 03D94 80A46AC4 46125102 */  mul.s   $f4, $f10, $f18            
/* 03D98 80A46AC8 00000000 */  nop
/* 03D9C 80A46ACC 46060202 */  mul.s   $f8, $f0, $f6              
/* 03DA0 80A46AD0 46082400 */  add.s   $f16, $f4, $f8             
/* 03DA4 80A46AD4 4600828D */  trunc.w.s $f10, $f16                 
/* 03DA8 80A46AD8 440C5000 */  mfc1    $t4, $f10                  
/* 03DAC 80A46ADC 00000000 */  nop
/* 03DB0 80A46AE0 A60C01FE */  sh      $t4, 0x01FE($s0)           ## 000001FE
.L80A46AE4:
/* 03DB4 80A46AE4 0C2917C2 */  jal     func_80A45F08              
/* 03DB8 80A46AE8 8FA5003C */  lw      $a1, 0x003C($sp)           
/* 03DBC 80A46AEC 10400004 */  beq     $v0, $zero, .L80A46B00     
/* 03DC0 80A46AF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03DC4 80A46AF4 A200020F */  sb      $zero, 0x020F($s0)         ## 0000020F
/* 03DC8 80A46AF8 0C291714 */  jal     func_80A45C50              
/* 03DCC 80A46AFC 8FA5003C */  lw      $a1, 0x003C($sp)           
.L80A46B00:
/* 03DD0 80A46B00 860D001C */  lh      $t5, 0x001C($s0)           ## 0000001C
/* 03DD4 80A46B04 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 03DD8 80A46B08 31AE001F */  andi    $t6, $t5, 0x001F           ## $t6 = 00000000
/* 03DDC 80A46B0C 51C10008 */  beql    $t6, $at, .L80A46B30       
/* 03DE0 80A46B10 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 03DE4 80A46B14 0C291370 */  jal     func_80A44DC0              
/* 03DE8 80A46B18 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03DEC 80A46B1C 10400003 */  beq     $v0, $zero, .L80A46B2C     
/* 03DF0 80A46B20 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 03DF4 80A46B24 0C291714 */  jal     func_80A45C50              
/* 03DF8 80A46B28 8FA5003C */  lw      $a1, 0x003C($sp)           
.L80A46B2C:
/* 03DFC 80A46B2C 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80A46B30:
/* 03E00 80A46B30 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 03E04 80A46B34 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 03E08 80A46B38 03E00008 */  jr      $ra                        
/* 03E0C 80A46B3C 00000000 */  nop
