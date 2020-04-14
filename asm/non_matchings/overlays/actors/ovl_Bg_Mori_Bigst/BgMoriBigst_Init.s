.rdata
glabel D_808A1558
    .asciz "mori (bigST.鍵型天井)(arg : %04x)(sw %d)(noE %d)(roomC %d)(playerPosY %f)\n"
    .balign 4

glabel D_808A15A4
    .asciz "【ビッグスタルフォス鍵型天井】 バンク危険！\n"
    .balign 4

glabel D_808A15D4
    .asciz "%s %d\n"
    .balign 4

glabel D_808A15DC
    .asciz "../z_bg_mori_bigst.c"
    .balign 4

.text
glabel BgMoriBigst_Init
/* 00090 808A0C50 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00094 808A0C54 AFB00024 */  sw      $s0, 0x0024($sp)           
/* 00098 808A0C58 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0009C 808A0C5C AFB10028 */  sw      $s1, 0x0028($sp)           
/* 000A0 808A0C60 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 000A4 808A0C64 AFBF002C */  sw      $ra, 0x002C($sp)           
/* 000A8 808A0C68 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 000AC 808A0C6C 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 000B0 808A0C70 00052A03 */  sra     $a1, $a1,  8               
/* 000B4 808A0C74 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 000B8 808A0C78 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 000BC 808A0C7C AFA20034 */  sw      $v0, 0x0034($sp)           
/* 000C0 808A0C80 82050003 */  lb      $a1, 0x0003($s0)           ## 00000003
/* 000C4 808A0C84 0C00B349 */  jal     Flags_GetTempClear
              
/* 000C8 808A0C88 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000CC 808A0C8C AFA20038 */  sw      $v0, 0x0038($sp)           
/* 000D0 808A0C90 82050003 */  lb      $a1, 0x0003($s0)           ## 00000003
/* 000D4 808A0C94 0C00B337 */  jal     Flags_GetClear
              
/* 000D8 808A0C98 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 000DC 808A0C9C 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 000E0 808A0CA0 AFA20010 */  sw      $v0, 0x0010($sp)           
/* 000E4 808A0CA4 8E2E1C44 */  lw      $t6, 0x1C44($s1)           ## 00001C44
/* 000E8 808A0CA8 3C04808A */  lui     $a0, %hi(D_808A1558)       ## $a0 = 808A0000
/* 000EC 808A0CAC 24841558 */  addiu   $a0, $a0, %lo(D_808A1558)  ## $a0 = 808A1558
/* 000F0 808A0CB0 C5C40028 */  lwc1    $f4, 0x0028($t6)           ## 00000028
/* 000F4 808A0CB4 8FA60034 */  lw      $a2, 0x0034($sp)           
/* 000F8 808A0CB8 8FA70038 */  lw      $a3, 0x0038($sp)           
/* 000FC 808A0CBC 460021A1 */  cvt.d.s $f6, $f4                   
/* 00100 808A0CC0 0C00084C */  jal     osSyncPrintf
              
/* 00104 808A0CC4 F7A60018 */  sdc1    $f6, 0x0018($sp)           
/* 00108 808A0CC8 3C060600 */  lui     $a2, 0x0600                ## $a2 = 06000000
/* 0010C 808A0CCC 24C6221C */  addiu   $a2, $a2, 0x221C           ## $a2 = 0600221C
/* 00110 808A0CD0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00114 808A0CD4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 00118 808A0CD8 0C2282F2 */  jal     func_808A0BC8              
/* 0011C 808A0CDC 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00120 808A0CE0 3C05808A */  lui     $a1, %hi(D_808A14E0)       ## $a1 = 808A0000
/* 00124 808A0CE4 24A514E0 */  addiu   $a1, $a1, %lo(D_808A14E0)  ## $a1 = 808A14E0
/* 00128 808A0CE8 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 0012C 808A0CEC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00130 808A0CF0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00134 808A0CF4 342117A4 */  ori     $at, $at, 0x17A4           ## $at = 000117A4
/* 00138 808A0CF8 02212021 */  addu    $a0, $s1, $at              
/* 0013C 808A0CFC 0C02604B */  jal     Object_GetIndex
              ## ObjectIndex
/* 00140 808A0D00 24050073 */  addiu   $a1, $zero, 0x0073         ## $a1 = 00000073
/* 00144 808A0D04 A202016A */  sb      $v0, 0x016A($s0)           ## 0000016A
/* 00148 808A0D08 820F016A */  lb      $t7, 0x016A($s0)           ## 0000016A
/* 0014C 808A0D0C 3C04808A */  lui     $a0, %hi(D_808A15A4)       ## $a0 = 808A0000
/* 00150 808A0D10 05E3000E */  bgezl   $t7, .L808A0D4C            
/* 00154 808A0D14 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 00158 808A0D18 0C00084C */  jal     osSyncPrintf
              
/* 0015C 808A0D1C 248415A4 */  addiu   $a0, $a0, %lo(D_808A15A4)  ## $a0 = 808A15A4
/* 00160 808A0D20 3C04808A */  lui     $a0, %hi(D_808A15D4)       ## $a0 = 808A0000
/* 00164 808A0D24 3C05808A */  lui     $a1, %hi(D_808A15DC)       ## $a1 = 808A0000
/* 00168 808A0D28 24A515DC */  addiu   $a1, $a1, %lo(D_808A15DC)  ## $a1 = 808A15DC
/* 0016C 808A0D2C 248415D4 */  addiu   $a0, $a0, %lo(D_808A15D4)  ## $a0 = 808A15D4
/* 00170 808A0D30 0C00084C */  jal     osSyncPrintf
              
/* 00174 808A0D34 240600EA */  addiu   $a2, $zero, 0x00EA         ## $a2 = 000000EA
/* 00178 808A0D38 0C00B55C */  jal     Actor_Kill
              
/* 0017C 808A0D3C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00180 808A0D40 10000016 */  beq     $zero, $zero, .L808A0D9C   
/* 00184 808A0D44 8FBF002C */  lw      $ra, 0x002C($sp)           
/* 00188 808A0D48 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
.L808A0D4C:
/* 0018C 808A0D4C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00190 808A0D50 00052A03 */  sra     $a1, $a1,  8               
/* 00194 808A0D54 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 00198 808A0D58 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 0019C 808A0D5C 10400004 */  beq     $v0, $zero, .L808A0D70     
/* 001A0 808A0D60 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001A4 808A0D64 C608000C */  lwc1    $f8, 0x000C($s0)           ## 0000000C
/* 001A8 808A0D68 10000006 */  beq     $zero, $zero, .L808A0D84   
/* 001AC 808A0D6C E6080028 */  swc1    $f8, 0x0028($s0)           ## 00000028
.L808A0D70:
/* 001B0 808A0D70 3C014387 */  lui     $at, 0x4387                ## $at = 43870000
/* 001B4 808A0D74 44818000 */  mtc1    $at, $f16                  ## $f16 = 270.00
/* 001B8 808A0D78 C60A000C */  lwc1    $f10, 0x000C($s0)          ## 0000000C
/* 001BC 808A0D7C 46105480 */  add.s   $f18, $f10, $f16           
/* 001C0 808A0D80 E6120028 */  swc1    $f18, 0x0028($s0)          ## 00000028
.L808A0D84:
/* 001C4 808A0D84 0C00B56E */  jal     Actor_SetHeight
              
/* 001C8 808A0D88 3C054248 */  lui     $a1, 0x4248                ## $a1 = 42480000
/* 001CC 808A0D8C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001D0 808A0D90 0C228377 */  jal     func_808A0DDC              
/* 001D4 808A0D94 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 001D8 808A0D98 8FBF002C */  lw      $ra, 0x002C($sp)           
.L808A0D9C:
/* 001DC 808A0D9C 8FB00024 */  lw      $s0, 0x0024($sp)           
/* 001E0 808A0DA0 8FB10028 */  lw      $s1, 0x0028($sp)           
/* 001E4 808A0DA4 03E00008 */  jr      $ra                        
/* 001E8 808A0DA8 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
