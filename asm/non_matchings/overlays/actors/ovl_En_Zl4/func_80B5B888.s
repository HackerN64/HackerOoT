glabel func_80B5B888
/* 000D8 80B5B888 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 000DC 80B5B88C AFBF001C */  sw      $ra, 0x001C($sp)
/* 000E0 80B5B890 AFA5002C */  sw      $a1, 0x002C($sp)
/* 000E4 80B5B894 848E07A0 */  lh      $t6, 0x07A0($a0)           ## 000007A0
/* 000E8 80B5B898 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 000EC 80B5B89C 8CD91C44 */  lw      $t9, 0x1C44($a2)           ## 00001C44
/* 000F0 80B5B8A0 000E7880 */  sll     $t7, $t6,  2
/* 000F4 80B5B8A4 008FC021 */  addu    $t8, $a0, $t7
/* 000F8 80B5B8A8 8F040790 */  lw      $a0, 0x0790($t8)           ## 00000790
/* 000FC 80B5B8AC 24050025 */  addiu   $a1, $zero, 0x0025         ## $a1 = 00000025
/* 00100 80B5B8B0 AFB90020 */  sw      $t9, 0x0020($sp)
/* 00104 80B5B8B4 0C0169DF */  jal     Camera_ChangeSetting
/* 00108 80B5B8B8 AFA40024 */  sw      $a0, 0x0024($sp)
/* 0010C 80B5B8BC 0C016B18 */  jal     Camera_ResetAnim
/* 00110 80B5B8C0 8FA40024 */  lw      $a0, 0x0024($sp)
/* 00114 80B5B8C4 87A8002E */  lh      $t0, 0x002E($sp)
/* 00118 80B5B8C8 3C0A80B6 */  lui     $t2, %hi(D_80B5FA90)       ## $t2 = 80B60000
/* 0011C 80B5B8CC 254AFA90 */  addiu   $t2, $t2, %lo(D_80B5FA90)  ## $t2 = 80B5FA90
/* 00120 80B5B8D0 00084880 */  sll     $t1, $t0,  2
/* 00124 80B5B8D4 01284823 */  subu    $t1, $t1, $t0
/* 00128 80B5B8D8 00094880 */  sll     $t1, $t1,  2
/* 0012C 80B5B8DC 012A1021 */  addu    $v0, $t1, $t2
/* 00130 80B5B8E0 844B0008 */  lh      $t3, 0x0008($v0)           ## 00000008
/* 00134 80B5B8E4 8C450000 */  lw      $a1, 0x0000($v0)           ## 00000000
/* 00138 80B5B8E8 8C460004 */  lw      $a2, 0x0004($v0)           ## 00000004
/* 0013C 80B5B8EC 8FA40024 */  lw      $a0, 0x0024($sp)
/* 00140 80B5B8F0 8FA70020 */  lw      $a3, 0x0020($sp)
/* 00144 80B5B8F4 0C016B1B */  jal     Camera_SetCSParams
/* 00148 80B5B8F8 AFAB0010 */  sw      $t3, 0x0010($sp)
/* 0014C 80B5B8FC 8FBF001C */  lw      $ra, 0x001C($sp)
/* 00150 80B5B900 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00154 80B5B904 03E00008 */  jr      $ra
/* 00158 80B5B908 00000000 */  nop
