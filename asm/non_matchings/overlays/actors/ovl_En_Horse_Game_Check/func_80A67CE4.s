.rdata
glabel D_80A6854C
    .asciz "En_HGC_Spot20_Ta_end():対応せず\n"
    .balign 4

.text
glabel func_80A67CE4
/* 00794 80A67CE4 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00798 80A67CE8 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0079C 80A67CEC 8C82019C */  lw      $v0, 0x019C($a0)           ## 0000019C
/* 007A0 80A67CF0 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 007A4 80A67CF4 240E04CE */  addiu   $t6, $zero, 0x04CE         ## $t6 = 000004CE
/* 007A8 80A67CF8 10410004 */  beq     $v0, $at, .L80A67D0C       
/* 007AC 80A67CFC 240F002E */  addiu   $t7, $zero, 0x002E         ## $t7 = 0000002E
/* 007B0 80A67D00 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 007B4 80A67D04 54410010 */  bnel    $v0, $at, .L80A67D48       
/* 007B8 80A67D08 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
.L80A67D0C:
/* 007BC 80A67D0C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 007C0 80A67D10 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 007C4 80A67D14 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 007C8 80A67D18 AC400008 */  sw      $zero, 0x0008($v0)         ## 8015E668
/* 007CC 80A67D1C 00250821 */  addu    $at, $at, $a1              
/* 007D0 80A67D20 A42E1E1A */  sh      $t6, 0x1E1A($at)           ## 00011E1A
/* 007D4 80A67D24 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 007D8 80A67D28 00250821 */  addu    $at, $at, $a1              
/* 007DC 80A67D2C A02F1E5E */  sb      $t7, 0x1E5E($at)           ## 00011E5E
/* 007E0 80A67D30 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 007E4 80A67D34 00250821 */  addu    $at, $at, $a1              
/* 007E8 80A67D38 24180014 */  addiu   $t8, $zero, 0x0014         ## $t8 = 00000014
/* 007EC 80A67D3C 1000002B */  beq     $zero, $zero, .L80A67DEC   
/* 007F0 80A67D40 A0381E15 */  sb      $t8, 0x1E15($at)           ## 00011E15
/* 007F4 80A67D44 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
.L80A67D48:
/* 007F8 80A67D48 14410014 */  bne     $v0, $at, .L80A67D9C       
/* 007FC 80A67D4C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00800 80A67D50 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00804 80A67D54 241900F0 */  addiu   $t9, $zero, 0x00F0         ## $t9 = 000000F0
/* 00808 80A67D58 2408000F */  addiu   $t0, $zero, 0x000F         ## $t0 = 0000000F
/* 0080C 80A67D5C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00810 80A67D60 A45913D0 */  sh      $t9, 0x13D0($v0)           ## 8015FA30
/* 00814 80A67D64 A44813CE */  sh      $t0, 0x13CE($v0)           ## 8015FA2E
/* 00818 80A67D68 AC400008 */  sw      $zero, 0x0008($v0)         ## 8015E668
/* 0081C 80A67D6C 00250821 */  addu    $at, $at, $a1              
/* 00820 80A67D70 240904CE */  addiu   $t1, $zero, 0x04CE         ## $t1 = 000004CE
/* 00824 80A67D74 A4291E1A */  sh      $t1, 0x1E1A($at)           ## 00011E1A
/* 00828 80A67D78 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0082C 80A67D7C 00250821 */  addu    $at, $at, $a1              
/* 00830 80A67D80 240A002E */  addiu   $t2, $zero, 0x002E         ## $t2 = 0000002E
/* 00834 80A67D84 A02A1E5E */  sb      $t2, 0x1E5E($at)           ## 00011E5E
/* 00838 80A67D88 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0083C 80A67D8C 00250821 */  addu    $at, $at, $a1              
/* 00840 80A67D90 240B0014 */  addiu   $t3, $zero, 0x0014         ## $t3 = 00000014
/* 00844 80A67D94 10000015 */  beq     $zero, $zero, .L80A67DEC   
/* 00848 80A67D98 A02B1E15 */  sb      $t3, 0x1E15($at)           ## 00011E15
.L80A67D9C:
/* 0084C 80A67D9C 3C0480A7 */  lui     $a0, %hi(D_80A6854C)       ## $a0 = 80A70000
/* 00850 80A67DA0 2484854C */  addiu   $a0, $a0, %lo(D_80A6854C)  ## $a0 = 80A6854C
/* 00854 80A67DA4 0C00084C */  jal     osSyncPrintf
              
/* 00858 80A67DA8 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0085C 80A67DAC 8FA5001C */  lw      $a1, 0x001C($sp)           
/* 00860 80A67DB0 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00864 80A67DB4 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00868 80A67DB8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0086C 80A67DBC AC400008 */  sw      $zero, 0x0008($v0)         ## 8015E668
/* 00870 80A67DC0 240C0157 */  addiu   $t4, $zero, 0x0157         ## $t4 = 00000157
/* 00874 80A67DC4 00250821 */  addu    $at, $at, $a1              
/* 00878 80A67DC8 A42C1E1A */  sh      $t4, 0x1E1A($at)           ## 00011E1A
/* 0087C 80A67DCC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00880 80A67DD0 240D002E */  addiu   $t5, $zero, 0x002E         ## $t5 = 0000002E
/* 00884 80A67DD4 00250821 */  addu    $at, $at, $a1              
/* 00888 80A67DD8 A02D1E5E */  sb      $t5, 0x1E5E($at)           ## 00011E5E
/* 0088C 80A67DDC 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00890 80A67DE0 240E0014 */  addiu   $t6, $zero, 0x0014         ## $t6 = 00000014
/* 00894 80A67DE4 00250821 */  addu    $at, $at, $a1              
/* 00898 80A67DE8 A02E1E15 */  sb      $t6, 0x1E15($at)           ## 00011E15
.L80A67DEC:
/* 0089C 80A67DEC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 008A0 80A67DF0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 008A4 80A67DF4 03E00008 */  jr      $ra                        
/* 008A8 80A67DF8 00000000 */  nop
