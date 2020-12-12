.rdata
glabel D_808F7C58
    .asciz "../z_boss_ganon.c"
    .balign 4

glabel D_808F7C6C
    .asciz "../z_boss_ganon.c"
    .balign 4

.text
glabel BossGanon_Draw
/* 0A468 808E0CD8 27BDFFA0 */  addiu   $sp, $sp, 0xFFA0           ## $sp = FFFFFFA0
/* 0A46C 808E0CDC AFB1002C */  sw      $s1, 0x002C($sp)
/* 0A470 808E0CE0 AFB00028 */  sw      $s0, 0x0028($sp)
/* 0A474 808E0CE4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0A478 808E0CE8 AFBF0034 */  sw      $ra, 0x0034($sp)
/* 0A47C 808E0CEC AFB20030 */  sw      $s2, 0x0030($sp)
/* 0A480 808E0CF0 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 0A484 808E0CF4 8CA40000 */  lw      $a0, 0x0000($a1)           ## 00000000
/* 0A488 808E0CF8 0C031A73 */  jal     Graph_Alloc

/* 0A48C 808E0CFC 24051000 */  addiu   $a1, $zero, 0x1000         ## $a1 = 00001000
/* 0A490 808E0D00 AFA20054 */  sw      $v0, 0x0054($sp)
/* 0A494 808E0D04 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 0A498 808E0D08 3C06808F */  lui     $a2, %hi(D_808F7C58)       ## $a2 = 808F0000
/* 0A49C 808E0D0C 24C67C58 */  addiu   $a2, $a2, %lo(D_808F7C58)  ## $a2 = 808F7C58
/* 0A4A0 808E0D10 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE0
/* 0A4A4 808E0D14 240723B2 */  addiu   $a3, $zero, 0x23B2         ## $a3 = 000023B2
/* 0A4A8 808E0D18 0C031AB1 */  jal     Graph_OpenDisps
/* 0A4AC 808E0D1C 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 0A4B0 808E0D20 0C024F46 */  jal     func_80093D18
/* 0A4B4 808E0D24 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 0A4B8 808E0D28 0C024F61 */  jal     func_80093D84
/* 0A4BC 808E0D2C 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 0A4C0 808E0D30 860E01A6 */  lh      $t6, 0x01A6($s0)           ## 000001A6
/* 0A4C4 808E0D34 31CF0002 */  andi    $t7, $t6, 0x0002           ## $t7 = 00000000
/* 0A4C8 808E0D38 51E0000D */  beql    $t7, $zero, .L808E0D70
/* 0A4CC 808E0D3C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
/* 0A4D0 808E0D40 8E4402C0 */  lw      $a0, 0x02C0($s2)           ## 000002C0
/* 0A4D4 808E0D44 24180384 */  addiu   $t8, $zero, 0x0384         ## $t8 = 00000384
/* 0A4D8 808E0D48 2419044B */  addiu   $t9, $zero, 0x044B         ## $t9 = 0000044B
/* 0A4DC 808E0D4C AFB90018 */  sw      $t9, 0x0018($sp)
/* 0A4E0 808E0D50 AFB80014 */  sw      $t8, 0x0014($sp)
/* 0A4E4 808E0D54 AFA00010 */  sw      $zero, 0x0010($sp)
/* 0A4E8 808E0D58 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 0A4EC 808E0D5C 24060032 */  addiu   $a2, $zero, 0x0032         ## $a2 = 00000032
/* 0A4F0 808E0D60 0C024CDC */  jal     Gfx_SetFog
/* 0A4F4 808E0D64 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0A4F8 808E0D68 AE4202C0 */  sw      $v0, 0x02C0($s2)           ## 000002C0
/* 0A4FC 808E0D6C 8E4302D0 */  lw      $v1, 0x02D0($s2)           ## 000002D0
.L808E0D70:
/* 0A500 808E0D70 3C040601 */  lui     $a0, %hi(D_06009A20)                ## $a0 = 06010000
/* 0A504 808E0D74 24849A20 */  addiu   $a0, $a0, %lo(D_06009A20)           ## $a0 = 06009A20
/* 0A508 808E0D78 00045100 */  sll     $t2, $a0,  4
/* 0A50C 808E0D7C 000A5F02 */  srl     $t3, $t2, 28
/* 0A510 808E0D80 3C09DB06 */  lui     $t1, 0xDB06                ## $t1 = DB060000
/* 0A514 808E0D84 24680008 */  addiu   $t0, $v1, 0x0008           ## $t0 = 00000008
/* 0A518 808E0D88 AE4802D0 */  sw      $t0, 0x02D0($s2)           ## 000002D0
/* 0A51C 808E0D8C 35290020 */  ori     $t1, $t1, 0x0020           ## $t1 = DB060020
/* 0A520 808E0D90 000B6080 */  sll     $t4, $t3,  2
/* 0A524 808E0D94 3C0D8016 */  lui     $t5, %hi(gSegments)
/* 0A528 808E0D98 01AC6821 */  addu    $t5, $t5, $t4
/* 0A52C 808E0D9C 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0A530 808E0DA0 AC690000 */  sw      $t1, 0x0000($v1)           ## 00000000
/* 0A534 808E0DA4 8DAD6FA8 */  lw      $t5, %lo(gSegments)($t5)
/* 0A538 808E0DA8 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0A53C 808E0DAC 00817024 */  and     $t6, $a0, $at
/* 0A540 808E0DB0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0A544 808E0DB4 01AE7821 */  addu    $t7, $t5, $t6
/* 0A548 808E0DB8 01E1C021 */  addu    $t8, $t7, $at
/* 0A54C 808E0DBC AC780004 */  sw      $t8, 0x0004($v1)           ## 00000004
/* 0A550 808E0DC0 92070152 */  lbu     $a3, 0x0152($s0)           ## 00000152
/* 0A554 808E0DC4 8E060170 */  lw      $a2, 0x0170($s0)           ## 00000170
/* 0A558 808E0DC8 8E050154 */  lw      $a1, 0x0154($s0)           ## 00000154
/* 0A55C 808E0DCC 3C08808E */  lui     $t0, %hi(func_808DE988)    ## $t0 = 808E0000
/* 0A560 808E0DD0 3C19808E */  lui     $t9, %hi(func_808DE734)    ## $t9 = 808E0000
/* 0A564 808E0DD4 2739E734 */  addiu   $t9, $t9, %lo(func_808DE734) ## $t9 = 808DE734
/* 0A568 808E0DD8 2508E988 */  addiu   $t0, $t0, %lo(func_808DE988) ## $t0 = 808DE988
/* 0A56C 808E0DDC AFA80014 */  sw      $t0, 0x0014($sp)
/* 0A570 808E0DE0 AFB90010 */  sw      $t9, 0x0010($sp)
/* 0A574 808E0DE4 AFB00018 */  sw      $s0, 0x0018($sp)
/* 0A578 808E0DE8 0C0286B2 */  jal     SkelAnime_DrawFlexOpa
/* 0A57C 808E0DEC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A580 808E0DF0 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0A584 808E0DF4 44814000 */  mtc1    $at, $f8                   ## $f8 = 30.00
/* 0A588 808E0DF8 C60602FC */  lwc1    $f6, 0x02FC($s0)           ## 000002FC
/* 0A58C 808E0DFC C60402F8 */  lwc1    $f4, 0x02F8($s0)           ## 000002F8
/* 0A590 808E0E00 C6100300 */  lwc1    $f16, 0x0300($s0)          ## 00000300
/* 0A594 808E0E04 46083280 */  add.s   $f10, $f6, $f8
/* 0A598 808E0E08 E60402EC */  swc1    $f4, 0x02EC($s0)           ## 000002EC
/* 0A59C 808E0E0C E61002F4 */  swc1    $f16, 0x02F4($s0)          ## 000002F4
/* 0A5A0 808E0E10 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A5A4 808E0E14 E60A02F0 */  swc1    $f10, 0x02F0($s0)          ## 000002F0
/* 0A5A8 808E0E18 0C02F228 */  jal     func_800BC8A0
/* 0A5AC 808E0E1C 8E4502C0 */  lw      $a1, 0x02C0($s2)           ## 000002C0
/* 0A5B0 808E0E20 AE4202C0 */  sw      $v0, 0x02C0($s2)           ## 000002C0
/* 0A5B4 808E0E24 0C238F61 */  jal     func_808E3D84
/* 0A5B8 808E0E28 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A5BC 808E0E2C 3C028090 */  lui     $v0, %hi(D_808F93C0)       ## $v0 = 80900000
/* 0A5C0 808E0E30 244293C0 */  addiu   $v0, $v0, %lo(D_808F93C0)  ## $v0 = 808F93C0
/* 0A5C4 808E0E34 8C490000 */  lw      $t1, 0x0000($v0)           ## 808F93C0
/* 0A5C8 808E0E38 8E0B0024 */  lw      $t3, 0x0024($s0)           ## 00000024
/* 0A5CC 808E0E3C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0A5D0 808E0E40 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0A5D4 808E0E44 AD2B0024 */  sw      $t3, 0x0024($t1)           ## 00000024
/* 0A5D8 808E0E48 8E0A0028 */  lw      $t2, 0x0028($s0)           ## 00000028
/* 0A5DC 808E0E4C AD2A0028 */  sw      $t2, 0x0028($t1)           ## 00000028
/* 0A5E0 808E0E50 8E0B002C */  lw      $t3, 0x002C($s0)           ## 0000002C
/* 0A5E4 808E0E54 AD2B002C */  sw      $t3, 0x002C($t1)           ## 0000002C
/* 0A5E8 808E0E58 8C4C0000 */  lw      $t4, 0x0000($v0)           ## 808F93C0
/* 0A5EC 808E0E5C 8E0E0214 */  lw      $t6, 0x0214($s0)           ## 00000214
/* 0A5F0 808E0E60 AD8E16D4 */  sw      $t6, 0x16D4($t4)           ## 000016D4
/* 0A5F4 808E0E64 8E0D0218 */  lw      $t5, 0x0218($s0)           ## 00000218
/* 0A5F8 808E0E68 AD8D16D8 */  sw      $t5, 0x16D8($t4)           ## 000016D8
/* 0A5FC 808E0E6C 8E0E021C */  lw      $t6, 0x021C($s0)           ## 0000021C
/* 0A600 808E0E70 AD8E16DC */  sw      $t6, 0x16DC($t4)           ## 000016DC
/* 0A604 808E0E74 8C4F0000 */  lw      $t7, 0x0000($v0)           ## 808F93C0
/* 0A608 808E0E78 8E190220 */  lw      $t9, 0x0220($s0)           ## 00000220
/* 0A60C 808E0E7C ADF916E0 */  sw      $t9, 0x16E0($t7)           ## 000016E0
/* 0A610 808E0E80 8E180224 */  lw      $t8, 0x0224($s0)           ## 00000224
/* 0A614 808E0E84 ADF816E4 */  sw      $t8, 0x16E4($t7)           ## 000016E4
/* 0A618 808E0E88 8E190228 */  lw      $t9, 0x0228($s0)           ## 00000228
/* 0A61C 808E0E8C ADF916E8 */  sw      $t9, 0x16E8($t7)           ## 000016E8
/* 0A620 808E0E90 8C480000 */  lw      $t0, 0x0000($v0)           ## 808F93C0
/* 0A624 808E0E94 8E0A022C */  lw      $t2, 0x022C($s0)           ## 0000022C
/* 0A628 808E0E98 AD0A16EC */  sw      $t2, 0x16EC($t0)           ## 000016EC
/* 0A62C 808E0E9C 8E090230 */  lw      $t1, 0x0230($s0)           ## 00000230
/* 0A630 808E0EA0 AD0916F0 */  sw      $t1, 0x16F0($t0)           ## 000016F0
/* 0A634 808E0EA4 8E0A0234 */  lw      $t2, 0x0234($s0)           ## 00000234
/* 0A638 808E0EA8 AD0A16F4 */  sw      $t2, 0x16F4($t0)           ## 000016F4
/* 0A63C 808E0EAC 8E0D0238 */  lw      $t5, 0x0238($s0)           ## 00000238
/* 0A640 808E0EB0 8C4B0000 */  lw      $t3, 0x0000($v0)           ## 808F93C0
/* 0A644 808E0EB4 AD6D16F8 */  sw      $t5, 0x16F8($t3)           ## 000016F8
/* 0A648 808E0EB8 8E0C023C */  lw      $t4, 0x023C($s0)           ## 0000023C
/* 0A64C 808E0EBC AD6C16FC */  sw      $t4, 0x16FC($t3)           ## 000016FC
/* 0A650 808E0EC0 8E0D0240 */  lw      $t5, 0x0240($s0)           ## 00000240
/* 0A654 808E0EC4 0C237B9C */  jal     func_808DEE70
/* 0A658 808E0EC8 AD6D1700 */  sw      $t5, 0x1700($t3)           ## 00001700
/* 0A65C 808E0ECC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0A660 808E0ED0 0C237C97 */  jal     func_808DF25C
/* 0A664 808E0ED4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0A668 808E0ED8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0A66C 808E0EDC 0C237D3C */  jal     func_808DF4F0
/* 0A670 808E0EE0 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0A674 808E0EE4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0A678 808E0EE8 0C237EF4 */  jal     func_808DFBD0
/* 0A67C 808E0EEC 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0A680 808E0EF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0A684 808E0EF4 0C237FF2 */  jal     func_808DFFC8
/* 0A688 808E0EF8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0A68C 808E0EFC 8FA40054 */  lw      $a0, 0x0054($sp)
/* 0A690 808E0F00 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0A694 808E0F04 0C2381BF */  jal     func_808E06FC
/* 0A698 808E0F08 02203025 */  or      $a2, $s1, $zero            ## $a2 = 00000000
/* 0A69C 808E0F0C 8FA40054 */  lw      $a0, 0x0054($sp)
/* 0A6A0 808E0F10 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0A6A4 808E0F14 0C23828F */  jal     func_808E0A3C
/* 0A6A8 808E0F18 02203025 */  or      $a2, $s1, $zero            ## $a2 = 00000000
/* 0A6AC 808E0F1C 3C06808F */  lui     $a2, %hi(D_808F7C6C)       ## $a2 = 808F0000
/* 0A6B0 808E0F20 24C67C6C */  addiu   $a2, $a2, %lo(D_808F7C6C)  ## $a2 = 808F7C6C
/* 0A6B4 808E0F24 27A40040 */  addiu   $a0, $sp, 0x0040           ## $a0 = FFFFFFE0
/* 0A6B8 808E0F28 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 0A6BC 808E0F2C 0C031AD5 */  jal     Graph_CloseDisps
/* 0A6C0 808E0F30 240724B1 */  addiu   $a3, $zero, 0x24B1         ## $a3 = 000024B1
/* 0A6C4 808E0F34 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 0A6C8 808E0F38 8FB00028 */  lw      $s0, 0x0028($sp)
/* 0A6CC 808E0F3C 8FB1002C */  lw      $s1, 0x002C($sp)
/* 0A6D0 808E0F40 8FB20030 */  lw      $s2, 0x0030($sp)
/* 0A6D4 808E0F44 03E00008 */  jr      $ra
/* 0A6D8 808E0F48 27BD0060 */  addiu   $sp, $sp, 0x0060           ## $sp = 00000000
