.late_rodata
glabel jtbl_80B5FCC0
.word L80B5DB14
.word L80B5DB54
.word L80B5DB94
.word L80B5DC08
.word L80B5DC28
.word L80B5DC94
.word L80B5DCB4
.word L80B5DD7C

.text
glabel func_80B5DAD8
/* 02328 80B5DAD8 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 0232C 80B5DADC AFBF0024 */  sw      $ra, 0x0024($sp)
/* 02330 80B5DAE0 AFB10020 */  sw      $s1, 0x0020($sp)
/* 02334 80B5DAE4 AFB0001C */  sw      $s0, 0x001C($sp)
/* 02338 80B5DAE8 90830208 */  lbu     $v1, 0x0208($a0)           ## 00000208
/* 0233C 80B5DAEC 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 02340 80B5DAF0 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 02344 80B5DAF4 2C610008 */  sltiu   $at, $v1, 0x0008
/* 02348 80B5DAF8 102000BD */  beq     $at, $zero, .L80B5DDF0
/* 0234C 80B5DAFC 00037080 */  sll     $t6, $v1,  2
/* 02350 80B5DB00 3C0180B6 */  lui     $at, %hi(jtbl_80B5FCC0)       ## $at = 80B60000
/* 02354 80B5DB04 002E0821 */  addu    $at, $at, $t6
/* 02358 80B5DB08 8C2EFCC0 */  lw      $t6, %lo(jtbl_80B5FCC0)($at)
/* 0235C 80B5DB0C 01C00008 */  jr      $t6
/* 02360 80B5DB10 00000000 */  nop
glabel L80B5DB14
/* 02364 80B5DB14 3C0580B6 */  lui     $a1, %hi(D_80B5E7B8)       ## $a1 = 80B60000
/* 02368 80B5DB18 24A5E7B8 */  addiu   $a1, $a1, %lo(D_80B5E7B8)  ## $a1 = 80B5E7B8
/* 0236C 80B5DB1C 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 02370 80B5DB20 0C00D3B0 */  jal     func_80034EC0
/* 02374 80B5DB24 24060012 */  addiu   $a2, $zero, 0x0012         ## $a2 = 00000012
/* 02378 80B5DB28 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 0237C 80B5DB2C A6000210 */  sh      $zero, 0x0210($s0)         ## 00000210
/* 02380 80B5DB30 A200020D */  sb      $zero, 0x020D($s0)         ## 0000020D
/* 02384 80B5DB34 A20F020E */  sb      $t7, 0x020E($s0)           ## 0000020E
/* 02388 80B5DB38 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0238C 80B5DB3C 0C2D6E22 */  jal     func_80B5B888
/* 02390 80B5DB40 2405000A */  addiu   $a1, $zero, 0x000A         ## $a1 = 0000000A
/* 02394 80B5DB44 92180208 */  lbu     $t8, 0x0208($s0)           ## 00000208
/* 02398 80B5DB48 A6000214 */  sh      $zero, 0x0214($s0)         ## 00000214
/* 0239C 80B5DB4C 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 023A0 80B5DB50 A2190208 */  sb      $t9, 0x0208($s0)           ## 00000208
glabel L80B5DB54
/* 023A4 80B5DB54 86080214 */  lh      $t0, 0x0214($s0)           ## 00000214
/* 023A8 80B5DB58 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 023AC 80B5DB5C 24057123 */  addiu   $a1, $zero, 0x7123         ## $a1 = 00007123
/* 023B0 80B5DB60 25090001 */  addiu   $t1, $t0, 0x0001           ## $t1 = 00000001
/* 023B4 80B5DB64 A6090214 */  sh      $t1, 0x0214($s0)           ## 00000214
/* 023B8 80B5DB68 860A0214 */  lh      $t2, 0x0214($s0)           ## 00000214
/* 023BC 80B5DB6C 2941000A */  slti    $at, $t2, 0x000A
/* 023C0 80B5DB70 14200006 */  bne     $at, $zero, .L80B5DB8C
/* 023C4 80B5DB74 00000000 */  nop
/* 023C8 80B5DB78 0C042DA0 */  jal     func_8010B680
/* 023CC 80B5DB7C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 023D0 80B5DB80 920B0208 */  lbu     $t3, 0x0208($s0)           ## 00000208
/* 023D4 80B5DB84 256C0001 */  addiu   $t4, $t3, 0x0001           ## $t4 = 00000001
/* 023D8 80B5DB88 A20C0208 */  sb      $t4, 0x0208($s0)           ## 00000208
.L80B5DB8C:
/* 023DC 80B5DB8C 10000098 */  beq     $zero, $zero, .L80B5DDF0
/* 023E0 80B5DB90 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
glabel L80B5DB94
/* 023E4 80B5DB94 0C042F6F */  jal     func_8010BDBC
/* 023E8 80B5DB98 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 023EC 80B5DB9C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 023F0 80B5DBA0 14410017 */  bne     $v0, $at, .L80B5DC00
/* 023F4 80B5DBA4 00000000 */  nop
/* 023F8 80B5DBA8 0C041AF2 */  jal     func_80106BC8
/* 023FC 80B5DBAC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02400 80B5DBB0 10400013 */  beq     $v0, $zero, .L80B5DC00
/* 02404 80B5DBB4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02408 80B5DBB8 0C2D6DEC */  jal     func_80B5B7B0
/* 0240C 80B5DBBC 2405000D */  addiu   $a1, $zero, 0x000D         ## $a1 = 0000000D
/* 02410 80B5DBC0 3C0580B6 */  lui     $a1, %hi(D_80B5E7B8)       ## $a1 = 80B60000
/* 02414 80B5DBC4 24A5E7B8 */  addiu   $a1, $a1, %lo(D_80B5E7B8)  ## $a1 = 80B5E7B8
/* 02418 80B5DBC8 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 0241C 80B5DBCC 0C00D3B0 */  jal     func_80034EC0
/* 02420 80B5DBD0 24060013 */  addiu   $a2, $zero, 0x0013         ## $a2 = 00000013
/* 02424 80B5DBD4 240D0003 */  addiu   $t5, $zero, 0x0003         ## $t5 = 00000003
/* 02428 80B5DBD8 A6000210 */  sh      $zero, 0x0210($s0)         ## 00000210
/* 0242C 80B5DBDC A200020D */  sb      $zero, 0x020D($s0)         ## 0000020D
/* 02430 80B5DBE0 A20D020E */  sb      $t5, 0x020E($s0)           ## 0000020E
/* 02434 80B5DBE4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02438 80B5DBE8 2405207C */  addiu   $a1, $zero, 0x207C         ## $a1 = 0000207C
/* 0243C 80B5DBEC 0C042DA0 */  jal     func_8010B680
/* 02440 80B5DBF0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 02444 80B5DBF4 920E0208 */  lbu     $t6, 0x0208($s0)           ## 00000208
/* 02448 80B5DBF8 25CF0001 */  addiu   $t7, $t6, 0x0001           ## $t7 = 00000001
/* 0244C 80B5DBFC A20F0208 */  sb      $t7, 0x0208($s0)           ## 00000208
.L80B5DC00:
/* 02450 80B5DC00 1000007B */  beq     $zero, $zero, .L80B5DDF0
/* 02454 80B5DC04 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
glabel L80B5DC08
/* 02458 80B5DC08 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0245C 80B5DC0C 0C2D6FE4 */  jal     func_80B5BF90
/* 02460 80B5DC10 24050014 */  addiu   $a1, $zero, 0x0014         ## $a1 = 00000014
/* 02464 80B5DC14 10400004 */  beq     $v0, $zero, .L80B5DC28
/* 02468 80B5DC18 00000000 */  nop
/* 0246C 80B5DC1C 92180208 */  lbu     $t8, 0x0208($s0)           ## 00000208
/* 02470 80B5DC20 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 02474 80B5DC24 A2190208 */  sb      $t9, 0x0208($s0)           ## 00000208
glabel L80B5DC28
.L80B5DC28:
/* 02478 80B5DC28 0C042F6F */  jal     func_8010BDBC
/* 0247C 80B5DC2C 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 02480 80B5DC30 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 02484 80B5DC34 14410015 */  bne     $v0, $at, .L80B5DC8C
/* 02488 80B5DC38 00000000 */  nop
/* 0248C 80B5DC3C 0C041AF2 */  jal     func_80106BC8
/* 02490 80B5DC40 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02494 80B5DC44 10400011 */  beq     $v0, $zero, .L80B5DC8C
/* 02498 80B5DC48 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0249C 80B5DC4C 2405207D */  addiu   $a1, $zero, 0x207D         ## $a1 = 0000207D
/* 024A0 80B5DC50 0C042DA0 */  jal     func_8010B680
/* 024A4 80B5DC54 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 024A8 80B5DC58 3C0580B6 */  lui     $a1, %hi(D_80B5E7B8)       ## $a1 = 80B60000
/* 024AC 80B5DC5C 24A5E7B8 */  addiu   $a1, $a1, %lo(D_80B5E7B8)  ## $a1 = 80B5E7B8
/* 024B0 80B5DC60 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 024B4 80B5DC64 0C00D3B0 */  jal     func_80034EC0
/* 024B8 80B5DC68 24060007 */  addiu   $a2, $zero, 0x0007         ## $a2 = 00000007
/* 024BC 80B5DC6C A6000216 */  sh      $zero, 0x0216($s0)         ## 00000216
/* 024C0 80B5DC70 86090216 */  lh      $t1, 0x0216($s0)           ## 00000216
/* 024C4 80B5DC74 24080005 */  addiu   $t0, $zero, 0x0005         ## $t0 = 00000005
/* 024C8 80B5DC78 A6000210 */  sh      $zero, 0x0210($s0)         ## 00000210
/* 024CC 80B5DC7C A200020D */  sb      $zero, 0x020D($s0)         ## 0000020D
/* 024D0 80B5DC80 A200020E */  sb      $zero, 0x020E($s0)         ## 0000020E
/* 024D4 80B5DC84 A2080208 */  sb      $t0, 0x0208($s0)           ## 00000208
/* 024D8 80B5DC88 A209020F */  sb      $t1, 0x020F($s0)           ## 0000020F
.L80B5DC8C:
/* 024DC 80B5DC8C 10000058 */  beq     $zero, $zero, .L80B5DDF0
/* 024E0 80B5DC90 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
glabel L80B5DC94
/* 024E4 80B5DC94 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 024E8 80B5DC98 0C2D6FE4 */  jal     func_80B5BF90
/* 024EC 80B5DC9C 24050008 */  addiu   $a1, $zero, 0x0008         ## $a1 = 00000008
/* 024F0 80B5DCA0 10400004 */  beq     $v0, $zero, .L80B5DCB4
/* 024F4 80B5DCA4 00000000 */  nop
/* 024F8 80B5DCA8 920A0208 */  lbu     $t2, 0x0208($s0)           ## 00000208
/* 024FC 80B5DCAC 254B0001 */  addiu   $t3, $t2, 0x0001           ## $t3 = 00000001
/* 02500 80B5DCB0 A20B0208 */  sb      $t3, 0x0208($s0)           ## 00000208
glabel L80B5DCB4
.L80B5DCB4:
/* 02504 80B5DCB4 0C042F6F */  jal     func_8010BDBC
/* 02508 80B5DCB8 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 0250C 80B5DCBC 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 02510 80B5DCC0 14410005 */  bne     $v0, $at, .L80B5DCD8
/* 02514 80B5DCC4 00000000 */  nop
/* 02518 80B5DCC8 0C041AF2 */  jal     func_80106BC8
/* 0251C 80B5DCCC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02520 80B5DCD0 54400004 */  bnel    $v0, $zero, .L80B5DCE4
/* 02524 80B5DCD4 862C07A0 */  lh      $t4, 0x07A0($s1)           ## 000007A0
.L80B5DCD8:
/* 02528 80B5DCD8 10000045 */  beq     $zero, $zero, .L80B5DDF0
/* 0252C 80B5DCDC 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
/* 02530 80B5DCE0 862C07A0 */  lh      $t4, 0x07A0($s1)           ## 000007A0
.L80B5DCE4:
/* 02534 80B5DCE4 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 02538 80B5DCE8 000C6880 */  sll     $t5, $t4,  2
/* 0253C 80B5DCEC 022D7021 */  addu    $t6, $s1, $t5
/* 02540 80B5DCF0 0C0169DF */  jal     Camera_ChangeSetting
/* 02544 80B5DCF4 8DC40790 */  lw      $a0, 0x0790($t6)           ## 00000790
/* 02548 80B5DCF8 240F0007 */  addiu   $t7, $zero, 0x0007         ## $t7 = 00000007
/* 0254C 80B5DCFC 3C190001 */  lui     $t9, 0x0001                ## $t9 = 00010000
/* 02550 80B5DD00 A20F0208 */  sb      $t7, 0x0208($s0)           ## 00000208
/* 02554 80B5DD04 0331C821 */  addu    $t9, $t9, $s1
/* 02558 80B5DD08 8F391D5C */  lw      $t9, 0x1D5C($t9)           ## 00011D5C
/* 0255C 80B5DD0C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02560 80B5DD10 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 02564 80B5DD14 0320F809 */  jalr    $ra, $t9
/* 02568 80B5DD18 00000000 */  nop
/* 0256C 80B5DD1C C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 02570 80B5DD20 C6100094 */  lwc1    $f16, 0x0094($s0)          ## 00000094
/* 02574 80B5DD24 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 02578 80B5DD28 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 0257C 80B5DD2C 46009485 */  abs.s   $f18, $f18
/* 02580 80B5DD30 46008405 */  abs.s   $f16, $f16
/* 02584 80B5DD34 460E9480 */  add.s   $f18, $f18, $f14
/* 02588 80B5DD38 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0258C 80B5DD3C 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02590 80B5DD40 460E8380 */  add.s   $f14, $f16, $f14
/* 02594 80B5DD44 44079000 */  mfc1    $a3, $f18
/* 02598 80B5DD48 2406000B */  addiu   $a2, $zero, 0x000B         ## $a2 = 0000000B
/* 0259C 80B5DD4C 0C00BD0D */  jal     func_8002F434
/* 025A0 80B5DD50 E7AE0010 */  swc1    $f14, 0x0010($sp)
/* 025A4 80B5DD54 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 025A8 80B5DD58 00310821 */  addu    $at, $at, $s1
/* 025AC 80B5DD5C 24180004 */  addiu   $t8, $zero, 0x0004         ## $t8 = 00000004
/* 025B0 80B5DD60 A03804BF */  sb      $t8, 0x04BF($at)           ## 000104BF
/* 025B4 80B5DD64 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 025B8 80B5DD68 00310821 */  addu    $at, $at, $s1
/* 025BC 80B5DD6C 24080036 */  addiu   $t0, $zero, 0x0036         ## $t0 = 00000036
/* 025C0 80B5DD70 A02803DC */  sb      $t0, 0x03DC($at)           ## 000103DC
/* 025C4 80B5DD74 1000001E */  beq     $zero, $zero, .L80B5DDF0
/* 025C8 80B5DD78 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
glabel L80B5DD7C
/* 025CC 80B5DD7C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 025D0 80B5DD80 0C00BD04 */  jal     Actor_HasParent              
/* 025D4 80B5DD84 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 025D8 80B5DD88 1040000A */  beq     $v0, $zero, .L80B5DDB4
/* 025DC 80B5DD8C 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 025E0 80B5DD90 3C0580B6 */  lui     $a1, %hi(D_80B5E7B8)       ## $a1 = 80B60000
/* 025E4 80B5DD94 24A5E7B8 */  addiu   $a1, $a1, %lo(D_80B5E7B8)  ## $a1 = 80B5E7B8
/* 025E8 80B5DD98 0C00D3B0 */  jal     func_80034EC0
/* 025EC 80B5DD9C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 025F0 80B5DDA0 92090208 */  lbu     $t1, 0x0208($s0)           ## 00000208
/* 025F4 80B5DDA4 252A0001 */  addiu   $t2, $t1, 0x0001           ## $t2 = 00000001
/* 025F8 80B5DDA8 A20A0208 */  sb      $t2, 0x0208($s0)           ## 00000208
/* 025FC 80B5DDAC 10000010 */  beq     $zero, $zero, .L80B5DDF0
/* 02600 80B5DDB0 314300FF */  andi    $v1, $t2, 0x00FF           ## $v1 = 00000001
.L80B5DDB4:
/* 02604 80B5DDB4 C6120090 */  lwc1    $f18, 0x0090($s0)          ## 00000090
/* 02608 80B5DDB8 C6100094 */  lwc1    $f16, 0x0094($s0)          ## 00000094
/* 0260C 80B5DDBC 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 02610 80B5DDC0 44817000 */  mtc1    $at, $f14                  ## $f14 = 1.00
/* 02614 80B5DDC4 46009485 */  abs.s   $f18, $f18
/* 02618 80B5DDC8 46008405 */  abs.s   $f16, $f16
/* 0261C 80B5DDCC 460E9480 */  add.s   $f18, $f18, $f14
/* 02620 80B5DDD0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02624 80B5DDD4 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 02628 80B5DDD8 460E8380 */  add.s   $f14, $f16, $f14
/* 0262C 80B5DDDC 44079000 */  mfc1    $a3, $f18
/* 02630 80B5DDE0 2406000B */  addiu   $a2, $zero, 0x000B         ## $a2 = 0000000B
/* 02634 80B5DDE4 0C00BD0D */  jal     func_8002F434
/* 02638 80B5DDE8 E7AE0010 */  swc1    $f14, 0x0010($sp)
/* 0263C 80B5DDEC 92030208 */  lbu     $v1, 0x0208($s0)           ## 00000208
.L80B5DDF0:
/* 02640 80B5DDF0 24010008 */  addiu   $at, $zero, 0x0008         ## $at = 00000008
/* 02644 80B5DDF4 14610003 */  bne     $v1, $at, .L80B5DE04
/* 02648 80B5DDF8 8FB0001C */  lw      $s0, 0x001C($sp)
/* 0264C 80B5DDFC 10000002 */  beq     $zero, $zero, .L80B5DE08
/* 02650 80B5DE00 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
.L80B5DE04:
/* 02654 80B5DE04 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80B5DE08:
/* 02658 80B5DE08 8FBF0024 */  lw      $ra, 0x0024($sp)
/* 0265C 80B5DE0C 8FB10020 */  lw      $s1, 0x0020($sp)
/* 02660 80B5DE10 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 02664 80B5DE14 03E00008 */  jr      $ra
/* 02668 80B5DE18 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
