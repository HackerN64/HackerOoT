.rdata
glabel D_808B46A0
    .asciz "Warning : ロンロン木箱落ちすぎた(%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_808B46DC
    .asciz "../z_bg_spot15_rrbox.c"
    .balign 4

.late_rodata
glabel D_808B4704
    .float 0.001

glabel D_808B4708
 .word 0xC6F9EC00
glabel D_808B470C
 .word 0xBA83126F

.text
glabel func_808B43D0
/* 00A70 808B43D0 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00A74 808B43D4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00A78 808B43D8 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00A7C 808B43DC C4800150 */  lwc1    $f0, 0x0150($a0)           ## 00000150
/* 00A80 808B43E0 3C01808B */  lui     $at, %hi(D_808B4704)       ## $at = 808B0000
/* 00A84 808B43E4 C4244704 */  lwc1    $f4, %lo(D_808B4704)($at)  
/* 00A88 808B43E8 46000005 */  abs.s   $f0, $f0                   
/* 00A8C 808B43EC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00A90 808B43F0 4600203C */  c.lt.s  $f4, $f0                   
/* 00A94 808B43F4 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00A98 808B43F8 45020008 */  bc1fl   .L808B441C                 
/* 00A9C 808B43FC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00AA0 808B4400 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00AA4 808B4404 2401FFEF */  addiu   $at, $zero, 0xFFEF         ## $at = FFFFFFEF
/* 00AA8 808B4408 E4860150 */  swc1    $f6, 0x0150($a0)           ## 00000150
/* 00AAC 808B440C 8C4E0680 */  lw      $t6, 0x0680($v0)           ## 00000680
/* 00AB0 808B4410 01C17824 */  and     $t7, $t6, $at              
/* 00AB4 808B4414 AC4F0680 */  sw      $t7, 0x0680($v0)           ## 00000680
/* 00AB8 808B4418 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L808B441C:
/* 00ABC 808B441C 0C00B638 */  jal     Actor_MoveForward
              
/* 00AC0 808B4420 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00AC4 808B4424 3C01808B */  lui     $at, %hi(D_808B4708)       ## $at = 808B0000
/* 00AC8 808B4428 C4284708 */  lwc1    $f8, %lo(D_808B4708)($at)  
/* 00ACC 808B442C C6020028 */  lwc1    $f2, 0x0028($s0)           ## 00000028
/* 00AD0 808B4430 3C04808B */  lui     $a0, %hi(D_808B46A0)       ## $a0 = 808B0000
/* 00AD4 808B4434 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00AD8 808B4438 4608103E */  c.le.s  $f2, $f8                   
/* 00ADC 808B443C 248446A0 */  addiu   $a0, $a0, %lo(D_808B46A0)  ## $a0 = 808B46A0
/* 00AE0 808B4440 24060257 */  addiu   $a2, $zero, 0x0257         ## $a2 = 00000257
/* 00AE4 808B4444 4502000A */  bc1fl   .L808B4470                 
/* 00AE8 808B4448 C6000080 */  lwc1    $f0, 0x0080($s0)           ## 00000080
/* 00AEC 808B444C 3C05808B */  lui     $a1, %hi(D_808B46DC)       ## $a1 = 808B0000
/* 00AF0 808B4450 24A546DC */  addiu   $a1, $a1, %lo(D_808B46DC)  ## $a1 = 808B46DC
/* 00AF4 808B4454 0C00084C */  jal     osSyncPrintf
              
/* 00AF8 808B4458 8607001C */  lh      $a3, 0x001C($s0)           ## 0000001C
/* 00AFC 808B445C 0C00B55C */  jal     Actor_Kill
              
/* 00B00 808B4460 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B04 808B4464 10000010 */  beq     $zero, $zero, .L808B44A8   
/* 00B08 808B4468 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B0C 808B446C C6000080 */  lwc1    $f0, 0x0080($s0)           ## 00000080
.L808B4470:
/* 00B10 808B4470 3C01808B */  lui     $at, %hi(D_808B470C)       ## $at = 808B0000
/* 00B14 808B4474 C430470C */  lwc1    $f16, %lo(D_808B470C)($at) 
/* 00B18 808B4478 46020281 */  sub.s   $f10, $f0, $f2             
/* 00B1C 808B447C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B20 808B4480 460A803E */  c.le.s  $f16, $f10                 
/* 00B24 808B4484 00000000 */  nop
/* 00B28 808B4488 45020007 */  bc1fl   .L808B44A8                 
/* 00B2C 808B448C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00B30 808B4490 0C22D021 */  jal     func_808B4084              
/* 00B34 808B4494 E6000028 */  swc1    $f0, 0x0028($s0)           ## 00000028
/* 00B38 808B4498 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00B3C 808B449C 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00B40 808B44A0 240528C9 */  addiu   $a1, $zero, 0x28C9         ## $a1 = 000028C9
/* 00B44 808B44A4 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808B44A8:
/* 00B48 808B44A8 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00B4C 808B44AC 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00B50 808B44B0 03E00008 */  jr      $ra                        
/* 00B54 808B44B4 00000000 */  nop
