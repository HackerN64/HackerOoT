glabel EnTg_Init
/* 00150 80B184B0 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00154 80B184B4 AFB00028 */  sw      $s0, 0x0028($sp)
/* 00158 80B184B8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0015C 80B184BC AFBF002C */  sw      $ra, 0x002C($sp)
/* 00160 80B184C0 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00164 80B184C4 3C068003 */  lui     $a2, %hi(ActorShadow_DrawCircle)
/* 00168 80B184C8 24C6B5EC */  addiu   $a2, %lo(ActorShadow_DrawCircle)
/* 0016C 80B184CC 24050000 */  addiu   $a1, $zero, 0x0000         ## $a1 = 00000000
/* 00170 80B184D0 248400B4 */  addiu   $a0, $a0, 0x00B4           ## $a0 = 000000B4
/* 00174 80B184D4 0C00AC78 */  jal     ActorShape_Init

/* 00178 80B184D8 3C0741E0 */  lui     $a3, 0x41E0                ## $a3 = 41E00000
/* 0017C 80B184DC 3C060601 */  lui     $a2, %hi(D_0600AE40)                ## $a2 = 06010000
/* 00180 80B184E0 3C070600 */  lui     $a3, %hi(D_06005040)                ## $a3 = 06000000
/* 00184 80B184E4 24E75040 */  addiu   $a3, $a3, %lo(D_06005040)           ## $a3 = 06005040
/* 00188 80B184E8 24C6AE40 */  addiu   $a2, $a2, %lo(D_0600AE40)           ## $a2 = 0600AE40
/* 0018C 80B184EC 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00190 80B184F0 2605014C */  addiu   $a1, $s0, 0x014C           ## $a1 = 0000014C
/* 00194 80B184F4 AFA00010 */  sw      $zero, 0x0010($sp)
/* 00198 80B184F8 AFA00014 */  sw      $zero, 0x0014($sp)
/* 0019C 80B184FC 0C0291BE */  jal     SkelAnime_InitFlex
/* 001A0 80B18500 AFA00018 */  sw      $zero, 0x0018($sp)
/* 001A4 80B18504 26050194 */  addiu   $a1, $s0, 0x0194           ## $a1 = 00000194
/* 001A8 80B18508 AFA50030 */  sw      $a1, 0x0030($sp)
/* 001AC 80B1850C 0C0170D9 */  jal     Collider_InitCylinder

/* 001B0 80B18510 8FA4003C */  lw      $a0, 0x003C($sp)
/* 001B4 80B18514 3C0780B2 */  lui     $a3, %hi(D_80B18910)       ## $a3 = 80B20000
/* 001B8 80B18518 8FA50030 */  lw      $a1, 0x0030($sp)
/* 001BC 80B1851C 24E78910 */  addiu   $a3, $a3, %lo(D_80B18910)  ## $a3 = 80B18910
/* 001C0 80B18520 8FA4003C */  lw      $a0, 0x003C($sp)
/* 001C4 80B18524 0C01712B */  jal     Collider_SetCylinder

/* 001C8 80B18528 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 001CC 80B1852C 3C0680B2 */  lui     $a2, %hi(D_80B1893C)       ## $a2 = 80B20000
/* 001D0 80B18530 24C6893C */  addiu   $a2, $a2, %lo(D_80B1893C)  ## $a2 = 80B1893C
/* 001D4 80B18534 26040098 */  addiu   $a0, $s0, 0x0098           ## $a0 = 00000098
/* 001D8 80B18538 0C0187BF */  jal     CollisionCheck_SetInfo2
/* 001DC 80B1853C 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 001E0 80B18540 240E0006 */  addiu   $t6, $zero, 0x0006         ## $t6 = 00000006
/* 001E4 80B18544 3C053C23 */  lui     $a1, 0x3C23                ## $a1 = 3C230000
/* 001E8 80B18548 A20E001F */  sb      $t6, 0x001F($s0)           ## 0000001F
/* 001EC 80B1854C 34A5D70A */  ori     $a1, $a1, 0xD70A           ## $a1 = 3C23D70A
/* 001F0 80B18550 0C00B58B */  jal     Actor_SetScale

/* 001F4 80B18554 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001F8 80B18558 8FAF003C */  lw      $t7, 0x003C($sp)
/* 001FC 80B1855C 3C0880B2 */  lui     $t0, %hi(func_80B185C0)    ## $t0 = 80B20000
/* 00200 80B18560 250885C0 */  addiu   $t0, $t0, %lo(func_80B185C0) ## $t0 = 80B185C0
/* 00204 80B18564 8DF8009C */  lw      $t8, 0x009C($t7)           ## 0000009C
/* 00208 80B18568 AE080190 */  sw      $t0, 0x0190($s0)           ## 00000190
/* 0020C 80B1856C 33190001 */  andi    $t9, $t8, 0x0001           ## $t9 = 00000000
/* 00210 80B18570 A2190208 */  sb      $t9, 0x0208($s0)           ## 00000208
/* 00214 80B18574 8FBF002C */  lw      $ra, 0x002C($sp)
/* 00218 80B18578 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0021C 80B1857C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00220 80B18580 03E00008 */  jr      $ra
/* 00224 80B18584 00000000 */  nop
