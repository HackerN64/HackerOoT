glabel BgHidanHamstep_Destroy
/* 00434 80888474 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00438 80888478 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0043C 8088847C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00440 80888480 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00444 80888484 8CE6014C */  lw      $a2, 0x014C($a3)           ## 0000014C
/* 00448 80888488 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0044C 8088848C 24A50810 */  addiu   $a1, $a1, 0x0810           ## $a1 = 00000810
/* 00450 80888490 0C00FB56 */  jal     DynaPolyInfo_Free
              ## DynaPolyInfo_delReserve
/* 00454 80888494 AFA70018 */  sw      $a3, 0x0018($sp)           
/* 00458 80888498 8FA70018 */  lw      $a3, 0x0018($sp)           
/* 0045C 8088849C 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00460 808884A0 84EF001C */  lh      $t7, 0x001C($a3)           ## 0000001C
/* 00464 808884A4 31F800FF */  andi    $t8, $t7, 0x00FF           ## $t8 = 00000000
/* 00468 808884A8 57000004 */  bnel    $t8, $zero, .L808884BC     
/* 0046C 808884AC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00470 808884B0 0C017232 */  jal     Collider_DestroyTris              
/* 00474 808884B4 24E50164 */  addiu   $a1, $a3, 0x0164           ## $a1 = 00000164
/* 00478 808884B8 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808884BC:
/* 0047C 808884BC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00480 808884C0 03E00008 */  jr      $ra                        
/* 00484 808884C4 00000000 */  nop
