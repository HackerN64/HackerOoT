glabel func_80999FE4
/* 01864 80999FE4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 01868 80999FE8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0186C 80999FEC AFA40020 */  sw      $a0, 0x0020($sp)           
/* 01870 80999FF0 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 01874 80999FF4 0C042F6F */  jal     func_8010BDBC              
/* 01878 80999FF8 24A420D8 */  addiu   $a0, $a1, 0x20D8           ## $a0 = 000020D8
/* 0187C 80999FFC 14400022 */  bne     $v0, $zero, .L8099A088     
/* 01880 8099A000 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 01884 8099A004 8FA50020 */  lw      $a1, 0x0020($sp)           
/* 01888 8099A008 3C0E8013 */  lui     $t6, %hi(D_801333E8)
/* 0188C 8099A00C 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 01890 8099A010 25CE33E8 */  addiu   $t6, %lo(D_801333E8)
/* 01894 8099A014 AFAE0014 */  sw      $t6, 0x0014($sp)           
/* 01898 8099A018 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 0189C 8099A01C 24042826 */  addiu   $a0, $zero, 0x2826         ## $a0 = 00002826
/* 018A0 8099A020 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 018A4 8099A024 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 018A8 8099A028 24A500E4 */  addiu   $a1, $a1, 0x00E4           ## $a1 = 000000E4
/* 018AC 8099A02C 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 018B0 8099A030 240525E9 */  addiu   $a1, $zero, 0x25E9         ## $a1 = 000025E9
/* 018B4 8099A034 240603E7 */  addiu   $a2, $zero, 0x03E7         ## $a2 = 000003E7
/* 018B8 8099A038 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 018BC 8099A03C 0C02003E */  jal     func_800800F8              
/* 018C0 8099A040 AFA00010 */  sw      $zero, 0x0010($sp)         
/* 018C4 8099A044 3C06809A */  lui     $a2, %hi(D_8099CCA2)       ## $a2 = 809A0000
/* 018C8 8099A048 84C6CCA2 */  lh      $a2, %lo(D_8099CCA2)($a2)  
/* 018CC 8099A04C 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 018D0 8099A050 0C0301E3 */  jal     Gameplay_CopyCamera              
/* 018D4 8099A054 2405FFFF */  addiu   $a1, $zero, 0xFFFF         ## $a1 = FFFFFFFF
/* 018D8 8099A058 3C05809A */  lui     $a1, %hi(D_8099CCA2)       ## $a1 = 809A0000
/* 018DC 8099A05C 84A5CCA2 */  lh      $a1, %lo(D_8099CCA2)($a1)  
/* 018E0 8099A060 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 018E4 8099A064 0C0300C5 */  jal     Gameplay_ChangeCameraStatus              
/* 018E8 8099A068 24060001 */  addiu   $a2, $zero, 0x0001         ## $a2 = 00000001
/* 018EC 8099A06C 8FB80020 */  lw      $t8, 0x0020($sp)           
/* 018F0 8099A070 240F0005 */  addiu   $t7, $zero, 0x0005         ## $t7 = 00000005
/* 018F4 8099A074 3C05809A */  lui     $a1, %hi(func_8099A098)    ## $a1 = 809A0000
/* 018F8 8099A078 AF0F01EC */  sw      $t7, 0x01EC($t8)           ## 000001EC
/* 018FC 8099A07C 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 01900 8099A080 0C2661E0 */  jal     func_80998780              
/* 01904 8099A084 24A5A098 */  addiu   $a1, $a1, %lo(func_8099A098) ## $a1 = 8099A098
.L8099A088:
/* 01908 8099A088 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0190C 8099A08C 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 01910 8099A090 03E00008 */  jr      $ra                        
/* 01914 8099A094 00000000 */  nop
