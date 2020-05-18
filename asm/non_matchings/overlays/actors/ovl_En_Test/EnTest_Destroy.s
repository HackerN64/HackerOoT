glabel EnTest_Destroy
/* 00250 8085F8A0 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00254 8085F8A4 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00258 8085F8A8 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 0025C 8085F8AC AFB0001C */  sw      $s0, 0x001C($sp)           
/* 00260 8085F8B0 848E001C */  lh      $t6, 0x001C($a0)           ## 0000001C
/* 00264 8085F8B4 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00268 8085F8B8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0026C 8085F8BC 11C1000D */  beq     $t6, $at, .L8085F8F4       
/* 00270 8085F8C0 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00274 8085F8C4 3C0145FA */  lui     $at, 0x45FA                ## $at = 45FA0000
/* 00278 8085F8C8 44812000 */  mtc1    $at, $f4                   ## $f4 = 8000.00
/* 0027C 8085F8CC 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00280 8085F8D0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00284 8085F8D4 24060002 */  addiu   $a2, $zero, 0x0002         ## $a2 = 00000002
/* 00288 8085F8D8 24070005 */  addiu   $a3, $zero, 0x0005         ## $a3 = 00000005
/* 0028C 8085F8DC 0C00D4FD */  jal     Actor_FindNearby
              
/* 00290 8085F8E0 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00294 8085F8E4 54400004 */  bnel    $v0, $zero, .L8085F8F8     
/* 00298 8085F8E8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0029C 8085F8EC 0C03D6D6 */  jal     func_800F5B58              
/* 002A0 8085F8F0 00000000 */  nop
.L8085F8F4:
/* 002A4 8085F8F4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L8085F8F8:
/* 002A8 8085F8F8 0C009C27 */  jal     Effect_Delete              
/* 002AC 8085F8FC 8E05080C */  lw      $a1, 0x080C($s0)           ## 0000080C
/* 002B0 8085F900 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002B4 8085F904 0C0170EB */  jal     Collider_DestroyCylinder
              
/* 002B8 8085F908 260508DC */  addiu   $a1, $s0, 0x08DC           ## $a1 = 000008DC
/* 002BC 8085F90C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002C0 8085F910 0C0170EB */  jal     Collider_DestroyCylinder
              
/* 002C4 8085F914 26050810 */  addiu   $a1, $s0, 0x0810           ## $a1 = 00000810
/* 002C8 8085F918 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 002CC 8085F91C 0C017418 */  jal     Collider_DestroyQuad              
/* 002D0 8085F920 2605085C */  addiu   $a1, $s0, 0x085C           ## $a1 = 0000085C
/* 002D4 8085F924 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 002D8 8085F928 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 002DC 8085F92C 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 002E0 8085F930 03E00008 */  jr      $ra                        
/* 002E4 8085F934 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
