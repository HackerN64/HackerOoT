.rdata
glabel D_808AF994
    .asciz "../z_bg_spot06_objects.c"
    .balign 4

glabel D_808AF9B0
    .asciz "../z_bg_spot06_objects.c"
    .balign 4

glabel D_808AF9CC
    .asciz "../z_bg_spot06_objects.c"
    .balign 4

.text
glabel func_808AF524
/* 00DA4 808AF524 27BDFF78 */  addiu   $sp, $sp, 0xFF78           ## $sp = FFFFFF78
/* 00DA8 808AF528 AFB20040 */  sw      $s2, 0x0040($sp)           
/* 00DAC 808AF52C 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 00DB0 808AF530 AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 00DB4 808AF534 AFB1003C */  sw      $s1, 0x003C($sp)           
/* 00DB8 808AF538 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 00DBC 808AF53C AFA40088 */  sw      $a0, 0x0088($sp)           
/* 00DC0 808AF540 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00DC4 808AF544 3C06808B */  lui     $a2, %hi(D_808AF994)       ## $a2 = 808B0000
/* 00DC8 808AF548 24C6F994 */  addiu   $a2, $a2, %lo(D_808AF994)  ## $a2 = 808AF994
/* 00DCC 808AF54C 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFE4
/* 00DD0 808AF550 2407034C */  addiu   $a3, $zero, 0x034C         ## $a3 = 0000034C
/* 00DD4 808AF554 0C031AB1 */  jal     Graph_OpenDisps              
/* 00DD8 808AF558 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00DDC 808AF55C 0C024F61 */  jal     func_80093D84              
/* 00DE0 808AF560 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00DE4 808AF564 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00DE8 808AF568 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 00DEC 808AF56C 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 00DF0 808AF570 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00DF4 808AF574 AE2E02D0 */  sw      $t6, 0x02D0($s1)           ## 000002D0
/* 00DF8 808AF578 3C05808B */  lui     $a1, %hi(D_808AF9B0)       ## $a1 = 808B0000
/* 00DFC 808AF57C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00E00 808AF580 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00E04 808AF584 24A5F9B0 */  addiu   $a1, $a1, %lo(D_808AF9B0)  ## $a1 = 808AF9B0
/* 00E08 808AF588 24060352 */  addiu   $a2, $zero, 0x0352         ## $a2 = 00000352
/* 00E0C 808AF58C 0C0346A2 */  jal     Matrix_NewMtx              
/* 00E10 808AF590 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 00E14 808AF594 AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 00E18 808AF598 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00E1C 808AF59C 8E50009C */  lw      $s0, 0x009C($s2)           ## 0000009C
/* 00E20 808AF5A0 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 00E24 808AF5A4 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00E28 808AF5A8 AE3802D0 */  sw      $t8, 0x02D0($s1)           ## 000002D0
/* 00E2C 808AF5AC 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 00E30 808AF5B0 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 00E34 808AF5B4 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00E38 808AF5B8 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 00E3C 808AF5BC 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 00E40 808AF5C0 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 00E44 808AF5C4 240B0020 */  addiu   $t3, $zero, 0x0020         ## $t3 = 00000020
/* 00E48 808AF5C8 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 00E4C 808AF5CC 00103023 */  subu    $a2, $zero, $s0            
/* 00E50 808AF5D0 AFA60050 */  sw      $a2, 0x0050($sp)           
/* 00E54 808AF5D4 AFAC0028 */  sw      $t4, 0x0028($sp)           
/* 00E58 808AF5D8 AFAB0024 */  sw      $t3, 0x0024($sp)           
/* 00E5C 808AF5DC AFAA0018 */  sw      $t2, 0x0018($sp)           
/* 00E60 808AF5E0 AFA90014 */  sw      $t1, 0x0014($sp)           
/* 00E64 808AF5E4 AFA80010 */  sw      $t0, 0x0010($sp)           
/* 00E68 808AF5E8 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00E6C 808AF5EC AFA20064 */  sw      $v0, 0x0064($sp)           
/* 00E70 808AF5F0 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 00E74 808AF5F4 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 00E78 808AF5F8 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 00E7C 808AF5FC 02003825 */  or      $a3, $s0, $zero            ## $a3 = 00000000
/* 00E80 808AF600 8FA30064 */  lw      $v1, 0x0064($sp)           
/* 00E84 808AF604 8FA60050 */  lw      $a2, 0x0050($sp)           
/* 00E88 808AF608 3C0EDB06 */  lui     $t6, 0xDB06                ## $t6 = DB060000
/* 00E8C 808AF60C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00E90 808AF610 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00E94 808AF614 35CE0024 */  ori     $t6, $t6, 0x0024           ## $t6 = DB060024
/* 00E98 808AF618 00103880 */  sll     $a3, $s0,  2               
/* 00E9C 808AF61C 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 00EA0 808AF620 AE2D02D0 */  sw      $t5, 0x02D0($s1)           ## 000002D0
/* 00EA4 808AF624 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 00EA8 808AF628 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00EAC 808AF62C 00F03823 */  subu    $a3, $a3, $s0              
/* 00EB0 808AF630 00073840 */  sll     $a3, $a3,  1               
/* 00EB4 808AF634 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 00EB8 808AF638 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 00EBC 808AF63C 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 00EC0 808AF640 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 00EC4 808AF644 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 00EC8 808AF648 AFA90028 */  sw      $t1, 0x0028($sp)           
/* 00ECC 808AF64C AFA80024 */  sw      $t0, 0x0024($sp)           
/* 00ED0 808AF650 AFB90018 */  sw      $t9, 0x0018($sp)           
/* 00ED4 808AF654 AFB80014 */  sw      $t8, 0x0014($sp)           
/* 00ED8 808AF658 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00EDC 808AF65C AFA70020 */  sw      $a3, 0x0020($sp)           
/* 00EE0 808AF660 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 00EE4 808AF664 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00EE8 808AF668 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 00EEC 808AF66C AFA20060 */  sw      $v0, 0x0060($sp)           
/* 00EF0 808AF670 8FA30060 */  lw      $v1, 0x0060($sp)           
/* 00EF4 808AF674 3C0BFB00 */  lui     $t3, 0xFB00                ## $t3 = FB000000
/* 00EF8 808AF678 240CFF80 */  addiu   $t4, $zero, 0xFF80         ## $t4 = FFFFFF80
/* 00EFC 808AF67C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00F00 808AF680 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00F04 808AF684 3C01C42A */  lui     $at, 0xC42A                ## $at = C42A0000
/* 00F08 808AF688 44813000 */  mtc1    $at, $f6                   ## $f6 = -680.00
/* 00F0C 808AF68C 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 00F10 808AF690 AE2A02D0 */  sw      $t2, 0x02D0($s1)           ## 000002D0
/* 00F14 808AF694 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 00F18 808AF698 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 00F1C 808AF69C 8FAD0088 */  lw      $t5, 0x0088($sp)           
/* 00F20 808AF6A0 3C06808B */  lui     $a2, %hi(D_808AF9CC)       ## $a2 = 808B0000
/* 00F24 808AF6A4 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x1360)
/* 00F28 808AF6A8 C5A4016C */  lwc1    $f4, 0x016C($t5)           ## 0000016C
/* 00F2C 808AF6AC 3C09DE00 */  lui     $t1, 0xDE00                ## $t1 = DE000000
/* 00F30 808AF6B0 24C6F9CC */  addiu   $a2, $a2, %lo(D_808AF9CC)  ## $a2 = 808AF9CC
/* 00F34 808AF6B4 4606203C */  c.lt.s  $f4, $f6                   
/* 00F38 808AF6B8 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFE4
/* 00F3C 808AF6BC 2407036F */  addiu   $a3, $zero, 0x036F         ## $a3 = 0000036F
/* 00F40 808AF6C0 4502000F */  bc1fl   .L808AF700                 
/* 00F44 808AF6C4 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00F48 808AF6C8 8DCEF9C0 */  lw      $t6, %lo(gSaveContext+0x1360)($t6)
/* 00F4C 808AF6CC 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 00F50 808AF6D0 29C10004 */  slti    $at, $t6, 0x0004           
/* 00F54 808AF6D4 5020000A */  beql    $at, $zero, .L808AF700     
/* 00F58 808AF6D8 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00F5C 808AF6DC 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
/* 00F60 808AF6E0 3C190600 */  lui     $t9, %hi(D_06000120)                ## $t9 = 06000000
/* 00F64 808AF6E4 27390120 */  addiu   $t9, $t9, %lo(D_06000120)           ## $t9 = 06000120
/* 00F68 808AF6E8 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00F6C 808AF6EC AE2F02D0 */  sw      $t7, 0x02D0($s1)           ## 000002D0
/* 00F70 808AF6F0 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 00F74 808AF6F4 10000008 */  beq     $zero, $zero, .L808AF718   
/* 00F78 808AF6F8 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00F7C 808AF6FC 8E2202D0 */  lw      $v0, 0x02D0($s1)           ## 000002D0
.L808AF700:
/* 00F80 808AF700 3C0A0600 */  lui     $t2, %hi(D_06000470)                ## $t2 = 06000000
/* 00F84 808AF704 254A0470 */  addiu   $t2, $t2, %lo(D_06000470)           ## $t2 = 06000470
/* 00F88 808AF708 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 00F8C 808AF70C AE2802D0 */  sw      $t0, 0x02D0($s1)           ## 000002D0
/* 00F90 808AF710 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 00F94 808AF714 AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
.L808AF718:
/* 00F98 808AF718 0C031AD5 */  jal     Graph_CloseDisps              
/* 00F9C 808AF71C 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 00FA0 808AF720 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 00FA4 808AF724 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 00FA8 808AF728 8FB1003C */  lw      $s1, 0x003C($sp)           
/* 00FAC 808AF72C 8FB20040 */  lw      $s2, 0x0040($sp)           
/* 00FB0 808AF730 03E00008 */  jr      $ra                        
/* 00FB4 808AF734 27BD0088 */  addiu   $sp, $sp, 0x0088           ## $sp = 00000000
