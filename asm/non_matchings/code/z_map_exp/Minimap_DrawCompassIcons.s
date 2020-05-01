.rdata
glabel D_8013D918
    .asciz "../z_map_exp.c"
    .balign 4

glabel D_8013D928
    .asciz "../z_map_exp.c"
    .balign 4

glabel D_8013D938
    .asciz "../z_map_exp.c"
    .balign 4

glabel D_8013D948
    .asciz "../z_map_exp.c"
    .balign 4

.late_rodata
glabel D_8013DC0C
    .float 0.4

glabel D_8013DC10
    .float -1.6

.text
glabel Minimap_DrawCompassIcons
/* AF83E0 80081240 27BDFF90 */  addiu $sp, $sp, -0x70
/* AF83E4 80081244 AFBF001C */  sw    $ra, 0x1c($sp)
/* AF83E8 80081248 AFB00018 */  sw    $s0, 0x18($sp)
/* AF83EC 8008124C AFA40070 */  sw    $a0, 0x70($sp)
/* AF83F0 80081250 8C8F1C44 */  lw    $t7, 0x1c44($a0)
/* AF83F4 80081254 3C068014 */  lui   $a2, %hi(D_8013D918) # $a2, 0x8014
/* AF83F8 80081258 24C6D918 */  addiu $a2, %lo(D_8013D918) # addiu $a2, $a2, -0x26e8
/* AF83FC 8008125C AFAF0068 */  sw    $t7, 0x68($sp)
/* AF8400 80081260 8C850000 */  lw    $a1, ($a0)
/* AF8404 80081264 27A40050 */  addiu $a0, $sp, 0x50
/* AF8408 80081268 24070235 */  li    $a3, 565
/* AF840C 8008126C 0C031AB1 */  jal   Graph_OpenDisps
/* AF8410 80081270 00A08025 */   move  $s0, $a1
/* AF8414 80081274 8FA20070 */  lw    $v0, 0x70($sp)
/* AF8418 80081278 3C180001 */  lui   $t8, 1
/* AF841C 8008127C 0302C021 */  addu  $t8, $t8, $v0
/* AF8420 80081280 97180744 */  lhu   $t8, 0x744($t8)
/* AF8424 80081284 2B0100AA */  slti  $at, $t8, 0xaa
/* AF8428 80081288 1420010A */  bnez  $at, .L800816B4
/* AF842C 8008128C 00000000 */   nop   
/* AF8430 80081290 0C025285 */  jal   func_80094A14
/* AF8434 80081294 8C440000 */   lw    $a0, ($v0)
/* AF8438 80081298 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF843C 8008129C 3C08DA38 */  lui   $t0, (0xDA380003 >> 16) # lui $t0, 0xda38
/* AF8440 800812A0 3C098013 */  lui   $t1, %hi(gMtxClear) # $t1, 0x8013
/* AF8444 800812A4 24590008 */  addiu $t9, $v0, 8
/* AF8448 800812A8 AE1902B0 */  sw    $t9, 0x2b0($s0)
/* AF844C 800812AC 2529DB20 */  addiu $t1, %lo(gMtxClear) # addiu $t1, $t1, -0x24e0
/* AF8450 800812B0 35080003 */  ori   $t0, (0xDA380003 & 0xFFFF) # ori $t0, $t0, 3
/* AF8454 800812B4 AC480000 */  sw    $t0, ($v0)
/* AF8458 800812B8 AC490004 */  sw    $t1, 4($v0)
/* AF845C 800812BC 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8460 800812C0 3C0BFC30 */  lui   $t3, (0xFC309661 >> 16) # lui $t3, 0xfc30
/* AF8464 800812C4 3C0C552E */  lui   $t4, (0x552EFF7F >> 16) # lui $t4, 0x552e
/* AF8468 800812C8 244A0008 */  addiu $t2, $v0, 8
/* AF846C 800812CC AE0A02B0 */  sw    $t2, 0x2b0($s0)
/* AF8470 800812D0 358CFF7F */  ori   $t4, (0x552EFF7F & 0xFFFF) # ori $t4, $t4, 0xff7f
/* AF8474 800812D4 356B9661 */  ori   $t3, (0xFC309661 & 0xFFFF) # ori $t3, $t3, 0x9661
/* AF8478 800812D8 AC4B0000 */  sw    $t3, ($v0)
/* AF847C 800812DC AC4C0004 */  sw    $t4, 4($v0)
/* AF8480 800812E0 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8484 800812E4 3C0FFB00 */  lui   $t7, 0xfb00
/* AF8488 800812E8 240E00FF */  li    $t6, 255
/* AF848C 800812EC 244D0008 */  addiu $t5, $v0, 8
/* AF8490 800812F0 AE0D02B0 */  sw    $t5, 0x2b0($s0)
/* AF8494 800812F4 AC4E0004 */  sw    $t6, 4($v0)
/* AF8498 800812F8 AC4F0000 */  sw    $t7, ($v0)
/* AF849C 800812FC 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF84A0 80081300 3C08FFFD */  lui   $t0, (0xFFFDF6FB >> 16) # lui $t0, 0xfffd
/* AF84A4 80081304 3C19FCFF */  lui   $t9, (0xFCFFFFFF >> 16) # lui $t9, 0xfcff
/* AF84A8 80081308 24580008 */  addiu $t8, $v0, 8
/* AF84AC 8008130C AE1802B0 */  sw    $t8, 0x2b0($s0)
/* AF84B0 80081310 3739FFFF */  ori   $t9, (0xFCFFFFFF & 0xFFFF) # ori $t9, $t9, 0xffff
/* AF84B4 80081314 3508F6FB */  ori   $t0, (0xFFFDF6FB & 0xFFFF) # ori $t0, $t0, 0xf6fb
/* AF84B8 80081318 AC480004 */  sw    $t0, 4($v0)
/* AF84BC 8008131C AC590000 */  sw    $t9, ($v0)
/* AF84C0 80081320 8FA50068 */  lw    $a1, 0x68($sp)
/* AF84C4 80081324 3C038016 */  lui   $v1, %hi(gGameInfo) # $v1, 0x8016
/* AF84C8 80081328 8C63FA90 */  lw    $v1, %lo(gGameInfo)($v1)
/* AF84CC 8008132C C4A40024 */  lwc1  $f4, 0x24($a1)
/* AF84D0 80081330 C4A8002C */  lwc1  $f8, 0x2c($a1)
/* AF84D4 80081334 846B0F30 */  lh    $t3, 0xf30($v1)
/* AF84D8 80081338 4600218D */  trunc.w.s $f6, $f4
/* AF84DC 8008133C 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AF84E0 80081340 44810000 */  mtc1  $at, $f0
/* AF84E4 80081344 4600428D */  trunc.w.s $f10, $f8
/* AF84E8 80081348 44023000 */  mfc1  $v0, $f6
/* AF84EC 8008134C 846C0F32 */  lh    $t4, 0xf32($v1)
/* AF84F0 80081350 846D0F34 */  lh    $t5, 0xf34($v1)
/* AF84F4 80081354 00021400 */  sll   $v0, $v0, 0x10
/* AF84F8 80081358 00021403 */  sra   $v0, $v0, 0x10
/* AF84FC 8008135C 004B001A */  div   $zero, $v0, $t3
/* AF8500 80081360 44045000 */  mfc1  $a0, $f10
/* AF8504 80081364 846E0F36 */  lh    $t6, 0xf36($v1)
/* AF8508 80081368 24060000 */  li    $a2, 0
/* AF850C 8008136C 00042400 */  sll   $a0, $a0, 0x10
/* AF8510 80081370 00042403 */  sra   $a0, $a0, 0x10
/* AF8514 80081374 15600002 */  bnez  $t3, .L80081380
/* AF8518 80081378 00000000 */   nop   
/* AF851C 8008137C 0007000D */  break 7
.L80081380:
/* AF8520 80081380 2401FFFF */  li    $at, -1
/* AF8524 80081384 15610004 */  bne   $t3, $at, .L80081398
/* AF8528 80081388 3C018000 */   lui   $at, 0x8000
/* AF852C 8008138C 14410002 */  bne   $v0, $at, .L80081398
/* AF8530 80081390 00000000 */   nop   
/* AF8534 80081394 0006000D */  break 6
.L80081398:
/* AF8538 80081398 00001012 */  mflo  $v0
/* AF853C 8008139C 00021400 */  sll   $v0, $v0, 0x10
/* AF8540 800813A0 00021403 */  sra   $v0, $v0, 0x10
/* AF8544 800813A4 008C001A */  div   $zero, $a0, $t4
/* AF8548 800813A8 15800002 */  bnez  $t4, .L800813B4
/* AF854C 800813AC 00000000 */   nop   
/* AF8550 800813B0 0007000D */  break 7
.L800813B4:
/* AF8554 800813B4 2401FFFF */  li    $at, -1
/* AF8558 800813B8 15810004 */  bne   $t4, $at, .L800813CC
/* AF855C 800813BC 3C018000 */   li    $at, 0x80000000 # 0.000000
/* AF8560 800813C0 14810002 */  bne   $a0, $at, .L800813CC
/* AF8564 800813C4 00000000 */   nop   
/* AF8568 800813C8 0006000D */  break 6
.L800813CC:
/* AF856C 800813CC 00002012 */  mflo  $a0
/* AF8570 800813D0 00042400 */  sll   $a0, $a0, 0x10
/* AF8574 800813D4 00042403 */  sra   $a0, $a0, 0x10
/* AF8578 800813D8 01A27821 */  addu  $t7, $t5, $v0
/* AF857C 800813DC 01C4C023 */  subu  $t8, $t6, $a0
/* AF8580 800813E0 44982000 */  mtc1  $t8, $f4
/* AF8584 800813E4 448F8000 */  mtc1  $t7, $f16
/* AF8588 800813E8 00003825 */  move  $a3, $zero
/* AF858C 800813EC 468021A0 */  cvt.s.w $f6, $f4
/* AF8590 800813F0 468084A0 */  cvt.s.w $f18, $f16
/* AF8594 800813F4 46003383 */  div.s $f14, $f6, $f0
/* AF8598 800813F8 0C034261 */  jal   Matrix_Translate
/* AF859C 800813FC 46009303 */   div.s $f12, $f18, $f0
/* AF85A0 80081400 3C018014 */  lui   $at, %hi(D_8013DC0C)
/* AF85A4 80081404 C42CDC0C */  lwc1  $f12, %lo(D_8013DC0C)($at)
/* AF85A8 80081408 24070001 */  li    $a3, 1
/* AF85AC 8008140C 44066000 */  mfc1  $a2, $f12
/* AF85B0 80081410 0C0342A3 */  jal   Matrix_Scale
/* AF85B4 80081414 46006386 */   mov.s $f14, $f12
/* AF85B8 80081418 3C018014 */  lui   $at, %hi(D_8013DC10)
/* AF85BC 8008141C C42CDC10 */  lwc1  $f12, %lo(D_8013DC10)($at)
/* AF85C0 80081420 0C0342DC */  jal   Matrix_RotateX
/* AF85C4 80081424 24050001 */   li    $a1, 1
/* AF85C8 80081428 8FB90068 */  lw    $t9, 0x68($sp)
/* AF85CC 8008142C 24097FFF */  li    $t1, 32767
/* AF85D0 80081430 24050001 */  li    $a1, 1
/* AF85D4 80081434 872800B6 */  lh    $t0, 0xb6($t9)
/* AF85D8 80081438 01281023 */  subu  $v0, $t1, $t0
/* AF85DC 8008143C 04410002 */  bgez  $v0, .L80081448
/* AF85E0 80081440 00400821 */   addu  $at, $v0, $zero
/* AF85E4 80081444 244103FF */  addiu $at, $v0, 0x3ff
.L80081448:
/* AF85E8 80081448 00011283 */  sra   $v0, $at, 0xa
/* AF85EC 8008144C 00021400 */  sll   $v0, $v0, 0x10
/* AF85F0 80081450 00021403 */  sra   $v0, $v0, 0x10
/* AF85F4 80081454 44824000 */  mtc1  $v0, $f8
/* AF85F8 80081458 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AF85FC 8008145C 44818000 */  mtc1  $at, $f16
/* AF8600 80081460 468042A0 */  cvt.s.w $f10, $f8
/* AF8604 80081464 0C034348 */  jal   Matrix_RotateY
/* AF8608 80081468 46105303 */   div.s $f12, $f10, $f16
/* AF860C 8008146C 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8610 80081470 3C0BDA38 */  lui   $t3, (0xDA380003 >> 16) # lui $t3, 0xda38
/* AF8614 80081474 356B0003 */  ori   $t3, (0xDA380003 & 0xFFFF) # ori $t3, $t3, 3
/* AF8618 80081478 244A0008 */  addiu $t2, $v0, 8
/* AF861C 8008147C AE0A02B0 */  sw    $t2, 0x2b0($s0)
/* AF8620 80081480 AC4B0000 */  sw    $t3, ($v0)
/* AF8624 80081484 8FAC0070 */  lw    $t4, 0x70($sp)
/* AF8628 80081488 3C058014 */  lui   $a1, %hi(D_8013D928) # $a1, 0x8014
/* AF862C 8008148C 24A5D928 */  addiu $a1, %lo(D_8013D928) # addiu $a1, $a1, -0x26d8
/* AF8630 80081490 8D840000 */  lw    $a0, ($t4)
/* AF8634 80081494 24060249 */  li    $a2, 585
/* AF8638 80081498 0C0346A2 */  jal   Matrix_NewMtx
/* AF863C 8008149C AFA2003C */   sw    $v0, 0x3c($sp)
/* AF8640 800814A0 8FA3003C */  lw    $v1, 0x3c($sp)
/* AF8644 800814A4 3C0EC8FF */  lui   $t6, (0xC8FF00FF >> 16) # lui $t6, 0xc8ff
/* AF8648 800814A8 35CE00FF */  ori   $t6, (0xC8FF00FF & 0xFFFF) # ori $t6, $t6, 0xff
/* AF864C 800814AC AC620004 */  sw    $v0, 4($v1)
/* AF8650 800814B0 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8654 800814B4 3C0FFA00 */  lui   $t7, 0xfa00
/* AF8658 800814B8 3C050401 */  lui   $a1, %hi(D_0400C820) # $a1, 0x401
/* AF865C 800814BC 244D0008 */  addiu $t5, $v0, 8
/* AF8660 800814C0 AE0D02B0 */  sw    $t5, 0x2b0($s0)
/* AF8664 800814C4 AC4E0004 */  sw    $t6, 4($v0)
/* AF8668 800814C8 AC4F0000 */  sw    $t7, ($v0)
/* AF866C 800814CC 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8670 800814D0 24A5C820 */  addiu $a1, %lo(D_0400C820) # addiu $a1, $a1, -0x37e0
/* AF8674 800814D4 3C19DE00 */  lui   $t9, 0xde00
/* AF8678 800814D8 24580008 */  addiu $t8, $v0, 8
/* AF867C 800814DC AE1802B0 */  sw    $t8, 0x2b0($s0)
/* AF8680 800814E0 AC450004 */  sw    $a1, 4($v0)
/* AF8684 800814E4 AC590000 */  sw    $t9, ($v0)
/* AF8688 800814E8 3C028012 */  lui   $v0, %hi(sPlayerInitialPosX) # $v0, 0x8012
/* AF868C 800814EC 84423A50 */  lh    $v0, %lo(sPlayerInitialPosX)($v0)
/* AF8690 800814F0 3C038016 */  lui   $v1, %hi(gGameInfo) # $v1, 0x8016
/* AF8694 800814F4 8C63FA90 */  lw    $v1, %lo(gGameInfo)($v1)
/* AF8698 800814F8 3C048012 */  lui   $a0, %hi(sPlayerInitialPosZ) # $a0, 0x8012
/* AF869C 800814FC 84843A54 */  lh    $a0, %lo(sPlayerInitialPosZ)($a0)
/* AF86A0 80081500 84690F30 */  lh    $t1, 0xf30($v1)
/* AF86A4 80081504 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AF86A8 80081508 44810000 */  mtc1  $at, $f0
/* AF86AC 8008150C 0049001A */  div   $zero, $v0, $t1
/* AF86B0 80081510 15200002 */  bnez  $t1, .L8008151C
/* AF86B4 80081514 00000000 */   nop   
/* AF86B8 80081518 0007000D */  break 7
.L8008151C:
/* AF86BC 8008151C 2401FFFF */  li    $at, -1
/* AF86C0 80081520 15210004 */  bne   $t1, $at, .L80081534
/* AF86C4 80081524 3C018000 */   lui   $at, 0x8000
/* AF86C8 80081528 14410002 */  bne   $v0, $at, .L80081534
/* AF86CC 8008152C 00000000 */   nop   
/* AF86D0 80081530 0006000D */  break 6
.L80081534:
/* AF86D4 80081534 84680F32 */  lh    $t0, 0xf32($v1)
/* AF86D8 80081538 00001012 */  mflo  $v0
/* AF86DC 8008153C 846A0F34 */  lh    $t2, 0xf34($v1)
/* AF86E0 80081540 846C0F36 */  lh    $t4, 0xf36($v1)
/* AF86E4 80081544 0088001A */  div   $zero, $a0, $t0
/* AF86E8 80081548 00021400 */  sll   $v0, $v0, 0x10
/* AF86EC 8008154C 00021403 */  sra   $v0, $v0, 0x10
/* AF86F0 80081550 15000002 */  bnez  $t0, .L8008155C
/* AF86F4 80081554 00000000 */   nop   
/* AF86F8 80081558 0007000D */  break 7
.L8008155C:
/* AF86FC 8008155C 2401FFFF */  li    $at, -1
/* AF8700 80081560 15010004 */  bne   $t0, $at, .L80081574
/* AF8704 80081564 3C018000 */   li    $at, 0x80000000 # 0.000000
/* AF8708 80081568 14810002 */  bne   $a0, $at, .L80081574
/* AF870C 8008156C 00000000 */   nop   
/* AF8710 80081570 0006000D */  break 6
.L80081574:
/* AF8714 80081574 00002012 */  mflo  $a0
/* AF8718 80081578 00042400 */  sll   $a0, $a0, 0x10
/* AF871C 8008157C 00042403 */  sra   $a0, $a0, 0x10
/* AF8720 80081580 01425821 */  addu  $t3, $t2, $v0
/* AF8724 80081584 01846823 */  subu  $t5, $t4, $a0
/* AF8728 80081588 448D3000 */  mtc1  $t5, $f6
/* AF872C 8008158C 448B9000 */  mtc1  $t3, $f18
/* AF8730 80081590 AFA50024 */  sw    $a1, 0x24($sp)
/* AF8734 80081594 46803220 */  cvt.s.w $f8, $f6
/* AF8738 80081598 24060000 */  li    $a2, 0
/* AF873C 8008159C 00003825 */  move  $a3, $zero
/* AF8740 800815A0 46809120 */  cvt.s.w $f4, $f18
/* AF8744 800815A4 46004383 */  div.s $f14, $f8, $f0
/* AF8748 800815A8 0C034261 */  jal   Matrix_Translate
/* AF874C 800815AC 46002303 */   div.s $f12, $f4, $f0
/* AF8750 800815B0 3C0F8016 */  lui   $t7, %hi(gGameInfo) # $t7, 0x8016
/* AF8754 800815B4 8DEFFA90 */  lw    $t7, %lo(gGameInfo)($t7)
/* AF8758 800815B8 3C0142C8 */  li    $at, 0x42C80000 # 0.000000
/* AF875C 800815BC 44819000 */  mtc1  $at, $f18
/* AF8760 800815C0 85EE0F26 */  lh    $t6, 0xf26($t7)
/* AF8764 800815C4 24070001 */  li    $a3, 1
/* AF8768 800815C8 448E5000 */  mtc1  $t6, $f10
/* AF876C 800815CC 00000000 */  nop   
/* AF8770 800815D0 46805420 */  cvt.s.w $f16, $f10
/* AF8774 800815D4 46128303 */  div.s $f12, $f16, $f18
/* AF8778 800815D8 44066000 */  mfc1  $a2, $f12
/* AF877C 800815DC 0C0342A3 */  jal   Matrix_Scale
/* AF8780 800815E0 46006386 */   mov.s $f14, $f12
/* AF8784 800815E4 3C188016 */  lui   $t8, %hi(gGameInfo) # $t8, 0x8016
/* AF8788 800815E8 8F18FA90 */  lw    $t8, %lo(gGameInfo)($t8)
/* AF878C 800815EC 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AF8790 800815F0 44814000 */  mtc1  $at, $f8
/* AF8794 800815F4 87190F7C */  lh    $t9, 0xf7c($t8)
/* AF8798 800815F8 24050001 */  li    $a1, 1
/* AF879C 800815FC 44992000 */  mtc1  $t9, $f4
/* AF87A0 80081600 00000000 */  nop   
/* AF87A4 80081604 468021A0 */  cvt.s.w $f6, $f4
/* AF87A8 80081608 0C0342DC */  jal   Matrix_RotateX
/* AF87AC 8008160C 46083303 */   div.s $f12, $f6, $f8
/* AF87B0 80081610 3C098012 */  lui   $t1, %hi(sPlayerInitialDirection) # $t1, 0x8012
/* AF87B4 80081614 85293A58 */  lh    $t1, %lo(sPlayerInitialDirection)($t1)
/* AF87B8 80081618 3C014120 */  li    $at, 0x41200000 # 0.000000
/* AF87BC 8008161C 44819000 */  mtc1  $at, $f18
/* AF87C0 80081620 44895000 */  mtc1  $t1, $f10
/* AF87C4 80081624 24050001 */  li    $a1, 1
/* AF87C8 80081628 46805420 */  cvt.s.w $f16, $f10
/* AF87CC 8008162C 0C034348 */  jal   Matrix_RotateY
/* AF87D0 80081630 46128303 */   div.s $f12, $f16, $f18
/* AF87D4 80081634 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF87D8 80081638 3C0ADA38 */  lui   $t2, (0xDA380003 >> 16) # lui $t2, 0xda38
/* AF87DC 8008163C 354A0003 */  ori   $t2, (0xDA380003 & 0xFFFF) # ori $t2, $t2, 3
/* AF87E0 80081640 24480008 */  addiu $t0, $v0, 8
/* AF87E4 80081644 AE0802B0 */  sw    $t0, 0x2b0($s0)
/* AF87E8 80081648 AC4A0000 */  sw    $t2, ($v0)
/* AF87EC 8008164C 8FAB0070 */  lw    $t3, 0x70($sp)
/* AF87F0 80081650 3C058014 */  lui   $a1, %hi(D_8013D938) # $a1, 0x8014
/* AF87F4 80081654 24A5D938 */  addiu $a1, %lo(D_8013D938) # addiu $a1, $a1, -0x26c8
/* AF87F8 80081658 8D640000 */  lw    $a0, ($t3)
/* AF87FC 8008165C 2406025B */  li    $a2, 603
/* AF8800 80081660 0C0346A2 */  jal   Matrix_NewMtx
/* AF8804 80081664 AFA20030 */   sw    $v0, 0x30($sp)
/* AF8808 80081668 8FA30030 */  lw    $v1, 0x30($sp)
/* AF880C 8008166C 3C0DFA00 */  lui   $t5, (0xFA0000FF >> 16) # lui $t5, 0xfa00
/* AF8810 80081670 3C0FC800 */  lui   $t7, (0xC80000FF >> 16) # lui $t7, 0xc800
/* AF8814 80081674 AC620004 */  sw    $v0, 4($v1)
/* AF8818 80081678 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF881C 8008167C 35EF00FF */  ori   $t7, (0xC80000FF & 0xFFFF) # ori $t7, $t7, 0xff
/* AF8820 80081680 35AD00FF */  ori   $t5, (0xFA0000FF & 0xFFFF) # ori $t5, $t5, 0xff
/* AF8824 80081684 244C0008 */  addiu $t4, $v0, 8
/* AF8828 80081688 AE0C02B0 */  sw    $t4, 0x2b0($s0)
/* AF882C 8008168C AC4F0004 */  sw    $t7, 4($v0)
/* AF8830 80081690 AC4D0000 */  sw    $t5, ($v0)
/* AF8834 80081694 8E0202B0 */  lw    $v0, 0x2b0($s0)
/* AF8838 80081698 3C18DE00 */  lui   $t8, 0xde00
/* AF883C 8008169C 244E0008 */  addiu $t6, $v0, 8
/* AF8840 800816A0 AE0E02B0 */  sw    $t6, 0x2b0($s0)
/* AF8844 800816A4 AC580000 */  sw    $t8, ($v0)
/* AF8848 800816A8 8FB90024 */  lw    $t9, 0x24($sp)
/* AF884C 800816AC AC590004 */  sw    $t9, 4($v0)
/* AF8850 800816B0 8FA20070 */  lw    $v0, 0x70($sp)
.L800816B4:
/* AF8854 800816B4 3C068014 */  lui   $a2, %hi(D_8013D948) # $a2, 0x8014
/* AF8858 800816B8 24C6D948 */  addiu $a2, %lo(D_8013D948) # addiu $a2, $a2, -0x26b8
/* AF885C 800816BC 27A40050 */  addiu $a0, $sp, 0x50
/* AF8860 800816C0 8C450000 */  lw    $a1, ($v0)
/* AF8864 800816C4 0C031AD5 */  jal   Graph_CloseDisps
/* AF8868 800816C8 2407025F */   li    $a3, 607
/* AF886C 800816CC 8FBF001C */  lw    $ra, 0x1c($sp)
/* AF8870 800816D0 8FB00018 */  lw    $s0, 0x18($sp)
/* AF8874 800816D4 27BD0070 */  addiu $sp, $sp, 0x70
/* AF8878 800816D8 03E00008 */  jr    $ra
/* AF887C 800816DC 00000000 */   nop   

