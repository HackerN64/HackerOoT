.rdata
glabel D_80154984
    .asciz "../z_message_PAL.c"
    .balign 4

glabel D_80154998
    .asciz "../z_message_PAL.c"
    .balign 4

.text
glabel func_8010F2CC
/* B8646C 8010F2CC 27BDFF98 */  addiu $sp, $sp, -0x68
/* B86470 8010F2D0 AFBF0014 */  sw    $ra, 0x14($sp)
/* B86474 8010F2D4 AFA40068 */  sw    $a0, 0x68($sp)
/* B86478 8010F2D8 3C068015 */  lui   $a2, %hi(D_80154984) # $a2, 0x8015
/* B8647C 8010F2DC 24C64984 */  addiu $a2, %lo(D_80154984) # addiu $a2, $a2, 0x4984
/* B86480 8010F2E0 27A40050 */  addiu $a0, $sp, 0x50
/* B86484 8010F2E4 AFA5006C */  sw    $a1, 0x6c($sp)
/* B86488 8010F2E8 0C031AB1 */  jal   Graph_OpenDisps
/* B8648C 8010F2EC 24070D9D */   li    $a3, 3485
/* B86490 8010F2F0 8FAE0068 */  lw    $t6, 0x68($sp)
/* B86494 8010F2F4 3C0F8015 */  lui   $t7, %hi(D_80153CF8) # $t7, 0x8015
/* B86498 8010F2F8 85EF3CF8 */  lh    $t7, %lo(D_80153CF8)($t7)
/* B8649C 8010F2FC 85C20000 */  lh    $v0, ($t6)
/* B864A0 8010F300 8FA5006C */  lw    $a1, 0x6c($sp)
/* B864A4 8010F304 3C018015 */  lui   $at, %hi(D_80153CF8) # $at, 0x8015
/* B864A8 8010F308 11E20004 */  beq   $t7, $v0, .L8010F31C
/* B864AC 8010F30C 2403001E */   li    $v1, 30
/* B864B0 8010F310 A4223CF8 */  sh    $v0, %lo(D_80153CF8)($at)
/* B864B4 8010F314 3C018015 */  lui   $at, %hi(D_80153CFC) # $at, 0x8015
/* B864B8 8010F318 A4233CFC */  sh    $v1, %lo(D_80153CFC)($at)
.L8010F31C:
/* B864BC 8010F31C 3C038015 */  lui   $v1, %hi(D_80153CFC) # $v1, 0x8015
/* B864C0 8010F320 84633CFC */  lh    $v1, %lo(D_80153CFC)($v1)
/* B864C4 8010F324 3C018015 */  lui   $at, %hi(D_80153CFC) # $at, 0x8015
/* B864C8 8010F328 3C04E700 */  lui   $a0, 0xe700
/* B864CC 8010F32C 10600050 */  beqz  $v1, .L8010F470
/* B864D0 8010F330 3C06E300 */   lui   $a2, (0xE3000A01 >> 16) # lui $a2, 0xe300
/* B864D4 8010F334 2463FFFF */  addiu $v1, $v1, -1
/* B864D8 8010F338 00031C00 */  sll   $v1, $v1, 0x10
/* B864DC 8010F33C 00031C03 */  sra   $v1, $v1, 0x10
/* B864E0 8010F340 A4233CFC */  sh    $v1, %lo(D_80153CFC)($at)
/* B864E4 8010F344 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B864E8 8010F348 34C60A01 */  ori   $a2, (0xE3000A01 & 0xFFFF) # ori $a2, $a2, 0xa01
/* B864EC 8010F34C 3C070030 */  lui   $a3, 0x30
/* B864F0 8010F350 24580008 */  addiu $t8, $v0, 8
/* B864F4 8010F354 ACB802C0 */  sw    $t8, 0x2c0($a1)
/* B864F8 8010F358 AC400004 */  sw    $zero, 4($v0)
/* B864FC 8010F35C AC440000 */  sw    $a0, ($v0)
/* B86500 8010F360 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86504 8010F364 3C08E200 */  lui   $t0, (0xE200001C >> 16) # lui $t0, 0xe200
/* B86508 8010F368 3508001C */  ori   $t0, (0xE200001C & 0xFFFF) # ori $t0, $t0, 0x1c
/* B8650C 8010F36C 24590008 */  addiu $t9, $v0, 8
/* B86510 8010F370 ACB902C0 */  sw    $t9, 0x2c0($a1)
/* B86514 8010F374 AC470004 */  sw    $a3, 4($v0)
/* B86518 8010F378 AC460000 */  sw    $a2, ($v0)
/* B8651C 8010F37C 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86520 8010F380 3C0C0001 */  lui   $t4, (0x00010001 >> 16) # lui $t4, 1
/* B86524 8010F384 358C0001 */  ori   $t4, (0x00010001 & 0xFFFF) # ori $t4, $t4, 1
/* B86528 8010F388 244A0008 */  addiu $t2, $v0, 8
/* B8652C 8010F38C ACAA02C0 */  sw    $t2, 0x2c0($a1)
/* B86530 8010F390 AC400004 */  sw    $zero, 4($v0)
/* B86534 8010F394 AC480000 */  sw    $t0, ($v0)
/* B86538 8010F398 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B8653C 8010F39C 3C09F700 */  lui   $t1, 0xf700
/* B86540 8010F3A0 3C0EF64F */  lui   $t6, (0xF64FC258 >> 16) # lui $t6, 0xf64f
/* B86544 8010F3A4 244B0008 */  addiu $t3, $v0, 8
/* B86548 8010F3A8 ACAB02C0 */  sw    $t3, 0x2c0($a1)
/* B8654C 8010F3AC AC4C0004 */  sw    $t4, 4($v0)
/* B86550 8010F3B0 AC490000 */  sw    $t1, ($v0)
/* B86554 8010F3B4 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86558 8010F3B8 35CEC258 */  ori   $t6, (0xF64FC258 & 0xFFFF) # ori $t6, $t6, 0xc258
/* B8655C 8010F3BC 240F01B8 */  li    $t7, 440
/* B86560 8010F3C0 244D0008 */  addiu $t5, $v0, 8
/* B86564 8010F3C4 ACAD02C0 */  sw    $t5, 0x2c0($a1)
/* B86568 8010F3C8 AC4F0004 */  sw    $t7, 4($v0)
/* B8656C 8010F3CC AC4E0000 */  sw    $t6, ($v0)
/* B86570 8010F3D0 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86574 8010F3D4 240DFFFF */  li    $t5, -1
/* B86578 8010F3D8 3C0FF60F */  lui   $t7, (0xF60F0230 >> 16) # lui $t7, 0xf60f
/* B8657C 8010F3DC 24580008 */  addiu $t8, $v0, 8
/* B86580 8010F3E0 ACB802C0 */  sw    $t8, 0x2c0($a1)
/* B86584 8010F3E4 AC400004 */  sw    $zero, 4($v0)
/* B86588 8010F3E8 AC440000 */  sw    $a0, ($v0)
/* B8658C 8010F3EC 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86590 8010F3F0 3C18000A */  lui   $t8, (0x000A01E0 >> 16) # lui $t8, 0xa
/* B86594 8010F3F4 371801E0 */  ori   $t8, (0x000A01E0 & 0xFFFF) # ori $t8, $t8, 0x1e0
/* B86598 8010F3F8 24590008 */  addiu $t9, $v0, 8
/* B8659C 8010F3FC ACB902C0 */  sw    $t9, 0x2c0($a1)
/* B865A0 8010F400 AC400004 */  sw    $zero, 4($v0)
/* B865A4 8010F404 AC440000 */  sw    $a0, ($v0)
/* B865A8 8010F408 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B865AC 8010F40C 35EF0230 */  ori   $t7, (0xF60F0230 & 0xFFFF) # ori $t7, $t7, 0x230
/* B865B0 8010F410 244A0008 */  addiu $t2, $v0, 8
/* B865B4 8010F414 ACAA02C0 */  sw    $t2, 0x2c0($a1)
/* B865B8 8010F418 AC470004 */  sw    $a3, 4($v0)
/* B865BC 8010F41C AC460000 */  sw    $a2, ($v0)
/* B865C0 8010F420 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B865C4 8010F424 244B0008 */  addiu $t3, $v0, 8
/* B865C8 8010F428 ACAB02C0 */  sw    $t3, 0x2c0($a1)
/* B865CC 8010F42C AC400004 */  sw    $zero, 4($v0)
/* B865D0 8010F430 AC480000 */  sw    $t0, ($v0)
/* B865D4 8010F434 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B865D8 8010F438 244C0008 */  addiu $t4, $v0, 8
/* B865DC 8010F43C ACAC02C0 */  sw    $t4, 0x2c0($a1)
/* B865E0 8010F440 AC4D0004 */  sw    $t5, 4($v0)
/* B865E4 8010F444 AC490000 */  sw    $t1, ($v0)
/* B865E8 8010F448 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B865EC 8010F44C 244E0008 */  addiu $t6, $v0, 8
/* B865F0 8010F450 ACAE02C0 */  sw    $t6, 0x2c0($a1)
/* B865F4 8010F454 AC580004 */  sw    $t8, 4($v0)
/* B865F8 8010F458 AC4F0000 */  sw    $t7, ($v0)
/* B865FC 8010F45C 8CA202C0 */  lw    $v0, 0x2c0($a1)
/* B86600 8010F460 24590008 */  addiu $t9, $v0, 8
/* B86604 8010F464 ACB902C0 */  sw    $t9, 0x2c0($a1)
/* B86608 8010F468 AC400004 */  sw    $zero, 4($v0)
/* B8660C 8010F46C AC440000 */  sw    $a0, ($v0)
.L8010F470:
/* B86610 8010F470 3C068015 */  lui   $a2, %hi(D_80154998) # $a2, 0x8015
/* B86614 8010F474 24C64998 */  addiu $a2, %lo(D_80154998) # addiu $a2, $a2, 0x4998
/* B86618 8010F478 27A40050 */  addiu $a0, $sp, 0x50
/* B8661C 8010F47C 0C031AD5 */  jal   Graph_CloseDisps
/* B86620 8010F480 24070DB9 */   li    $a3, 3513
/* B86624 8010F484 8FBF0014 */  lw    $ra, 0x14($sp)
/* B86628 8010F488 27BD0068 */  addiu $sp, $sp, 0x68
/* B8662C 8010F48C 03E00008 */  jr    $ra
/* B86630 8010F490 00000000 */   nop   

