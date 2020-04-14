.rdata
glabel D_8089EBC0
    .asciz "../z_bg_mizu_movebg.c"
    .balign 4

glabel D_8089EBD8
    .asciz "../z_bg_mizu_movebg.c"
    .balign 4

glabel D_8089EBF0
    .asciz "../z_bg_mizu_movebg.c"
    .balign 4

.text
glabel BgMizuMovebg_Draw
/* 00C00 8089E830 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 00C04 8089E834 AFB10048 */  sw      $s1, 0x0048($sp)           
/* 00C08 8089E838 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 00C0C 8089E83C AFBF004C */  sw      $ra, 0x004C($sp)           
/* 00C10 8089E840 AFB00044 */  sw      $s0, 0x0044($sp)           
/* 00C14 8089E844 AFA40090 */  sw      $a0, 0x0090($sp)           
/* 00C18 8089E848 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00C1C 8089E84C 3C06808A */  lui     $a2, %hi(D_8089EBC0)       ## $a2 = 808A0000
/* 00C20 8089E850 24C6EBC0 */  addiu   $a2, $a2, %lo(D_8089EBC0)  ## $a2 = 8089EBC0
/* 00C24 8089E854 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFE0
/* 00C28 8089E858 240702F2 */  addiu   $a3, $zero, 0x02F2         ## $a3 = 000002F2
/* 00C2C 8089E85C 0C031AB1 */  jal     Graph_OpenDisps              
/* 00C30 8089E860 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00C34 8089E864 3C0E0001 */  lui     $t6, 0x0001                ## $t6 = 00010000
/* 00C38 8089E868 01D17021 */  addu    $t6, $t6, $s1              
/* 00C3C 8089E86C 8DCE1DE4 */  lw      $t6, 0x1DE4($t6)           ## 00011DE4
/* 00C40 8089E870 AFAE0084 */  sw      $t6, 0x0084($sp)           
/* 00C44 8089E874 0C024F46 */  jal     func_80093D18              
/* 00C48 8089E878 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00C4C 8089E87C 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00C50 8089E880 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 00C54 8089E884 37180020 */  ori     $t8, $t8, 0x0020           ## $t8 = DB060020
/* 00C58 8089E888 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00C5C 8089E88C AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 00C60 8089E890 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00C64 8089E894 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00C68 8089E898 8FAC0090 */  lw      $t4, 0x0090($sp)           
/* 00C6C 8089E89C 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00C70 8089E8A0 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 00C74 8089E8A4 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 00C78 8089E8A8 240A0020 */  addiu   $t2, $zero, 0x0020         ## $t2 = 00000020
/* 00C7C 8089E8AC 240B0020 */  addiu   $t3, $zero, 0x0020         ## $t3 = 00000020
/* 00C80 8089E8B0 AFAB0028 */  sw      $t3, 0x0028($sp)           
/* 00C84 8089E8B4 AFAA0024 */  sw      $t2, 0x0024($sp)           
/* 00C88 8089E8B8 AFA90018 */  sw      $t1, 0x0018($sp)           
/* 00C8C 8089E8BC AFA80014 */  sw      $t0, 0x0014($sp)           
/* 00C90 8089E8C0 AFB90010 */  sw      $t9, 0x0010($sp)           
/* 00C94 8089E8C4 AFA00034 */  sw      $zero, 0x0034($sp)         
/* 00C98 8089E8C8 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 00C9C 8089E8CC AFA0002C */  sw      $zero, 0x002C($sp)         
/* 00CA0 8089E8D0 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00CA4 8089E8D4 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00CA8 8089E8D8 8FA60084 */  lw      $a2, 0x0084($sp)           
/* 00CAC 8089E8DC 8D8D016C */  lw      $t5, 0x016C($t4)           ## 0000016C
/* 00CB0 8089E8E0 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00CB4 8089E8E4 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00CB8 8089E8E8 AFA2006C */  sw      $v0, 0x006C($sp)           
/* 00CBC 8089E8EC AFA60054 */  sw      $a2, 0x0054($sp)           
/* 00CC0 8089E8F0 0C02541A */  jal     Gfx_TwoTexScrollEnvColor              
/* 00CC4 8089E8F4 AFAD0038 */  sw      $t5, 0x0038($sp)           
/* 00CC8 8089E8F8 8FA3006C */  lw      $v1, 0x006C($sp)           
/* 00CCC 8089E8FC 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 00CD0 8089E900 35EF0024 */  ori     $t7, $t7, 0x0024           ## $t7 = DB060024
/* 00CD4 8089E904 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00CD8 8089E908 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00CDC 8089E90C 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 00CE0 8089E910 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00CE4 8089E914 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00CE8 8089E918 AE0E02C0 */  sw      $t6, 0x02C0($s0)           ## 000002C0
/* 00CEC 8089E91C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00CF0 8089E920 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00CF4 8089E924 8FAB0090 */  lw      $t3, 0x0090($sp)           
/* 00CF8 8089E928 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 00CFC 8089E92C 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 00D00 8089E930 240A0020 */  addiu   $t2, $zero, 0x0020         ## $t2 = 00000020
/* 00D04 8089E934 AFAA0028 */  sw      $t2, 0x0028($sp)           
/* 00D08 8089E938 AFA90024 */  sw      $t1, 0x0024($sp)           
/* 00D0C 8089E93C AFA80018 */  sw      $t0, 0x0018($sp)           
/* 00D10 8089E940 AFA00034 */  sw      $zero, 0x0034($sp)         
/* 00D14 8089E944 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 00D18 8089E948 AFA0002C */  sw      $zero, 0x002C($sp)         
/* 00D1C 8089E94C AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00D20 8089E950 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00D24 8089E954 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 00D28 8089E958 AFB80010 */  sw      $t8, 0x0010($sp)           
/* 00D2C 8089E95C 8D6C0170 */  lw      $t4, 0x0170($t3)           ## 00000170
/* 00D30 8089E960 8FA60054 */  lw      $a2, 0x0054($sp)           
/* 00D34 8089E964 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00D38 8089E968 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00D3C 8089E96C AFA20068 */  sw      $v0, 0x0068($sp)           
/* 00D40 8089E970 0C02541A */  jal     Gfx_TwoTexScrollEnvColor              
/* 00D44 8089E974 AFAC0038 */  sw      $t4, 0x0038($sp)           
/* 00D48 8089E978 8FA30068 */  lw      $v1, 0x0068($sp)           
/* 00D4C 8089E97C 3C0EDB06 */  lui     $t6, 0xDB06                ## $t6 = DB060000
/* 00D50 8089E980 35CE0028 */  ori     $t6, $t6, 0x0028           ## $t6 = DB060028
/* 00D54 8089E984 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00D58 8089E988 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00D5C 8089E98C 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 00D60 8089E990 24180020 */  addiu   $t8, $zero, 0x0020         ## $t8 = 00000020
/* 00D64 8089E994 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 00D68 8089E998 AE0D02C0 */  sw      $t5, 0x02C0($s0)           ## 000002C0
/* 00D6C 8089E99C AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 00D70 8089E9A0 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00D74 8089E9A4 8FAA0090 */  lw      $t2, 0x0090($sp)           
/* 00D78 8089E9A8 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 00D7C 8089E9AC 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 00D80 8089E9B0 24090020 */  addiu   $t1, $zero, 0x0020         ## $t1 = 00000020
/* 00D84 8089E9B4 AFA90028 */  sw      $t1, 0x0028($sp)           
/* 00D88 8089E9B8 AFA80024 */  sw      $t0, 0x0024($sp)           
/* 00D8C 8089E9BC AFB90018 */  sw      $t9, 0x0018($sp)           
/* 00D90 8089E9C0 AFA00034 */  sw      $zero, 0x0034($sp)         
/* 00D94 8089E9C4 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 00D98 8089E9C8 AFA0002C */  sw      $zero, 0x002C($sp)         
/* 00D9C 8089E9CC AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00DA0 8089E9D0 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00DA4 8089E9D4 AFB80014 */  sw      $t8, 0x0014($sp)           
/* 00DA8 8089E9D8 AFAF0010 */  sw      $t7, 0x0010($sp)           
/* 00DAC 8089E9DC 8D4B0174 */  lw      $t3, 0x0174($t2)           ## 00000174
/* 00DB0 8089E9E0 8FA60054 */  lw      $a2, 0x0054($sp)           
/* 00DB4 8089E9E4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00DB8 8089E9E8 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00DBC 8089E9EC AFA20064 */  sw      $v0, 0x0064($sp)           
/* 00DC0 8089E9F0 0C02541A */  jal     Gfx_TwoTexScrollEnvColor              
/* 00DC4 8089E9F4 AFAB0038 */  sw      $t3, 0x0038($sp)           
/* 00DC8 8089E9F8 8FA30064 */  lw      $v1, 0x0064($sp)           
/* 00DCC 8089E9FC 3C0DDB06 */  lui     $t5, 0xDB06                ## $t5 = DB060000
/* 00DD0 8089EA00 35AD002C */  ori     $t5, $t5, 0x002C           ## $t5 = DB06002C
/* 00DD4 8089EA04 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00DD8 8089EA08 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00DDC 8089EA0C 240E0020 */  addiu   $t6, $zero, 0x0020         ## $t6 = 00000020
/* 00DE0 8089EA10 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 00DE4 8089EA14 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 00DE8 8089EA18 AE0C02C0 */  sw      $t4, 0x02C0($s0)           ## 000002C0
/* 00DEC 8089EA1C AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00DF0 8089EA20 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00DF4 8089EA24 8FA90090 */  lw      $t1, 0x0090($sp)           
/* 00DF8 8089EA28 8FA60084 */  lw      $a2, 0x0084($sp)           
/* 00DFC 8089EA2C 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00E00 8089EA30 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00E04 8089EA34 24080020 */  addiu   $t0, $zero, 0x0020         ## $t0 = 00000020
/* 00E08 8089EA38 AFA80028 */  sw      $t0, 0x0028($sp)           
/* 00E0C 8089EA3C AFB90024 */  sw      $t9, 0x0024($sp)           
/* 00E10 8089EA40 AFB80018 */  sw      $t8, 0x0018($sp)           
/* 00E14 8089EA44 AFA00034 */  sw      $zero, 0x0034($sp)         
/* 00E18 8089EA48 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 00E1C 8089EA4C AFA0002C */  sw      $zero, 0x002C($sp)         
/* 00E20 8089EA50 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00E24 8089EA54 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00E28 8089EA58 AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 00E2C 8089EA5C AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 00E30 8089EA60 8D2A0178 */  lw      $t2, 0x0178($t1)           ## 00000178
/* 00E34 8089EA64 00C00821 */  addu    $at, $a2, $zero            
/* 00E38 8089EA68 00063080 */  sll     $a2, $a2,  2               
/* 00E3C 8089EA6C 00C13023 */  subu    $a2, $a2, $at              
/* 00E40 8089EA70 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00E44 8089EA74 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00E48 8089EA78 AFA20060 */  sw      $v0, 0x0060($sp)           
/* 00E4C 8089EA7C 0C02541A */  jal     Gfx_TwoTexScrollEnvColor              
/* 00E50 8089EA80 AFAA0038 */  sw      $t2, 0x0038($sp)           
/* 00E54 8089EA84 8FA30060 */  lw      $v1, 0x0060($sp)           
/* 00E58 8089EA88 3C0CDA38 */  lui     $t4, 0xDA38                ## $t4 = DA380000
/* 00E5C 8089EA8C 358C0003 */  ori     $t4, $t4, 0x0003           ## $t4 = DA380003
/* 00E60 8089EA90 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00E64 8089EA94 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00E68 8089EA98 3C05808A */  lui     $a1, %hi(D_8089EBD8)       ## $a1 = 808A0000
/* 00E6C 8089EA9C 24A5EBD8 */  addiu   $a1, $a1, %lo(D_8089EBD8)  ## $a1 = 8089EBD8
/* 00E70 8089EAA0 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00E74 8089EAA4 AE0B02C0 */  sw      $t3, 0x02C0($s0)           ## 000002C0
/* 00E78 8089EAA8 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 00E7C 8089EAAC 8E240000 */  lw      $a0, 0x0000($s1)           ## 00000000
/* 00E80 8089EAB0 24060314 */  addiu   $a2, $zero, 0x0314         ## $a2 = 00000314
/* 00E84 8089EAB4 0C0346A2 */  jal     Matrix_NewMtx              
/* 00E88 8089EAB8 AFA2005C */  sw      $v0, 0x005C($sp)           
/* 00E8C 8089EABC 8FA3005C */  lw      $v1, 0x005C($sp)           
/* 00E90 8089EAC0 3C06808A */  lui     $a2, %hi(D_8089EBF0)       ## $a2 = 808A0000
/* 00E94 8089EAC4 24C6EBF0 */  addiu   $a2, $a2, %lo(D_8089EBF0)  ## $a2 = 8089EBF0
/* 00E98 8089EAC8 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00E9C 8089EACC 8FAD0090 */  lw      $t5, 0x0090($sp)           
/* 00EA0 8089EAD0 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFE0
/* 00EA4 8089EAD4 2407031B */  addiu   $a3, $zero, 0x031B         ## $a3 = 0000031B
/* 00EA8 8089EAD8 8DAE0180 */  lw      $t6, 0x0180($t5)           ## 00000180
/* 00EAC 8089EADC 11C00009 */  beq     $t6, $zero, .L8089EB04     
/* 00EB0 8089EAE0 00000000 */  nop
/* 00EB4 8089EAE4 8E0202C0 */  lw      $v0, 0x02C0($s0)           ## 000002C0
/* 00EB8 8089EAE8 3C18DE00 */  lui     $t8, 0xDE00                ## $t8 = DE000000
/* 00EBC 8089EAEC 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00EC0 8089EAF0 AE0F02C0 */  sw      $t7, 0x02C0($s0)           ## 000002C0
/* 00EC4 8089EAF4 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00EC8 8089EAF8 8FB90090 */  lw      $t9, 0x0090($sp)           
/* 00ECC 8089EAFC 8F280180 */  lw      $t0, 0x0180($t9)           ## 00000180
/* 00ED0 8089EB00 AC480004 */  sw      $t0, 0x0004($v0)           ## 00000004
.L8089EB04:
/* 00ED4 8089EB04 0C031AD5 */  jal     Graph_CloseDisps              
/* 00ED8 8089EB08 8E250000 */  lw      $a1, 0x0000($s1)           ## 00000000
/* 00EDC 8089EB0C 8FBF004C */  lw      $ra, 0x004C($sp)           
/* 00EE0 8089EB10 8FB00044 */  lw      $s0, 0x0044($sp)           
/* 00EE4 8089EB14 8FB10048 */  lw      $s1, 0x0048($sp)           
/* 00EE8 8089EB18 03E00008 */  jr      $ra                        
/* 00EEC 8089EB1C 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
