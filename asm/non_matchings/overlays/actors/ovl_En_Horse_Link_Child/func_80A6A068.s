glabel func_80A6A068
/* 00C98 80A6A068 27BDFFA8 */  addiu   $sp, $sp, 0xFFA8           ## $sp = FFFFFFA8
/* 00C9C 80A6A06C AFBF002C */  sw      $ra, 0x002C($sp)
/* 00CA0 80A6A070 AFB00028 */  sw      $s0, 0x0028($sp)
/* 00CA4 80A6A074 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00CA8 80A6A078 0C29A7D7 */  jal     func_80A69F5C
/* 00CAC 80A6A07C AFA5005C */  sw      $a1, 0x005C($sp)
/* 00CB0 80A6A080 8FAE005C */  lw      $t6, 0x005C($sp)
/* 00CB4 80A6A084 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00CB8 80A6A088 8DC51C44 */  lw      $a1, 0x1C44($t6)           ## 00001C44
/* 00CBC 80A6A08C 0C00B6E3 */  jal     func_8002DB8C
/* 00CC0 80A6A090 AFA50054 */  sw      $a1, 0x0054($sp)
/* 00CC4 80A6A094 3C058016 */  lui     $a1, %hi(gSaveContext)
/* 00CC8 80A6A098 24A5E660 */  addiu   $a1, %lo(gSaveContext)
/* 00CCC 80A6A09C 8CAF0000 */  lw      $t7, 0x0000($a1)           ## 8015E660
/* 00CD0 80A6A0A0 240102AE */  addiu   $at, $zero, 0x02AE         ## $at = 000002AE
/* 00CD4 80A6A0A4 E7A00050 */  swc1    $f0, 0x0050($sp)
/* 00CD8 80A6A0A8 15E1000E */  bne     $t7, $at, .L80A6A0E4
/* 00CDC 80A6A0AC 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 00CE0 80A6A0B0 3C188013 */  lui     $t8, %hi(D_801333E8)
/* 00CE4 80A6A0B4 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 00CE8 80A6A0B8 271833E8 */  addiu   $t8, %lo(D_801333E8)
/* 00CEC 80A6A0BC AFB80014 */  sw      $t8, 0x0014($sp)
/* 00CF0 80A6A0C0 AFA70010 */  sw      $a3, 0x0010($sp)
/* 00CF4 80A6A0C4 24042844 */  addiu   $a0, $zero, 0x2844         ## $a0 = 00002844
/* 00CF8 80A6A0C8 260500E4 */  addiu   $a1, $s0, 0x00E4           ## $a1 = 000000E4
/* 00CFC 80A6A0CC 0C03DCE3 */  jal     Audio_PlaySoundGeneral

/* 00D00 80A6A0D0 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00D04 80A6A0D4 0C29A9C9 */  jal     func_80A6A724
/* 00D08 80A6A0D8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D0C 80A6A0DC 100000FB */  beq     $zero, $zero, .L80A6A4CC
/* 00D10 80A6A0E0 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A6A0E4:
/* 00D14 80A6A0E4 94A20ED6 */  lhu     $v0, 0x0ED6($a1)           ## 00000ED6
/* 00D18 80A6A0E8 3C198016 */  lui     $t9, %hi(gGameInfo)
/* 00D1C 80A6A0EC 8FA9005C */  lw      $t1, 0x005C($sp)
/* 00D20 80A6A0F0 30420040 */  andi    $v0, $v0, 0x0040           ## $v0 = 00000000
/* 00D24 80A6A0F4 50400006 */  beql    $v0, $zero, .L80A6A110
/* 00D28 80A6A0F8 852A00A4 */  lh      $t2, 0x00A4($t1)           ## 000000A4
/* 00D2C 80A6A0FC 8F39FA90 */  lw      $t9, %lo(gGameInfo)($t9)
/* 00D30 80A6A100 872805BE */  lh      $t0, 0x05BE($t9)           ## 801605BE
/* 00D34 80A6A104 15000009 */  bne     $t0, $zero, .L80A6A12C
/* 00D38 80A6A108 00000000 */  nop
/* 00D3C 80A6A10C 852A00A4 */  lh      $t2, 0x00A4($t1)           ## 000000A4
.L80A6A110:
/* 00D40 80A6A110 24010063 */  addiu   $at, $zero, 0x0063         ## $at = 00000063
/* 00D44 80A6A114 5541000A */  bnel    $t2, $at, .L80A6A140
/* 00D48 80A6A118 AE0202A0 */  sw      $v0, 0x02A0($s0)           ## 000002A0
/* 00D4C 80A6A11C 8CAB0008 */  lw      $t3, 0x0008($a1)           ## 00000008
/* 00D50 80A6A120 3401FFF1 */  ori     $at, $zero, 0xFFF1         ## $at = 0000FFF1
/* 00D54 80A6A124 55610006 */  bnel    $t3, $at, .L80A6A140
/* 00D58 80A6A128 AE0202A0 */  sw      $v0, 0x02A0($s0)           ## 000002A0
.L80A6A12C:
/* 00D5C 80A6A12C 0C29A937 */  jal     func_80A6A4DC
/* 00D60 80A6A130 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D64 80A6A134 10000003 */  beq     $zero, $zero, .L80A6A144
/* 00D68 80A6A138 8E030150 */  lw      $v1, 0x0150($s0)           ## 00000150
/* 00D6C 80A6A13C AE0202A0 */  sw      $v0, 0x02A0($s0)           ## 000002A0
.L80A6A140:
/* 00D70 80A6A140 8E030150 */  lw      $v1, 0x0150($s0)           ## 00000150
.L80A6A144:
/* 00D74 80A6A144 260401A0 */  addiu   $a0, $s0, 0x01A0           ## $a0 = 000001A0
/* 00D78 80A6A148 AFA40030 */  sw      $a0, 0x0030($sp)
/* 00D7C 80A6A14C 0C02927F */  jal     SkelAnime_FrameUpdateMatrix

/* 00D80 80A6A150 AFA30048 */  sw      $v1, 0x0048($sp)
/* 00D84 80A6A154 3C058016 */  lui     $a1, %hi(gSaveContext)
/* 00D88 80A6A158 24A5E660 */  addiu   $a1, %lo(gSaveContext)
/* 00D8C 80A6A15C 8FA30048 */  lw      $v1, 0x0048($sp)
/* 00D90 80A6A160 14400007 */  bne     $v0, $zero, .L80A6A180
/* 00D94 80A6A164 00403825 */  or      $a3, $v0, $zero            ## $a3 = 00000000
/* 00D98 80A6A168 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00D9C 80A6A16C 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00DA0 80A6A170 50C40004 */  beql    $a2, $a0, .L80A6A184
/* 00DA4 80A6A174 94AC0ED6 */  lhu     $t4, 0x0ED6($a1)           ## 8015F536
/* 00DA8 80A6A178 14800099 */  bne     $a0, $zero, .L80A6A3E0
/* 00DAC 80A6A17C 00000000 */  nop
.L80A6A180:
/* 00DB0 80A6A180 94AC0ED6 */  lhu     $t4, 0x0ED6($a1)           ## 8015F536
.L80A6A184:
/* 00DB4 80A6A184 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00DB8 80A6A188 26050008 */  addiu   $a1, $s0, 0x0008           ## $a1 = 00000008
/* 00DBC 80A6A18C 318D0020 */  andi    $t5, $t4, 0x0020           ## $t5 = 00000000
/* 00DC0 80A6A190 11A00085 */  beq     $t5, $zero, .L80A6A3A8
/* 00DC4 80A6A194 26040024 */  addiu   $a0, $s0, 0x0024           ## $a0 = 00000024
/* 00DC8 80A6A198 AFA50034 */  sw      $a1, 0x0034($sp)
/* 00DCC 80A6A19C 0C032D9E */  jal     Math3D_Vec3f_DistXYZ
/* 00DD0 80A6A1A0 AFA7004C */  sw      $a3, 0x004C($sp)
/* 00DD4 80A6A1A4 8FA40054 */  lw      $a0, 0x0054($sp)
/* 00DD8 80A6A1A8 8FA50034 */  lw      $a1, 0x0034($sp)
/* 00DDC 80A6A1AC E7A00044 */  swc1    $f0, 0x0044($sp)
/* 00DE0 80A6A1B0 0C032D9E */  jal     Math3D_Vec3f_DistXYZ
/* 00DE4 80A6A1B4 24840024 */  addiu   $a0, $a0, 0x0024           ## $a0 = 00000024
/* 00DE8 80A6A1B8 3C01437A */  lui     $at, 0x437A                ## $at = 437A0000
/* 00DEC 80A6A1BC 44812000 */  mtc1    $at, $f4                   ## $f4 = 250.00
/* 00DF0 80A6A1C0 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 00DF4 80A6A1C4 8FA7004C */  lw      $a3, 0x004C($sp)
/* 00DF8 80A6A1C8 4600203C */  c.lt.s  $f4, $f0
/* 00DFC 80A6A1CC C7A20044 */  lwc1    $f2, 0x0044($sp)
/* 00E00 80A6A1D0 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 00E04 80A6A1D4 45020040 */  bc1fl   .L80A6A2D8
/* 00E08 80A6A1D8 C7A20050 */  lwc1    $f2, 0x0050($sp)
/* 00E0C 80A6A1DC 3C014396 */  lui     $at, 0x4396                ## $at = 43960000
/* 00E10 80A6A1E0 44810000 */  mtc1    $at, $f0                   ## $f0 = 300.00
/* 00E14 80A6A1E4 24030004 */  addiu   $v1, $zero, 0x0004         ## $v1 = 00000004
/* 00E18 80A6A1E8 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 00E1C 80A6A1EC 4602003E */  c.le.s  $f0, $f2
/* 00E20 80A6A1F0 00000000 */  nop
/* 00E24 80A6A1F4 45020006 */  bc1fl   .L80A6A210
/* 00E28 80A6A1F8 4600103C */  c.lt.s  $f2, $f0
/* 00E2C 80A6A1FC 44813000 */  mtc1    $at, $f6                   ## $f6 = 6.00
/* 00E30 80A6A200 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00E34 80A6A204 10000076 */  beq     $zero, $zero, .L80A6A3E0
/* 00E38 80A6A208 E6060068 */  swc1    $f6, 0x0068($s0)           ## 00000068
/* 00E3C 80A6A20C 4600103C */  c.lt.s  $f2, $f0
.L80A6A210:
/* 00E40 80A6A210 3C014316 */  lui     $at, 0x4316                ## $at = 43160000
/* 00E44 80A6A214 4502000D */  bc1fl   .L80A6A24C
/* 00E48 80A6A218 3C014316 */  lui     $at, 0x4316                ## $at = 43160000
/* 00E4C 80A6A21C 44814000 */  mtc1    $at, $f8                   ## $f8 = 150.00
/* 00E50 80A6A220 24030003 */  addiu   $v1, $zero, 0x0003         ## $v1 = 00000003
/* 00E54 80A6A224 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 00E58 80A6A228 4602403E */  c.le.s  $f8, $f2
/* 00E5C 80A6A22C 00000000 */  nop
/* 00E60 80A6A230 45020006 */  bc1fl   .L80A6A24C
/* 00E64 80A6A234 3C014316 */  lui     $at, 0x4316                ## $at = 43160000
/* 00E68 80A6A238 44815000 */  mtc1    $at, $f10                  ## $f10 = 150.00
/* 00E6C 80A6A23C 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00E70 80A6A240 10000067 */  beq     $zero, $zero, .L80A6A3E0
/* 00E74 80A6A244 E60A0068 */  swc1    $f10, 0x0068($s0)          ## 00000068
/* 00E78 80A6A248 3C014316 */  lui     $at, 0x4316                ## $at = 43160000
.L80A6A24C:
/* 00E7C 80A6A24C 44818000 */  mtc1    $at, $f16                  ## $f16 = 150.00
/* 00E80 80A6A250 3C01428C */  lui     $at, 0x428C                ## $at = 428C0000
/* 00E84 80A6A254 4610103C */  c.lt.s  $f2, $f16
/* 00E88 80A6A258 00000000 */  nop
/* 00E8C 80A6A25C 4502000E */  bc1fl   .L80A6A298
/* 00E90 80A6A260 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00E94 80A6A264 44819000 */  mtc1    $at, $f18                  ## $f18 = 70.00
/* 00E98 80A6A268 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
/* 00E9C 80A6A26C 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 00EA0 80A6A270 4602903E */  c.le.s  $f18, $f2
/* 00EA4 80A6A274 00000000 */  nop
/* 00EA8 80A6A278 45020007 */  bc1fl   .L80A6A298
/* 00EAC 80A6A27C 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00EB0 80A6A280 44812000 */  mtc1    $at, $f4                   ## $f4 = 2.00
/* 00EB4 80A6A284 AE0001F0 */  sw      $zero, 0x01F0($s0)         ## 000001F0
/* 00EB8 80A6A288 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00EBC 80A6A28C 10000054 */  beq     $zero, $zero, .L80A6A3E0
/* 00EC0 80A6A290 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
/* 00EC4 80A6A294 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
.L80A6A298:
/* 00EC8 80A6A298 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00ECC 80A6A29C 14800007 */  bne     $a0, $zero, .L80A6A2BC
/* 00ED0 80A6A2A0 E6060068 */  swc1    $f6, 0x0068($s0)           ## 00000068
/* 00ED4 80A6A2A4 14E60003 */  bne     $a3, $a2, .L80A6A2B4
/* 00ED8 80A6A2A8 00000000 */  nop
/* 00EDC 80A6A2AC 1000004C */  beq     $zero, $zero, .L80A6A3E0
/* 00EE0 80A6A2B0 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
.L80A6A2B4:
/* 00EE4 80A6A2B4 1000004A */  beq     $zero, $zero, .L80A6A3E0
/* 00EE8 80A6A2B8 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A2BC:
/* 00EEC 80A6A2BC 14E60003 */  bne     $a3, $a2, .L80A6A2CC
/* 00EF0 80A6A2C0 00000000 */  nop
/* 00EF4 80A6A2C4 10000046 */  beq     $zero, $zero, .L80A6A3E0
/* 00EF8 80A6A2C8 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A2CC:
/* 00EFC 80A6A2CC 10000044 */  beq     $zero, $zero, .L80A6A3E0
/* 00F00 80A6A2D0 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
/* 00F04 80A6A2D4 C7A20050 */  lwc1    $f2, 0x0050($sp)
.L80A6A2D8:
/* 00F08 80A6A2D8 44814000 */  mtc1    $at, $f8                   ## $f8 = 2.00
/* 00F0C 80A6A2DC 24030004 */  addiu   $v1, $zero, 0x0004         ## $v1 = 00000004
/* 00F10 80A6A2E0 3C014396 */  lui     $at, 0x4396                ## $at = 43960000
/* 00F14 80A6A2E4 4608103C */  c.lt.s  $f2, $f8
/* 00F18 80A6A2E8 00000000 */  nop
/* 00F1C 80A6A2EC 45020007 */  bc1fl   .L80A6A30C
/* 00F20 80A6A2F0 44810000 */  mtc1    $at, $f0                   ## $f0 = 300.00
/* 00F24 80A6A2F4 3C0140C0 */  lui     $at, 0x40C0                ## $at = 40C00000
/* 00F28 80A6A2F8 44815000 */  mtc1    $at, $f10                  ## $f10 = 6.00
/* 00F2C 80A6A2FC 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00F30 80A6A300 10000037 */  beq     $zero, $zero, .L80A6A3E0
/* 00F34 80A6A304 E60A0068 */  swc1    $f10, 0x0068($s0)          ## 00000068
/* 00F38 80A6A308 44810000 */  mtc1    $at, $f0                   ## $f0 = 6.00
.L80A6A30C:
/* 00F3C 80A6A30C 24030003 */  addiu   $v1, $zero, 0x0003         ## $v1 = 00000003
/* 00F40 80A6A310 3C0143C8 */  lui     $at, 0x43C8                ## $at = 43C80000
/* 00F44 80A6A314 4600103C */  c.lt.s  $f2, $f0
/* 00F48 80A6A318 00000000 */  nop
/* 00F4C 80A6A31C 45020007 */  bc1fl   .L80A6A33C
/* 00F50 80A6A320 44819000 */  mtc1    $at, $f18                  ## $f18 = 400.00
/* 00F54 80A6A324 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 00F58 80A6A328 44818000 */  mtc1    $at, $f16                  ## $f16 = 4.00
/* 00F5C 80A6A32C 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00F60 80A6A330 1000002B */  beq     $zero, $zero, .L80A6A3E0
/* 00F64 80A6A334 E6100068 */  swc1    $f16, 0x0068($s0)          ## 00000068
/* 00F68 80A6A338 44819000 */  mtc1    $at, $f18                  ## $f18 = 4.00
.L80A6A33C:
/* 00F6C 80A6A33C 24030002 */  addiu   $v1, $zero, 0x0002         ## $v1 = 00000002
/* 00F70 80A6A340 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 00F74 80A6A344 4612103C */  c.lt.s  $f2, $f18
/* 00F78 80A6A348 00000000 */  nop
/* 00F7C 80A6A34C 45020007 */  bc1fl   .L80A6A36C
/* 00F80 80A6A350 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00F84 80A6A354 44812000 */  mtc1    $at, $f4                   ## $f4 = 2.00
/* 00F88 80A6A358 AE0001F0 */  sw      $zero, 0x01F0($s0)         ## 000001F0
/* 00F8C 80A6A35C 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00F90 80A6A360 1000001F */  beq     $zero, $zero, .L80A6A3E0
/* 00F94 80A6A364 E6040068 */  swc1    $f4, 0x0068($s0)           ## 00000068
/* 00F98 80A6A368 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
.L80A6A36C:
/* 00F9C 80A6A36C 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 00FA0 80A6A370 14800007 */  bne     $a0, $zero, .L80A6A390
/* 00FA4 80A6A374 E6060068 */  swc1    $f6, 0x0068($s0)           ## 00000068
/* 00FA8 80A6A378 14E60003 */  bne     $a3, $a2, .L80A6A388
/* 00FAC 80A6A37C 00000000 */  nop
/* 00FB0 80A6A380 10000017 */  beq     $zero, $zero, .L80A6A3E0
/* 00FB4 80A6A384 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
.L80A6A388:
/* 00FB8 80A6A388 10000015 */  beq     $zero, $zero, .L80A6A3E0
/* 00FBC 80A6A38C 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A390:
/* 00FC0 80A6A390 14E60003 */  bne     $a3, $a2, .L80A6A3A0
/* 00FC4 80A6A394 00000000 */  nop
/* 00FC8 80A6A398 10000011 */  beq     $zero, $zero, .L80A6A3E0
/* 00FCC 80A6A39C 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A3A0:
/* 00FD0 80A6A3A0 1000000F */  beq     $zero, $zero, .L80A6A3E0
/* 00FD4 80A6A3A4 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
.L80A6A3A8:
/* 00FD8 80A6A3A8 8E040150 */  lw      $a0, 0x0150($s0)           ## 00000150
/* 00FDC 80A6A3AC 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 00FE0 80A6A3B0 14800007 */  bne     $a0, $zero, .L80A6A3D0
/* 00FE4 80A6A3B4 E6080068 */  swc1    $f8, 0x0068($s0)           ## 00000068
/* 00FE8 80A6A3B8 14460003 */  bne     $v0, $a2, .L80A6A3C8
/* 00FEC 80A6A3BC 00000000 */  nop
/* 00FF0 80A6A3C0 10000007 */  beq     $zero, $zero, .L80A6A3E0
/* 00FF4 80A6A3C4 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
.L80A6A3C8:
/* 00FF8 80A6A3C8 10000005 */  beq     $zero, $zero, .L80A6A3E0
/* 00FFC 80A6A3CC 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A3D0:
/* 01000 80A6A3D0 14460003 */  bne     $v0, $a2, .L80A6A3E0
/* 01004 80A6A3D4 00C01825 */  or      $v1, $a2, $zero            ## $v1 = 00000001
/* 01008 80A6A3D8 10000001 */  beq     $zero, $zero, .L80A6A3E0
/* 0100C 80A6A3DC 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80A6A3E0:
/* 01010 80A6A3E0 54640004 */  bnel    $v1, $a0, .L80A6A3F4
/* 01014 80A6A3E4 AE030150 */  sw      $v1, 0x0150($s0)           ## 00000150
/* 01018 80A6A3E8 14E6001E */  bne     $a3, $a2, .L80A6A464
/* 0101C 80A6A3EC 00000000 */  nop
/* 01020 80A6A3F0 AE030150 */  sw      $v1, 0x0150($s0)           ## 00000150
.L80A6A3F4:
/* 01024 80A6A3F4 0C29A569 */  jal     func_80A695A4
/* 01028 80A6A3F8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0102C 80A6A3FC E7A00038 */  swc1    $f0, 0x0038($sp)
/* 01030 80A6A400 8E0E0150 */  lw      $t6, 0x0150($s0)           ## 00000150
/* 01034 80A6A404 3C0480A7 */  lui     $a0, %hi(D_80A6AEE0)       ## $a0 = 80A70000
/* 01038 80A6A408 000E7880 */  sll     $t7, $t6,  2
/* 0103C 80A6A40C 008F2021 */  addu    $a0, $a0, $t7
/* 01040 80A6A410 0C028800 */  jal     SkelAnime_GetFrameCount

/* 01044 80A6A414 8C84AEE0 */  lw      $a0, %lo(D_80A6AEE0)($a0)
/* 01048 80A6A418 44825000 */  mtc1    $v0, $f10                  ## $f10 = 0.00
/* 0104C 80A6A41C 8E180150 */  lw      $t8, 0x0150($s0)           ## 00000150
/* 01050 80A6A420 3C01C0A0 */  lui     $at, 0xC0A0                ## $at = C0A00000
/* 01054 80A6A424 46805420 */  cvt.s.w $f16, $f10
/* 01058 80A6A428 44819000 */  mtc1    $at, $f18                  ## $f18 = -5.00
/* 0105C 80A6A42C 3C0580A7 */  lui     $a1, %hi(D_80A6AEE0)       ## $a1 = 80A70000
/* 01060 80A6A430 0018C880 */  sll     $t9, $t8,  2
/* 01064 80A6A434 00B92821 */  addu    $a1, $a1, $t9
/* 01068 80A6A438 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 0106C 80A6A43C AFA80014 */  sw      $t0, 0x0014($sp)
/* 01070 80A6A440 8CA5AEE0 */  lw      $a1, %lo(D_80A6AEE0)($a1)
/* 01074 80A6A444 E7B00010 */  swc1    $f16, 0x0010($sp)
/* 01078 80A6A448 8FA40030 */  lw      $a0, 0x0030($sp)
/* 0107C 80A6A44C 8FA60038 */  lw      $a2, 0x0038($sp)
/* 01080 80A6A450 24070000 */  addiu   $a3, $zero, 0x0000         ## $a3 = 00000000
/* 01084 80A6A454 0C029468 */  jal     SkelAnime_ChangeAnim

/* 01088 80A6A458 E7B20018 */  swc1    $f18, 0x0018($sp)
/* 0108C 80A6A45C 1000001B */  beq     $zero, $zero, .L80A6A4CC
/* 01090 80A6A460 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A6A464:
/* 01094 80A6A464 0C29A569 */  jal     func_80A695A4
/* 01098 80A6A468 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0109C 80A6A46C E7A00038 */  swc1    $f0, 0x0038($sp)
/* 010A0 80A6A470 8E090150 */  lw      $t1, 0x0150($s0)           ## 00000150
/* 010A4 80A6A474 3C0480A7 */  lui     $a0, %hi(D_80A6AEE0)       ## $a0 = 80A70000
/* 010A8 80A6A478 00095080 */  sll     $t2, $t1,  2
/* 010AC 80A6A47C 008A2021 */  addu    $a0, $a0, $t2
/* 010B0 80A6A480 0C028800 */  jal     SkelAnime_GetFrameCount

/* 010B4 80A6A484 8C84AEE0 */  lw      $a0, %lo(D_80A6AEE0)($a0)
/* 010B8 80A6A488 44822000 */  mtc1    $v0, $f4                   ## $f4 = 0.00
/* 010BC 80A6A48C 8E0B0150 */  lw      $t3, 0x0150($s0)           ## 00000150
/* 010C0 80A6A490 44804000 */  mtc1    $zero, $f8                 ## $f8 = 0.00
/* 010C4 80A6A494 468021A0 */  cvt.s.w $f6, $f4
/* 010C8 80A6A498 3C0580A7 */  lui     $a1, %hi(D_80A6AEE0)       ## $a1 = 80A70000
/* 010CC 80A6A49C 8E0701B8 */  lw      $a3, 0x01B8($s0)           ## 000001B8
/* 010D0 80A6A4A0 000B6080 */  sll     $t4, $t3,  2
/* 010D4 80A6A4A4 00AC2821 */  addu    $a1, $a1, $t4
/* 010D8 80A6A4A8 240D0002 */  addiu   $t5, $zero, 0x0002         ## $t5 = 00000002
/* 010DC 80A6A4AC AFAD0014 */  sw      $t5, 0x0014($sp)
/* 010E0 80A6A4B0 8CA5AEE0 */  lw      $a1, %lo(D_80A6AEE0)($a1)
/* 010E4 80A6A4B4 E7A60010 */  swc1    $f6, 0x0010($sp)
/* 010E8 80A6A4B8 8FA40030 */  lw      $a0, 0x0030($sp)
/* 010EC 80A6A4BC 8FA60038 */  lw      $a2, 0x0038($sp)
/* 010F0 80A6A4C0 0C029468 */  jal     SkelAnime_ChangeAnim

/* 010F4 80A6A4C4 E7A80018 */  swc1    $f8, 0x0018($sp)
/* 010F8 80A6A4C8 8FBF002C */  lw      $ra, 0x002C($sp)
.L80A6A4CC:
/* 010FC 80A6A4CC 8FB00028 */  lw      $s0, 0x0028($sp)
/* 01100 80A6A4D0 27BD0058 */  addiu   $sp, $sp, 0x0058           ## $sp = 00000000
/* 01104 80A6A4D4 03E00008 */  jr      $ra
/* 01108 80A6A4D8 00000000 */  nop
