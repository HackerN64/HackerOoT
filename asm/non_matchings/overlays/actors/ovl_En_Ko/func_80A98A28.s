glabel func_80A98A28
/* 01C78 80A98A28 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 01C7C 80A98A2C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 01C80 80A98A30 8C490004 */  lw      $t1, 0x0004($v0)           ## 8015E664
/* 01C84 80A98A34 3C0A8012 */  lui     $t2, %hi(gBitFlags)
/* 01C88 80A98A38 55200012 */  bnel    $t1, $zero, .L80A98A84     
/* 01C8C 80A98A3C 848D001C */  lh      $t5, 0x001C($a0)           ## 0000001C
/* 01C90 80A98A40 8D4A7120 */  lw      $t2, %lo(gBitFlags)($t2)
/* 01C94 80A98A44 8C4B00A4 */  lw      $t3, 0x00A4($v0)           ## 8015E704
/* 01C98 80A98A48 014B6024 */  and     $t4, $t2, $t3              
/* 01C9C 80A98A4C 5580000D */  bnel    $t4, $zero, .L80A98A84     
/* 01CA0 80A98A50 848D001C */  lh      $t5, 0x001C($a0)           ## 0000001C
/* 01CA4 80A98A54 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 01CA8 80A98A58 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01CAC 80A98A5C 304200FF */  andi    $v0, $v0, 0x00FF           ## $v0 = 00000060
/* 01CB0 80A98A60 10410005 */  beq     $v0, $at, .L80A98A78       
/* 01CB4 80A98A64 24010009 */  addiu   $at, $zero, 0x0009         ## $at = 00000009
/* 01CB8 80A98A68 10410003 */  beq     $v0, $at, .L80A98A78       
/* 01CBC 80A98A6C 00000000 */  nop
/* 01CC0 80A98A70 03E00008 */  jr      $ra                        
/* 01CC4 80A98A74 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98A78:
/* 01CC8 80A98A78 03E00008 */  jr      $ra                        
/* 01CCC 80A98A7C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A98A80:
/* 01CD0 80A98A80 848D001C */  lh      $t5, 0x001C($a0)           ## 0000001C
.L80A98A84:
/* 01CD4 80A98A84 24010009 */  addiu   $at, $zero, 0x0009         ## $at = 00000009
/* 01CD8 80A98A88 31AE00FF */  andi    $t6, $t5, 0x00FF           ## $t6 = 00000000
/* 01CDC 80A98A8C 11C10003 */  beq     $t6, $at, .L80A98A9C       
/* 01CE0 80A98A90 00000000 */  nop
/* 01CE4 80A98A94 03E00008 */  jr      $ra                        
/* 01CE8 80A98A98 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A98A9C:
/* 01CEC 80A98A9C 03E00008 */  jr      $ra                        
/* 01CF0 80A98AA0 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
