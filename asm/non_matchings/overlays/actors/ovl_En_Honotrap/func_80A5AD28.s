.rdata
glabel D_80A5B0E4
    .asciz "../z_en_honotrap.c"
    .balign 4

glabel D_80A5B0F8
    .asciz "../z_en_honotrap.c"
    .balign 4

glabel D_80A5B10C
    .asciz "../z_en_honotrap.c"
    .balign 4

.late_rodata
glabel D_80A5B144
    .float 9.58738019108e-05

.text
glabel func_80A5AD28
/* 010F8 80A5AD28 27BDFF80 */  addiu   $sp, $sp, 0xFF80           ## $sp = FFFFFF80
/* 010FC 80A5AD2C AFB20040 */  sw      $s2, 0x0040($sp)           
/* 01100 80A5AD30 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 01104 80A5AD34 AFBF0044 */  sw      $ra, 0x0044($sp)           
/* 01108 80A5AD38 AFB1003C */  sw      $s1, 0x003C($sp)           
/* 0110C 80A5AD3C AFB00038 */  sw      $s0, 0x0038($sp)           
/* 01110 80A5AD40 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 01114 80A5AD44 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 01118 80A5AD48 3C0680A6 */  lui     $a2, %hi(D_80A5B0E4)       ## $a2 = 80A60000
/* 0111C 80A5AD4C 24C6B0E4 */  addiu   $a2, $a2, %lo(D_80A5B0E4)  ## $a2 = 80A5B0E4
/* 01120 80A5AD50 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFE4
/* 01124 80A5AD54 240703E8 */  addiu   $a3, $zero, 0x03E8         ## $a3 = 000003E8
/* 01128 80A5AD58 0C031AB1 */  jal     Graph_OpenDisps              
/* 0112C 80A5AD5C 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 01130 80A5AD60 0C024F61 */  jal     func_80093D84              
/* 01134 80A5AD64 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 01138 80A5AD68 862E023E */  lh      $t6, 0x023E($s1)           ## 0000023E
/* 0113C 80A5AD6C 3C09DB06 */  lui     $t1, 0xDB06                ## $t1 = DB060000
/* 01140 80A5AD70 35290020 */  ori     $t1, $t1, 0x0020           ## $t1 = DB060020
/* 01144 80A5AD74 25CFFFEC */  addiu   $t7, $t6, 0xFFEC           ## $t7 = FFFFFFEC
/* 01148 80A5AD78 A62F023E */  sh      $t7, 0x023E($s1)           ## 0000023E
/* 0114C 80A5AD7C 8638023E */  lh      $t8, 0x023E($s1)           ## 0000023E
/* 01150 80A5AD80 240A0020 */  addiu   $t2, $zero, 0x0020         ## $t2 = 00000020
/* 01154 80A5AD84 240B0040 */  addiu   $t3, $zero, 0x0040         ## $t3 = 00000040
/* 01158 80A5AD88 331901FF */  andi    $t9, $t8, 0x01FF           ## $t9 = 00000000
/* 0115C 80A5AD8C A639023E */  sh      $t9, 0x023E($s1)           ## 0000023E
/* 01160 80A5AD90 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01164 80A5AD94 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 01168 80A5AD98 240F0080 */  addiu   $t7, $zero, 0x0080         ## $t7 = 00000080
/* 0116C 80A5AD9C 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 01170 80A5ADA0 AE0802D0 */  sw      $t0, 0x02D0($s0)           ## 000002D0
/* 01174 80A5ADA4 AC490000 */  sw      $t1, 0x0000($v0)           ## 00000000
/* 01178 80A5ADA8 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 0117C 80A5ADAC AFA0001C */  sw      $zero, 0x001C($sp)         
/* 01180 80A5ADB0 AFAC0018 */  sw      $t4, 0x0018($sp)           
/* 01184 80A5ADB4 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 01188 80A5ADB8 AFAA0010 */  sw      $t2, 0x0010($sp)           
/* 0118C 80A5ADBC 862D023E */  lh      $t5, 0x023E($s1)           ## 0000023E
/* 01190 80A5ADC0 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 01194 80A5ADC4 AFAE0024 */  sw      $t6, 0x0024($sp)           
/* 01198 80A5ADC8 AFAF0028 */  sw      $t7, 0x0028($sp)           
/* 0119C 80A5ADCC 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 011A0 80A5ADD0 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 011A4 80A5ADD4 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 011A8 80A5ADD8 AFA20060 */  sw      $v0, 0x0060($sp)           
/* 011AC 80A5ADDC 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 011B0 80A5ADE0 AFAD0020 */  sw      $t5, 0x0020($sp)           
/* 011B4 80A5ADE4 8FA30060 */  lw      $v1, 0x0060($sp)           
/* 011B8 80A5ADE8 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 011BC 80A5ADEC 3C08FFC8 */  lui     $t0, 0xFFC8                ## $t0 = FFC80000
/* 011C0 80A5ADF0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 011C4 80A5ADF4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 011C8 80A5ADF8 350800FF */  ori     $t0, $t0, 0x00FF           ## $t0 = FFC800FF
/* 011CC 80A5ADFC 37398080 */  ori     $t9, $t9, 0x8080           ## $t9 = FA008080
/* 011D0 80A5AE00 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 011D4 80A5AE04 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 011D8 80A5AE08 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
/* 011DC 80A5AE0C AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 011E0 80A5AE10 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 011E4 80A5AE14 3C0AFB00 */  lui     $t2, 0xFB00                ## $t2 = FB000000
/* 011E8 80A5AE18 3C0BFF00 */  lui     $t3, 0xFF00                ## $t3 = FF000000
/* 011EC 80A5AE1C 24490008 */  addiu   $t1, $v0, 0x0008           ## $t1 = 00000008
/* 011F0 80A5AE20 AE0902D0 */  sw      $t1, 0x02D0($s0)           ## 000002D0
/* 011F4 80A5AE24 AC4B0004 */  sw      $t3, 0x0004($v0)           ## 00000004
/* 011F8 80A5AE28 AC4A0000 */  sw      $t2, 0x0000($v0)           ## 00000000
/* 011FC 80A5AE2C 864C07A0 */  lh      $t4, 0x07A0($s2)           ## 000007A0
/* 01200 80A5AE30 000C6880 */  sll     $t5, $t4,  2               
/* 01204 80A5AE34 024D7021 */  addu    $t6, $s2, $t5              
/* 01208 80A5AE38 0C016A7D */  jal     Camera_GetCamDirYaw              
/* 0120C 80A5AE3C 8DC40790 */  lw      $a0, 0x0790($t6)           ## 00000790
/* 01210 80A5AE40 862F00B6 */  lh      $t7, 0x00B6($s1)           ## 000000B6
/* 01214 80A5AE44 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 01218 80A5AE48 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0121C 80A5AE4C 004FC023 */  subu    $t8, $v0, $t7              
/* 01220 80A5AE50 0301C821 */  addu    $t9, $t8, $at              
/* 01224 80A5AE54 00194400 */  sll     $t0, $t9, 16               
/* 01228 80A5AE58 00084C03 */  sra     $t1, $t0, 16               
/* 0122C 80A5AE5C 44892000 */  mtc1    $t1, $f4                   ## $f4 = 0.00
/* 01230 80A5AE60 3C0180A6 */  lui     $at, %hi(D_80A5B144)       ## $at = 80A60000
/* 01234 80A5AE64 C428B144 */  lwc1    $f8, %lo(D_80A5B144)($at)  
/* 01238 80A5AE68 468021A0 */  cvt.s.w $f6, $f4                   
/* 0123C 80A5AE6C 46083302 */  mul.s   $f12, $f6, $f8             
/* 01240 80A5AE70 0C034348 */  jal     Matrix_RotateY              
/* 01244 80A5AE74 00000000 */  nop
/* 01248 80A5AE78 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 0124C 80A5AE7C 3C0BDA38 */  lui     $t3, 0xDA38                ## $t3 = DA380000
/* 01250 80A5AE80 356B0003 */  ori     $t3, $t3, 0x0003           ## $t3 = DA380003
/* 01254 80A5AE84 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 01258 80A5AE88 AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 0125C 80A5AE8C 3C0580A6 */  lui     $a1, %hi(D_80A5B0F8)       ## $a1 = 80A60000
/* 01260 80A5AE90 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 01264 80A5AE94 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 01268 80A5AE98 24A5B0F8 */  addiu   $a1, $a1, %lo(D_80A5B0F8)  ## $a1 = 80A5B0F8
/* 0126C 80A5AE9C 24060400 */  addiu   $a2, $zero, 0x0400         ## $a2 = 00000400
/* 01270 80A5AEA0 0C0346A2 */  jal     Matrix_NewMtx              
/* 01274 80A5AEA4 00408825 */  or      $s1, $v0, $zero            ## $s1 = 00000000
/* 01278 80A5AEA8 AE220004 */  sw      $v0, 0x0004($s1)           ## 00000004
/* 0127C 80A5AEAC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 01280 80A5AEB0 3C0E0405 */  lui     $t6, %hi(D_0404D4E0)                ## $t6 = 04050000
/* 01284 80A5AEB4 25CED4E0 */  addiu   $t6, $t6, %lo(D_0404D4E0)           ## $t6 = 0404D4E0
/* 01288 80A5AEB8 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 0128C 80A5AEBC AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 01290 80A5AEC0 3C0DDE00 */  lui     $t5, 0xDE00                ## $t5 = DE000000
/* 01294 80A5AEC4 3C0680A6 */  lui     $a2, %hi(D_80A5B10C)       ## $a2 = 80A60000
/* 01298 80A5AEC8 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 0129C 80A5AECC AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
/* 012A0 80A5AED0 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 012A4 80A5AED4 24C6B10C */  addiu   $a2, $a2, %lo(D_80A5B10C)  ## $a2 = 80A5B10C
/* 012A8 80A5AED8 27A40064 */  addiu   $a0, $sp, 0x0064           ## $a0 = FFFFFFE4
/* 012AC 80A5AEDC 0C031AD5 */  jal     Graph_CloseDisps              
/* 012B0 80A5AEE0 24070404 */  addiu   $a3, $zero, 0x0404         ## $a3 = 00000404
/* 012B4 80A5AEE4 8FBF0044 */  lw      $ra, 0x0044($sp)           
/* 012B8 80A5AEE8 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 012BC 80A5AEEC 8FB1003C */  lw      $s1, 0x003C($sp)           
/* 012C0 80A5AEF0 8FB20040 */  lw      $s2, 0x0040($sp)           
/* 012C4 80A5AEF4 03E00008 */  jr      $ra                        
/* 012C8 80A5AEF8 27BD0080 */  addiu   $sp, $sp, 0x0080           ## $sp = 00000000
