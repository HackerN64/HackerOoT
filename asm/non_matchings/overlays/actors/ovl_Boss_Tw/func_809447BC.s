.rdata
glabel D_8094ACD8
    .asciz "../z_boss_tw.c"
    .balign 4

glabel D_8094ACE8
    .asciz "../z_boss_tw.c"
    .balign 4

glabel D_8094ACF8
    .asciz "../z_boss_tw.c"
    .balign 4

glabel D_8094AD08
    .asciz "../z_boss_tw.c"
    .balign 4

glabel D_8094AD18
    .asciz "../z_boss_tw.c"
    .balign 4

glabel D_8094AD28
    .asciz "../z_boss_tw.c"
    .balign 4

.late_rodata
glabel D_8094B15C
    .float 1.57079637051

glabel D_8094B160
    .float 1.57079637051

.text
glabel func_809447BC
/* 0BAEC 809447BC 27BDFF68 */  addiu   $sp, $sp, 0xFF68           ## $sp = FFFFFF68
/* 0BAF0 809447C0 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 0BAF4 809447C4 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 0BAF8 809447C8 AFA40098 */  sw      $a0, 0x0098($sp)           
/* 0BAFC 809447CC AFA5009C */  sw      $a1, 0x009C($sp)           
/* 0BB00 809447D0 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0BB04 809447D4 3C068095 */  lui     $a2, %hi(D_8094ACD8)       ## $a2 = 80950000
/* 0BB08 809447D8 24C6ACD8 */  addiu   $a2, $a2, %lo(D_8094ACD8)  ## $a2 = 8094ACD8
/* 0BB0C 809447DC 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFE8
/* 0BB10 809447E0 24071D7A */  addiu   $a3, $zero, 0x1D7A         ## $a3 = 00001D7A
/* 0BB14 809447E4 0C031AB1 */  jal     Graph_OpenDisps              
/* 0BB18 809447E8 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0BB1C 809447EC 8FAF009C */  lw      $t7, 0x009C($sp)           
/* 0BB20 809447F0 0C024F61 */  jal     func_80093D84              
/* 0BB24 809447F4 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 0BB28 809447F8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BB2C 809447FC 3C19DB06 */  lui     $t9, 0xDB06                ## $t9 = DB060000
/* 0BB30 80944800 37390020 */  ori     $t9, $t9, 0x0020           ## $t9 = DB060020
/* 0BB34 80944804 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 0BB38 80944808 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 0BB3C 8094480C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0BB40 80944810 8FAA0098 */  lw      $t2, 0x0098($sp)           
/* 0BB44 80944814 8FA9009C */  lw      $t1, 0x009C($sp)           
/* 0BB48 80944818 240B0020 */  addiu   $t3, $zero, 0x0020         ## $t3 = 00000020
/* 0BB4C 8094481C 85470150 */  lh      $a3, 0x0150($t2)           ## 00000150
/* 0BB50 80944820 8D240000 */  lw      $a0, 0x0000($t1)           ## 00000000
/* 0BB54 80944824 240C0040 */  addiu   $t4, $zero, 0x0040         ## $t4 = 00000040
/* 0BB58 80944828 00073823 */  subu    $a3, $zero, $a3            
/* 0BB5C 8094482C 00E00821 */  addu    $at, $a3, $zero            
/* 0BB60 80944830 00073900 */  sll     $a3, $a3,  4               
/* 0BB64 80944834 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 0BB68 80944838 240E0040 */  addiu   $t6, $zero, 0x0040         ## $t6 = 00000040
/* 0BB6C 8094483C 240F0040 */  addiu   $t7, $zero, 0x0040         ## $t7 = 00000040
/* 0BB70 80944840 AFAF0028 */  sw      $t7, 0x0028($sp)           
/* 0BB74 80944844 AFAE0024 */  sw      $t6, 0x0024($sp)           
/* 0BB78 80944848 AFAD0018 */  sw      $t5, 0x0018($sp)           
/* 0BB7C 8094484C 00E13823 */  subu    $a3, $a3, $at              
/* 0BB80 80944850 AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 0BB84 80944854 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 0BB88 80944858 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0BB8C 8094485C AFAB0010 */  sw      $t3, 0x0010($sp)           
/* 0BB90 80944860 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 0BB94 80944864 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 0BB98 80944868 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 0BB9C 8094486C AFA2007C */  sw      $v0, 0x007C($sp)           
/* 0BBA0 80944870 8FA3007C */  lw      $v1, 0x007C($sp)           
/* 0BBA4 80944874 0C034213 */  jal     Matrix_Push              
/* 0BBA8 80944878 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0BBAC 8094487C 3C014368 */  lui     $at, 0x4368                ## $at = 43680000
/* 0BBB0 80944880 44817000 */  mtc1    $at, $f14                  ## $f14 = 232.00
/* 0BBB4 80944884 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 0BBB8 80944888 3C06C416 */  lui     $a2, 0xC416                ## $a2 = C4160000
/* 0BBBC 8094488C 0C034261 */  jal     Matrix_Translate              
/* 0BBC0 80944890 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0BBC4 80944894 8FB80098 */  lw      $t8, 0x0098($sp)           
/* 0BBC8 80944898 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0BBCC 8094489C C70C04E0 */  lwc1    $f12, 0x04E0($t8)          ## 000004E0
/* 0BBD0 809448A0 44066000 */  mfc1    $a2, $f12                  
/* 0BBD4 809448A4 0C0342A3 */  jal     Matrix_Scale              
/* 0BBD8 809448A8 46006386 */  mov.s   $f14, $f12                 
/* 0BBDC 809448AC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BBE0 809448B0 3C09FA00 */  lui     $t1, 0xFA00                ## $t1 = FA000000
/* 0BBE4 809448B4 3C058095 */  lui     $a1, %hi(D_8094ACE8)       ## $a1 = 80950000
/* 0BBE8 809448B8 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 0BBEC 809448BC AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 0BBF0 809448C0 AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 0BBF4 809448C4 8FAA0098 */  lw      $t2, 0x0098($sp)           
/* 0BBF8 809448C8 3C19DA38 */  lui     $t9, 0xDA38                ## $t9 = DA380000
/* 0BBFC 809448CC 37390003 */  ori     $t9, $t9, 0x0003           ## $t9 = DA380003
/* 0BC00 809448D0 C54404D8 */  lwc1    $f4, 0x04D8($t2)           ## 000004D8
/* 0BC04 809448D4 24A5ACE8 */  addiu   $a1, $a1, %lo(D_8094ACE8)  ## $a1 = 8094ACE8
/* 0BC08 809448D8 24061D9E */  addiu   $a2, $zero, 0x1D9E         ## $a2 = 00001D9E
/* 0BC0C 809448DC 4600218D */  trunc.w.s $f6, $f4                   
/* 0BC10 809448E0 440E3000 */  mfc1    $t6, $f6                   
/* 0BC14 809448E4 00000000 */  nop
/* 0BC18 809448E8 31CF00FF */  andi    $t7, $t6, 0x00FF           ## $t7 = 00000000
/* 0BC1C 809448EC AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 0BC20 809448F0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BC24 809448F4 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 0BC28 809448F8 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 0BC2C 809448FC AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0BC30 80944900 8FA9009C */  lw      $t1, 0x009C($sp)           
/* 0BC34 80944904 8D240000 */  lw      $a0, 0x0000($t1)           ## FA000000
/* 0BC38 80944908 0C0346A2 */  jal     Matrix_NewMtx              
/* 0BC3C 8094490C AFA20074 */  sw      $v0, 0x0074($sp)           
/* 0BC40 80944910 8FA30074 */  lw      $v1, 0x0074($sp)           
/* 0BC44 80944914 3C040602 */  lui     $a0, %hi(D_0601EC68)                ## $a0 = 06020000
/* 0BC48 80944918 2484EC68 */  addiu   $a0, $a0, %lo(D_0601EC68)           ## $a0 = 0601EC68
/* 0BC4C 8094491C AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0BC50 80944920 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BC54 80944924 00046100 */  sll     $t4, $a0,  4               
/* 0BC58 80944928 000C6F02 */  srl     $t5, $t4, 28               
/* 0BC5C 8094492C 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 0BC60 80944930 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0BC64 80944934 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 0BC68 80944938 25EF6FA8 */  addiu   $t7, %lo(gSegments)
/* 0BC6C 8094493C 000D7080 */  sll     $t6, $t5,  2               
/* 0BC70 80944940 3C0BDE00 */  lui     $t3, 0xDE00                ## $t3 = DE000000
/* 0BC74 80944944 01CF2821 */  addu    $a1, $t6, $t7              
/* 0BC78 80944948 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0BC7C 8094494C AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 0BC80 80944950 8CB80000 */  lw      $t8, 0x0000($a1)           ## 00000000
/* 0BC84 80944954 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0BC88 80944958 00814024 */  and     $t0, $a0, $at              
/* 0BC8C 8094495C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0BC90 80944960 0308C821 */  addu    $t9, $t8, $t0              
/* 0BC94 80944964 03214821 */  addu    $t1, $t9, $at              
/* 0BC98 80944968 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 0BC9C 8094496C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BCA0 80944970 3C0BFA00 */  lui     $t3, 0xFA00                ## $t3 = FA000000
/* 0BCA4 80944974 3C0187AF */  lui     $at, 0x87AF                ## $at = 87AF0000
/* 0BCA8 80944978 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0BCAC 8094497C AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 0BCB0 80944980 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 0BCB4 80944984 8FAC0098 */  lw      $t4, 0x0098($sp)           
/* 0BCB8 80944988 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 0BCBC 8094498C 3421A500 */  ori     $at, $at, 0xA500           ## $at = 87AFA500
/* 0BCC0 80944990 C58804D8 */  lwc1    $f8, 0x04D8($t4)           ## 000004D8
/* 0BCC4 80944994 44066000 */  mfc1    $a2, $f12                  
/* 0BCC8 80944998 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0BCCC 8094499C 4600428D */  trunc.w.s $f10, $f8                  
/* 0BCD0 809449A0 44185000 */  mfc1    $t8, $f10                  
/* 0BCD4 809449A4 00000000 */  nop
/* 0BCD8 809449A8 331900FF */  andi    $t9, $t8, 0x00FF           ## $t9 = 00000000
/* 0BCDC 809449AC 03214825 */  or      $t1, $t9, $at              ## $t1 = 87AFA500
/* 0BCE0 809449B0 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 0BCE4 809449B4 44817000 */  mtc1    $at, $f14                  ## $f14 = 2.00
/* 0BCE8 809449B8 AC490004 */  sw      $t1, 0x0004($v0)           ## 00000004
/* 0BCEC 809449BC AFA80044 */  sw      $t0, 0x0044($sp)           
/* 0BCF0 809449C0 0C034261 */  jal     Matrix_Translate              
/* 0BCF4 809449C4 AFA50048 */  sw      $a1, 0x0048($sp)           
/* 0BCF8 809449C8 3C018095 */  lui     $at, %hi(D_8094B15C)       ## $at = 80950000
/* 0BCFC 809449CC C42CB15C */  lwc1    $f12, %lo(D_8094B15C)($at) 
/* 0BD00 809449D0 0C0342DC */  jal     Matrix_RotateX              
/* 0BD04 809449D4 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0BD08 809449D8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BD0C 809449DC 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 0BD10 809449E0 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 0BD14 809449E4 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 0BD18 809449E8 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 0BD1C 809449EC AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 0BD20 809449F0 8FAC009C */  lw      $t4, 0x009C($sp)           
/* 0BD24 809449F4 3C058095 */  lui     $a1, %hi(D_8094ACF8)       ## $a1 = 80950000
/* 0BD28 809449F8 24A5ACF8 */  addiu   $a1, $a1, %lo(D_8094ACF8)  ## $a1 = 8094ACF8
/* 0BD2C 809449FC 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 0BD30 80944A00 24061DAC */  addiu   $a2, $zero, 0x1DAC         ## $a2 = 00001DAC
/* 0BD34 80944A04 0C0346A2 */  jal     Matrix_NewMtx              
/* 0BD38 80944A08 AFA20068 */  sw      $v0, 0x0068($sp)           
/* 0BD3C 80944A0C 8FA30068 */  lw      $v1, 0x0068($sp)           
/* 0BD40 80944A10 3C040602 */  lui     $a0, %hi(D_0601CEE0)                ## $a0 = 06020000
/* 0BD44 80944A14 2484CEE0 */  addiu   $a0, $a0, %lo(D_0601CEE0)           ## $a0 = 0601CEE0
/* 0BD48 80944A18 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0BD4C 80944A1C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BD50 80944A20 00047900 */  sll     $t7, $a0,  4               
/* 0BD54 80944A24 000FC702 */  srl     $t8, $t7, 28               
/* 0BD58 80944A28 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 0BD5C 80944A2C AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 0BD60 80944A30 0018C880 */  sll     $t9, $t8,  2               
/* 0BD64 80944A34 3C0EDE00 */  lui     $t6, 0xDE00                ## $t6 = DE000000
/* 0BD68 80944A38 3C098016 */  lui     $t1, %hi(gSegments)
/* 0BD6C 80944A3C 01394821 */  addu    $t1, $t1, $t9              
/* 0BD70 80944A40 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0BD74 80944A44 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 0BD78 80944A48 8D296FA8 */  lw      $t1, %lo(gSegments)($t1)
/* 0BD7C 80944A4C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0BD80 80944A50 00815024 */  and     $t2, $a0, $at              
/* 0BD84 80944A54 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0BD88 80944A58 012A5821 */  addu    $t3, $t1, $t2              
/* 0BD8C 80944A5C 01616021 */  addu    $t4, $t3, $at              
/* 0BD90 80944A60 3C014368 */  lui     $at, 0x4368                ## $at = 43680000
/* 0BD94 80944A64 44817000 */  mtc1    $at, $f14                  ## $f14 = 232.00
/* 0BD98 80944A68 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 0BD9C 80944A6C 3C064416 */  lui     $a2, 0x4416                ## $a2 = 44160000
/* 0BDA0 80944A70 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0BDA4 80944A74 0C034261 */  jal     Matrix_Translate              
/* 0BDA8 80944A78 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 0BDAC 80944A7C 8FAD0098 */  lw      $t5, 0x0098($sp)           
/* 0BDB0 80944A80 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0BDB4 80944A84 C5AC04E0 */  lwc1    $f12, 0x04E0($t5)          ## 000004E0
/* 0BDB8 80944A88 44066000 */  mfc1    $a2, $f12                  
/* 0BDBC 80944A8C 0C0342A3 */  jal     Matrix_Scale              
/* 0BDC0 80944A90 46006386 */  mov.s   $f14, $f12                 
/* 0BDC4 80944A94 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BDC8 80944A98 3C0FFA00 */  lui     $t7, 0xFA00                ## $t7 = FA000000
/* 0BDCC 80944A9C 3C058095 */  lui     $a1, %hi(D_8094AD08)       ## $a1 = 80950000
/* 0BDD0 80944AA0 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 0BDD4 80944AA4 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 0BDD8 80944AA8 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 0BDDC 80944AAC 8FB80098 */  lw      $t8, 0x0098($sp)           
/* 0BDE0 80944AB0 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 0BDE4 80944AB4 35CE0003 */  ori     $t6, $t6, 0x0003           ## $t6 = DA380003
/* 0BDE8 80944AB8 C71004D8 */  lwc1    $f16, 0x04D8($t8)          ## 000004D8
/* 0BDEC 80944ABC 24A5AD08 */  addiu   $a1, $a1, %lo(D_8094AD08)  ## $a1 = 8094AD08
/* 0BDF0 80944AC0 24061DC1 */  addiu   $a2, $zero, 0x1DC1         ## $a2 = 00001DC1
/* 0BDF4 80944AC4 4600848D */  trunc.w.s $f18, $f16                 
/* 0BDF8 80944AC8 440B9000 */  mfc1    $t3, $f18                  
/* 0BDFC 80944ACC 00000000 */  nop
/* 0BE00 80944AD0 316C00FF */  andi    $t4, $t3, 0x00FF           ## $t4 = 00000000
/* 0BE04 80944AD4 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 0BE08 80944AD8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BE0C 80944ADC 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 0BE10 80944AE0 AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 0BE14 80944AE4 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 0BE18 80944AE8 8FAF009C */  lw      $t7, 0x009C($sp)           
/* 0BE1C 80944AEC 8DE40000 */  lw      $a0, 0x0000($t7)           ## FA000000
/* 0BE20 80944AF0 0C0346A2 */  jal     Matrix_NewMtx              
/* 0BE24 80944AF4 AFA2005C */  sw      $v0, 0x005C($sp)           
/* 0BE28 80944AF8 8FA3005C */  lw      $v1, 0x005C($sp)           
/* 0BE2C 80944AFC 3C19DE00 */  lui     $t9, 0xDE00                ## $t9 = DE000000
/* 0BE30 80944B00 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0BE34 80944B04 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0BE38 80944B08 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BE3C 80944B0C 3C0FFA00 */  lui     $t7, 0xFA00                ## $t7 = FA000000
/* 0BE40 80944B10 44806000 */  mtc1    $zero, $f12                ## $f12 = 0.00
/* 0BE44 80944B14 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 0BE48 80944B18 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 0BE4C 80944B1C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0BE50 80944B20 8FA90048 */  lw      $t1, 0x0048($sp)           
/* 0BE54 80944B24 8FAB0044 */  lw      $t3, 0x0044($sp)           
/* 0BE58 80944B28 24060000 */  addiu   $a2, $zero, 0x0000         ## $a2 = 00000000
/* 0BE5C 80944B2C 8D2A0000 */  lw      $t2, 0x0000($t1)           ## 00000000
/* 0BE60 80944B30 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0BE64 80944B34 014B6021 */  addu    $t4, $t2, $t3              
/* 0BE68 80944B38 01816821 */  addu    $t5, $t4, $at              
/* 0BE6C 80944B3C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 0BE70 80944B40 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BE74 80944B44 3C01FFFF */  lui     $at, 0xFFFF                ## $at = FFFF0000
/* 0BE78 80944B48 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 0BE7C 80944B4C AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 0BE80 80944B50 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 0BE84 80944B54 8FB80098 */  lw      $t8, 0x0098($sp)           
/* 0BE88 80944B58 C70404D8 */  lwc1    $f4, 0x04D8($t8)           ## 000004E0
/* 0BE8C 80944B5C 4600218D */  trunc.w.s $f6, $f4                   
/* 0BE90 80944B60 440B3000 */  mfc1    $t3, $f6                   
/* 0BE94 80944B64 00000000 */  nop
/* 0BE98 80944B68 316C00FF */  andi    $t4, $t3, 0x00FF           ## $t4 = 00000000
/* 0BE9C 80944B6C 01816825 */  or      $t5, $t4, $at              ## $t5 = FFFF0000
/* 0BEA0 80944B70 3C014000 */  lui     $at, 0x4000                ## $at = 40000000
/* 0BEA4 80944B74 44817000 */  mtc1    $at, $f14                  ## $f14 = 2.00
/* 0BEA8 80944B78 0C034261 */  jal     Matrix_Translate              
/* 0BEAC 80944B7C AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 0BEB0 80944B80 3C018095 */  lui     $at, %hi(D_8094B160)       ## $at = 80950000
/* 0BEB4 80944B84 C42CB160 */  lwc1    $f12, %lo(D_8094B160)($at) 
/* 0BEB8 80944B88 0C0342DC */  jal     Matrix_RotateX              
/* 0BEBC 80944B8C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0BEC0 80944B90 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BEC4 80944B94 3C0FDA38 */  lui     $t7, 0xDA38                ## $t7 = DA380000
/* 0BEC8 80944B98 35EF0003 */  ori     $t7, $t7, 0x0003           ## $t7 = DA380003
/* 0BECC 80944B9C 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 0BED0 80944BA0 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 0BED4 80944BA4 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 0BED8 80944BA8 8FB8009C */  lw      $t8, 0x009C($sp)           
/* 0BEDC 80944BAC 3C058095 */  lui     $a1, %hi(D_8094AD18)       ## $a1 = 80950000
/* 0BEE0 80944BB0 24A5AD18 */  addiu   $a1, $a1, %lo(D_8094AD18)  ## $a1 = 8094AD18
/* 0BEE4 80944BB4 8F040000 */  lw      $a0, 0x0000($t8)           ## 00000000
/* 0BEE8 80944BB8 24061DCF */  addiu   $a2, $zero, 0x1DCF         ## $a2 = 00001DCF
/* 0BEEC 80944BBC 0C0346A2 */  jal     Matrix_NewMtx              
/* 0BEF0 80944BC0 AFA20050 */  sw      $v0, 0x0050($sp)           
/* 0BEF4 80944BC4 8FA30050 */  lw      $v1, 0x0050($sp)           
/* 0BEF8 80944BC8 3C040602 */  lui     $a0, %hi(D_0601DBE8)                ## $a0 = 06020000
/* 0BEFC 80944BCC 2484DBE8 */  addiu   $a0, $a0, %lo(D_0601DBE8)           ## $a0 = 0601DBE8
/* 0BF00 80944BD0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 0BF04 80944BD4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0BF08 80944BD8 00045100 */  sll     $t2, $a0,  4               
/* 0BF0C 80944BDC 000A5F02 */  srl     $t3, $t2, 28               
/* 0BF10 80944BE0 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 0BF14 80944BE4 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 0BF18 80944BE8 000B6080 */  sll     $t4, $t3,  2               
/* 0BF1C 80944BEC 3C09DE00 */  lui     $t1, 0xDE00                ## $t1 = DE000000
/* 0BF20 80944BF0 3C0D8016 */  lui     $t5, %hi(gSegments)
/* 0BF24 80944BF4 01AC6821 */  addu    $t5, $t5, $t4              
/* 0BF28 80944BF8 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0BF2C 80944BFC AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 0BF30 80944C00 8DAD6FA8 */  lw      $t5, %lo(gSegments)($t5)
/* 0BF34 80944C04 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 0BF38 80944C08 00817024 */  and     $t6, $a0, $at              
/* 0BF3C 80944C0C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 0BF40 80944C10 01AE7821 */  addu    $t7, $t5, $t6              
/* 0BF44 80944C14 01E1C021 */  addu    $t8, $t7, $at              
/* 0BF48 80944C18 0C034221 */  jal     Matrix_Pull              
/* 0BF4C 80944C1C AC580004 */  sw      $t8, 0x0004($v0)           ## 00000004
/* 0BF50 80944C20 8FB9009C */  lw      $t9, 0x009C($sp)           
/* 0BF54 80944C24 3C068095 */  lui     $a2, %hi(D_8094AD28)       ## $a2 = 80950000
/* 0BF58 80944C28 24C6AD28 */  addiu   $a2, $a2, %lo(D_8094AD28)  ## $a2 = 8094AD28
/* 0BF5C 80944C2C 27A40080 */  addiu   $a0, $sp, 0x0080           ## $a0 = FFFFFFE8
/* 0BF60 80944C30 24071DD3 */  addiu   $a3, $zero, 0x1DD3         ## $a3 = 00001DD3
/* 0BF64 80944C34 0C031AD5 */  jal     Graph_CloseDisps              
/* 0BF68 80944C38 8F250000 */  lw      $a1, 0x0000($t9)           ## 00000000
/* 0BF6C 80944C3C 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 0BF70 80944C40 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 0BF74 80944C44 27BD0098 */  addiu   $sp, $sp, 0x0098           ## $sp = 00000000
/* 0BF78 80944C48 03E00008 */  jr      $ra                        
/* 0BF7C 80944C4C 00000000 */  nop
