glabel func_80983F30
/* 00C30 80983F30 44856000 */  mtc1    $a1, $f12                  ## $f12 = 0.00
/* 00C34 80983F34 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00C38 80983F38 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00C3C 80983F3C AFA40020 */  sw      $a0, 0x0020($sp)           
/* 00C40 80983F40 44056000 */  mfc1    $a1, $f12                  
/* 00C44 80983F44 0C0295B2 */  jal     Animation_OnFrame              
/* 00C48 80983F48 2484014C */  addiu   $a0, $a0, 0x014C           ## $a0 = 0000014C
/* 00C4C 80983F4C 1040000B */  beq     $v0, $zero, .L80983F7C     
/* 00C50 80983F50 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 00C54 80983F54 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 00C58 80983F58 3C0E8013 */  lui     $t6, %hi(D_801333E8)
/* 00C5C 80983F5C 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 00C60 80983F60 25CE33E8 */  addiu   $t6, %lo(D_801333E8)
/* 00C64 80983F64 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 00C68 80983F68 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 00C6C 80983F6C 2404392C */  addiu   $a0, $zero, 0x392C         ## $a0 = 0000392C
/* 00C70 80983F70 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00C74 80983F74 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 00C78 80983F78 24A500E4 */  addiu   $a1, $a1, 0x00E4           ## $a1 = 000000E4
.L80983F7C:
/* 00C7C 80983F7C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00C80 80983F80 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00C84 80983F84 03E00008 */  jr      $ra                        
/* 00C88 80983F88 00000000 */  nop
