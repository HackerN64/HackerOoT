.late_rodata
glabel D_80855354
 .word 0x3F2AAAAB

.text
glabel func_80833064
/* 00E54 80833064 3C018085 */  lui     $at, %hi(D_80855354)       ## $at = 80850000
/* 00E58 80833068 C4245354 */  lwc1    $f4, %lo(D_80855354)($at)  
/* 00E5C 8083306C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00E60 80833070 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00E64 80833074 0C20CBFF */  jal     func_80832FFC              
/* 00E68 80833078 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 00E6C 8083307C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00E70 80833080 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00E74 80833084 03E00008 */  jr      $ra                        
/* 00E78 80833088 00000000 */  nop
