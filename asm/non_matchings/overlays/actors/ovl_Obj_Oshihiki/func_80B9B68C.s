.rdata
glabel D_80B9CB90
    .asciz "Error : scene_data_ID が判別できない。(%s %d)\n"
    .balign 4

glabel D_80B9CBC0
    .asciz "../z_obj_oshihiki.c"
    .balign 4

.text
glabel func_80B9B68C
/* 0050C 80B9B68C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00510 80B9B690 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00514 80B9B694 8488001C */  lh      $t0, 0x001C($a0)           ## 0000001C
/* 00518 80B9B698 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0051C 80B9B69C 3C0280BA */  lui     $v0, %hi(D_80B9CA4C)       ## $v0 = 80BA0000
/* 00520 80B9B6A0 00084183 */  sra     $t0, $t0,  6               
/* 00524 80B9B6A4 31080003 */  andi    $t0, $t0, 0x0003           ## $t0 = 00000000
/* 00528 80B9B6A8 00084400 */  sll     $t0, $t0, 16               
/* 0052C 80B9B6AC 00084403 */  sra     $t0, $t0, 16               
/* 00530 80B9B6B0 2442CA4C */  addiu   $v0, $v0, %lo(D_80B9CA4C)  ## $v0 = 80B9CA4C
/* 00534 80B9B6B4 24040009 */  addiu   $a0, $zero, 0x0009         ## $a0 = 00000009
/* 00538 80B9B6B8 84A600A4 */  lh      $a2, 0x00A4($a1)           ## 000000A4
/* 0053C 80B9B6BC 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80B9B6C0:
/* 00540 80B9B6C0 844E0000 */  lh      $t6, 0x0000($v0)           ## 80B9CA4C
/* 00544 80B9B6C4 50CE0005 */  beql    $a2, $t6, .L80B9B6DC       
/* 00548 80B9B6C8 28610009 */  slti    $at, $v1, 0x0009           
/* 0054C 80B9B6CC 24630001 */  addiu   $v1, $v1, 0x0001           ## $v1 = 00000001
/* 00550 80B9B6D0 1464FFFB */  bne     $v1, $a0, .L80B9B6C0       
/* 00554 80B9B6D4 24420002 */  addiu   $v0, $v0, 0x0002           ## $v0 = 80B9CA4E
/* 00558 80B9B6D8 28610009 */  slti    $at, $v1, 0x0009           
.L80B9B6DC:
/* 0055C 80B9B6DC 1420000F */  bne     $at, $zero, .L80B9B71C     
/* 00560 80B9B6E0 0003C080 */  sll     $t8, $v1,  2               
/* 00564 80B9B6E4 3C0480BA */  lui     $a0, %hi(D_80B9CB90)       ## $a0 = 80BA0000
/* 00568 80B9B6E8 3C0580BA */  lui     $a1, %hi(D_80B9CBC0)       ## $a1 = 80BA0000
/* 0056C 80B9B6EC 24A5CBC0 */  addiu   $a1, $a1, %lo(D_80B9CBC0)  ## $a1 = 80B9CBC0
/* 00570 80B9B6F0 2484CB90 */  addiu   $a0, $a0, %lo(D_80B9CB90)  ## $a0 = 80B9CB90
/* 00574 80B9B6F4 24060243 */  addiu   $a2, $zero, 0x0243         ## $a2 = 00000243
/* 00578 80B9B6F8 0C00084C */  jal     osSyncPrintf
              
/* 0057C 80B9B6FC AFA70018 */  sw      $a3, 0x0018($sp)           
/* 00580 80B9B700 8FA70018 */  lw      $a3, 0x0018($sp)           
/* 00584 80B9B704 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 00588 80B9B708 24E201D0 */  addiu   $v0, $a3, 0x01D0           ## $v0 = 000001D0
/* 0058C 80B9B70C A0430002 */  sb      $v1, 0x0002($v0)           ## 000001D2
/* 00590 80B9B710 A0430001 */  sb      $v1, 0x0001($v0)           ## 000001D1
/* 00594 80B9B714 10000010 */  beq     $zero, $zero, .L80B9B758   
/* 00598 80B9B718 A0430000 */  sb      $v1, 0x0000($v0)           ## 000001D0
.L80B9B71C:
/* 0059C 80B9B71C 0303C023 */  subu    $t8, $t8, $v1              
/* 005A0 80B9B720 0008C880 */  sll     $t9, $t0,  2               
/* 005A4 80B9B724 0328C823 */  subu    $t9, $t9, $t0              
/* 005A8 80B9B728 0018C080 */  sll     $t8, $t8,  2               
/* 005AC 80B9B72C 3C0A80BA */  lui     $t2, %hi(D_80B9C9E0)       ## $t2 = 80BA0000
/* 005B0 80B9B730 254AC9E0 */  addiu   $t2, $t2, %lo(D_80B9C9E0)  ## $t2 = 80B9C9E0
/* 005B4 80B9B734 03194821 */  addu    $t1, $t8, $t9              
/* 005B8 80B9B738 012A2021 */  addu    $a0, $t1, $t2              
/* 005BC 80B9B73C 908B0000 */  lbu     $t3, 0x0000($a0)           ## 00000000
/* 005C0 80B9B740 24E201D0 */  addiu   $v0, $a3, 0x01D0           ## $v0 = 000001D0
/* 005C4 80B9B744 A04B0000 */  sb      $t3, 0x0000($v0)           ## 000001D0
/* 005C8 80B9B748 908C0001 */  lbu     $t4, 0x0001($a0)           ## 00000001
/* 005CC 80B9B74C A04C0001 */  sb      $t4, 0x0001($v0)           ## 000001D1
/* 005D0 80B9B750 908D0002 */  lbu     $t5, 0x0002($a0)           ## 00000002
/* 005D4 80B9B754 A04D0002 */  sb      $t5, 0x0002($v0)           ## 000001D2
.L80B9B758:
/* 005D8 80B9B758 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 005DC 80B9B75C 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 005E0 80B9B760 03E00008 */  jr      $ra                        
/* 005E4 80B9B764 00000000 */  nop
