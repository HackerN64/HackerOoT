glabel func_8096D728
/* 00278 8096D728 00067900 */  sll     $t7, $a2,  4
/* 0027C 8096D72C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00280 8096D730 000FC702 */  srl     $t8, $t7, 28
/* 00284 8096D734 0018C880 */  sll     $t9, $t8,  2
/* 00288 8096D738 3C088016 */  lui     $t0, %hi(gSegments)
/* 0028C 8096D73C 01194021 */  addu    $t0, $t0, $t9
/* 00290 8096D740 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00294 8096D744 8D086FA8 */  lw      $t0, %lo(gSegments)($t0)
/* 00298 8096D748 AFA40028 */  sw      $a0, 0x0028($sp)
/* 0029C 8096D74C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 002A0 8096D750 AFA5002C */  sw      $a1, 0x002C($sp)
/* 002A4 8096D754 00C14824 */  and     $t1, $a2, $at
/* 002A8 8096D758 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 002AC 8096D75C 8FA50028 */  lw      $a1, 0x0028($sp)
/* 002B0 8096D760 AFA60030 */  sw      $a2, 0x0030($sp)
/* 002B4 8096D764 AFBF0024 */  sw      $ra, 0x0024($sp)
/* 002B8 8096D768 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 002BC 8096D76C 01093021 */  addu    $a2, $t0, $t1
/* 002C0 8096D770 00C13021 */  addu    $a2, $a2, $at
/* 002C4 8096D774 AFA00010 */  sw      $zero, 0x0010($sp)
/* 002C8 8096D778 AFA00014 */  sw      $zero, 0x0014($sp)
/* 002CC 8096D77C AFA00018 */  sw      $zero, 0x0018($sp)
/* 002D0 8096D780 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 002D4 8096D784 0C0291BE */  jal     SkelAnime_InitFlex
/* 002D8 8096D788 24A5014C */  addiu   $a1, $a1, 0x014C           ## $a1 = 0000014C
/* 002DC 8096D78C 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 002E0 8096D790 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 002E4 8096D794 03E00008 */  jr      $ra
/* 002E8 8096D798 00000000 */  nop
