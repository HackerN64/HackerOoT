glabel EnZl2_Destroy
/* 00000 80B4E990 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00004 80B4E994 AFBF0014 */  sw      $ra, 0x0014($sp)
/* 00008 80B4E998 0C0295BC */  jal     SkelAnime_Free
/* 0000C 80B4E99C 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00010 80B4E9A0 8FBF0014 */  lw      $ra, 0x0014($sp)
/* 00014 80B4E9A4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00018 80B4E9A8 03E00008 */  jr      $ra
/* 0001C 80B4E9AC 00000000 */  nop
