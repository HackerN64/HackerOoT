.rdata
glabel D_801540A8
    .asciz "ＪＪ＝%d\n"
    .balign 4

glabel D_801540B4
    .asciz "NZ_NEXTMSG=%x, %x, %x\n"
    .balign 4

glabel D_801540CC
    # Name ＝
    .asciz "\n名前 ＝ "
    .balign 4

glabel D_801540D8
    .asciz "%x "
    .balign 4

glabel D_801540DC
    # ＥＶＥＮＴ TIMER ＝
    .asciz "\nＥＶＥＮＴタイマー ＝ "
    .balign 4

glabel D_801540F4
    # Horseback Archery Score ＝ %d
    .asciz "\n流鏑馬スコア ＝ %d\n"
    .balign 4

glabel D_8015410C
    # Total Gold Skulltula Tokens ＝ %d
    .asciz "\n金スタ合計数 ＝ %d"
    .balign 4

glabel D_80154120
    .asciz "%x(%x) "
    .balign 4

glabel D_80154128
    # Fishing Pond Fish Size ＝
    .asciz "\n釣り堀魚サイズ ＝ "
    .balign 4

glabel D_8015413C
    .asciz "%x(%x) "
    .balign 4

glabel D_80154144
    # Ranking＝%d
    .asciz "ランキング＝%d\n"
    .balign 4

glabel D_80154154
    .asciz "HI_SCORE( kanfont->mbuff.nes_mes_buf[message->rdp] & 0xff000000 ) = %x\n"
    .balign 4

glabel D_8015419C
    .asciz "score=%d\n"
    .balign 4

glabel D_801541A8
    # Zelda Time ＝
    .asciz "\nゼルダ時間 ＝ "
    .balign 4

glabel D_801541B8
    .asciz "ITEM_NO=(%d) (%d)\n"
    .balign 4

glabel D_801541CC
    .asciz "../z_message_PAL.c"
    .balign 4

glabel D_801541E0
    .asciz "../z_message_PAL.c"
    .balign 4

glabel D_801541F4
    .asciz "NZ_TIMER_END (key_off_flag=%d)\n"
    .balign 4

glabel D_80154214
    .asciz "NZ_BGM (key_off_flag=%d)\n"
    .balign 4

.late_rodata
glabel D_80154BC8
    .float 0.00359999993816

glabel jtbl_80154BCC
    .word L8010A6FC
    .word L8010A6FC
    .word L8010A6FC
    .word L8010A850
    .word L8010A850
    .word L8010B06C
    .word L8010A850

.text
glabel func_80109B3C
/* B80CDC 80109B3C 27BDFF68 */  addiu $sp, $sp, -0x98
/* B80CE0 80109B40 3C010001 */  lui   $at, 1
/* B80CE4 80109B44 AFBF0044 */  sw    $ra, 0x44($sp)
/* B80CE8 80109B48 AFBE0040 */  sw    $fp, 0x40($sp)
/* B80CEC 80109B4C AFB7003C */  sw    $s7, 0x3c($sp)
/* B80CF0 80109B50 AFB60038 */  sw    $s6, 0x38($sp)
/* B80CF4 80109B54 AFB50034 */  sw    $s5, 0x34($sp)
/* B80CF8 80109B58 AFB40030 */  sw    $s4, 0x30($sp)
/* B80CFC 80109B5C AFB3002C */  sw    $s3, 0x2c($sp)
/* B80D00 80109B60 AFB20028 */  sw    $s2, 0x28($sp)
/* B80D04 80109B64 AFB10024 */  sw    $s1, 0x24($sp)
/* B80D08 80109B68 AFB00020 */  sw    $s0, 0x20($sp)
/* B80D0C 80109B6C A7A00086 */  sh    $zero, 0x86($sp)
/* B80D10 80109B70 00240821 */  addu  $at, $at, $a0
/* B80D14 80109B74 3C070001 */  lui   $a3, 1
/* B80D18 80109B78 00E43821 */  addu  $a3, $a3, $a0
/* B80D1C 80109B7C A42004C0 */  sh    $zero, 0x4c0($at)
/* B80D20 80109B80 94E704C0 */  lhu   $a3, 0x4c0($a3)
/* B80D24 80109B84 3C010001 */  lui   $at, 1
/* B80D28 80109B88 00240821 */  addu  $at, $at, $a0
/* B80D2C 80109B8C A42704C2 */  sh    $a3, 0x4c2($at)
/* B80D30 80109B90 3C010001 */  lui   $at, 1
/* B80D34 80109B94 00240821 */  addu  $at, $at, $a0
/* B80D38 80109B98 A42704AE */  sh    $a3, 0x4ae($at)
/* B80D3C 80109B9C 3C018015 */  lui   $at, %hi(D_8014B2F0) # $at, 0x8015
/* B80D40 80109BA0 A420B2F0 */  sh    $zero, %lo(D_8014B2F0)($at)
/* B80D44 80109BA4 34018000 */  li    $at, 32768
/* B80D48 80109BA8 249720D8 */  addiu $s7, $a0, 0x20d8
/* B80D4C 80109BAC 02E17021 */  addu  $t6, $s7, $at
/* B80D50 80109BB0 0000A825 */  move  $s5, $zero
/* B80D54 80109BB4 0000B025 */  move  $s6, $zero
/* B80D58 80109BB8 AFAE0054 */  sw    $t6, 0x54($sp)
/* B80D5C 80109BBC AFA40098 */  sw    $a0, 0x98($sp)
/* B80D60 80109BC0 249E2200 */  addiu $fp, $a0, 0x2200
.L80109BC4:
/* B80D64 80109BC4 8FAF0054 */  lw    $t7, 0x54($sp)
/* B80D68 80109BC8 34028000 */  li    $v0, 32768
/* B80D6C 80109BCC 02F65021 */  addu  $t2, $s7, $s6
/* B80D70 80109BD0 95F863CE */  lhu   $t8, 0x63ce($t7)
/* B80D74 80109BD4 01425821 */  addu  $t3, $t2, $v0
/* B80D78 80109BD8 24010004 */  li    $at, 4
/* B80D7C 80109BDC 03D8C821 */  addu  $t9, $fp, $t8
/* B80D80 80109BE0 03224821 */  addu  $t1, $t9, $v0
/* B80D84 80109BE4 91325C88 */  lbu   $s2, 0x5c88($t1)
/* B80D88 80109BE8 A1726306 */  sb    $s2, 0x6306($t3)
/* B80D8C 80109BEC 325100FF */  andi  $s1, $s2, 0xff
/* B80D90 80109BF0 1241000B */  beq   $s2, $at, .L80109C20
/* B80D94 80109BF4 02408025 */   move  $s0, $s2
/* B80D98 80109BF8 24010007 */  li    $at, 7
/* B80D9C 80109BFC 12410008 */  beq   $s2, $at, .L80109C20
/* B80DA0 80109C00 2401000C */   li    $at, 12
/* B80DA4 80109C04 12410006 */  beq   $s2, $at, .L80109C20
/* B80DA8 80109C08 2401000B */   li    $at, 11
/* B80DAC 80109C0C 12410004 */  beq   $s2, $at, .L80109C20
/* B80DB0 80109C10 24140008 */   li    $s4, 8
/* B80DB4 80109C14 24010002 */  li    $at, 2
/* B80DB8 80109C18 1641007B */  bne   $s2, $at, .L80109E08
/* B80DBC 80109C1C 00009825 */   move  $s3, $zero
.L80109C20:
/* B80DC0 80109C20 26E17FFF */  addiu $at, $s7, 0x7fff
/* B80DC4 80109C24 240C0006 */  li    $t4, 6
/* B80DC8 80109C28 240D0001 */  li    $t5, 1
/* B80DCC 80109C2C A02C6305 */  sb    $t4, 0x6305($at)
/* B80DD0 80109C30 A42D63D3 */  sh    $t5, 0x63d3($at)
/* B80DD4 80109C34 3C028016 */  lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* B80DD8 80109C38 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* B80DDC 80109C3C 3C048015 */  lui   $a0, %hi(D_801540A8) # $a0, 0x8015
/* B80DE0 80109C40 248440A8 */  addiu $a0, %lo(D_801540A8) # addiu $a0, $a0, 0x40a8
/* B80DE4 80109C44 844E0F16 */  lh    $t6, 0xf16($v0)
/* B80DE8 80109C48 25CF0008 */  addiu $t7, $t6, 8
/* B80DEC 80109C4C A44F0B02 */  sh    $t7, 0xb02($v0)
/* B80DF0 80109C50 0C00084C */  jal   osSyncPrintf
/* B80DF4 80109C54 87A50086 */   lh    $a1, 0x86($sp)
/* B80DF8 80109C58 8FB80054 */  lw    $t8, 0x54($sp)
/* B80DFC 80109C5C 24010004 */  li    $at, 4
/* B80E00 80109C60 87A90086 */  lh    $t1, 0x86($sp)
/* B80E04 80109C64 931962FD */  lbu   $t9, 0x62fd($t8)
/* B80E08 80109C68 5321001A */  beql  $t9, $at, .L80109CD4
/* B80E0C 80109C6C 24010007 */   li    $at, 7
/* B80E10 80109C70 15200007 */  bnez  $t1, .L80109C90
/* B80E14 80109C74 87AC0086 */   lh    $t4, 0x86($sp)
/* B80E18 80109C78 3C028016 */  lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* B80E1C 80109C7C 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* B80E20 80109C80 844A0F16 */  lh    $t2, 0xf16($v0)
/* B80E24 80109C84 254B001A */  addiu $t3, $t2, 0x1a
/* B80E28 80109C88 10000011 */  b     .L80109CD0
/* B80E2C 80109C8C A44B0B02 */   sh    $t3, 0xb02($v0)
.L80109C90:
/* B80E30 80109C90 24010001 */  li    $at, 1
/* B80E34 80109C94 15810007 */  bne   $t4, $at, .L80109CB4
/* B80E38 80109C98 87AF0086 */   lh    $t7, 0x86($sp)
/* B80E3C 80109C9C 3C028016 */  lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* B80E40 80109CA0 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* B80E44 80109CA4 844D0F16 */  lh    $t5, 0xf16($v0)
/* B80E48 80109CA8 25AE0014 */  addiu $t6, $t5, 0x14
/* B80E4C 80109CAC 10000008 */  b     .L80109CD0
/* B80E50 80109CB0 A44E0B02 */   sh    $t6, 0xb02($v0)
.L80109CB4:
/* B80E54 80109CB4 24010002 */  li    $at, 2
/* B80E58 80109CB8 15E10005 */  bne   $t7, $at, .L80109CD0
/* B80E5C 80109CBC 3C028016 */   lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* B80E60 80109CC0 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* B80E64 80109CC4 84580F16 */  lh    $t8, 0xf16($v0)
/* B80E68 80109CC8 27190010 */  addiu $t9, $t8, 0x10
/* B80E6C 80109CCC A4590B02 */  sh    $t9, 0xb02($v0)
.L80109CD0:
/* B80E70 80109CD0 24010007 */  li    $at, 7
.L80109CD4:
/* B80E74 80109CD4 1601002D */  bne   $s0, $at, .L80109D8C
/* B80E78 80109CD8 8FA90054 */   lw    $t1, 0x54($sp)
/* B80E7C 80109CDC 952363CE */  lhu   $v1, 0x63ce($t1)
/* B80E80 80109CE0 34088000 */  li    $t0, 32768
/* B80E84 80109CE4 3C048015 */  lui   $a0, %hi(D_801540B4) # $a0, 0x8015
/* B80E88 80109CE8 03C35021 */  addu  $t2, $fp, $v1
/* B80E8C 80109CEC 03C36021 */  addu  $t4, $fp, $v1
/* B80E90 80109CF0 01881021 */  addu  $v0, $t4, $t0
/* B80E94 80109CF4 01485821 */  addu  $t3, $t2, $t0
/* B80E98 80109CF8 91655C88 */  lbu   $a1, 0x5c88($t3)
/* B80E9C 80109CFC 90465C89 */  lbu   $a2, 0x5c89($v0)
/* B80EA0 80109D00 90475C8A */  lbu   $a3, 0x5c8a($v0)
/* B80EA4 80109D04 0C00084C */  jal   osSyncPrintf
/* B80EA8 80109D08 248440B4 */   addiu $a0, %lo(D_801540B4) # addiu $a0, $a0, 0x40b4
/* B80EAC 80109D0C 8FA40054 */  lw    $a0, 0x54($sp)
/* B80EB0 80109D10 34038000 */  li    $v1, 32768
/* B80EB4 80109D14 26C20001 */  addiu $v0, $s6, 1
/* B80EB8 80109D18 948D63CE */  lhu   $t5, 0x63ce($a0)
/* B80EBC 80109D1C 00023C00 */  sll   $a3, $v0, 0x10
/* B80EC0 80109D20 00073C03 */  sra   $a3, $a3, 0x10
/* B80EC4 80109D24 03CD7021 */  addu  $t6, $fp, $t5
/* B80EC8 80109D28 01C37821 */  addu  $t7, $t6, $v1
/* B80ECC 80109D2C 91F25C89 */  lbu   $s2, 0x5c89($t7)
/* B80ED0 80109D30 02E7C021 */  addu  $t8, $s7, $a3
/* B80ED4 80109D34 0303C821 */  addu  $t9, $t8, $v1
/* B80ED8 80109D38 A3326306 */  sb    $s2, 0x6306($t9)
/* B80EDC 80109D3C 948963CE */  lhu   $t1, 0x63ce($a0)
/* B80EE0 80109D40 0040B025 */  move  $s6, $v0
/* B80EE4 80109D44 26C20001 */  addiu $v0, $s6, 1
/* B80EE8 80109D48 03C95021 */  addu  $t2, $fp, $t1
/* B80EEC 80109D4C 01435821 */  addu  $t3, $t2, $v1
/* B80EF0 80109D50 00023C00 */  sll   $a3, $v0, 0x10
/* B80EF4 80109D54 916C5C8A */  lbu   $t4, 0x5c8a($t3)
/* B80EF8 80109D58 00073C03 */  sra   $a3, $a3, 0x10
/* B80EFC 80109D5C 0002B400 */  sll   $s6, $v0, 0x10
/* B80F00 80109D60 0016B403 */  sra   $s6, $s6, 0x10
/* B80F04 80109D64 02E76821 */  addu  $t5, $s7, $a3
/* B80F08 80109D68 01A37021 */  addu  $t6, $t5, $v1
/* B80F0C 80109D6C 02F67821 */  addu  $t7, $s7, $s6
/* B80F10 80109D70 01E3C021 */  addu  $t8, $t7, $v1
/* B80F14 80109D74 A1CC6306 */  sb    $t4, 0x6306($t6)
/* B80F18 80109D78 93196306 */  lbu   $t9, 0x6306($t8)
/* B80F1C 80109D7C 00125200 */  sll   $t2, $s2, 8
/* B80F20 80109D80 3C018015 */  lui   $at, %hi(D_8014B304) # $at, 0x8015
/* B80F24 80109D84 032A5825 */  or    $t3, $t9, $t2
/* B80F28 80109D88 A42BB304 */  sh    $t3, %lo(D_8014B304)($at)
.L80109D8C:
/* B80F2C 80109D8C 2401000C */  li    $at, 12
/* B80F30 80109D90 16210012 */  bne   $s1, $at, .L80109DDC
/* B80F34 80109D94 34038000 */   li    $v1, 32768
/* B80F38 80109D98 8FA40054 */  lw    $a0, 0x54($sp)
/* B80F3C 80109D9C 26C20001 */  addiu $v0, $s6, 1
/* B80F40 80109DA0 00023C00 */  sll   $a3, $v0, 0x10
/* B80F44 80109DA4 948D63CE */  lhu   $t5, 0x63ce($a0)
/* B80F48 80109DA8 00073C03 */  sra   $a3, $a3, 0x10
/* B80F4C 80109DAC 02E7C021 */  addu  $t8, $s7, $a3
/* B80F50 80109DB0 03CD6021 */  addu  $t4, $fp, $t5
/* B80F54 80109DB4 01837021 */  addu  $t6, $t4, $v1
/* B80F58 80109DB8 91CF5C89 */  lbu   $t7, 0x5c89($t6)
/* B80F5C 80109DBC 03034821 */  addu  $t1, $t8, $v1
/* B80F60 80109DC0 0002B400 */  sll   $s6, $v0, 0x10
/* B80F64 80109DC4 A12F6306 */  sb    $t7, 0x6306($t1)
/* B80F68 80109DC8 949963CE */  lhu   $t9, 0x63ce($a0)
/* B80F6C 80109DCC 26E17FFF */  addiu $at, $s7, 0x7fff
/* B80F70 80109DD0 0016B403 */  sra   $s6, $s6, 0x10
/* B80F74 80109DD4 272A0002 */  addiu $t2, $t9, 2
/* B80F78 80109DD8 A42A63CF */  sh    $t2, 0x63cf($at)
.L80109DDC:
/* B80F7C 80109DDC 26E17FFF */  addiu $at, $s7, 0x7fff
/* B80F80 80109DE0 A43663D5 */  sh    $s6, 0x63d5($at)
/* B80F84 80109DE4 3C0B8015 */  lui   $t3, %hi(D_8014B300) # $t3, 0x8015
/* B80F88 80109DE8 916BB300 */  lbu   $t3, %lo(D_8014B300)($t3)
/* B80F8C 80109DEC 8FAD0054 */  lw    $t5, 0x54($sp)
/* B80F90 80109DF0 516004A8 */  beql  $t3, $zero, .L8010B094
/* B80F94 80109DF4 8FBF0044 */   lw    $ra, 0x44($sp)
/* B80F98 80109DF8 95AC63D4 */  lhu   $t4, 0x63d4($t5)
/* B80F9C 80109DFC 26E17FFF */  addiu $at, $s7, 0x7fff
/* B80FA0 80109E00 100004A3 */  b     .L8010B090
/* B80FA4 80109E04 A42C63D3 */   sh    $t4, 0x63d3($at)
.L80109E08:
/* B80FA8 80109E08 2401000F */  li    $at, 15
/* B80FAC 80109E0C 16010057 */  bne   $s0, $at, .L80109F6C
/* B80FB0 80109E10 3C048015 */   lui   $a0, %hi(D_801540CC) # $a0, 0x8015
.L80109E14:
/* B80FB4 80109E14 3C0E8016 */  lui   $t6, %hi(gSaveContext+0x23)
/* B80FB8 80109E18 01D47021 */  addu  $t6, $t6, $s4
/* B80FBC 80109E1C 91CEE683 */  lbu   $t6, %lo(gSaveContext+0x23)($t6)
/* B80FC0 80109E20 2401003E */  li    $at, 62
/* B80FC4 80109E24 15C10006 */  bne   $t6, $at, .L80109E40
/* B80FC8 80109E28 00000000 */   nop   
/* B80FCC 80109E2C 2694FFFF */  addiu $s4, $s4, -1
/* B80FD0 80109E30 0014A400 */  sll   $s4, $s4, 0x10
/* B80FD4 80109E34 0014A403 */  sra   $s4, $s4, 0x10
/* B80FD8 80109E38 1E80FFF6 */  bgtz  $s4, .L80109E14
/* B80FDC 80109E3C 00000000 */   nop   
.L80109E40:
/* B80FE0 80109E40 0C00084C */  jal   osSyncPrintf
/* B80FE4 80109E44 248440CC */   addiu $a0, %lo(D_801540CC) # addiu $a0, $a0, 0x40cc
/* B80FE8 80109E48 1A800044 */  blez  $s4, .L80109F5C
.L80109E4C:
/* B80FEC 80109E4C 3C118016 */   lui   $s1, %hi(gSaveContext+0x24)
/* B80FF0 80109E50 02338821 */  addu  $s1, $s1, $s3
/* B80FF4 80109E54 9231E684 */  lbu   $s1, %lo(gSaveContext+0x24)($s1)
/* B80FF8 80109E58 02F69021 */  addu  $s2, $s7, $s6
/* B80FFC 80109E5C 34018000 */  li    $at, 32768
/* B81000 80109E60 02419021 */  addu  $s2, $s2, $at
/* B81004 80109E64 2401003E */  li    $at, 62
/* B81008 80109E68 16210004 */  bne   $s1, $at, .L80109E7C
/* B8100C 80109E6C 02208025 */   move  $s0, $s1
/* B81010 80109E70 24110020 */  li    $s1, 32
/* B81014 80109E74 10000024 */  b     .L80109F08
/* B81018 80109E78 24100020 */   li    $s0, 32
.L80109E7C:
/* B8101C 80109E7C 24010040 */  li    $at, 64
/* B81020 80109E80 56010005 */  bnel  $s0, $at, .L80109E98
/* B81024 80109E84 2401003F */   li    $at, 63
/* B81028 80109E88 2411002E */  li    $s1, 46
/* B8102C 80109E8C 1000001E */  b     .L80109F08
/* B81030 80109E90 2410002E */   li    $s0, 46
/* B81034 80109E94 2401003F */  li    $at, 63
.L80109E98:
/* B81038 80109E98 56010005 */  bnel  $s0, $at, .L80109EB0
/* B8103C 80109E9C 2A01000A */   slti  $at, $s0, 0xa
/* B81040 80109EA0 2411002D */  li    $s1, 45
/* B81044 80109EA4 10000018 */  b     .L80109F08
/* B81048 80109EA8 2410002D */   li    $s0, 45
/* B8104C 80109EAC 2A01000A */  slti  $at, $s0, 0xa
.L80109EB0:
/* B81050 80109EB0 50200007 */  beql  $at, $zero, .L80109ED0
/* B81054 80109EB4 2A010024 */   slti  $at, $s0, 0x24
/* B81058 80109EB8 02008825 */  move  $s1, $s0
/* B8105C 80109EBC 26310030 */  addiu $s1, $s1, 0x30
/* B81060 80109EC0 323100FF */  andi  $s1, $s1, 0xff
/* B81064 80109EC4 10000010 */  b     .L80109F08
/* B81068 80109EC8 02208025 */   move  $s0, $s1
/* B8106C 80109ECC 2A010024 */  slti  $at, $s0, 0x24
.L80109ED0:
/* B81070 80109ED0 50200007 */  beql  $at, $zero, .L80109EF0
/* B81074 80109ED4 2A01003E */   slti  $at, $s0, 0x3e
/* B81078 80109ED8 02008825 */  move  $s1, $s0
/* B8107C 80109EDC 26310037 */  addiu $s1, $s1, 0x37
/* B81080 80109EE0 323100FF */  andi  $s1, $s1, 0xff
/* B81084 80109EE4 10000008 */  b     .L80109F08
/* B81088 80109EE8 02208025 */   move  $s0, $s1
/* B8108C 80109EEC 2A01003E */  slti  $at, $s0, 0x3e
.L80109EF0:
/* B81090 80109EF0 50200006 */  beql  $at, $zero, .L80109F0C
/* B81094 80109EF4 24010020 */   li    $at, 32
/* B81098 80109EF8 02008825 */  move  $s1, $s0
/* B8109C 80109EFC 2631003D */  addiu $s1, $s1, 0x3d
/* B810A0 80109F00 323100FF */  andi  $s1, $s1, 0xff
/* B810A4 80109F04 02208025 */  move  $s0, $s1
.L80109F08:
/* B810A8 80109F08 24010020 */  li    $at, 32
.L80109F0C:
/* B810AC 80109F0C 12010006 */  beq   $s0, $at, .L80109F28
/* B810B0 80109F10 03C02025 */   move  $a0, $fp
/* B810B4 80109F14 2605FFE0 */  addiu $a1, $s0, -0x20
/* B810B8 80109F18 30A500FF */  andi  $a1, $a1, 0xff
/* B810BC 80109F1C 0C01BB98 */  jal   func_8006EE60
/* B810C0 80109F20 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B810C4 80109F24 26B50080 */  addiu $s5, $s5, 0x80
.L80109F28:
/* B810C8 80109F28 3C048015 */  lui   $a0, %hi(D_801540D8) # $a0, 0x8015
/* B810CC 80109F2C 248440D8 */  addiu $a0, %lo(D_801540D8) # addiu $a0, $a0, 0x40d8
/* B810D0 80109F30 0C00084C */  jal   osSyncPrintf
/* B810D4 80109F34 02002825 */   move  $a1, $s0
/* B810D8 80109F38 26730001 */  addiu $s3, $s3, 1
/* B810DC 80109F3C 00139C00 */  sll   $s3, $s3, 0x10
/* B810E0 80109F40 00139C03 */  sra   $s3, $s3, 0x10
/* B810E4 80109F44 26D60001 */  addiu $s6, $s6, 1
/* B810E8 80109F48 0274082A */  slt   $at, $s3, $s4
/* B810EC 80109F4C 0016B400 */  sll   $s6, $s6, 0x10
/* B810F0 80109F50 A2516306 */  sb    $s1, 0x6306($s2)
/* B810F4 80109F54 1420FFBD */  bnez  $at, .L80109E4C
/* B810F8 80109F58 0016B403 */   sra   $s6, $s6, 0x10
.L80109F5C:
/* B810FC 80109F5C 26D6FFFF */  addiu $s6, $s6, -1
/* B81100 80109F60 0016B400 */  sll   $s6, $s6, 0x10
/* B81104 80109F64 10000441 */  b     .L8010B06C
/* B81108 80109F68 0016B403 */   sra   $s6, $s6, 0x10
.L80109F6C:
/* B8110C 80109F6C 24010016 */  li    $at, 22
/* B81110 80109F70 12010003 */  beq   $s0, $at, .L80109F80
/* B81114 80109F74 3C048015 */   lui   $a0, %hi(D_801540DC) # $a0, 0x8015
/* B81118 80109F78 24010017 */  li    $at, 23
/* B8111C 80109F7C 16010069 */  bne   $s0, $at, .L8010A124
.L80109F80:
/* B81120 80109F80 248440DC */   addiu $a0, %lo(D_801540DC) # addiu $a0, $a0, 0x40dc
/* B81124 80109F84 0C00084C */  jal   osSyncPrintf
/* B81128 80109F88 00009825 */   move  $s3, $zero
/* B8112C 80109F8C 00001C00 */  sll   $v1, $zero, 0x10
/* B81130 80109F90 00002400 */  sll   $a0, $zero, 0x10
/* B81134 80109F94 24010017 */  li    $at, 23
/* B81138 80109F98 00042403 */  sra   $a0, $a0, 0x10
/* B8113C 80109F9C 00031C03 */  sra   $v1, $v1, 0x10
/* B81140 80109FA0 16010004 */  bne   $s0, $at, .L80109FB4
/* B81144 80109FA4 00002825 */   move  $a1, $zero
/* B81148 80109FA8 3C028016 */  lui   $v0, %hi(gSaveContext+0x13d0) # $v0, 0x8016
/* B8114C 80109FAC 10000003 */  b     .L80109FBC
/* B81150 80109FB0 8442FA30 */   lh    $v0, %lo(gSaveContext+0x13d0)($v0)
.L80109FB4:
/* B81154 80109FB4 3C028016 */  lui   $v0, %hi(gSaveContext+0x13d4)
/* B81158 80109FB8 8442FA34 */  lh    $v0, %lo(gSaveContext+0x13d4)($v0)
.L80109FBC:
/* B8115C 80109FBC 2841003C */  slti  $at, $v0, 0x3c
/* B81160 80109FC0 A7A3007E */  sh    $v1, 0x7e($sp)
/* B81164 80109FC4 14200014 */  bnez  $at, .L8010A018
/* B81168 80109FC8 A7A4007C */   sh    $a0, 0x7c($sp)
/* B8116C 80109FCC 24630001 */  addiu $v1, $v1, 1
.L80109FD0:
/* B81170 80109FD0 00031C00 */  sll   $v1, $v1, 0x10
/* B81174 80109FD4 00031C03 */  sra   $v1, $v1, 0x10
/* B81178 80109FD8 2861000A */  slti  $at, $v1, 0xa
/* B8117C 80109FDC 14200007 */  bnez  $at, .L80109FFC
/* B81180 80109FE0 2442FFC4 */   addiu $v0, $v0, -0x3c
/* B81184 80109FE4 24840001 */  addiu $a0, $a0, 1
/* B81188 80109FE8 2463FFF6 */  addiu $v1, $v1, -0xa
/* B8118C 80109FEC 00042400 */  sll   $a0, $a0, 0x10
/* B81190 80109FF0 00031C00 */  sll   $v1, $v1, 0x10
/* B81194 80109FF4 00042403 */  sra   $a0, $a0, 0x10
/* B81198 80109FF8 00031C03 */  sra   $v1, $v1, 0x10
.L80109FFC:
/* B8119C 80109FFC 00021400 */  sll   $v0, $v0, 0x10
/* B811A0 8010A000 00021403 */  sra   $v0, $v0, 0x10
/* B811A4 8010A004 2841003C */  slti  $at, $v0, 0x3c
/* B811A8 8010A008 5020FFF1 */  beql  $at, $zero, .L80109FD0
/* B811AC 8010A00C 24630001 */   addiu $v1, $v1, 1
/* B811B0 8010A010 A7A4007C */  sh    $a0, 0x7c($sp)
/* B811B4 8010A014 A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A018:
/* B811B8 8010A018 2841000A */  slti  $at, $v0, 0xa
/* B811BC 8010A01C A7A20082 */  sh    $v0, 0x82($sp)
/* B811C0 8010A020 1420000B */  bnez  $at, .L8010A050
/* B811C4 8010A024 A7A50080 */   sh    $a1, 0x80($sp)
.L8010A028:
/* B811C8 8010A028 2442FFF6 */  addiu $v0, $v0, -0xa
/* B811CC 8010A02C 00021400 */  sll   $v0, $v0, 0x10
/* B811D0 8010A030 24A50001 */  addiu $a1, $a1, 1
/* B811D4 8010A034 00021403 */  sra   $v0, $v0, 0x10
/* B811D8 8010A038 2841000A */  slti  $at, $v0, 0xa
/* B811DC 8010A03C 00052C00 */  sll   $a1, $a1, 0x10
/* B811E0 8010A040 1020FFF9 */  beqz  $at, .L8010A028
/* B811E4 8010A044 00052C03 */   sra   $a1, $a1, 0x10
/* B811E8 8010A048 A7A50080 */  sh    $a1, 0x80($sp)
/* B811EC 8010A04C A7A20082 */  sh    $v0, 0x82($sp)
.L8010A050:
/* B811F0 8010A050 0013C040 */  sll   $t8, $s3, 1
.L8010A054:
/* B811F4 8010A054 27AF007C */  addiu $t7, $sp, 0x7c
/* B811F8 8010A058 030F8021 */  addu  $s0, $t8, $t7
/* B811FC 8010A05C 86050000 */  lh    $a1, ($s0)
/* B81200 8010A060 02F69021 */  addu  $s2, $s7, $s6
/* B81204 8010A064 34018000 */  li    $at, 32768
/* B81208 8010A068 24A50010 */  addiu $a1, $a1, 0x10
/* B8120C 8010A06C 30A500FF */  andi  $a1, $a1, 0xff
/* B81210 8010A070 02419021 */  addu  $s2, $s2, $at
/* B81214 8010A074 03C02025 */  move  $a0, $fp
/* B81218 8010A078 0C01BB98 */  jal   func_8006EE60
/* B8121C 8010A07C 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81220 8010A080 86090000 */  lh    $t1, ($s0)
/* B81224 8010A084 26D60001 */  addiu $s6, $s6, 1
/* B81228 8010A088 0016B400 */  sll   $s6, $s6, 0x10
/* B8122C 8010A08C 24010001 */  li    $at, 1
/* B81230 8010A090 25390030 */  addiu $t9, $t1, 0x30
/* B81234 8010A094 26B50080 */  addiu $s5, $s5, 0x80
/* B81238 8010A098 A2596306 */  sb    $t9, 0x6306($s2)
/* B8123C 8010A09C 1661000E */  bne   $s3, $at, .L8010A0D8
/* B81240 8010A0A0 0016B403 */   sra   $s6, $s6, 0x10
/* B81244 8010A0A4 03C02025 */  move  $a0, $fp
/* B81248 8010A0A8 24050002 */  li    $a1, 2
/* B8124C 8010A0AC 0C01BB98 */  jal   func_8006EE60
/* B81250 8010A0B0 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81254 8010A0B4 02F65821 */  addu  $t3, $s7, $s6
/* B81258 8010A0B8 26D60001 */  addiu $s6, $s6, 1
/* B8125C 8010A0BC 25617FFF */  addiu $at, $t3, 0x7fff
/* B81260 8010A0C0 240A0022 */  li    $t2, 34
/* B81264 8010A0C4 0016B400 */  sll   $s6, $s6, 0x10
/* B81268 8010A0C8 26B50080 */  addiu $s5, $s5, 0x80
/* B8126C 8010A0CC A02A6307 */  sb    $t2, 0x6307($at)
/* B81270 8010A0D0 1000000C */  b     .L8010A104
/* B81274 8010A0D4 0016B403 */   sra   $s6, $s6, 0x10
.L8010A0D8:
/* B81278 8010A0D8 24010003 */  li    $at, 3
/* B8127C 8010A0DC 16610009 */  bne   $s3, $at, .L8010A104
/* B81280 8010A0E0 03C02025 */   move  $a0, $fp
/* B81284 8010A0E4 24050002 */  li    $a1, 2
/* B81288 8010A0E8 0C01BB98 */  jal   func_8006EE60
/* B8128C 8010A0EC 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81290 8010A0F0 02F66021 */  addu  $t4, $s7, $s6
/* B81294 8010A0F4 25817FFF */  addiu $at, $t4, 0x7fff
/* B81298 8010A0F8 240D0022 */  li    $t5, 34
/* B8129C 8010A0FC 26B50080 */  addiu $s5, $s5, 0x80
/* B812A0 8010A100 A02D6307 */  sb    $t5, 0x6307($at)
.L8010A104:
/* B812A4 8010A104 26730001 */  addiu $s3, $s3, 1
/* B812A8 8010A108 00139C00 */  sll   $s3, $s3, 0x10
/* B812AC 8010A10C 00139C03 */  sra   $s3, $s3, 0x10
/* B812B0 8010A110 2A610004 */  slti  $at, $s3, 4
/* B812B4 8010A114 5420FFCF */  bnezl $at, .L8010A054
/* B812B8 8010A118 0013C040 */   sll   $t8, $s3, 1
/* B812BC 8010A11C 100003D4 */  b     .L8010B070
/* B812C0 8010A120 8FB90054 */   lw    $t9, 0x54($sp)
.L8010A124:
/* B812C4 8010A124 24010018 */  li    $at, 24
/* B812C8 8010A128 1601005A */  bne   $s0, $at, .L8010A294
/* B812CC 8010A12C 3C048015 */   lui   $a0, %hi(D_801540F4) # $a0, 0x8015
/* B812D0 8010A130 3C058016 */  lui   $a1, %hi(gSaveContext+0x1406) # $a1, 0x8016
/* B812D4 8010A134 94A5FA66 */  lhu   $a1, %lo(gSaveContext+0x1406)($a1)
/* B812D8 8010A138 248440F4 */  addiu $a0, %lo(D_801540F4) # addiu $a0, $a0, 0x40f4
/* B812DC 8010A13C 00009825 */  move  $s3, $zero
/* B812E0 8010A140 0C00084C */  jal   osSyncPrintf
/* B812E4 8010A144 00008825 */   move  $s1, $zero
/* B812E8 8010A148 3C028016 */  lui   $v0, %hi(gSaveContext+0x1406) # $v0, 0x8016
/* B812EC 8010A14C 8442FA66 */  lh    $v0, %lo(gSaveContext+0x1406)($v0)
/* B812F0 8010A150 00002400 */  sll   $a0, $zero, 0x10
/* B812F4 8010A154 00042403 */  sra   $a0, $a0, 0x10
/* B812F8 8010A158 00001C00 */  sll   $v1, $zero, 0x10
/* B812FC 8010A15C 284103E8 */  slti  $at, $v0, 0x3e8
/* B81300 8010A160 00031C03 */  sra   $v1, $v1, 0x10
/* B81304 8010A164 00002825 */  move  $a1, $zero
/* B81308 8010A168 1420000A */  bnez  $at, .L8010A194
/* B8130C 8010A16C A7A4007C */   sh    $a0, 0x7c($sp)
.L8010A170:
/* B81310 8010A170 2442FC18 */  addiu $v0, $v0, -0x3e8
/* B81314 8010A174 00021400 */  sll   $v0, $v0, 0x10
/* B81318 8010A178 24840001 */  addiu $a0, $a0, 1
/* B8131C 8010A17C 00021403 */  sra   $v0, $v0, 0x10
/* B81320 8010A180 284103E8 */  slti  $at, $v0, 0x3e8
/* B81324 8010A184 00042400 */  sll   $a0, $a0, 0x10
/* B81328 8010A188 1020FFF9 */  beqz  $at, .L8010A170
/* B8132C 8010A18C 00042403 */   sra   $a0, $a0, 0x10
/* B81330 8010A190 A7A4007C */  sh    $a0, 0x7c($sp)
.L8010A194:
/* B81334 8010A194 28410064 */  slti  $at, $v0, 0x64
/* B81338 8010A198 1420000A */  bnez  $at, .L8010A1C4
/* B8133C 8010A19C A7A3007E */   sh    $v1, 0x7e($sp)
.L8010A1A0:
/* B81340 8010A1A0 2442FF9C */  addiu $v0, $v0, -0x64
/* B81344 8010A1A4 00021400 */  sll   $v0, $v0, 0x10
/* B81348 8010A1A8 24630001 */  addiu $v1, $v1, 1
/* B8134C 8010A1AC 00021403 */  sra   $v0, $v0, 0x10
/* B81350 8010A1B0 28410064 */  slti  $at, $v0, 0x64
/* B81354 8010A1B4 00031C00 */  sll   $v1, $v1, 0x10
/* B81358 8010A1B8 1020FFF9 */  beqz  $at, .L8010A1A0
/* B8135C 8010A1BC 00031C03 */   sra   $v1, $v1, 0x10
/* B81360 8010A1C0 A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A1C4:
/* B81364 8010A1C4 2841000A */  slti  $at, $v0, 0xa
/* B81368 8010A1C8 A7A20082 */  sh    $v0, 0x82($sp)
/* B8136C 8010A1CC 1420000B */  bnez  $at, .L8010A1FC
/* B81370 8010A1D0 A7A50080 */   sh    $a1, 0x80($sp)
.L8010A1D4:
/* B81374 8010A1D4 2442FFF6 */  addiu $v0, $v0, -0xa
/* B81378 8010A1D8 00021400 */  sll   $v0, $v0, 0x10
/* B8137C 8010A1DC 24A50001 */  addiu $a1, $a1, 1
/* B81380 8010A1E0 00021403 */  sra   $v0, $v0, 0x10
/* B81384 8010A1E4 2841000A */  slti  $at, $v0, 0xa
/* B81388 8010A1E8 00052C00 */  sll   $a1, $a1, 0x10
/* B8138C 8010A1EC 1020FFF9 */  beqz  $at, .L8010A1D4
/* B81390 8010A1F0 00052C03 */   sra   $a1, $a1, 0x10
/* B81394 8010A1F4 A7A50080 */  sh    $a1, 0x80($sp)
/* B81398 8010A1F8 A7A20082 */  sh    $v0, 0x82($sp)
.L8010A1FC:
/* B8139C 8010A1FC 24010003 */  li    $at, 3
.L8010A200:
/* B813A0 8010A200 12610005 */  beq   $s3, $at, .L8010A218
/* B813A4 8010A204 00137040 */   sll   $t6, $s3, 1
/* B813A8 8010A208 03AEC021 */  addu  $t8, $sp, $t6
/* B813AC 8010A20C 8718007C */  lh    $t8, 0x7c($t8)
/* B813B0 8010A210 13000002 */  beqz  $t8, .L8010A21C
/* B813B4 8010A214 00000000 */   nop   
.L8010A218:
/* B813B8 8010A218 24110001 */  li    $s1, 1
.L8010A21C:
/* B813BC 8010A21C 12200013 */  beqz  $s1, .L8010A26C
/* B813C0 8010A220 03C02025 */   move  $a0, $fp
/* B813C4 8010A224 00137840 */  sll   $t7, $s3, 1
/* B813C8 8010A228 27A9007C */  addiu $t1, $sp, 0x7c
/* B813CC 8010A22C 01E98021 */  addu  $s0, $t7, $t1
/* B813D0 8010A230 86050000 */  lh    $a1, ($s0)
/* B813D4 8010A234 02F69021 */  addu  $s2, $s7, $s6
/* B813D8 8010A238 34018000 */  li    $at, 32768
/* B813DC 8010A23C 24A50010 */  addiu $a1, $a1, 0x10
/* B813E0 8010A240 30A500FF */  andi  $a1, $a1, 0xff
/* B813E4 8010A244 02419021 */  addu  $s2, $s2, $at
/* B813E8 8010A248 0C01BB98 */  jal   func_8006EE60
/* B813EC 8010A24C 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B813F0 8010A250 86190000 */  lh    $t9, ($s0)
/* B813F4 8010A254 26D60001 */  addiu $s6, $s6, 1
/* B813F8 8010A258 0016B400 */  sll   $s6, $s6, 0x10
/* B813FC 8010A25C 272A0030 */  addiu $t2, $t9, 0x30
/* B81400 8010A260 A24A6306 */  sb    $t2, 0x6306($s2)
/* B81404 8010A264 26B50080 */  addiu $s5, $s5, 0x80
/* B81408 8010A268 0016B403 */  sra   $s6, $s6, 0x10
.L8010A26C:
/* B8140C 8010A26C 26730001 */  addiu $s3, $s3, 1
/* B81410 8010A270 00139C00 */  sll   $s3, $s3, 0x10
/* B81414 8010A274 00139C03 */  sra   $s3, $s3, 0x10
/* B81418 8010A278 2A610004 */  slti  $at, $s3, 4
/* B8141C 8010A27C 5420FFE0 */  bnezl $at, .L8010A200
/* B81420 8010A280 24010003 */   li    $at, 3
/* B81424 8010A284 26D6FFFF */  addiu $s6, $s6, -1
/* B81428 8010A288 0016B400 */  sll   $s6, $s6, 0x10
/* B8142C 8010A28C 10000377 */  b     .L8010B06C
/* B81430 8010A290 0016B403 */   sra   $s6, $s6, 0x10
.L8010A294:
/* B81434 8010A294 24010019 */  li    $at, 25
/* B81438 8010A298 16010051 */  bne   $s0, $at, .L8010A3E0
/* B8143C 8010A29C 3C048015 */   lui   $a0, %hi(D_8015410C) # $a0, 0x8015
/* B81440 8010A2A0 3C058016 */  lui   $a1, %hi(gSaveContext+0xd0) # $a1, 0x8016
/* B81444 8010A2A4 84A5E730 */  lh    $a1, %lo(gSaveContext+0xd0)($a1)
/* B81448 8010A2A8 2484410C */  addiu $a0, %lo(D_8015410C) # addiu $a0, $a0, 0x410c
/* B8144C 8010A2AC 00009825 */  move  $s3, $zero
/* B81450 8010A2B0 0C00084C */  jal   osSyncPrintf
/* B81454 8010A2B4 00008825 */   move  $s1, $zero
/* B81458 8010A2B8 3C058016 */  lui   $a1, %hi(gSaveContext+0xd0)
/* B8145C 8010A2BC 84A5E730 */  lh    $a1, %lo(gSaveContext+0xd0)($a1)
/* B81460 8010A2C0 00002400 */  sll   $a0, $zero, 0x10
/* B81464 8010A2C4 00042403 */  sra   $a0, $a0, 0x10
/* B81468 8010A2C8 28A10064 */  slti  $at, $a1, 0x64
/* B8146C 8010A2CC 00001825 */  move  $v1, $zero
/* B81470 8010A2D0 1420000A */  bnez  $at, .L8010A2FC
/* B81474 8010A2D4 A7A4007C */   sh    $a0, 0x7c($sp)
.L8010A2D8:
/* B81478 8010A2D8 24A5FF9C */  addiu $a1, $a1, -0x64
/* B8147C 8010A2DC 00052C00 */  sll   $a1, $a1, 0x10
/* B81480 8010A2E0 24840001 */  addiu $a0, $a0, 1
/* B81484 8010A2E4 00052C03 */  sra   $a1, $a1, 0x10
/* B81488 8010A2E8 28A10064 */  slti  $at, $a1, 0x64
/* B8148C 8010A2EC 00042400 */  sll   $a0, $a0, 0x10
/* B81490 8010A2F0 1020FFF9 */  beqz  $at, .L8010A2D8
/* B81494 8010A2F4 00042403 */   sra   $a0, $a0, 0x10
/* B81498 8010A2F8 A7A4007C */  sh    $a0, 0x7c($sp)
.L8010A2FC:
/* B8149C 8010A2FC 28A1000A */  slti  $at, $a1, 0xa
/* B814A0 8010A300 A7A3007E */  sh    $v1, 0x7e($sp)
/* B814A4 8010A304 1420000B */  bnez  $at, .L8010A334
/* B814A8 8010A308 A7A50080 */   sh    $a1, 0x80($sp)
.L8010A30C:
/* B814AC 8010A30C 24A5FFF6 */  addiu $a1, $a1, -0xa
/* B814B0 8010A310 00052C00 */  sll   $a1, $a1, 0x10
/* B814B4 8010A314 24630001 */  addiu $v1, $v1, 1
/* B814B8 8010A318 00052C03 */  sra   $a1, $a1, 0x10
/* B814BC 8010A31C 28A1000A */  slti  $at, $a1, 0xa
/* B814C0 8010A320 00031C00 */  sll   $v1, $v1, 0x10
/* B814C4 8010A324 1020FFF9 */  beqz  $at, .L8010A30C
/* B814C8 8010A328 00031C03 */   sra   $v1, $v1, 0x10
/* B814CC 8010A32C A7A50080 */  sh    $a1, 0x80($sp)
/* B814D0 8010A330 A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A334:
/* B814D4 8010A334 24010002 */  li    $at, 2
.L8010A338:
/* B814D8 8010A338 12610005 */  beq   $s3, $at, .L8010A350
/* B814DC 8010A33C 00135840 */   sll   $t3, $s3, 1
/* B814E0 8010A340 03AB6821 */  addu  $t5, $sp, $t3
/* B814E4 8010A344 85AD007C */  lh    $t5, 0x7c($t5)
/* B814E8 8010A348 11A00002 */  beqz  $t5, .L8010A354
/* B814EC 8010A34C 00000000 */   nop   
.L8010A350:
/* B814F0 8010A350 24110001 */  li    $s1, 1
.L8010A354:
/* B814F4 8010A354 12200018 */  beqz  $s1, .L8010A3B8
/* B814F8 8010A358 03C02025 */   move  $a0, $fp
/* B814FC 8010A35C 00136040 */  sll   $t4, $s3, 1
/* B81500 8010A360 27AE007C */  addiu $t6, $sp, 0x7c
/* B81504 8010A364 018E8021 */  addu  $s0, $t4, $t6
/* B81508 8010A368 86050000 */  lh    $a1, ($s0)
/* B8150C 8010A36C 02F69021 */  addu  $s2, $s7, $s6
/* B81510 8010A370 34018000 */  li    $at, 32768
/* B81514 8010A374 24A50010 */  addiu $a1, $a1, 0x10
/* B81518 8010A378 30A500FF */  andi  $a1, $a1, 0xff
/* B8151C 8010A37C 02419021 */  addu  $s2, $s2, $at
/* B81520 8010A380 0C01BB98 */  jal   func_8006EE60
/* B81524 8010A384 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81528 8010A388 86180000 */  lh    $t8, ($s0)
/* B8152C 8010A38C 3C048015 */  lui   $a0, %hi(D_80154120) # $a0, 0x8015
/* B81530 8010A390 26B50080 */  addiu $s5, $s5, 0x80
/* B81534 8010A394 270F0030 */  addiu $t7, $t8, 0x30
/* B81538 8010A398 A24F6306 */  sb    $t7, 0x6306($s2)
/* B8153C 8010A39C 86060000 */  lh    $a2, ($s0)
/* B81540 8010A3A0 24844120 */  addiu $a0, %lo(D_80154120) # addiu $a0, $a0, 0x4120
/* B81544 8010A3A4 0C00084C */  jal   osSyncPrintf
/* B81548 8010A3A8 24C50010 */   addiu $a1, $a2, 0x10
/* B8154C 8010A3AC 26D60001 */  addiu $s6, $s6, 1
/* B81550 8010A3B0 0016B400 */  sll   $s6, $s6, 0x10
/* B81554 8010A3B4 0016B403 */  sra   $s6, $s6, 0x10
.L8010A3B8:
/* B81558 8010A3B8 26730001 */  addiu $s3, $s3, 1
/* B8155C 8010A3BC 00139C00 */  sll   $s3, $s3, 0x10
/* B81560 8010A3C0 00139C03 */  sra   $s3, $s3, 0x10
/* B81564 8010A3C4 2A610003 */  slti  $at, $s3, 3
/* B81568 8010A3C8 5420FFDB */  bnezl $at, .L8010A338
/* B8156C 8010A3CC 24010002 */   li    $at, 2
/* B81570 8010A3D0 26D6FFFF */  addiu $s6, $s6, -1
/* B81574 8010A3D4 0016B400 */  sll   $s6, $s6, 0x10
/* B81578 8010A3D8 10000324 */  b     .L8010B06C
/* B8157C 8010A3DC 0016B403 */   sra   $s6, $s6, 0x10
.L8010A3E0:
/* B81580 8010A3E0 2401001D */  li    $at, 29
/* B81584 8010A3E4 1601003D */  bne   $s0, $at, .L8010A4DC
/* B81588 8010A3E8 3C048015 */   lui   $a0, %hi(D_80154128) # $a0, 0x8015
/* B8158C 8010A3EC 24844128 */  addiu $a0, %lo(D_80154128) # addiu $a0, $a0, 0x4128
/* B81590 8010A3F0 0C00084C */  jal   osSyncPrintf
/* B81594 8010A3F4 00009825 */   move  $s3, $zero
/* B81598 8010A3F8 3C038016 */  lui   $v1, %hi(gSaveContext+0x1406) # $v1, 0x8016
/* B8159C 8010A3FC 8463FA66 */  lh    $v1, %lo(gSaveContext+0x1406)($v1)
/* B815A0 8010A400 00002025 */  move  $a0, $zero
/* B815A4 8010A404 A7A0007C */  sh    $zero, 0x7c($sp)
/* B815A8 8010A408 2861000A */  slti  $at, $v1, 0xa
/* B815AC 8010A40C 1420000B */  bnez  $at, .L8010A43C
/* B815B0 8010A410 A7A3007E */   sh    $v1, 0x7e($sp)
.L8010A414:
/* B815B4 8010A414 2463FFF6 */  addiu $v1, $v1, -0xa
/* B815B8 8010A418 00031C00 */  sll   $v1, $v1, 0x10
/* B815BC 8010A41C 24840001 */  addiu $a0, $a0, 1
/* B815C0 8010A420 00031C03 */  sra   $v1, $v1, 0x10
/* B815C4 8010A424 2861000A */  slti  $at, $v1, 0xa
/* B815C8 8010A428 00042400 */  sll   $a0, $a0, 0x10
/* B815CC 8010A42C 1020FFF9 */  beqz  $at, .L8010A414
/* B815D0 8010A430 00042403 */   sra   $a0, $a0, 0x10
/* B815D4 8010A434 A7A4007C */  sh    $a0, 0x7c($sp)
/* B815D8 8010A438 A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A43C:
/* B815DC 8010A43C 24010001 */  li    $at, 1
.L8010A440:
/* B815E0 8010A440 12610004 */  beq   $s3, $at, .L8010A454
/* B815E4 8010A444 00134840 */   sll   $t1, $s3, 1
/* B815E8 8010A448 03A9C821 */  addu  $t9, $sp, $t1
/* B815EC 8010A44C 8739007C */  lh    $t9, 0x7c($t9)
/* B815F0 8010A450 13200018 */  beqz  $t9, .L8010A4B4
.L8010A454:
/* B815F4 8010A454 00135040 */   sll   $t2, $s3, 1
/* B815F8 8010A458 27AB007C */  addiu $t3, $sp, 0x7c
/* B815FC 8010A45C 014B8021 */  addu  $s0, $t2, $t3
/* B81600 8010A460 86050000 */  lh    $a1, ($s0)
/* B81604 8010A464 02F69021 */  addu  $s2, $s7, $s6
/* B81608 8010A468 34018000 */  li    $at, 32768
/* B8160C 8010A46C 24A50010 */  addiu $a1, $a1, 0x10
/* B81610 8010A470 30A500FF */  andi  $a1, $a1, 0xff
/* B81614 8010A474 02419021 */  addu  $s2, $s2, $at
/* B81618 8010A478 03C02025 */  move  $a0, $fp
/* B8161C 8010A47C 0C01BB98 */  jal   func_8006EE60
/* B81620 8010A480 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81624 8010A484 860D0000 */  lh    $t5, ($s0)
/* B81628 8010A488 3C048015 */  lui   $a0, %hi(D_8015413C) # $a0, 0x8015
/* B8162C 8010A48C 26B50080 */  addiu $s5, $s5, 0x80
/* B81630 8010A490 25AC0030 */  addiu $t4, $t5, 0x30
/* B81634 8010A494 A24C6306 */  sb    $t4, 0x6306($s2)
/* B81638 8010A498 86060000 */  lh    $a2, ($s0)
/* B8163C 8010A49C 2484413C */  addiu $a0, %lo(D_8015413C) # addiu $a0, $a0, 0x413c
/* B81640 8010A4A0 0C00084C */  jal   osSyncPrintf
/* B81644 8010A4A4 24C50010 */   addiu $a1, $a2, 0x10
/* B81648 8010A4A8 26D60001 */  addiu $s6, $s6, 1
/* B8164C 8010A4AC 0016B400 */  sll   $s6, $s6, 0x10
/* B81650 8010A4B0 0016B403 */  sra   $s6, $s6, 0x10
.L8010A4B4:
/* B81654 8010A4B4 26730001 */  addiu $s3, $s3, 1
/* B81658 8010A4B8 00139C00 */  sll   $s3, $s3, 0x10
/* B8165C 8010A4BC 00139C03 */  sra   $s3, $s3, 0x10
/* B81660 8010A4C0 2A610002 */  slti  $at, $s3, 2
/* B81664 8010A4C4 5420FFDE */  bnezl $at, .L8010A440
/* B81668 8010A4C8 24010001 */   li    $at, 1
/* B8166C 8010A4CC 26D6FFFF */  addiu $s6, $s6, -1
/* B81670 8010A4D0 0016B400 */  sll   $s6, $s6, 0x10
/* B81674 8010A4D4 100002E5 */  b     .L8010B06C
/* B81678 8010A4D8 0016B403 */   sra   $s6, $s6, 0x10
.L8010A4DC:
/* B8167C 8010A4DC 2401001E */  li    $at, 30
/* B81680 8010A4E0 1601013D */  bne   $s0, $at, .L8010A9D8
/* B81684 8010A4E4 8FA30054 */   lw    $v1, 0x54($sp)
/* B81688 8010A4E8 946763CE */  lhu   $a3, 0x63ce($v1)
/* B8168C 8010A4EC 26E17FFF */  addiu $at, $s7, 0x7fff
/* B81690 8010A4F0 34028000 */  li    $v0, 32768
/* B81694 8010A4F4 24E70001 */  addiu $a3, $a3, 1
/* B81698 8010A4F8 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B8169C 8010A4FC A42763CF */  sh    $a3, 0x63cf($at)
/* B816A0 8010A500 03C77021 */  addu  $t6, $fp, $a3
/* B816A4 8010A504 01C2C021 */  addu  $t8, $t6, $v0
/* B816A8 8010A508 930F5C88 */  lbu   $t7, 0x5c88($t8)
/* B816AC 8010A50C 947963CE */  lhu   $t9, 0x63ce($v1)
/* B816B0 8010A510 3C108016 */  lui   $s0, %hi(gSaveContext+0xeba)
/* B816B4 8010A514 000F4880 */  sll   $t1, $t7, 2
/* B816B8 8010A518 03D95021 */  addu  $t2, $fp, $t9
/* B816BC 8010A51C 02098021 */  addu  $s0, $s0, $t1
/* B816C0 8010A520 01425821 */  addu  $t3, $t2, $v0
/* B816C4 8010A524 3C048015 */  lui   $a0, %hi(D_80154144) # $a0, 0x8015
/* B816C8 8010A528 9610F51A */  lhu   $s0, %lo(gSaveContext+0xeba)($s0)
/* B816CC 8010A52C 24844144 */  addiu $a0, %lo(D_80154144) # addiu $a0, $a0, 0x4144
/* B816D0 8010A530 0C00084C */  jal   osSyncPrintf
/* B816D4 8010A534 91655C88 */   lbu   $a1, 0x5c88($t3)
/* B816D8 8010A538 8FAD0054 */  lw    $t5, 0x54($sp)
/* B816DC 8010A53C 24010002 */  li    $at, 2
/* B816E0 8010A540 3C0E8016 */  lui   $t6, %hi(gSaveContext+4) # $t6, 0x8016
/* B816E4 8010A544 95A363CE */  lhu   $v1, 0x63ce($t5)
/* B816E8 8010A548 03C36021 */  addu  $t4, $fp, $v1
/* B816EC 8010A54C 25827FFF */  addiu $v0, $t4, 0x7fff
/* B816F0 8010A550 90425C89 */  lbu   $v0, 0x5c89($v0)
/* B816F4 8010A554 304200FF */  andi  $v0, $v0, 0xff
/* B816F8 8010A558 54410061 */  bnel  $v0, $at, .L8010A6E0
/* B816FC 8010A55C 2C410007 */   sltiu $at, $v0, 7
/* B81700 8010A560 8DCEE664 */  lw    $t6, %lo(gSaveContext+4)($t6)
/* B81704 8010A564 24010005 */  li    $at, 5
/* B81708 8010A568 24020011 */  li    $v0, 17
/* B8170C 8010A56C 11C00003 */  beqz  $t6, .L8010A57C
/* B81710 8010A570 3C048015 */   lui   $a0, %hi(D_80154154) # $a0, 0x8015
/* B81714 8010A574 10000001 */  b     .L8010A57C
/* B81718 8010A578 24020005 */   li    $v0, 5
.L8010A57C:
/* B8171C 8010A57C 14410004 */  bne   $v0, $at, .L8010A590
/* B81720 8010A580 24844154 */   addiu $a0, %lo(D_80154154) # addiu $a0, $a0, 0x4154
/* B81724 8010A584 3210007F */  andi  $s0, $s0, 0x7f
/* B81728 8010A588 1000001A */  b     .L8010A5F4
/* B8172C 8010A58C 3210FFFF */   andi  $s0, $s0, 0xffff
.L8010A590:
/* B81730 8010A590 0003C040 */  sll   $t8, $v1, 1
/* B81734 8010A594 03D87821 */  addu  $t7, $fp, $t8
/* B81738 8010A598 25E97FFF */  addiu $t1, $t7, 0x7fff
/* B8173C 8010A59C 95295C89 */  lhu   $t1, 0x5c89($t1)
/* B81740 8010A5A0 3C01FF00 */  lui   $at, 0xff00
/* B81744 8010A5A4 3C058016 */  lui   $a1, %hi(gSaveContext+0xeb8)
/* B81748 8010A5A8 0121C824 */  and   $t9, $t1, $at
/* B8174C 8010A5AC 00195080 */  sll   $t2, $t9, 2
/* B81750 8010A5B0 00AA2821 */  addu  $a1, $a1, $t2
/* B81754 8010A5B4 0C00084C */  jal   osSyncPrintf
/* B81758 8010A5B8 8CA5F518 */   lw    $a1, %lo(gSaveContext+0xeb8)($a1)
/* B8175C 8010A5BC 8FAB0054 */  lw    $t3, 0x54($sp)
/* B81760 8010A5C0 3C108016 */  lui   $s0, %hi(gSaveContext+0xeb8)
/* B81764 8010A5C4 3C01FF00 */  lui   $at, 0xff00
/* B81768 8010A5C8 956D63CE */  lhu   $t5, 0x63ce($t3)
/* B8176C 8010A5CC 03CD6021 */  addu  $t4, $fp, $t5
/* B81770 8010A5D0 258E7FFF */  addiu $t6, $t4, 0x7fff
/* B81774 8010A5D4 91CE5C89 */  lbu   $t6, 0x5c89($t6)
/* B81778 8010A5D8 000EC080 */  sll   $t8, $t6, 2
/* B8177C 8010A5DC 02188021 */  addu  $s0, $s0, $t8
/* B81780 8010A5E0 8E10F518 */  lw    $s0, %lo(gSaveContext+0xeb8)($s0)
/* B81784 8010A5E4 02018024 */  and   $s0, $s0, $at
/* B81788 8010A5E8 00108602 */  srl   $s0, $s0, 0x18
/* B8178C 8010A5EC 3210007F */  andi  $s0, $s0, 0x7f
/* B81790 8010A5F0 3210FFFF */  andi  $s0, $s0, 0xffff
.L8010A5F4:
/* B81794 8010A5F4 44902000 */  mtc1  $s0, $f4
/* B81798 8010A5F8 3C048015 */  lui   $a0, %hi(D_8015419C) # $a0, 0x8015
/* B8179C 8010A5FC 06010005 */  bgez  $s0, .L8010A614
/* B817A0 8010A600 46802020 */   cvt.s.w $f0, $f4
/* B817A4 8010A604 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* B817A8 8010A608 44813000 */  mtc1  $at, $f6
/* B817AC 8010A60C 00000000 */  nop   
/* B817B0 8010A610 46060000 */  add.s $f0, $f0, $f6
.L8010A614:
/* B817B4 8010A614 46000202 */  mul.s $f8, $f0, $f0
/* B817B8 8010A618 3C018015 */  lui   $at, %hi(D_80154BC8)
/* B817BC 8010A61C C42A4BC8 */  lwc1  $f10, %lo(D_80154BC8)($at)
/* B817C0 8010A620 3C013F00 */  li    $at, 0x3F000000 # 0.000000
/* B817C4 8010A624 44819000 */  mtc1  $at, $f18
/* B817C8 8010A628 24100001 */  li    $s0, 1
/* B817CC 8010A62C 3C014F00 */  li    $at, 0x4F000000 # 0.000000
/* B817D0 8010A630 460A4402 */  mul.s $f16, $f8, $f10
/* B817D4 8010A634 2484419C */  addiu $a0, %lo(D_8015419C) # addiu $a0, $a0, 0x419c
/* B817D8 8010A638 46128100 */  add.s $f4, $f16, $f18
/* B817DC 8010A63C 444FF800 */  cfc1  $t7, $31
/* B817E0 8010A640 44D0F800 */  ctc1  $s0, $31
/* B817E4 8010A644 00000000 */  nop   
/* B817E8 8010A648 460021A4 */  cvt.w.s $f6, $f4
/* B817EC 8010A64C 4450F800 */  cfc1  $s0, $31
/* B817F0 8010A650 00000000 */  nop   
/* B817F4 8010A654 32100078 */  andi  $s0, $s0, 0x78
/* B817F8 8010A658 52000013 */  beql  $s0, $zero, .L8010A6A8
/* B817FC 8010A65C 44103000 */   mfc1  $s0, $f6
/* B81800 8010A660 44813000 */  mtc1  $at, $f6
/* B81804 8010A664 24100001 */  li    $s0, 1
/* B81808 8010A668 46062181 */  sub.s $f6, $f4, $f6
/* B8180C 8010A66C 44D0F800 */  ctc1  $s0, $31
/* B81810 8010A670 00000000 */  nop   
/* B81814 8010A674 460031A4 */  cvt.w.s $f6, $f6
/* B81818 8010A678 4450F800 */  cfc1  $s0, $31
/* B8181C 8010A67C 00000000 */  nop   
/* B81820 8010A680 32100078 */  andi  $s0, $s0, 0x78
/* B81824 8010A684 16000005 */  bnez  $s0, .L8010A69C
/* B81828 8010A688 00000000 */   nop   
/* B8182C 8010A68C 44103000 */  mfc1  $s0, $f6
/* B81830 8010A690 3C018000 */  lui   $at, 0x8000
/* B81834 8010A694 10000007 */  b     .L8010A6B4
/* B81838 8010A698 02018025 */   or    $s0, $s0, $at
.L8010A69C:
/* B8183C 8010A69C 10000005 */  b     .L8010A6B4
/* B81840 8010A6A0 2410FFFF */   li    $s0, -1
/* B81844 8010A6A4 44103000 */  mfc1  $s0, $f6
.L8010A6A8:
/* B81848 8010A6A8 00000000 */  nop   
/* B8184C 8010A6AC 0600FFFB */  bltz  $s0, .L8010A69C
/* B81850 8010A6B0 00000000 */   nop   
.L8010A6B4:
/* B81854 8010A6B4 44CFF800 */  ctc1  $t7, $31
/* B81858 8010A6B8 3210FFFF */  andi  $s0, $s0, 0xffff
/* B8185C 8010A6BC 0C00084C */  jal   osSyncPrintf
/* B81860 8010A6C0 02002825 */   move  $a1, $s0
/* B81864 8010A6C4 8FA90054 */  lw    $t1, 0x54($sp)
/* B81868 8010A6C8 953963CE */  lhu   $t9, 0x63ce($t1)
/* B8186C 8010A6CC 03D95021 */  addu  $t2, $fp, $t9
/* B81870 8010A6D0 25427FFF */  addiu $v0, $t2, 0x7fff
/* B81874 8010A6D4 90425C89 */  lbu   $v0, 0x5c89($v0)
/* B81878 8010A6D8 304200FF */  andi  $v0, $v0, 0xff
/* B8187C 8010A6DC 2C410007 */  sltiu $at, $v0, 7
.L8010A6E0:
/* B81880 8010A6E0 10200262 */  beqz  $at, .L8010B06C
/* B81884 8010A6E4 00025880 */   sll   $t3, $v0, 2
/* B81888 8010A6E8 3C018015 */  lui   $at, %hi(jtbl_80154BCC)
/* B8188C 8010A6EC 002B0821 */  addu  $at, $at, $t3
/* B81890 8010A6F0 8C2B4BCC */  lw    $t3, %lo(jtbl_80154BCC)($at)
/* B81894 8010A6F4 01600008 */  jr    $t3
/* B81898 8010A6F8 00000000 */   nop   
glabel L8010A6FC
/* B8189C 8010A6FC 00101400 */  sll   $v0, $s0, 0x10
/* B818A0 8010A700 00002400 */  sll   $a0, $zero, 0x10
/* B818A4 8010A704 00021403 */  sra   $v0, $v0, 0x10
/* B818A8 8010A708 00042403 */  sra   $a0, $a0, 0x10
/* B818AC 8010A70C 00001C00 */  sll   $v1, $zero, 0x10
/* B818B0 8010A710 284103E8 */  slti  $at, $v0, 0x3e8
/* B818B4 8010A714 00031C03 */  sra   $v1, $v1, 0x10
/* B818B8 8010A718 00002825 */  move  $a1, $zero
/* B818BC 8010A71C A7A4007C */  sh    $a0, 0x7c($sp)
/* B818C0 8010A720 00009825 */  move  $s3, $zero
/* B818C4 8010A724 1420000A */  bnez  $at, .L8010A750
/* B818C8 8010A728 00008825 */   move  $s1, $zero
.L8010A72C:
/* B818CC 8010A72C 2442FC18 */  addiu $v0, $v0, -0x3e8
/* B818D0 8010A730 00021400 */  sll   $v0, $v0, 0x10
/* B818D4 8010A734 24840001 */  addiu $a0, $a0, 1
/* B818D8 8010A738 00021403 */  sra   $v0, $v0, 0x10
/* B818DC 8010A73C 284103E8 */  slti  $at, $v0, 0x3e8
/* B818E0 8010A740 00042400 */  sll   $a0, $a0, 0x10
/* B818E4 8010A744 1020FFF9 */  beqz  $at, .L8010A72C
/* B818E8 8010A748 00042403 */   sra   $a0, $a0, 0x10
/* B818EC 8010A74C A7A4007C */  sh    $a0, 0x7c($sp)
.L8010A750:
/* B818F0 8010A750 28410064 */  slti  $at, $v0, 0x64
/* B818F4 8010A754 1420000A */  bnez  $at, .L8010A780
/* B818F8 8010A758 A7A3007E */   sh    $v1, 0x7e($sp)
.L8010A75C:
/* B818FC 8010A75C 2442FF9C */  addiu $v0, $v0, -0x64
/* B81900 8010A760 00021400 */  sll   $v0, $v0, 0x10
/* B81904 8010A764 24630001 */  addiu $v1, $v1, 1
/* B81908 8010A768 00021403 */  sra   $v0, $v0, 0x10
/* B8190C 8010A76C 28410064 */  slti  $at, $v0, 0x64
/* B81910 8010A770 00031C00 */  sll   $v1, $v1, 0x10
/* B81914 8010A774 1020FFF9 */  beqz  $at, .L8010A75C
/* B81918 8010A778 00031C03 */   sra   $v1, $v1, 0x10
/* B8191C 8010A77C A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A780:
/* B81920 8010A780 2841000A */  slti  $at, $v0, 0xa
/* B81924 8010A784 A7A20082 */  sh    $v0, 0x82($sp)
/* B81928 8010A788 1420000B */  bnez  $at, .L8010A7B8
/* B8192C 8010A78C A7A50080 */   sh    $a1, 0x80($sp)
.L8010A790:
/* B81930 8010A790 2442FFF6 */  addiu $v0, $v0, -0xa
/* B81934 8010A794 00021400 */  sll   $v0, $v0, 0x10
/* B81938 8010A798 24A50001 */  addiu $a1, $a1, 1
/* B8193C 8010A79C 00021403 */  sra   $v0, $v0, 0x10
/* B81940 8010A7A0 2841000A */  slti  $at, $v0, 0xa
/* B81944 8010A7A4 00052C00 */  sll   $a1, $a1, 0x10
/* B81948 8010A7A8 1020FFF9 */  beqz  $at, .L8010A790
/* B8194C 8010A7AC 00052C03 */   sra   $a1, $a1, 0x10
/* B81950 8010A7B0 A7A50080 */  sh    $a1, 0x80($sp)
/* B81954 8010A7B4 A7A20082 */  sh    $v0, 0x82($sp)
.L8010A7B8:
/* B81958 8010A7B8 24010003 */  li    $at, 3
.L8010A7BC:
/* B8195C 8010A7BC 12610005 */  beq   $s3, $at, .L8010A7D4
/* B81960 8010A7C0 00136840 */   sll   $t5, $s3, 1
/* B81964 8010A7C4 03AD6021 */  addu  $t4, $sp, $t5
/* B81968 8010A7C8 858C007C */  lh    $t4, 0x7c($t4)
/* B8196C 8010A7CC 11800002 */  beqz  $t4, .L8010A7D8
/* B81970 8010A7D0 00000000 */   nop   
.L8010A7D4:
/* B81974 8010A7D4 24110001 */  li    $s1, 1
.L8010A7D8:
/* B81978 8010A7D8 12200013 */  beqz  $s1, .L8010A828
/* B8197C 8010A7DC 03C02025 */   move  $a0, $fp
/* B81980 8010A7E0 00137040 */  sll   $t6, $s3, 1
/* B81984 8010A7E4 27B8007C */  addiu $t8, $sp, 0x7c
/* B81988 8010A7E8 01D88021 */  addu  $s0, $t6, $t8
/* B8198C 8010A7EC 86050000 */  lh    $a1, ($s0)
/* B81990 8010A7F0 02F69021 */  addu  $s2, $s7, $s6
/* B81994 8010A7F4 34018000 */  li    $at, 32768
/* B81998 8010A7F8 24A50010 */  addiu $a1, $a1, 0x10
/* B8199C 8010A7FC 30A500FF */  andi  $a1, $a1, 0xff
/* B819A0 8010A800 02419021 */  addu  $s2, $s2, $at
/* B819A4 8010A804 0C01BB98 */  jal   func_8006EE60
/* B819A8 8010A808 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B819AC 8010A80C 860F0000 */  lh    $t7, ($s0)
/* B819B0 8010A810 26D60001 */  addiu $s6, $s6, 1
/* B819B4 8010A814 0016B400 */  sll   $s6, $s6, 0x10
/* B819B8 8010A818 25E90030 */  addiu $t1, $t7, 0x30
/* B819BC 8010A81C A2496306 */  sb    $t1, 0x6306($s2)
/* B819C0 8010A820 26B50080 */  addiu $s5, $s5, 0x80
/* B819C4 8010A824 0016B403 */  sra   $s6, $s6, 0x10
.L8010A828:
/* B819C8 8010A828 26730001 */  addiu $s3, $s3, 1
/* B819CC 8010A82C 00139C00 */  sll   $s3, $s3, 0x10
/* B819D0 8010A830 00139C03 */  sra   $s3, $s3, 0x10
/* B819D4 8010A834 2A610004 */  slti  $at, $s3, 4
/* B819D8 8010A838 5420FFE0 */  bnezl $at, .L8010A7BC
/* B819DC 8010A83C 24010003 */   li    $at, 3
/* B819E0 8010A840 26D6FFFF */  addiu $s6, $s6, -1
/* B819E4 8010A844 0016B400 */  sll   $s6, $s6, 0x10
/* B819E8 8010A848 10000208 */  b     .L8010B06C
/* B819EC 8010A84C 0016B403 */   sra   $s6, $s6, 0x10
glabel L8010A850
/* B819F0 8010A850 00101400 */  sll   $v0, $s0, 0x10
/* B819F4 8010A854 00001C00 */  sll   $v1, $zero, 0x10
/* B819F8 8010A858 00002400 */  sll   $a0, $zero, 0x10
/* B819FC 8010A85C 00021403 */  sra   $v0, $v0, 0x10
/* B81A00 8010A860 00042403 */  sra   $a0, $a0, 0x10
/* B81A04 8010A864 00031C03 */  sra   $v1, $v1, 0x10
/* B81A08 8010A868 2841003C */  slti  $at, $v0, 0x3c
/* B81A0C 8010A86C 00002825 */  move  $a1, $zero
/* B81A10 8010A870 A7A3007E */  sh    $v1, 0x7e($sp)
/* B81A14 8010A874 A7A4007C */  sh    $a0, 0x7c($sp)
/* B81A18 8010A878 14200014 */  bnez  $at, .L8010A8CC
/* B81A1C 8010A87C 00009825 */   move  $s3, $zero
/* B81A20 8010A880 24630001 */  addiu $v1, $v1, 1
.L8010A884:
/* B81A24 8010A884 00031C00 */  sll   $v1, $v1, 0x10
/* B81A28 8010A888 00031C03 */  sra   $v1, $v1, 0x10
/* B81A2C 8010A88C 2861000A */  slti  $at, $v1, 0xa
/* B81A30 8010A890 14200007 */  bnez  $at, .L8010A8B0
/* B81A34 8010A894 2442FFC4 */   addiu $v0, $v0, -0x3c
/* B81A38 8010A898 24840001 */  addiu $a0, $a0, 1
/* B81A3C 8010A89C 2463FFF6 */  addiu $v1, $v1, -0xa
/* B81A40 8010A8A0 00042400 */  sll   $a0, $a0, 0x10
/* B81A44 8010A8A4 00031C00 */  sll   $v1, $v1, 0x10
/* B81A48 8010A8A8 00042403 */  sra   $a0, $a0, 0x10
/* B81A4C 8010A8AC 00031C03 */  sra   $v1, $v1, 0x10
.L8010A8B0:
/* B81A50 8010A8B0 00021400 */  sll   $v0, $v0, 0x10
/* B81A54 8010A8B4 00021403 */  sra   $v0, $v0, 0x10
/* B81A58 8010A8B8 2841003C */  slti  $at, $v0, 0x3c
/* B81A5C 8010A8BC 5020FFF1 */  beql  $at, $zero, .L8010A884
/* B81A60 8010A8C0 24630001 */   addiu $v1, $v1, 1
/* B81A64 8010A8C4 A7A4007C */  sh    $a0, 0x7c($sp)
/* B81A68 8010A8C8 A7A3007E */  sh    $v1, 0x7e($sp)
.L8010A8CC:
/* B81A6C 8010A8CC 2841000A */  slti  $at, $v0, 0xa
/* B81A70 8010A8D0 A7A20082 */  sh    $v0, 0x82($sp)
/* B81A74 8010A8D4 1420000B */  bnez  $at, .L8010A904
/* B81A78 8010A8D8 A7A50080 */   sh    $a1, 0x80($sp)
.L8010A8DC:
/* B81A7C 8010A8DC 2442FFF6 */  addiu $v0, $v0, -0xa
/* B81A80 8010A8E0 00021400 */  sll   $v0, $v0, 0x10
/* B81A84 8010A8E4 24A50001 */  addiu $a1, $a1, 1
/* B81A88 8010A8E8 00021403 */  sra   $v0, $v0, 0x10
/* B81A8C 8010A8EC 2841000A */  slti  $at, $v0, 0xa
/* B81A90 8010A8F0 00052C00 */  sll   $a1, $a1, 0x10
/* B81A94 8010A8F4 1020FFF9 */  beqz  $at, .L8010A8DC
/* B81A98 8010A8F8 00052C03 */   sra   $a1, $a1, 0x10
/* B81A9C 8010A8FC A7A50080 */  sh    $a1, 0x80($sp)
/* B81AA0 8010A900 A7A20082 */  sh    $v0, 0x82($sp)
.L8010A904:
/* B81AA4 8010A904 0013C840 */  sll   $t9, $s3, 1
.L8010A908:
/* B81AA8 8010A908 27AA007C */  addiu $t2, $sp, 0x7c
/* B81AAC 8010A90C 032A8021 */  addu  $s0, $t9, $t2
/* B81AB0 8010A910 86050000 */  lh    $a1, ($s0)
/* B81AB4 8010A914 02F69021 */  addu  $s2, $s7, $s6
/* B81AB8 8010A918 34018000 */  li    $at, 32768
/* B81ABC 8010A91C 24A50010 */  addiu $a1, $a1, 0x10
/* B81AC0 8010A920 30A500FF */  andi  $a1, $a1, 0xff
/* B81AC4 8010A924 02419021 */  addu  $s2, $s2, $at
/* B81AC8 8010A928 03C02025 */  move  $a0, $fp
/* B81ACC 8010A92C 0C01BB98 */  jal   func_8006EE60
/* B81AD0 8010A930 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81AD4 8010A934 860B0000 */  lh    $t3, ($s0)
/* B81AD8 8010A938 26D60001 */  addiu $s6, $s6, 1
/* B81ADC 8010A93C 0016B400 */  sll   $s6, $s6, 0x10
/* B81AE0 8010A940 24010001 */  li    $at, 1
/* B81AE4 8010A944 256D0030 */  addiu $t5, $t3, 0x30
/* B81AE8 8010A948 26B50080 */  addiu $s5, $s5, 0x80
/* B81AEC 8010A94C A24D6306 */  sb    $t5, 0x6306($s2)
/* B81AF0 8010A950 1661000E */  bne   $s3, $at, .L8010A98C
/* B81AF4 8010A954 0016B403 */   sra   $s6, $s6, 0x10
/* B81AF8 8010A958 03C02025 */  move  $a0, $fp
/* B81AFC 8010A95C 24050002 */  li    $a1, 2
/* B81B00 8010A960 0C01BB98 */  jal   func_8006EE60
/* B81B04 8010A964 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81B08 8010A968 02F67021 */  addu  $t6, $s7, $s6
/* B81B0C 8010A96C 26D60001 */  addiu $s6, $s6, 1
/* B81B10 8010A970 25C17FFF */  addiu $at, $t6, 0x7fff
/* B81B14 8010A974 240C0022 */  li    $t4, 34
/* B81B18 8010A978 0016B400 */  sll   $s6, $s6, 0x10
/* B81B1C 8010A97C 26B50080 */  addiu $s5, $s5, 0x80
/* B81B20 8010A980 A02C6307 */  sb    $t4, 0x6307($at)
/* B81B24 8010A984 1000000C */  b     .L8010A9B8
/* B81B28 8010A988 0016B403 */   sra   $s6, $s6, 0x10
.L8010A98C:
/* B81B2C 8010A98C 24010003 */  li    $at, 3
/* B81B30 8010A990 16610009 */  bne   $s3, $at, .L8010A9B8
/* B81B34 8010A994 03C02025 */   move  $a0, $fp
/* B81B38 8010A998 24050002 */  li    $a1, 2
/* B81B3C 8010A99C 0C01BB98 */  jal   func_8006EE60
/* B81B40 8010A9A0 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81B44 8010A9A4 02F67821 */  addu  $t7, $s7, $s6
/* B81B48 8010A9A8 25E17FFF */  addiu $at, $t7, 0x7fff
/* B81B4C 8010A9AC 24180022 */  li    $t8, 34
/* B81B50 8010A9B0 26B50080 */  addiu $s5, $s5, 0x80
/* B81B54 8010A9B4 A0386307 */  sb    $t8, 0x6307($at)
.L8010A9B8:
/* B81B58 8010A9B8 26730001 */  addiu $s3, $s3, 1
/* B81B5C 8010A9BC 00139C00 */  sll   $s3, $s3, 0x10
/* B81B60 8010A9C0 00139C03 */  sra   $s3, $s3, 0x10
/* B81B64 8010A9C4 2A610004 */  slti  $at, $s3, 4
/* B81B68 8010A9C8 5420FFCF */  bnezl $at, .L8010A908
/* B81B6C 8010A9CC 0013C840 */   sll   $t9, $s3, 1
/* B81B70 8010A9D0 100001A7 */  b     .L8010B070
/* B81B74 8010A9D4 8FB90054 */   lw    $t9, 0x54($sp)
.L8010A9D8:
/* B81B78 8010A9D8 2401001F */  li    $at, 31
/* B81B7C 8010A9DC 1601006B */  bne   $s0, $at, .L8010AB8C
/* B81B80 8010A9E0 3C048015 */   lui   $a0, %hi(D_801541A8) # $a0, 0x8015
/* B81B84 8010A9E4 248441A8 */  addiu $a0, %lo(D_801541A8) # addiu $a0, $a0, 0x41a8
/* B81B88 8010A9E8 0C00084C */  jal   osSyncPrintf
/* B81B8C 8010A9EC 00009825 */   move  $s3, $zero
/* B81B90 8010A9F0 3C098016 */  lui   $t1, %hi(gSaveContext+0xc)
/* B81B94 8010A9F4 9529E66C */  lhu   $t1, %lo(gSaveContext+0xc)($t1)
/* B81B98 8010A9F8 00002025 */  move  $a0, $zero
/* B81B9C 8010A9FC 3C014F80 */  li    $at, 0x4F800000 # 0.000000
/* B81BA0 8010AA00 44894000 */  mtc1  $t1, $f8
/* B81BA4 8010AA04 05210004 */  bgez  $t1, .L8010AA18
/* B81BA8 8010AA08 468042A0 */   cvt.s.w $f10, $f8
/* B81BAC 8010AA0C 44818000 */  mtc1  $at, $f16
/* B81BB0 8010AA10 00000000 */  nop   
/* B81BB4 8010AA14 46105280 */  add.s $f10, $f10, $f16
.L8010AA18:
/* B81BB8 8010AA18 3C013CB4 */  li    $at, 0x3CB40000 # 0.000000
/* B81BBC 8010AA1C 44819000 */  mtc1  $at, $f18
/* B81BC0 8010AA20 3C014270 */  li    $at, 0x42700000 # 0.000000
/* B81BC4 8010AA24 44812000 */  mtc1  $at, $f4
/* B81BC8 8010AA28 46125002 */  mul.s $f0, $f10, $f18
/* B81BCC 8010AA2C A7A4007C */  sh    $a0, 0x7c($sp)
/* B81BD0 8010AA30 46040183 */  div.s $f6, $f0, $f4
/* B81BD4 8010AA34 4600040D */  trunc.w.s $f16, $f0
/* B81BD8 8010AA38 44028000 */  mfc1  $v0, $f16
/* B81BDC 8010AA3C 00000000 */  nop   
/* B81BE0 8010AA40 00021400 */  sll   $v0, $v0, 0x10
/* B81BE4 8010AA44 00021403 */  sra   $v0, $v0, 0x10
/* B81BE8 8010AA48 4600320D */  trunc.w.s $f8, $f6
/* B81BEC 8010AA4C 44034000 */  mfc1  $v1, $f8
/* B81BF0 8010AA50 00000000 */  nop   
/* B81BF4 8010AA54 00031C00 */  sll   $v1, $v1, 0x10
/* B81BF8 8010AA58 00031C03 */  sra   $v1, $v1, 0x10
/* B81BFC 8010AA5C 2861000A */  slti  $at, $v1, 0xa
/* B81C00 8010AA60 1420000B */  bnez  $at, .L8010AA90
/* B81C04 8010AA64 A7A3007E */   sh    $v1, 0x7e($sp)
.L8010AA68:
/* B81C08 8010AA68 2463FFF6 */  addiu $v1, $v1, -0xa
/* B81C0C 8010AA6C 00031C00 */  sll   $v1, $v1, 0x10
/* B81C10 8010AA70 24840001 */  addiu $a0, $a0, 1
/* B81C14 8010AA74 00031C03 */  sra   $v1, $v1, 0x10
/* B81C18 8010AA78 2861000A */  slti  $at, $v1, 0xa
/* B81C1C 8010AA7C 00042400 */  sll   $a0, $a0, 0x10
/* B81C20 8010AA80 1020FFF9 */  beqz  $at, .L8010AA68
/* B81C24 8010AA84 00042403 */   sra   $a0, $a0, 0x10
/* B81C28 8010AA88 A7A4007C */  sh    $a0, 0x7c($sp)
/* B81C2C 8010AA8C A7A3007E */  sh    $v1, 0x7e($sp)
.L8010AA90:
/* B81C30 8010AA90 2401003C */  li    $at, 60
/* B81C34 8010AA94 0041001A */  div   $zero, $v0, $at
/* B81C38 8010AA98 00001010 */  mfhi  $v0
/* B81C3C 8010AA9C 00021400 */  sll   $v0, $v0, 0x10
/* B81C40 8010AAA0 00021403 */  sra   $v0, $v0, 0x10
/* B81C44 8010AAA4 2841000A */  slti  $at, $v0, 0xa
/* B81C48 8010AAA8 00002825 */  move  $a1, $zero
/* B81C4C 8010AAAC A7A20082 */  sh    $v0, 0x82($sp)
/* B81C50 8010AAB0 1420000B */  bnez  $at, .L8010AAE0
/* B81C54 8010AAB4 A7A00080 */   sh    $zero, 0x80($sp)
.L8010AAB8:
/* B81C58 8010AAB8 2442FFF6 */  addiu $v0, $v0, -0xa
/* B81C5C 8010AABC 00021400 */  sll   $v0, $v0, 0x10
/* B81C60 8010AAC0 24A50001 */  addiu $a1, $a1, 1
/* B81C64 8010AAC4 00021403 */  sra   $v0, $v0, 0x10
/* B81C68 8010AAC8 2841000A */  slti  $at, $v0, 0xa
/* B81C6C 8010AACC 00052C00 */  sll   $a1, $a1, 0x10
/* B81C70 8010AAD0 1020FFF9 */  beqz  $at, .L8010AAB8
/* B81C74 8010AAD4 00052C03 */   sra   $a1, $a1, 0x10
/* B81C78 8010AAD8 A7A50080 */  sh    $a1, 0x80($sp)
/* B81C7C 8010AADC A7A20082 */  sh    $v0, 0x82($sp)
.L8010AAE0:
/* B81C80 8010AAE0 00135840 */  sll   $t3, $s3, 1
.L8010AAE4:
/* B81C84 8010AAE4 27AD007C */  addiu $t5, $sp, 0x7c
/* B81C88 8010AAE8 016D8021 */  addu  $s0, $t3, $t5
/* B81C8C 8010AAEC 86050000 */  lh    $a1, ($s0)
/* B81C90 8010AAF0 02F69021 */  addu  $s2, $s7, $s6
/* B81C94 8010AAF4 34018000 */  li    $at, 32768
/* B81C98 8010AAF8 24A50010 */  addiu $a1, $a1, 0x10
/* B81C9C 8010AAFC 30A500FF */  andi  $a1, $a1, 0xff
/* B81CA0 8010AB00 02419021 */  addu  $s2, $s2, $at
/* B81CA4 8010AB04 03C02025 */  move  $a0, $fp
/* B81CA8 8010AB08 0C01BB98 */  jal   func_8006EE60
/* B81CAC 8010AB0C 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81CB0 8010AB10 860C0000 */  lh    $t4, ($s0)
/* B81CB4 8010AB14 26D60001 */  addiu $s6, $s6, 1
/* B81CB8 8010AB18 0016B400 */  sll   $s6, $s6, 0x10
/* B81CBC 8010AB1C 24010001 */  li    $at, 1
/* B81CC0 8010AB20 258E0030 */  addiu $t6, $t4, 0x30
/* B81CC4 8010AB24 26B50080 */  addiu $s5, $s5, 0x80
/* B81CC8 8010AB28 A24E6306 */  sb    $t6, 0x6306($s2)
/* B81CCC 8010AB2C 1661000D */  bne   $s3, $at, .L8010AB64
/* B81CD0 8010AB30 0016B403 */   sra   $s6, $s6, 0x10
/* B81CD4 8010AB34 03C02025 */  move  $a0, $fp
/* B81CD8 8010AB38 2405001A */  li    $a1, 26
/* B81CDC 8010AB3C 0C01BB98 */  jal   func_8006EE60
/* B81CE0 8010AB40 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B81CE4 8010AB44 02F67821 */  addu  $t7, $s7, $s6
/* B81CE8 8010AB48 26D60001 */  addiu $s6, $s6, 1
/* B81CEC 8010AB4C 25E17FFF */  addiu $at, $t7, 0x7fff
/* B81CF0 8010AB50 2418003A */  li    $t8, 58
/* B81CF4 8010AB54 0016B400 */  sll   $s6, $s6, 0x10
/* B81CF8 8010AB58 26B50080 */  addiu $s5, $s5, 0x80
/* B81CFC 8010AB5C A0386307 */  sb    $t8, 0x6307($at)
/* B81D00 8010AB60 0016B403 */  sra   $s6, $s6, 0x10
.L8010AB64:
/* B81D04 8010AB64 26730001 */  addiu $s3, $s3, 1
/* B81D08 8010AB68 00139C00 */  sll   $s3, $s3, 0x10
/* B81D0C 8010AB6C 00139C03 */  sra   $s3, $s3, 0x10
/* B81D10 8010AB70 2A610004 */  slti  $at, $s3, 4
/* B81D14 8010AB74 5420FFDB */  bnezl $at, .L8010AAE4
/* B81D18 8010AB78 00135840 */   sll   $t3, $s3, 1
/* B81D1C 8010AB7C 26D6FFFF */  addiu $s6, $s6, -1
/* B81D20 8010AB80 0016B400 */  sll   $s6, $s6, 0x10
/* B81D24 8010AB84 10000139 */  b     .L8010B06C
/* B81D28 8010AB88 0016B403 */   sra   $s6, $s6, 0x10
.L8010AB8C:
/* B81D2C 8010AB8C 24010013 */  li    $at, 19
/* B81D30 8010AB90 16010026 */  bne   $s0, $at, .L8010AC2C
/* B81D34 8010AB94 8FA30054 */   lw    $v1, 0x54($sp)
/* B81D38 8010AB98 946963CE */  lhu   $t1, 0x63ce($v1)
/* B81D3C 8010AB9C 26C20001 */  addiu $v0, $s6, 1
/* B81D40 8010ABA0 00023C00 */  sll   $a3, $v0, 0x10
/* B81D44 8010ABA4 03C9C821 */  addu  $t9, $fp, $t1
/* B81D48 8010ABA8 272A7FFF */  addiu $t2, $t9, 0x7fff
/* B81D4C 8010ABAC 914A5C8A */  lbu   $t2, 0x5c8a($t2)
/* B81D50 8010ABB0 00073C03 */  sra   $a3, $a3, 0x10
/* B81D54 8010ABB4 02E75821 */  addu  $t3, $s7, $a3
/* B81D58 8010ABB8 25617FFF */  addiu $at, $t3, 0x7fff
/* B81D5C 8010ABBC A02A6307 */  sb    $t2, 0x6307($at)
/* B81D60 8010ABC0 946C63CE */  lhu   $t4, 0x63ce($v1)
/* B81D64 8010ABC4 0002B400 */  sll   $s6, $v0, 0x10
/* B81D68 8010ABC8 0016B403 */  sra   $s6, $s6, 0x10
/* B81D6C 8010ABCC 02F66821 */  addu  $t5, $s7, $s6
/* B81D70 8010ABD0 03CC7021 */  addu  $t6, $fp, $t4
/* B81D74 8010ABD4 25C67FFF */  addiu $a2, $t6, 0x7fff
/* B81D78 8010ABD8 25A57FFF */  addiu $a1, $t5, 0x7fff
/* B81D7C 8010ABDC 3C048015 */  lui   $a0, %hi(D_801541B8) # $a0, 0x8015
/* B81D80 8010ABE0 248441B8 */  addiu $a0, %lo(D_801541B8) # addiu $a0, $a0, 0x41b8
/* B81D84 8010ABE4 90A56307 */  lbu   $a1, 0x6307($a1)
/* B81D88 8010ABE8 0C00084C */  jal   osSyncPrintf
/* B81D8C 8010ABEC 90C65C8A */   lbu   $a2, 0x5c8a($a2)
/* B81D90 8010ABF0 3C198016 */  lui   $t9, %hi(gGameInfo) # $t9, 0x8016
/* B81D94 8010ABF4 8F39FA90 */  lw    $t9, %lo(gGameInfo)($t9)
/* B81D98 8010ABF8 8FB80054 */  lw    $t8, 0x54($sp)
/* B81D9C 8010ABFC 8FA40098 */  lw    $a0, 0x98($sp)
/* B81DA0 8010AC00 87260F16 */  lh    $a2, 0xf16($t9)
/* B81DA4 8010AC04 970F63CE */  lhu   $t7, 0x63ce($t8)
/* B81DA8 8010AC08 24C6000A */  addiu $a2, $a2, 0xa
/* B81DAC 8010AC0C 03CF4821 */  addu  $t1, $fp, $t7
/* B81DB0 8010AC10 25257FFF */  addiu $a1, $t1, 0x7fff
/* B81DB4 8010AC14 00063400 */  sll   $a2, $a2, 0x10
/* B81DB8 8010AC18 00063403 */  sra   $a2, $a2, 0x10
/* B81DBC 8010AC1C 0C04265A */  jal   func_80109968
/* B81DC0 8010AC20 90A55C8A */   lbu   $a1, 0x5c8a($a1)
/* B81DC4 8010AC24 10000112 */  b     .L8010B070
/* B81DC8 8010AC28 8FB90054 */   lw    $t9, 0x54($sp)
.L8010AC2C:
/* B81DCC 8010AC2C 24010015 */  li    $at, 21
/* B81DD0 8010AC30 16010051 */  bne   $s0, $at, .L8010AD78
/* B81DD4 8010AC34 8FA20054 */   lw    $v0, 0x54($sp)
/* B81DD8 8010AC38 944A63CE */  lhu   $t2, 0x63ce($v0)
/* B81DDC 8010AC3C 26E17FFF */  addiu $at, $s7, 0x7fff
/* B81DE0 8010AC40 3C10008C */  lui   $s0, %hi(_message_texture_staticSegmentRomStart) # $s0, 0x8c
/* B81DE4 8010AC44 03CA5821 */  addu  $t3, $fp, $t2
/* B81DE8 8010AC48 256D7FFF */  addiu $t5, $t3, 0x7fff
/* B81DEC 8010AC4C 91AD5C8A */  lbu   $t5, 0x5c8a($t5)
/* B81DF0 8010AC50 2610F000 */  addiu $s0, %lo(_message_texture_staticSegmentRomStart) # addiu $s0, $s0, -0x1000
/* B81DF4 8010AC54 3C078015 */  lui   $a3, %hi(D_801541CC) # $a3, 0x8015
/* B81DF8 8010AC58 000D6040 */  sll   $t4, $t5, 1
/* B81DFC 8010AC5C A42C63F7 */  sh    $t4, 0x63f7($at)
/* B81E00 8010AC60 944E63CE */  lhu   $t6, 0x63ce($v0)
/* B81E04 8010AC64 24E741CC */  addiu $a3, %lo(D_801541CC) # addiu $a3, $a3, 0x41cc
/* B81E08 8010AC68 24060900 */  li    $a2, 2304
/* B81E0C 8010AC6C 03CEC021 */  addu  $t8, $fp, $t6
/* B81E10 8010AC70 270F7FFF */  addiu $t7, $t8, 0x7fff
/* B81E14 8010AC74 91EF5C8B */  lbu   $t7, 0x5c8b($t7)
/* B81E18 8010AC78 31E900F0 */  andi  $t1, $t7, 0xf0
/* B81E1C 8010AC7C 0009C903 */  sra   $t9, $t1, 4
/* B81E20 8010AC80 A03963F9 */  sb    $t9, 0x63f9($at)
/* B81E24 8010AC84 944A63CE */  lhu   $t2, 0x63ce($v0)
/* B81E28 8010AC88 03CA5821 */  addu  $t3, $fp, $t2
/* B81E2C 8010AC8C 256D7FFF */  addiu $t5, $t3, 0x7fff
/* B81E30 8010AC90 91AD5C8B */  lbu   $t5, 0x5c8b($t5)
/* B81E34 8010AC94 31AC000F */  andi  $t4, $t5, 0xf
/* B81E38 8010AC98 A02C63FA */  sb    $t4, 0x63fa($at)
/* B81E3C 8010AC9C 944E63CE */  lhu   $t6, 0x63ce($v0)
/* B81E40 8010ACA0 03CEC021 */  addu  $t8, $fp, $t6
/* B81E44 8010ACA4 270F7FFF */  addiu $t7, $t8, 0x7fff
/* B81E48 8010ACA8 91EF5C8C */  lbu   $t7, 0x5c8c($t7)
/* B81E4C 8010ACAC 31E900F0 */  andi  $t1, $t7, 0xf0
/* B81E50 8010ACB0 0009C903 */  sra   $t9, $t1, 4
/* B81E54 8010ACB4 A03963FB */  sb    $t9, 0x63fb($at)
/* B81E58 8010ACB8 944A63CE */  lhu   $t2, 0x63ce($v0)
/* B81E5C 8010ACBC 24090002 */  li    $t1, 2
/* B81E60 8010ACC0 240F0726 */  li    $t7, 1830
/* B81E64 8010ACC4 03CA5821 */  addu  $t3, $fp, $t2
/* B81E68 8010ACC8 256D7FFF */  addiu $t5, $t3, 0x7fff
/* B81E6C 8010ACCC 91AD5C8C */  lbu   $t5, 0x5c8c($t5)
/* B81E70 8010ACD0 31AC000F */  andi  $t4, $t5, 0xf
/* B81E74 8010ACD4 A02C63FC */  sb    $t4, 0x63fc($at)
/* B81E78 8010ACD8 944E63F6 */  lhu   $t6, 0x63f6($v0)
/* B81E7C 8010ACDC 8C4462B0 */  lw    $a0, 0x62b0($v0)
/* B81E80 8010ACE0 A7A90086 */  sh    $t1, 0x86($sp)
/* B81E84 8010ACE4 000EC0C0 */  sll   $t8, $t6, 3
/* B81E88 8010ACE8 030EC021 */  addu  $t8, $t8, $t6
/* B81E8C 8010ACEC 0018C200 */  sll   $t8, $t8, 8
/* B81E90 8010ACF0 02182821 */  addu  $a1, $s0, $t8
/* B81E94 8010ACF4 AFAF0010 */  sw    $t7, 0x10($sp)
/* B81E98 8010ACF8 0C0006A8 */  jal   DmaMgr_SendRequest1
/* B81E9C 8010ACFC 24841000 */   addiu $a0, $a0, 0x1000
/* B81EA0 8010AD00 8FA20054 */  lw    $v0, 0x54($sp)
/* B81EA4 8010AD04 3C078015 */  lui   $a3, %hi(D_801541E0) # $a3, 0x8015
/* B81EA8 8010AD08 240B072A */  li    $t3, 1834
/* B81EAC 8010AD0C 945963F6 */  lhu   $t9, 0x63f6($v0)
/* B81EB0 8010AD10 8C4462B0 */  lw    $a0, 0x62b0($v0)
/* B81EB4 8010AD14 AFAB0010 */  sw    $t3, 0x10($sp)
/* B81EB8 8010AD18 001950C0 */  sll   $t2, $t9, 3
/* B81EBC 8010AD1C 01595021 */  addu  $t2, $t2, $t9
/* B81EC0 8010AD20 000A5200 */  sll   $t2, $t2, 8
/* B81EC4 8010AD24 020A2821 */  addu  $a1, $s0, $t2
/* B81EC8 8010AD28 24A50900 */  addiu $a1, $a1, 0x900
/* B81ECC 8010AD2C 24E741E0 */  addiu $a3, %lo(D_801541E0) # addiu $a3, $a3, 0x41e0
/* B81ED0 8010AD30 24060900 */  li    $a2, 2304
/* B81ED4 8010AD34 0C0006A8 */  jal   DmaMgr_SendRequest1
/* B81ED8 8010AD38 24841900 */   addiu $a0, $a0, 0x1900
/* B81EDC 8010AD3C 8FAD0054 */  lw    $t5, 0x54($sp)
/* B81EE0 8010AD40 26E17FFF */  addiu $at, $s7, 0x7fff
/* B81EE4 8010AD44 3C028016 */  lui   $v0, %hi(gGameInfo) # $v0, 0x8016
/* B81EE8 8010AD48 95AC63CE */  lhu   $t4, 0x63ce($t5)
/* B81EEC 8010AD4C 3C198016 */  lui   $t9, %hi(gGameInfo) # $t9, 0x8016
/* B81EF0 8010AD50 24090032 */  li    $t1, 50
/* B81EF4 8010AD54 258E0003 */  addiu $t6, $t4, 3
/* B81EF8 8010AD58 A42E63CF */  sh    $t6, 0x63cf($at)
/* B81EFC 8010AD5C 8C42FA90 */  lw    $v0, %lo(gGameInfo)($v0)
/* B81F00 8010AD60 84580F16 */  lh    $t8, 0xf16($v0)
/* B81F04 8010AD64 270F0008 */  addiu $t7, $t8, 8
/* B81F08 8010AD68 A44F0B0E */  sh    $t7, 0xb0e($v0)
/* B81F0C 8010AD6C 8F39FA90 */  lw    $t9, %lo(gGameInfo)($t9)
/* B81F10 8010AD70 100000BE */  b     .L8010B06C
/* B81F14 8010AD74 A7290B00 */   sh    $t1, 0xb00($t9)
.L8010AD78:
/* B81F18 8010AD78 24010005 */  li    $at, 5
/* B81F1C 8010AD7C 16010012 */  bne   $s0, $at, .L8010ADC8
/* B81F20 8010AD80 26C20001 */   addiu $v0, $s6, 1
/* B81F24 8010AD84 8FAA0054 */  lw    $t2, 0x54($sp)
/* B81F28 8010AD88 00021C00 */  sll   $v1, $v0, 0x10
/* B81F2C 8010AD8C 26E17FFF */  addiu $at, $s7, 0x7fff
/* B81F30 8010AD90 954763CE */  lhu   $a3, 0x63ce($t2)
/* B81F34 8010AD94 00031C03 */  sra   $v1, $v1, 0x10
/* B81F38 8010AD98 02E36021 */  addu  $t4, $s7, $v1
/* B81F3C 8010AD9C 24E70001 */  addiu $a3, $a3, 1
/* B81F40 8010ADA0 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B81F44 8010ADA4 03C75821 */  addu  $t3, $fp, $a3
/* B81F48 8010ADA8 256D7FFF */  addiu $t5, $t3, 0x7fff
/* B81F4C 8010ADAC A42763CF */  sh    $a3, 0x63cf($at)
/* B81F50 8010ADB0 91AD5C89 */  lbu   $t5, 0x5c89($t5)
/* B81F54 8010ADB4 25817FFF */  addiu $at, $t4, 0x7fff
/* B81F58 8010ADB8 0002B400 */  sll   $s6, $v0, 0x10
/* B81F5C 8010ADBC 0016B403 */  sra   $s6, $s6, 0x10
/* B81F60 8010ADC0 100000AA */  b     .L8010B06C
/* B81F64 8010ADC4 A02D6307 */   sb    $t5, 0x6307($at)
.L8010ADC8:
/* B81F68 8010ADC8 24010001 */  li    $at, 1
/* B81F6C 8010ADCC 16010004 */  bne   $s0, $at, .L8010ADE0
/* B81F70 8010ADD0 87AE0086 */   lh    $t6, 0x86($sp)
/* B81F74 8010ADD4 25D80001 */  addiu $t8, $t6, 1
/* B81F78 8010ADD8 100000A4 */  b     .L8010B06C
/* B81F7C 8010ADDC A7B80086 */   sh    $t8, 0x86($sp)
.L8010ADE0:
/* B81F80 8010ADE0 24010008 */  li    $at, 8
/* B81F84 8010ADE4 120100A1 */  beq   $s0, $at, .L8010B06C
/* B81F88 8010ADE8 24010009 */   li    $at, 9
/* B81F8C 8010ADEC 1201009F */  beq   $s0, $at, .L8010B06C
/* B81F90 8010ADF0 2401000D */   li    $at, 13
/* B81F94 8010ADF4 1201009D */  beq   $s0, $at, .L8010B06C
/* B81F98 8010ADF8 24010010 */   li    $at, 16
/* B81F9C 8010ADFC 1201009B */  beq   $s0, $at, .L8010B06C
/* B81FA0 8010AE00 2401000A */   li    $at, 10
/* B81FA4 8010AE04 12010099 */  beq   $s0, $at, .L8010B06C
/* B81FA8 8010AE08 2401001A */   li    $at, 26
/* B81FAC 8010AE0C 12010097 */  beq   $s0, $at, .L8010B06C
/* B81FB0 8010AE10 2401000E */   li    $at, 14
/* B81FB4 8010AE14 1601001A */  bne   $s0, $at, .L8010AE80
/* B81FB8 8010AE18 3C028015 */   lui   $v0, %hi(D_8014B2F0) # $v0, 0x8015
/* B81FBC 8010AE1C 2442B2F0 */  addiu $v0, %lo(D_8014B2F0) # addiu $v0, $v0, -0x4d10
/* B81FC0 8010AE20 240F0001 */  li    $t7, 1
/* B81FC4 8010AE24 A44F0000 */  sh    $t7, ($v0)
/* B81FC8 8010AE28 3C048015 */  lui   $a0, %hi(D_801541F4) # $a0, 0x8015
/* B81FCC 8010AE2C 248441F4 */  addiu $a0, %lo(D_801541F4) # addiu $a0, $a0, 0x41f4
/* B81FD0 8010AE30 0C00084C */  jal   osSyncPrintf
/* B81FD4 8010AE34 84450000 */   lh    $a1, ($v0)
/* B81FD8 8010AE38 8FA90054 */  lw    $t1, 0x54($sp)
/* B81FDC 8010AE3C 26C20001 */  addiu $v0, $s6, 1
/* B81FE0 8010AE40 00021C00 */  sll   $v1, $v0, 0x10
/* B81FE4 8010AE44 952763CE */  lhu   $a3, 0x63ce($t1)
/* B81FE8 8010AE48 26E17FFF */  addiu $at, $s7, 0x7fff
/* B81FEC 8010AE4C 00031C03 */  sra   $v1, $v1, 0x10
/* B81FF0 8010AE50 24E70001 */  addiu $a3, $a3, 1
/* B81FF4 8010AE54 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B81FF8 8010AE58 03C7C821 */  addu  $t9, $fp, $a3
/* B81FFC 8010AE5C 272A7FFF */  addiu $t2, $t9, 0x7fff
/* B82000 8010AE60 A42763CF */  sh    $a3, 0x63cf($at)
/* B82004 8010AE64 914A5C89 */  lbu   $t2, 0x5c89($t2)
/* B82008 8010AE68 02E35821 */  addu  $t3, $s7, $v1
/* B8200C 8010AE6C 25617FFF */  addiu $at, $t3, 0x7fff
/* B82010 8010AE70 0002B400 */  sll   $s6, $v0, 0x10
/* B82014 8010AE74 0016B403 */  sra   $s6, $s6, 0x10
/* B82018 8010AE78 1000007C */  b     .L8010B06C
/* B8201C 8010AE7C A02A6307 */   sb    $t2, 0x6307($at)
.L8010AE80:
/* B82020 8010AE80 24010011 */  li    $at, 17
/* B82024 8010AE84 1601002A */  bne   $s0, $at, .L8010AF30
/* B82028 8010AE88 3C028015 */   lui   $v0, %hi(D_8014B2F0) # $v0, 0x8015
/* B8202C 8010AE8C 2442B2F0 */  addiu $v0, %lo(D_8014B2F0) # addiu $v0, $v0, -0x4d10
/* B82030 8010AE90 240D0001 */  li    $t5, 1
/* B82034 8010AE94 A44D0000 */  sh    $t5, ($v0)
/* B82038 8010AE98 3C048015 */  lui   $a0, %hi(D_80154214) # $a0, 0x8015
/* B8203C 8010AE9C 24844214 */  addiu $a0, %lo(D_80154214) # addiu $a0, $a0, 0x4214
/* B82040 8010AEA0 0C00084C */  jal   osSyncPrintf
/* B82044 8010AEA4 84450000 */   lh    $a1, ($v0)
/* B82048 8010AEA8 8FAC0054 */  lw    $t4, 0x54($sp)
/* B8204C 8010AEAC 26C20001 */  addiu $v0, $s6, 1
/* B82050 8010AEB0 26E17FFF */  addiu $at, $s7, 0x7fff
/* B82054 8010AEB4 958763CE */  lhu   $a3, 0x63ce($t4)
/* B82058 8010AEB8 00021C00 */  sll   $v1, $v0, 0x10
/* B8205C 8010AEBC 00031C03 */  sra   $v1, $v1, 0x10
/* B82060 8010AEC0 24E70001 */  addiu $a3, $a3, 1
/* B82064 8010AEC4 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B82068 8010AEC8 03C77021 */  addu  $t6, $fp, $a3
/* B8206C 8010AECC 25D87FFF */  addiu $t8, $t6, 0x7fff
/* B82070 8010AED0 A42763CF */  sh    $a3, 0x63cf($at)
/* B82074 8010AED4 93185C89 */  lbu   $t8, 0x5c89($t8)
/* B82078 8010AED8 02E37821 */  addu  $t7, $s7, $v1
/* B8207C 8010AEDC 25E17FFF */  addiu $at, $t7, 0x7fff
/* B82080 8010AEE0 A0386307 */  sb    $t8, 0x6307($at)
/* B82084 8010AEE4 8FA90054 */  lw    $t1, 0x54($sp)
/* B82088 8010AEE8 0040B025 */  move  $s6, $v0
/* B8208C 8010AEEC 26C20001 */  addiu $v0, $s6, 1
/* B82090 8010AEF0 952763CE */  lhu   $a3, 0x63ce($t1)
/* B82094 8010AEF4 00021C00 */  sll   $v1, $v0, 0x10
/* B82098 8010AEF8 26E17FFF */  addiu $at, $s7, 0x7fff
/* B8209C 8010AEFC 24E70001 */  addiu $a3, $a3, 1
/* B820A0 8010AF00 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B820A4 8010AF04 03C7C821 */  addu  $t9, $fp, $a3
/* B820A8 8010AF08 272A7FFF */  addiu $t2, $t9, 0x7fff
/* B820AC 8010AF0C A42763CF */  sh    $a3, 0x63cf($at)
/* B820B0 8010AF10 00031C03 */  sra   $v1, $v1, 0x10
/* B820B4 8010AF14 914A5C89 */  lbu   $t2, 0x5c89($t2)
/* B820B8 8010AF18 02E35821 */  addu  $t3, $s7, $v1
/* B820BC 8010AF1C 25617FFF */  addiu $at, $t3, 0x7fff
/* B820C0 8010AF20 0002B400 */  sll   $s6, $v0, 0x10
/* B820C4 8010AF24 0016B403 */  sra   $s6, $s6, 0x10
/* B820C8 8010AF28 10000050 */  b     .L8010B06C
/* B820CC 8010AF2C A02A6307 */   sb    $t2, 0x6307($at)
.L8010AF30:
/* B820D0 8010AF30 24010006 */  li    $at, 6
/* B820D4 8010AF34 12010004 */  beq   $s0, $at, .L8010AF48
/* B820D8 8010AF38 26C20001 */   addiu $v0, $s6, 1
/* B820DC 8010AF3C 24010014 */  li    $at, 20
/* B820E0 8010AF40 56010013 */  bnel  $s0, $at, .L8010AF90
/* B820E4 8010AF44 24010012 */   li    $at, 18
.L8010AF48:
/* B820E8 8010AF48 8FAD0054 */  lw    $t5, 0x54($sp)
/* B820EC 8010AF4C 00021C00 */  sll   $v1, $v0, 0x10
/* B820F0 8010AF50 26E17FFF */  addiu $at, $s7, 0x7fff
/* B820F4 8010AF54 95A763CE */  lhu   $a3, 0x63ce($t5)
/* B820F8 8010AF58 00031C03 */  sra   $v1, $v1, 0x10
/* B820FC 8010AF5C 02E37821 */  addu  $t7, $s7, $v1
/* B82100 8010AF60 24E70001 */  addiu $a3, $a3, 1
/* B82104 8010AF64 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B82108 8010AF68 03C76021 */  addu  $t4, $fp, $a3
/* B8210C 8010AF6C 258E7FFF */  addiu $t6, $t4, 0x7fff
/* B82110 8010AF70 A42763CF */  sh    $a3, 0x63cf($at)
/* B82114 8010AF74 91D85C89 */  lbu   $t8, 0x5c89($t6)
/* B82118 8010AF78 25E17FFF */  addiu $at, $t7, 0x7fff
/* B8211C 8010AF7C 0002B400 */  sll   $s6, $v0, 0x10
/* B82120 8010AF80 0016B403 */  sra   $s6, $s6, 0x10
/* B82124 8010AF84 10000039 */  b     .L8010B06C
/* B82128 8010AF88 A0386307 */   sb    $t8, 0x6307($at)
/* B8212C 8010AF8C 24010012 */  li    $at, 18
.L8010AF90:
/* B82130 8010AF90 16010022 */  bne   $s0, $at, .L8010B01C
/* B82134 8010AF94 26C20001 */   addiu $v0, $s6, 1
/* B82138 8010AF98 8FA90054 */  lw    $t1, 0x54($sp)
/* B8213C 8010AF9C 26E17FFF */  addiu $at, $s7, 0x7fff
/* B82140 8010AFA0 00021C00 */  sll   $v1, $v0, 0x10
/* B82144 8010AFA4 952763CE */  lhu   $a3, 0x63ce($t1)
/* B82148 8010AFA8 00031C03 */  sra   $v1, $v1, 0x10
/* B8214C 8010AFAC 02E35821 */  addu  $t3, $s7, $v1
/* B82150 8010AFB0 24E70001 */  addiu $a3, $a3, 1
/* B82154 8010AFB4 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B82158 8010AFB8 03C7C821 */  addu  $t9, $fp, $a3
/* B8215C 8010AFBC 272A7FFF */  addiu $t2, $t9, 0x7fff
/* B82160 8010AFC0 A42763CF */  sh    $a3, 0x63cf($at)
/* B82164 8010AFC4 914A5C89 */  lbu   $t2, 0x5c89($t2)
/* B82168 8010AFC8 25617FFF */  addiu $at, $t3, 0x7fff
/* B8216C 8010AFCC 0040B025 */  move  $s6, $v0
/* B82170 8010AFD0 A02A6307 */  sb    $t2, 0x6307($at)
/* B82174 8010AFD4 8FAD0054 */  lw    $t5, 0x54($sp)
/* B82178 8010AFD8 26C20001 */  addiu $v0, $s6, 1
/* B8217C 8010AFDC 00021C00 */  sll   $v1, $v0, 0x10
/* B82180 8010AFE0 95A763CE */  lhu   $a3, 0x63ce($t5)
/* B82184 8010AFE4 26E17FFF */  addiu $at, $s7, 0x7fff
/* B82188 8010AFE8 00031C03 */  sra   $v1, $v1, 0x10
/* B8218C 8010AFEC 24E70001 */  addiu $a3, $a3, 1
/* B82190 8010AFF0 30E7FFFF */  andi  $a3, $a3, 0xffff
/* B82194 8010AFF4 03C76021 */  addu  $t4, $fp, $a3
/* B82198 8010AFF8 258E7FFF */  addiu $t6, $t4, 0x7fff
/* B8219C 8010AFFC A42763CF */  sh    $a3, 0x63cf($at)
/* B821A0 8010B000 91CE5C89 */  lbu   $t6, 0x5c89($t6)
/* B821A4 8010B004 02E3C021 */  addu  $t8, $s7, $v1
/* B821A8 8010B008 27017FFF */  addiu $at, $t8, 0x7fff
/* B821AC 8010B00C 0002B400 */  sll   $s6, $v0, 0x10
/* B821B0 8010B010 0016B403 */  sra   $s6, $s6, 0x10
/* B821B4 8010B014 10000015 */  b     .L8010B06C
/* B821B8 8010B018 A02E6307 */   sb    $t6, 0x6307($at)
.L8010B01C:
/* B821BC 8010B01C 2401001B */  li    $at, 27
/* B821C0 8010B020 16010004 */  bne   $s0, $at, .L8010B034
/* B821C4 8010B024 240F0002 */   li    $t7, 2
/* B821C8 8010B028 26E17FFF */  addiu $at, $s7, 0x7fff
/* B821CC 8010B02C 1000000F */  b     .L8010B06C
/* B821D0 8010B030 A02F63E7 */   sb    $t7, 0x63e7($at)
.L8010B034:
/* B821D4 8010B034 2401001C */  li    $at, 28
/* B821D8 8010B038 16010004 */  bne   $s0, $at, .L8010B04C
/* B821DC 8010B03C 24090003 */   li    $t1, 3
/* B821E0 8010B040 26E17FFF */  addiu $at, $s7, 0x7fff
/* B821E4 8010B044 10000009 */  b     .L8010B06C
/* B821E8 8010B048 A02963E7 */   sb    $t1, 0x63e7($at)
.L8010B04C:
/* B821EC 8010B04C 24010020 */  li    $at, 32
/* B821F0 8010B050 12010006 */  beq   $s0, $at, .L8010B06C
/* B821F4 8010B054 03C02025 */   move  $a0, $fp
/* B821F8 8010B058 2605FFE0 */  addiu $a1, $s0, -0x20
/* B821FC 8010B05C 30A500FF */  andi  $a1, $a1, 0xff
/* B82200 8010B060 0C01BB98 */  jal   func_8006EE60
/* B82204 8010B064 32A6FFFF */   andi  $a2, $s5, 0xffff
/* B82208 8010B068 26B50080 */  addiu $s5, $s5, 0x80
.L8010B06C:
glabel L8010B06C
/* B8220C 8010B06C 8FB90054 */  lw    $t9, 0x54($sp)
.L8010B070:
/* B82210 8010B070 26D60001 */  addiu $s6, $s6, 1
/* B82214 8010B074 0016B400 */  sll   $s6, $s6, 0x10
/* B82218 8010B078 972A63CE */  lhu   $t2, 0x63ce($t9)
/* B8221C 8010B07C 26E17FFF */  addiu $at, $s7, 0x7fff
/* B82220 8010B080 0016B403 */  sra   $s6, $s6, 0x10
/* B82224 8010B084 254B0001 */  addiu $t3, $t2, 1
/* B82228 8010B088 1000FACE */  b     .L80109BC4
/* B8222C 8010B08C A42B63CF */   sh    $t3, 0x63cf($at)
.L8010B090:
/* B82230 8010B090 8FBF0044 */  lw    $ra, 0x44($sp)
.L8010B094:
/* B82234 8010B094 8FB00020 */  lw    $s0, 0x20($sp)
/* B82238 8010B098 8FB10024 */  lw    $s1, 0x24($sp)
/* B8223C 8010B09C 8FB20028 */  lw    $s2, 0x28($sp)
/* B82240 8010B0A0 8FB3002C */  lw    $s3, 0x2c($sp)
/* B82244 8010B0A4 8FB40030 */  lw    $s4, 0x30($sp)
/* B82248 8010B0A8 8FB50034 */  lw    $s5, 0x34($sp)
/* B8224C 8010B0AC 8FB60038 */  lw    $s6, 0x38($sp)
/* B82250 8010B0B0 8FB7003C */  lw    $s7, 0x3c($sp)
/* B82254 8010B0B4 8FBE0040 */  lw    $fp, 0x40($sp)
/* B82258 8010B0B8 03E00008 */  jr    $ra
/* B8225C 8010B0BC 27BD0098 */   addiu $sp, $sp, 0x98