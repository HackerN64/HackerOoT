glabel BgPoEvent_Destroy
/* 00638 808A6848 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0063C 808A684C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00640 808A6850 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 00644 808A6854 908E0168 */  lbu     $t6, 0x0168($a0)           ## 00000168
/* 00648 808A6858 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 0064C 808A685C 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00650 808A6860 29C10002 */  slti    $at, $t6, 0x0002           
/* 00654 808A6864 54200007 */  bnel    $at, $zero, .L808A6884     
/* 00658 808A6868 8CE6014C */  lw      $a2, 0x014C($a3)           ## 0000014C
/* 0065C 808A686C 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 00660 808A6870 0C017232 */  jal     Collider_DestroyTris              
/* 00664 808A6874 24E50170 */  addiu   $a1, $a3, 0x0170           ## $a1 = 00000170
/* 00668 808A6878 10000012 */  beq     $zero, $zero, .L808A68C4   
/* 0066C 808A687C 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00670 808A6880 8CE6014C */  lw      $a2, 0x014C($a3)           ## 0000014C
.L808A6884:
/* 00674 808A6884 AFA70018 */  sw      $a3, 0x0018($sp)           
/* 00678 808A6888 0C00FB56 */  jal     DynaPolyInfo_Free
              ## DynaPolyInfo_delReserve
/* 0067C 808A688C 24850810 */  addiu   $a1, $a0, 0x0810           ## $a1 = 00000810
/* 00680 808A6890 8FA70018 */  lw      $a3, 0x0018($sp)           
/* 00684 808A6894 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00688 808A6898 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0068C 808A689C 90F80168 */  lbu     $t8, 0x0168($a3)           ## 00000168
/* 00690 808A68A0 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00694 808A68A4 57010007 */  bnel    $t8, $at, .L808A68C4       
/* 00698 808A68A8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0069C 808A68AC 845913D0 */  lh      $t9, 0x13D0($v0)           ## 8015FA30
/* 006A0 808A68B0 2408000A */  addiu   $t0, $zero, 0x000A         ## $t0 = 0000000A
/* 006A4 808A68B4 5B200003 */  blezl   $t9, .L808A68C4            
/* 006A8 808A68B8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 006AC 808A68BC A44813CE */  sh      $t0, 0x13CE($v0)           ## 8015FA2E
/* 006B0 808A68C0 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L808A68C4:
/* 006B4 808A68C4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 006B8 808A68C8 03E00008 */  jr      $ra                        
/* 006BC 808A68CC 00000000 */  nop
