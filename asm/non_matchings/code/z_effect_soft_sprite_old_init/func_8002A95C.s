glabel func_8002A95C
/* AA1AFC 8002A95C 27BDFFB8 */  addiu $sp, $sp, -0x48
/* AA1B00 8002A960 AFBF0014 */  sw    $ra, 0x14($sp)
/* AA1B04 8002A964 AFA40048 */  sw    $a0, 0x48($sp)
/* AA1B08 8002A968 AFA60050 */  sw    $a2, 0x50($sp)
/* AA1B0C 8002A96C AFA70054 */  sw    $a3, 0x54($sp)
/* AA1B10 8002A970 0C01DF90 */  jal   Math_Vec3f_Copy
/* AA1B14 8002A974 27A40018 */   addiu $a0, $sp, 0x18
/* AA1B18 8002A978 27A40024 */  addiu $a0, $sp, 0x24
/* AA1B1C 8002A97C 0C01DF90 */  jal   Math_Vec3f_Copy
/* AA1B20 8002A980 8FA50050 */   lw    $a1, 0x50($sp)
/* AA1B24 8002A984 27A40030 */  addiu $a0, $sp, 0x30
/* AA1B28 8002A988 0C01DF90 */  jal   Math_Vec3f_Copy
/* AA1B2C 8002A98C 8FA50054 */   lw    $a1, 0x54($sp)
/* AA1B30 8002A990 87A2005E */  lh    $v0, 0x5e($sp)
/* AA1B34 8002A994 97AE005A */  lhu   $t6, 0x5a($sp)
/* AA1B38 8002A998 87AF0062 */  lh    $t7, 0x62($sp)
/* AA1B3C 8002A99C 8FB80064 */  lw    $t8, 0x64($sp)
/* AA1B40 8002A9A0 A7A2003E */  sh    $v0, 0x3e($sp)
/* AA1B44 8002A9A4 A7AE003C */  sh    $t6, 0x3c($sp)
/* AA1B48 8002A9A8 A7AF0040 */  sh    $t7, 0x40($sp)
/* AA1B4C 8002A9AC 14400008 */  bnez  $v0, .L8002A9D0
/* AA1B50 8002A9B0 AFB80044 */   sw    $t8, 0x44($sp)
/* AA1B54 8002A9B4 8FA40048 */  lw    $a0, 0x48($sp)
/* AA1B58 8002A9B8 24050023 */  li    $a1, 35
/* AA1B5C 8002A9BC 24060064 */  li    $a2, 100
/* AA1B60 8002A9C0 0C009DE6 */  jal   EffectSs_Spawn
/* AA1B64 8002A9C4 27A70018 */   addiu $a3, $sp, 0x18
/* AA1B68 8002A9C8 10000007 */  b     .L8002A9E8
/* AA1B6C 8002A9CC 8FBF0014 */   lw    $ra, 0x14($sp)
.L8002A9D0:
/* AA1B70 8002A9D0 8FA40048 */  lw    $a0, 0x48($sp)
/* AA1B74 8002A9D4 24050023 */  li    $a1, 35
/* AA1B78 8002A9D8 2406007F */  li    $a2, 127
/* AA1B7C 8002A9DC 0C009DE6 */  jal   EffectSs_Spawn
/* AA1B80 8002A9E0 27A70018 */   addiu $a3, $sp, 0x18
/* AA1B84 8002A9E4 8FBF0014 */  lw    $ra, 0x14($sp)
.L8002A9E8:
/* AA1B88 8002A9E8 27BD0048 */  addiu $sp, $sp, 0x48
/* AA1B8C 8002A9EC 03E00008 */  jr    $ra
/* AA1B90 8002A9F0 00000000 */   nop   

