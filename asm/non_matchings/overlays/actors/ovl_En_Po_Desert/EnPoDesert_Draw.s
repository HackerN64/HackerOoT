.rdata
glabel D_80AD3A04
    .asciz "../z_en_po_desert.c"
    .balign 4

glabel D_80AD3A18
    .asciz "../z_en_po_desert.c"
    .balign 4

.text
glabel EnPoDesert_Draw
/* 00B44 80AD37F4 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 00B48 80AD37F8 AFB20030 */  sw      $s2, 0x0030($sp)
/* 00B4C 80AD37FC 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 00B50 80AD3800 AFBF0034 */  sw      $ra, 0x0034($sp)
/* 00B54 80AD3804 AFB1002C */  sw      $s1, 0x002C($sp)
/* 00B58 80AD3808 AFB00028 */  sw      $s0, 0x0028($sp)
/* 00B5C 80AD380C 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00B60 80AD3810 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 00B64 80AD3814 3C0680AD */  lui     $a2, %hi(D_80AD3A04)       ## $a2 = 80AD0000
/* 00B68 80AD3818 24C63A04 */  addiu   $a2, $a2, %lo(D_80AD3A04)  ## $a2 = 80AD3A04
/* 00B6C 80AD381C 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE8
/* 00B70 80AD3820 2407022F */  addiu   $a3, $zero, 0x022F         ## $a3 = 0000022F
/* 00B74 80AD3824 0C031AB1 */  jal     Graph_OpenDisps
/* 00B78 80AD3828 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00B7C 80AD382C 0C024F61 */  jal     func_80093D84
/* 00B80 80AD3830 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00B84 80AD3834 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00B88 80AD3838 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 00B8C 80AD383C 35EF0028 */  ori     $t7, $t7, 0x0028           ## $t7 = DB060028
/* 00B90 80AD3840 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00B94 80AD3844 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 00B98 80AD3848 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00B9C 80AD384C 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00BA0 80AD3850 241800FF */  addiu   $t8, $zero, 0x00FF         ## $t8 = 000000FF
/* 00BA4 80AD3854 AFB80010 */  sw      $t8, 0x0010($sp)
/* 00BA8 80AD3858 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 00BAC 80AD385C 24060055 */  addiu   $a2, $zero, 0x0055         ## $a2 = 00000055
/* 00BB0 80AD3860 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00BB4 80AD3864 0C025474 */  jal     Gfx_EnvColor
/* 00BB8 80AD3868 AFA2004C */  sw      $v0, 0x004C($sp)
/* 00BBC 80AD386C 8FA3004C */  lw      $v1, 0x004C($sp)
/* 00BC0 80AD3870 3C08DB06 */  lui     $t0, 0xDB06                ## $t0 = DB060000
/* 00BC4 80AD3874 35080020 */  ori     $t0, $t0, 0x0020           ## $t0 = DB060020
/* 00BC8 80AD3878 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00BCC 80AD387C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00BD0 80AD3880 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00BD4 80AD3884 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 00BD8 80AD3888 AC480000 */  sw      $t0, 0x0000($v0)           ## 00000000
/* 00BDC 80AD388C 92290223 */  lbu     $t1, 0x0223($s1)           ## 00000223
/* 00BE0 80AD3890 92270222 */  lbu     $a3, 0x0222($s1)           ## 00000222
/* 00BE4 80AD3894 92260221 */  lbu     $a2, 0x0221($s1)           ## 00000221
/* 00BE8 80AD3898 92250220 */  lbu     $a1, 0x0220($s1)           ## 00000220
/* 00BEC 80AD389C 8E440000 */  lw      $a0, 0x0000($s2)           ## 00000000
/* 00BF0 80AD38A0 AFA20048 */  sw      $v0, 0x0048($sp)
/* 00BF4 80AD38A4 0C025474 */  jal     Gfx_EnvColor
/* 00BF8 80AD38A8 AFA90010 */  sw      $t1, 0x0010($sp)
/* 00BFC 80AD38AC 8FA30048 */  lw      $v1, 0x0048($sp)
/* 00C00 80AD38B0 3C0A80AD */  lui     $t2, %hi(func_80AD3328)    ## $t2 = 80AD0000
/* 00C04 80AD38B4 254A3328 */  addiu   $t2, $t2, %lo(func_80AD3328) ## $t2 = 80AD3328
/* 00C08 80AD38B8 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00C0C 80AD38BC 8E2B0190 */  lw      $t3, 0x0190($s1)           ## 00000190
/* 00C10 80AD38C0 02402025 */  or      $a0, $s2, $zero            ## $a0 = 00000000
/* 00C14 80AD38C4 3C0780AD */  lui     $a3, %hi(func_80AD3504)    ## $a3 = 80AD0000
/* 00C18 80AD38C8 154B000B */  bne     $t2, $t3, .L80AD38F8
/* 00C1C 80AD38CC 3C0880AD */  lui     $t0, %hi(func_80AD3594)    ## $t0 = 80AD0000
/* 00C20 80AD38D0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00C24 80AD38D4 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 00C28 80AD38D8 3C0E8011 */  lui     $t6, %hi(D_80116280)
/* 00C2C 80AD38DC 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00C30 80AD38E0 AE0C02D0 */  sw      $t4, 0x02D0($s0)           ## 000002D0
/* 00C34 80AD38E4 25CE6280 */  addiu   $t6, %lo(D_80116280)
/* 00C38 80AD38E8 35AD0030 */  ori     $t5, $t5, 0x0030           ## $t5 = DB060030
/* 00C3C 80AD38EC AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00C40 80AD38F0 1000000A */  beq     $zero, $zero, .L80AD391C
/* 00C44 80AD38F4 AC4E0004 */  sw      $t6, 0x0004($v0)           ## 00000004
.L80AD38F8:
/* 00C48 80AD38F8 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00C4C 80AD38FC 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 00C50 80AD3900 3C198011 */  lui     $t9, %hi(D_80116280+0x10)
/* 00C54 80AD3904 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00C58 80AD3908 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 00C5C 80AD390C 27396290 */  addiu   $t9, %lo(D_80116280+0x10)
/* 00C60 80AD3910 37180030 */  ori     $t8, $t8, 0x0030           ## $t8 = DB060030
/* 00C64 80AD3914 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00C68 80AD3918 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
.L80AD391C:
/* 00C6C 80AD391C 8E250150 */  lw      $a1, 0x0150($s1)           ## 00000150
/* 00C70 80AD3920 8E26016C */  lw      $a2, 0x016C($s1)           ## 0000016C
/* 00C74 80AD3924 25083594 */  addiu   $t0, $t0, %lo(func_80AD3594) ## $t0 = 80AD3594
/* 00C78 80AD3928 AFA80010 */  sw      $t0, 0x0010($sp)
/* 00C7C 80AD392C AFB10014 */  sw      $s1, 0x0014($sp)
/* 00C80 80AD3930 8E0902D0 */  lw      $t1, 0x02D0($s0)           ## 000002D0
/* 00C84 80AD3934 24E73504 */  addiu   $a3, $a3, %lo(func_80AD3504) ## $a3 = 80AD3504
/* 00C88 80AD3938 0C0288A2 */  jal     SkelAnime_Draw
/* 00C8C 80AD393C AFA90018 */  sw      $t1, 0x0018($sp)
/* 00C90 80AD3940 AE0202D0 */  sw      $v0, 0x02D0($s0)           ## 000002D0
/* 00C94 80AD3944 3C0680AD */  lui     $a2, %hi(D_80AD3A18)       ## $a2 = 80AD0000
/* 00C98 80AD3948 24C63A18 */  addiu   $a2, $a2, %lo(D_80AD3A18)  ## $a2 = 80AD3A18
/* 00C9C 80AD394C 8E450000 */  lw      $a1, 0x0000($s2)           ## 00000000
/* 00CA0 80AD3950 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE8
/* 00CA4 80AD3954 0C031AD5 */  jal     Graph_CloseDisps
/* 00CA8 80AD3958 24070255 */  addiu   $a3, $zero, 0x0255         ## $a3 = 00000255
/* 00CAC 80AD395C 8FBF0034 */  lw      $ra, 0x0034($sp)
/* 00CB0 80AD3960 8FB00028 */  lw      $s0, 0x0028($sp)
/* 00CB4 80AD3964 8FB1002C */  lw      $s1, 0x002C($sp)
/* 00CB8 80AD3968 8FB20030 */  lw      $s2, 0x0030($sp)
/* 00CBC 80AD396C 03E00008 */  jr      $ra
/* 00CC0 80AD3970 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000
/* 00CC4 80AD3974 00000000 */  nop
/* 00CC8 80AD3978 00000000 */  nop
/* 00CCC 80AD397C 00000000 */  nop
