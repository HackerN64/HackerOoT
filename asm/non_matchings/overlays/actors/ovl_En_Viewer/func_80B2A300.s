glabel func_80B2A300
/* 00100 80B2A300 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00104 80B2A304 AFBF002C */  sw      $ra, 0x002C($sp)
/* 00108 80B2A308 AFB00028 */  sw      $s0, 0x0028($sp)
/* 0010C 80B2A30C AFA40038 */  sw      $a0, 0x0038($sp)
/* 00110 80B2A310 AFA5003C */  sw      $a1, 0x003C($sp)
/* 00114 80B2A314 AFA70044 */  sw      $a3, 0x0044($sp)
/* 00118 80B2A318 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 0011C 80B2A31C 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00120 80B2A320 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00124 80B2A324 00021203 */  sra     $v0, $v0,  8
/* 00128 80B2A328 00021400 */  sll     $v0, $v0, 16
/* 0012C 80B2A32C 00021403 */  sra     $v0, $v0, 16
/* 00130 80B2A330 1041000C */  beq     $v0, $at, .L80B2A364
/* 00134 80B2A334 8FB00038 */  lw      $s0, 0x0038($sp)
/* 00138 80B2A338 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0013C 80B2A33C 10410009 */  beq     $v0, $at, .L80B2A364
/* 00140 80B2A340 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00144 80B2A344 10410007 */  beq     $v0, $at, .L80B2A364
/* 00148 80B2A348 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 0014C 80B2A34C 10410005 */  beq     $v0, $at, .L80B2A364
/* 00150 80B2A350 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 00154 80B2A354 10410003 */  beq     $v0, $at, .L80B2A364
/* 00158 80B2A358 24010009 */  addiu   $at, $zero, 0x0009         ## $at = 00000009
/* 0015C 80B2A35C 1441000B */  bne     $v0, $at, .L80B2A38C
/* 00160 80B2A360 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
.L80B2A364:
/* 00164 80B2A364 26100198 */  addiu   $s0, $s0, 0x0198           ## $s0 = 00000198
/* 00168 80B2A368 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000198
/* 0016C 80B2A36C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00170 80B2A370 AFA00010 */  sw      $zero, 0x0010($sp)
/* 00174 80B2A374 AFA00014 */  sw      $zero, 0x0014($sp)
/* 00178 80B2A378 AFA00018 */  sw      $zero, 0x0018($sp)
/* 0017C 80B2A37C 0C0291BE */  jal     SkelAnime_InitFlex
/* 00180 80B2A380 A7A20036 */  sh      $v0, 0x0036($sp)
/* 00184 80B2A384 1000000B */  beq     $zero, $zero, .L80B2A3B4
/* 00188 80B2A388 87A20036 */  lh      $v0, 0x0036($sp)
.L80B2A38C:
/* 0018C 80B2A38C 8FB00038 */  lw      $s0, 0x0038($sp)
/* 00190 80B2A390 8FA4003C */  lw      $a0, 0x003C($sp)
/* 00194 80B2A394 AFA00010 */  sw      $zero, 0x0010($sp)
/* 00198 80B2A398 26100198 */  addiu   $s0, $s0, 0x0198           ## $s0 = 00000330
/* 0019C 80B2A39C 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000330
/* 001A0 80B2A3A0 AFA00014 */  sw      $zero, 0x0014($sp)
/* 001A4 80B2A3A4 AFA00018 */  sw      $zero, 0x0018($sp)
/* 001A8 80B2A3A8 0C02915F */  jal     SkelAnime_Init

/* 001AC 80B2A3AC A7A20036 */  sh      $v0, 0x0036($sp)
/* 001B0 80B2A3B0 87A20036 */  lh      $v0, 0x0036($sp)
.L80B2A3B4:
/* 001B4 80B2A3B4 8FB80038 */  lw      $t8, 0x0038($sp)
/* 001B8 80B2A3B8 8FAF003C */  lw      $t7, 0x003C($sp)
/* 001BC 80B2A3BC 3C0A0001 */  lui     $t2, 0x0001                ## $t2 = 00010000
/* 001C0 80B2A3C0 831901DC */  lb      $t9, 0x01DC($t8)           ## 000001DC
/* 001C4 80B2A3C4 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 001C8 80B2A3C8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000330
/* 001CC 80B2A3CC 00194100 */  sll     $t0, $t9,  4
/* 001D0 80B2A3D0 01194021 */  addu    $t0, $t0, $t9
/* 001D4 80B2A3D4 00084080 */  sll     $t0, $t0,  2
/* 001D8 80B2A3D8 01E84821 */  addu    $t1, $t7, $t0
/* 001DC 80B2A3DC 01495021 */  addu    $t2, $t2, $t1
/* 001E0 80B2A3E0 8D4A17B4 */  lw      $t2, 0x17B4($t2)           ## 000117B4
/* 001E4 80B2A3E4 8FA50044 */  lw      $a1, 0x0044($sp)
/* 001E8 80B2A3E8 01415821 */  addu    $t3, $t2, $at
/* 001EC 80B2A3EC 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 001F0 80B2A3F0 AC2B6FC0 */  sw      $t3, %lo(gSegments+0x18)($at)
/* 001F4 80B2A3F4 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 001F8 80B2A3F8 10410007 */  beq     $v0, $at, .L80B2A418
/* 001FC 80B2A3FC 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 00200 80B2A400 10410005 */  beq     $v0, $at, .L80B2A418
/* 00204 80B2A404 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 00208 80B2A408 10410003 */  beq     $v0, $at, .L80B2A418
/* 0020C 80B2A40C 24010009 */  addiu   $at, $zero, 0x0009         ## $at = 00000009
/* 00210 80B2A410 14410005 */  bne     $v0, $at, .L80B2A428
/* 00214 80B2A414 3C064040 */  lui     $a2, 0x4040                ## $a2 = 40400000
.L80B2A418:
/* 00218 80B2A418 0C0294E1 */  jal     SkelAnime_ChangeAnimPlaybackRepeat
/* 0021C 80B2A41C 3C063F80 */  lui     $a2, 0x3F80                ## $a2 = 3F800000
/* 00220 80B2A420 10000005 */  beq     $zero, $zero, .L80B2A438
/* 00224 80B2A424 8FBF002C */  lw      $ra, 0x002C($sp)
.L80B2A428:
/* 00228 80B2A428 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000330
/* 0022C 80B2A42C 0C0294E1 */  jal     SkelAnime_ChangeAnimPlaybackRepeat
/* 00230 80B2A430 8FA50044 */  lw      $a1, 0x0044($sp)
/* 00234 80B2A434 8FBF002C */  lw      $ra, 0x002C($sp)
.L80B2A438:
/* 00238 80B2A438 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0023C 80B2A43C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00240 80B2A440 03E00008 */  jr      $ra
/* 00244 80B2A444 00000000 */  nop
