.late_rodata
glabel D_808F817C
    .float 0.7853982

glabel D_808F8180
    .float 1.5707964

glabel D_808F8184
    .float 20000.0

glabel jtbl_808F8188
    .word L808E12A0
    .word L808E15E8
    .word L808E1688
    .word L808E176C
    .word L808E16FC

glabel D_808F819C
    .float 62500.0

glabel D_808F81A0
    .float 0.7

glabel D_808F81A4
    .float 0.9

glabel D_808F81A8
    .float 0.2

glabel D_808F81AC
    .float 465.0

.text
glabel func_808E1034
/* 0A7C4 808E1034 27BDFF40 */  addiu   $sp, $sp, 0xFF40           ## $sp = FFFFFF40
/* 0A7C8 808E1038 AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 0A7CC 808E103C AFB10030 */  sw      $s1, 0x0030($sp)           
/* 0A7D0 808E1040 AFB0002C */  sw      $s0, 0x002C($sp)           
/* 0A7D4 808E1044 F7B40020 */  sdc1    $f20, 0x0020($sp)          
/* 0A7D8 808E1048 AFA500C4 */  sw      $a1, 0x00C4($sp)           
/* 0A7DC 808E104C A7A000BA */  sh      $zero, 0x00BA($sp)         
/* 0A7E0 808E1050 8CAF1C44 */  lw      $t7, 0x1C44($a1)           ## 00001C44
/* 0A7E4 808E1054 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0A7E8 808E1058 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 0A7EC 808E105C AFAF006C */  sw      $t7, 0x006C($sp)           
/* 0A7F0 808E1060 849801A2 */  lh      $t8, 0x01A2($a0)           ## 000001A2
/* 0A7F4 808E1064 8C830118 */  lw      $v1, 0x0118($a0)           ## 00000118
/* 0A7F8 808E1068 240530A0 */  addiu   $a1, $zero, 0x30A0         ## $a1 = 000030A0
/* 0A7FC 808E106C 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 0A800 808E1070 A49901A2 */  sh      $t9, 0x01A2($a0)           ## 000001A2
/* 0A804 808E1074 A06701A0 */  sb      $a3, 0x01A0($v1)           ## 000001A0
/* 0A808 808E1078 848201A8 */  lh      $v0, 0x01A8($a0)           ## 000001A8
/* 0A80C 808E107C 10400038 */  beq     $v0, $zero, .L808E1160     
/* 0A810 808E1080 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 0A814 808E1084 1441000B */  bne     $v0, $at, .L808E10B4       
/* 0A818 808E1088 248401CC */  addiu   $a0, $a0, 0x01CC           ## $a0 = 000001CC
/* 0A81C 808E108C 3C053F80 */  lui     $a1, 0x3F80                ## $a1 = 3F800000
/* 0A820 808E1090 0C01E123 */  jal     Math_ApproachZeroF
              
/* 0A824 808E1094 3C064120 */  lui     $a2, 0x4120                ## $a2 = 41200000
/* 0A828 808E1098 26240050 */  addiu   $a0, $s1, 0x0050           ## $a0 = 00000050
/* 0A82C 808E109C 3C0541F0 */  lui     $a1, 0x41F0                ## $a1 = 41F00000
/* 0A830 808E10A0 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 0A834 808E10A4 0C01E107 */  jal     Math_ApproachF
              
/* 0A838 808E10A8 3C0742C8 */  lui     $a3, 0x42C8                ## $a3 = 42C80000
/* 0A83C 808E10AC 10000020 */  beq     $zero, $zero, .L808E1130   
/* 0A840 808E10B0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L808E10B4:
/* 0A844 808E10B4 862900B6 */  lh      $t1, 0x00B6($s1)           ## 000000B6
/* 0A848 808E10B8 3C0B8016 */  lui     $t3, %hi(D_8015FCF8)
/* 0A84C 808E10BC 256BFCF8 */  addiu   $t3, %lo(D_8015FCF8)
/* 0A850 808E10C0 252A1000 */  addiu   $t2, $t1, 0x1000           ## $t2 = 00001000
/* 0A854 808E10C4 A62A00B6 */  sh      $t2, 0x00B6($s1)           ## 000000B6
/* 0A858 808E10C8 A467066E */  sh      $a3, 0x066E($v1)           ## 0000066E
/* 0A85C 808E10CC 8E2D0024 */  lw      $t5, 0x0024($s1)           ## 00000024
/* 0A860 808E10D0 262401CC */  addiu   $a0, $s1, 0x01CC           ## $a0 = 000001CC
/* 0A864 808E10D4 3C053F80 */  lui     $a1, 0x3F80                ## $a1 = 3F800000
/* 0A868 808E10D8 AD6D0000 */  sw      $t5, 0x0000($t3)           ## 8015FCF8
/* 0A86C 808E10DC 8E2C0028 */  lw      $t4, 0x0028($s1)           ## 00000028
/* 0A870 808E10E0 3C0641F0 */  lui     $a2, 0x41F0                ## $a2 = 41F00000
/* 0A874 808E10E4 AD6C0004 */  sw      $t4, 0x0004($t3)           ## 8015FCFC
/* 0A878 808E10E8 8E2D002C */  lw      $t5, 0x002C($s1)           ## 0000002C
/* 0A87C 808E10EC 0C01E123 */  jal     Math_ApproachZeroF
              
/* 0A880 808E10F0 AD6D0008 */  sw      $t5, 0x0008($t3)           ## 8015FD00
/* 0A884 808E10F4 26240050 */  addiu   $a0, $s1, 0x0050           ## $a0 = 00000050
/* 0A888 808E10F8 3C0541A0 */  lui     $a1, 0x41A0                ## $a1 = 41A00000
/* 0A88C 808E10FC 3C063F00 */  lui     $a2, 0x3F00                ## $a2 = 3F000000
/* 0A890 808E1100 0C01E107 */  jal     Math_ApproachF
              
/* 0A894 808E1104 3C0742C8 */  lui     $a3, 0x42C8                ## $a3 = 42C80000
/* 0A898 808E1108 3C018090 */  lui     $at, %hi(D_808F817C)       ## $at = 80900000
/* 0A89C 808E110C 0C00CFBE */  jal     Rand_ZeroFloat
              
/* 0A8A0 808E1110 C42C817C */  lwc1    $f12, %lo(D_808F817C)($at) 
/* 0A8A4 808E1114 3C018090 */  lui     $at, %hi(D_808F8180)       ## $at = 80900000
/* 0A8A8 808E1118 C4268180 */  lwc1    $f6, %lo(D_808F8180)($at)  
/* 0A8AC 808E111C C62401C8 */  lwc1    $f4, 0x01C8($s1)           ## 000001C8
/* 0A8B0 808E1120 46003200 */  add.s   $f8, $f6, $f0              
/* 0A8B4 808E1124 46082280 */  add.s   $f10, $f4, $f8             
/* 0A8B8 808E1128 E62A01C8 */  swc1    $f10, 0x01C8($s1)          ## 000001C8
/* 0A8BC 808E112C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L808E1130:
/* 0A8C0 808E1130 0C00B58B */  jal     Actor_SetScale
              
/* 0A8C4 808E1134 8E250050 */  lw      $a1, 0x0050($s1)           ## 00000050
/* 0A8C8 808E1138 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 0A8CC 808E113C C62601CC */  lwc1    $f6, 0x01CC($s1)           ## 000001CC
/* 0A8D0 808E1140 4606A032 */  c.eq.s  $f20, $f6                  
/* 0A8D4 808E1144 00000000 */  nop
/* 0A8D8 808E1148 4502027D */  bc1fl   .L808E1B40                 
/* 0A8DC 808E114C 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0A8E0 808E1150 0C00B55C */  jal     Actor_Kill
              
/* 0A8E4 808E1154 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A8E8 808E1158 10000279 */  beq     $zero, $zero, .L808E1B40   
/* 0A8EC 808E115C 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L808E1160:
/* 0A8F0 808E1160 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A8F4 808E1164 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 0A8F8 808E1168 AFA30064 */  sw      $v1, 0x0064($sp)           
/* 0A8FC 808E116C 862E01A2 */  lh      $t6, 0x01A2($s1)           ## 000001A2
/* 0A900 808E1170 3C0540C0 */  lui     $a1, 0x40C0                ## $a1 = 40C00000
/* 0A904 808E1174 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A908 808E1178 31CF0001 */  andi    $t7, $t6, 0x0001           ## $t7 = 00000000
/* 0A90C 808E117C 11E00005 */  beq     $t7, $zero, .L808E1194     
/* 0A910 808E1180 00000000 */  nop
/* 0A914 808E1184 0C00B58B */  jal     Actor_SetScale
              
/* 0A918 808E1188 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A91C 808E118C 10000003 */  beq     $zero, $zero, .L808E119C   
/* 0A920 808E1190 00000000 */  nop
.L808E1194:
/* 0A924 808E1194 0C00B58B */  jal     Actor_SetScale
              
/* 0A928 808E1198 3C0540A8 */  lui     $a1, 0x40A8                ## $a1 = 40A80000
.L808E119C:
/* 0A92C 808E119C 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 0A930 808E11A0 00000000 */  nop
/* 0A934 808E11A4 3C018090 */  lui     $at, %hi(D_808F8184)       ## $at = 80900000
/* 0A938 808E11A8 C4248184 */  lwc1    $f4, %lo(D_808F8184)($at)  
/* 0A93C 808E11AC 863800B8 */  lh      $t8, 0x00B8($s1)           ## 000000B8
/* 0A940 808E11B0 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 0A944 808E11B4 46040202 */  mul.s   $f8, $f0, $f4              
/* 0A948 808E11B8 4600428D */  trunc.w.s $f10, $f8                  
/* 0A94C 808E11BC 440B5000 */  mfc1    $t3, $f10                  
/* 0A950 808E11C0 00000000 */  nop
/* 0A954 808E11C4 030B6021 */  addu    $t4, $t8, $t3              
/* 0A958 808E11C8 258D4000 */  addiu   $t5, $t4, 0x4000           ## $t5 = 00004000
/* 0A95C 808E11CC A62D00B8 */  sh      $t5, 0x00B8($s1)           ## 000000B8
/* 0A960 808E11D0 00107040 */  sll     $t6, $s0,  1               
.L808E11D4:
/* 0A964 808E11D4 022E1021 */  addu    $v0, $s1, $t6              
/* 0A968 808E11D8 844301B6 */  lh      $v1, 0x01B6($v0)           ## 000001B6
/* 0A96C 808E11DC 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0A970 808E11E0 00108400 */  sll     $s0, $s0, 16               
/* 0A974 808E11E4 10600003 */  beq     $v1, $zero, .L808E11F4     
/* 0A978 808E11E8 00108403 */  sra     $s0, $s0, 16               
/* 0A97C 808E11EC 246FFFFF */  addiu   $t7, $v1, 0xFFFF           ## $t7 = FFFFFFFF
/* 0A980 808E11F0 A44F01B6 */  sh      $t7, 0x01B6($v0)           ## 000001B6
.L808E11F4:
/* 0A984 808E11F4 2A010005 */  slti    $at, $s0, 0x0005           
/* 0A988 808E11F8 5420FFF6 */  bnel    $at, $zero, .L808E11D4     
/* 0A98C 808E11FC 00107040 */  sll     $t6, $s0,  1               
/* 0A990 808E1200 8FA20064 */  lw      $v0, 0x0064($sp)           
/* 0A994 808E1204 C62C0024 */  lwc1    $f12, 0x0024($s1)          ## 00000024
/* 0A998 808E1208 8FA3006C */  lw      $v1, 0x006C($sp)           
/* 0A99C 808E120C C44601FC */  lwc1    $f6, 0x01FC($v0)           ## 000001FC
/* 0A9A0 808E1210 3C014220 */  lui     $at, 0x4220                ## $at = 42200000
/* 0A9A4 808E1214 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0A9A8 808E1218 460C3101 */  sub.s   $f4, $f6, $f12             
/* 0A9AC 808E121C E7A40078 */  swc1    $f4, 0x0078($sp)           
/* 0A9B0 808E1220 C6220028 */  lwc1    $f2, 0x0028($s1)           ## 00000028
/* 0A9B4 808E1224 C4480200 */  lwc1    $f8, 0x0200($v0)           ## 00000200
/* 0A9B8 808E1228 46024281 */  sub.s   $f10, $f8, $f2             
/* 0A9BC 808E122C E7AA0074 */  swc1    $f10, 0x0074($sp)          
/* 0A9C0 808E1230 C620002C */  lwc1    $f0, 0x002C($s1)           ## 0000002C
/* 0A9C4 808E1234 C4460204 */  lwc1    $f6, 0x0204($v0)           ## 00000204
/* 0A9C8 808E1238 46003101 */  sub.s   $f4, $f6, $f0              
/* 0A9CC 808E123C 44813000 */  mtc1    $at, $f6                   ## $f6 = 40.00
/* 0A9D0 808E1240 E7A40070 */  swc1    $f4, 0x0070($sp)           
/* 0A9D4 808E1244 C46A0028 */  lwc1    $f10, 0x0028($v1)          ## 00000028
/* 0A9D8 808E1248 C4680024 */  lwc1    $f8, 0x0024($v1)           ## 00000024
/* 0A9DC 808E124C 46065100 */  add.s   $f4, $f10, $f6             
/* 0A9E0 808E1250 460C4501 */  sub.s   $f20, $f8, $f12            
/* 0A9E4 808E1254 46022201 */  sub.s   $f8, $f4, $f2              
/* 0A9E8 808E1258 E7A80084 */  swc1    $f8, 0x0084($sp)           
/* 0A9EC 808E125C C46A002C */  lwc1    $f10, 0x002C($v1)          ## 0000002C
/* 0A9F0 808E1260 46005181 */  sub.s   $f6, $f10, $f0             
/* 0A9F4 808E1264 0C00B642 */  jal     func_8002D908              
/* 0A9F8 808E1268 E7A60080 */  swc1    $f6, 0x0080($sp)           
/* 0A9FC 808E126C 0C00B5FB */  jal     func_8002D7EC              
/* 0AA00 808E1270 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0AA04 808E1274 963901C2 */  lhu     $t9, 0x01C2($s1)           ## 000001C2
/* 0AA08 808E1278 C7B00078 */  lwc1    $f16, 0x0078($sp)          
/* 0AA0C 808E127C C7B20070 */  lwc1    $f18, 0x0070($sp)          
/* 0AA10 808E1280 2F210005 */  sltiu   $at, $t9, 0x0005           
/* 0AA14 808E1284 1020014A */  beq     $at, $zero, .L808E17B0     
/* 0AA18 808E1288 0019C880 */  sll     $t9, $t9,  2               
/* 0AA1C 808E128C 3C018090 */  lui     $at, %hi(jtbl_808F8188)       ## $at = 80900000
/* 0AA20 808E1290 00390821 */  addu    $at, $at, $t9              
/* 0AA24 808E1294 8C398188 */  lw      $t9, %lo(jtbl_808F8188)($at)  
/* 0AA28 808E1298 03200008 */  jr      $t9                        
/* 0AA2C 808E129C 00000000 */  nop
glabel L808E12A0
/* 0AA30 808E12A0 8FA8006C */  lw      $t0, 0x006C($sp)           
/* 0AA34 808E12A4 8FAB0064 */  lw      $t3, 0x0064($sp)           
/* 0AA38 808E12A8 8D09067C */  lw      $t1, 0x067C($t0)           ## 0000067C
/* 0AA3C 808E12AC 312A0002 */  andi    $t2, $t1, 0x0002           ## $t2 = 00000000
/* 0AA40 808E12B0 51400020 */  beql    $t2, $zero, .L808E1334     
/* 0AA44 808E12B4 C7A20080 */  lwc1    $f2, 0x0080($sp)           
/* 0AA48 808E12B8 856C008A */  lh      $t4, 0x008A($t3)           ## 0000008A
/* 0AA4C 808E12BC 851800B6 */  lh      $t8, 0x00B6($t0)           ## 000000B6
/* 0AA50 808E12C0 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 0AA54 808E12C4 01817821 */  addu    $t7, $t4, $at              
/* 0AA58 808E12C8 030F1023 */  subu    $v0, $t8, $t7              
/* 0AA5C 808E12CC 00021400 */  sll     $v0, $v0, 16               
/* 0AA60 808E12D0 00021403 */  sra     $v0, $v0, 16               
/* 0AA64 808E12D4 04400003 */  bltz    $v0, .L808E12E4            
/* 0AA68 808E12D8 00021823 */  subu    $v1, $zero, $v0            
/* 0AA6C 808E12DC 10000001 */  beq     $zero, $zero, .L808E12E4   
/* 0AA70 808E12E0 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
.L808E12E4:
/* 0AA74 808E12E4 28612000 */  slti    $at, $v1, 0x2000           
/* 0AA78 808E12E8 10200011 */  beq     $at, $zero, .L808E1330     
/* 0AA7C 808E12EC C7AC0084 */  lwc1    $f12, 0x0084($sp)          
/* 0AA80 808E12F0 4614A102 */  mul.s   $f4, $f20, $f20            
/* 0AA84 808E12F4 C7A20080 */  lwc1    $f2, 0x0080($sp)           
/* 0AA88 808E12F8 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 0AA8C 808E12FC 460C6202 */  mul.s   $f8, $f12, $f12            
/* 0AA90 808E1300 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 0AA94 808E1304 46021182 */  mul.s   $f6, $f2, $f2              
/* 0AA98 808E1308 46082280 */  add.s   $f10, $f4, $f8             
/* 0AA9C 808E130C 44812000 */  mtc1    $at, $f4                   ## $f4 = 25.00
/* 0AAA0 808E1310 46065000 */  add.s   $f0, $f10, $f6             
/* 0AAA4 808E1314 46000004 */  sqrt.s  $f0, $f0                   
/* 0AAA8 808E1318 4604003E */  c.le.s  $f0, $f4                   
/* 0AAAC 808E131C 00000000 */  nop
/* 0AAB0 808E1320 45020004 */  bc1fl   .L808E1334                 
/* 0AAB4 808E1324 C7A20080 */  lwc1    $f2, 0x0080($sp)           
/* 0AAB8 808E1328 10000005 */  beq     $zero, $zero, .L808E1340   
/* 0AABC 808E132C 92220621 */  lbu     $v0, 0x0621($s1)           ## 00000621
.L808E1330:
/* 0AAC0 808E1330 C7A20080 */  lwc1    $f2, 0x0080($sp)           
.L808E1334:
/* 0AAC4 808E1334 C7AC0084 */  lwc1    $f12, 0x0084($sp)          
/* 0AAC8 808E1338 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 0AACC 808E133C 92220621 */  lbu     $v0, 0x0621($s1)           ## 00000621
.L808E1340:
/* 0AAD0 808E1340 00608025 */  or      $s0, $v1, $zero            ## $s0 = 00000000
/* 0AAD4 808E1344 30590002 */  andi    $t9, $v0, 0x0002           ## $t9 = 00000000
/* 0AAD8 808E1348 17200003 */  bne     $t9, $zero, .L808E1358     
/* 0AADC 808E134C 3049FFFD */  andi    $t1, $v0, 0xFFFD           ## $t1 = 00000000
/* 0AAE0 808E1350 10600071 */  beq     $v1, $zero, .L808E1518     
/* 0AAE4 808E1354 00000000 */  nop
.L808E1358:
/* 0AAE8 808E1358 8E24064C */  lw      $a0, 0x064C($s1)           ## 0000064C
/* 0AAEC 808E135C 14600017 */  bne     $v1, $zero, .L808E13BC     
/* 0AAF0 808E1360 A2290621 */  sb      $t1, 0x0621($s1)           ## 00000621
/* 0AAF4 808E1364 8C8A0000 */  lw      $t2, 0x0000($a0)           ## 00000000
/* 0AAF8 808E1368 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 0AAFC 808E136C 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 0AB00 808E1370 000A5AC0 */  sll     $t3, $t2, 11               
/* 0AB04 808E1374 05610011 */  bgez    $t3, .L808E13BC            
/* 0AB08 808E1378 240C0002 */  addiu   $t4, $zero, 0x0002         ## $t4 = 00000002
/* 0AB0C 808E137C 3C0D8013 */  lui     $t5, %hi(D_801333E8)
/* 0AB10 808E1380 25AD33E8 */  addiu   $t5, %lo(D_801333E8)
/* 0AB14 808E1384 A7AC00BA */  sh      $t4, 0x00BA($sp)           
/* 0AB18 808E1388 AFAD0014 */  sw      $t5, 0x0014($sp)           
/* 0AB1C 808E138C 2404180C */  addiu   $a0, $zero, 0x180C         ## $a0 = 0000180C
/* 0AB20 808E1390 250500E4 */  addiu   $a1, $t0, 0x00E4           ## $a1 = 000000E4
/* 0AB24 808E1394 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 0AB28 808E1398 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 0AB2C 808E139C AFA70010 */  sw      $a3, 0x0010($sp)           
/* 0AB30 808E13A0 C62C008C */  lwc1    $f12, 0x008C($s1)          ## 0000008C
/* 0AB34 808E13A4 240500FF */  addiu   $a1, $zero, 0x00FF         ## $a1 = 000000FF
/* 0AB38 808E13A8 24060014 */  addiu   $a2, $zero, 0x0014         ## $a2 = 00000014
/* 0AB3C 808E13AC 0C02A800 */  jal     func_800AA000              
/* 0AB40 808E13B0 24070096 */  addiu   $a3, $zero, 0x0096         ## $a3 = 00000096
/* 0AB44 808E13B4 100000FF */  beq     $zero, $zero, .L808E17B4   
/* 0AB48 808E13B8 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
.L808E13BC:
/* 0AB4C 808E13BC 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 0AB50 808E13C0 A7AE00BA */  sh      $t6, 0x00BA($sp)           
/* 0AB54 808E13C4 C7AC0070 */  lwc1    $f12, 0x0070($sp)          
/* 0AB58 808E13C8 0C034199 */  jal     Math_Atan2S
              
/* 0AB5C 808E13CC C7AE0078 */  lwc1    $f14, 0x0078($sp)          
/* 0AB60 808E13D0 C7B00078 */  lwc1    $f16, 0x0078($sp)          
/* 0AB64 808E13D4 C7B20070 */  lwc1    $f18, 0x0070($sp)          
/* 0AB68 808E13D8 A6220032 */  sh      $v0, 0x0032($s1)           ## 00000032
/* 0AB6C 808E13DC 46108202 */  mul.s   $f8, $f16, $f16            
/* 0AB70 808E13E0 C7AE0074 */  lwc1    $f14, 0x0074($sp)          
/* 0AB74 808E13E4 46129282 */  mul.s   $f10, $f18, $f18           
/* 0AB78 808E13E8 460A4000 */  add.s   $f0, $f8, $f10             
/* 0AB7C 808E13EC 0C034199 */  jal     Math_Atan2S
              
/* 0AB80 808E13F0 46000304 */  sqrt.s  $f12, $f0                  
/* 0AB84 808E13F4 863801A4 */  lh      $t8, 0x01A4($s1)           ## 000001A4
/* 0AB88 808E13F8 24190002 */  addiu   $t9, $zero, 0x0002         ## $t9 = 00000002
/* 0AB8C 808E13FC A6220030 */  sh      $v0, 0x0030($s1)           ## 00000030
/* 0AB90 808E1400 270F0001 */  addiu   $t7, $t8, 0x0001           ## $t7 = 00000001
/* 0AB94 808E1404 A62F01A4 */  sh      $t7, 0x01A4($s1)           ## 000001A4
/* 0AB98 808E1408 A63901B8 */  sh      $t9, 0x01B8($s1)           ## 000001B8
/* 0AB9C 808E140C 8FA5006C */  lw      $a1, 0x006C($sp)           
/* 0ABA0 808E1410 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 0ABA4 808E1414 3C098013 */  lui     $t1, %hi(D_801333E8)
/* 0ABA8 808E1418 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 0ABAC 808E141C 252933E8 */  addiu   $t1, %lo(D_801333E8)
/* 0ABB0 808E1420 AFA90014 */  sw      $t1, 0x0014($sp)           
/* 0ABB4 808E1424 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 0ABB8 808E1428 2404182A */  addiu   $a0, $zero, 0x182A         ## $a0 = 0000182A
/* 0ABBC 808E142C 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 0ABC0 808E1430 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 0ABC4 808E1434 24A500E4 */  addiu   $a1, $a1, 0x00E4           ## $a1 = 000000E4
/* 0ABC8 808E1438 C62C008C */  lwc1    $f12, 0x008C($s1)          ## 0000008C
/* 0ABCC 808E143C 240500B4 */  addiu   $a1, $zero, 0x00B4         ## $a1 = 000000B4
/* 0ABD0 808E1440 24060014 */  addiu   $a2, $zero, 0x0014         ## $a2 = 00000014
/* 0ABD4 808E1444 0C02A800 */  jal     func_800AA000              
/* 0ABD8 808E1448 24070064 */  addiu   $a3, $zero, 0x0064         ## $a3 = 00000064
/* 0ABDC 808E144C 16000024 */  bne     $s0, $zero, .L808E14E0     
/* 0ABE0 808E1450 8FAA0064 */  lw      $t2, 0x0064($sp)           
/* 0ABE4 808E1454 3C018090 */  lui     $at, %hi(D_808F819C)       ## $at = 80900000
/* 0ABE8 808E1458 C426819C */  lwc1    $f6, %lo(D_808F819C)($at)  
/* 0ABEC 808E145C C544008C */  lwc1    $f4, 0x008C($t2)           ## 0000008C
/* 0ABF0 808E1460 4604303C */  c.lt.s  $f6, $f4                   
/* 0ABF4 808E1464 00000000 */  nop
/* 0ABF8 808E1468 45000008 */  bc1f    .L808E148C                 
/* 0ABFC 808E146C 00000000 */  nop
/* 0AC00 808E1470 862B01A4 */  lh      $t3, 0x01A4($s1)           ## 000001A4
/* 0AC04 808E1474 240C0001 */  addiu   $t4, $zero, 0x0001         ## $t4 = 00000001
/* 0AC08 808E1478 29610003 */  slti    $at, $t3, 0x0003           
/* 0AC0C 808E147C 10200003 */  beq     $at, $zero, .L808E148C     
/* 0AC10 808E1480 00000000 */  nop
/* 0AC14 808E1484 1000000E */  beq     $zero, $zero, .L808E14C0   
/* 0AC18 808E1488 A62C01C2 */  sh      $t4, 0x01C2($s1)           ## 000001C2
.L808E148C:
/* 0AC1C 808E148C 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 0AC20 808E1490 00000000 */  nop
/* 0AC24 808E1494 3C018090 */  lui     $at, %hi(D_808F81A0)       ## $at = 80900000
/* 0AC28 808E1498 C42881A0 */  lwc1    $f8, %lo(D_808F81A0)($at)  
/* 0AC2C 808E149C 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 0AC30 808E14A0 240E0003 */  addiu   $t6, $zero, 0x0003         ## $t6 = 00000003
/* 0AC34 808E14A4 4608003C */  c.lt.s  $f0, $f8                   
/* 0AC38 808E14A8 00000000 */  nop
/* 0AC3C 808E14AC 45020004 */  bc1fl   .L808E14C0                 
/* 0AC40 808E14B0 A62E01C2 */  sh      $t6, 0x01C2($s1)           ## 000001C2
/* 0AC44 808E14B4 10000002 */  beq     $zero, $zero, .L808E14C0   
/* 0AC48 808E14B8 A62D01C2 */  sh      $t5, 0x01C2($s1)           ## 000001C2
/* 0AC4C 808E14BC A62E01C2 */  sh      $t6, 0x01C2($s1)           ## 000001C2
.L808E14C0:
/* 0AC50 808E14C0 8FB8006C */  lw      $t8, 0x006C($sp)           
/* 0AC54 808E14C4 830F0842 */  lb      $t7, 0x0842($t8)           ## 00000842
/* 0AC58 808E14C8 29E10018 */  slti    $at, $t7, 0x0018           
/* 0AC5C 808E14CC 142000B8 */  bne     $at, $zero, .L808E17B0     
/* 0AC60 808E14D0 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 0AC64 808E14D4 44815000 */  mtc1    $at, $f10                  ## $f10 = 20.00
/* 0AC68 808E14D8 100000B5 */  beq     $zero, $zero, .L808E17B0   
/* 0AC6C 808E14DC E62A0068 */  swc1    $f10, 0x0068($s1)          ## 00000068
.L808E14E0:
/* 0AC70 808E14E0 0C03F66B */  jal     Rand_ZeroOne
              ## Rand.Next() float
/* 0AC74 808E14E4 00000000 */  nop
/* 0AC78 808E14E8 3C018090 */  lui     $at, %hi(D_808F81A4)       ## $at = 80900000
/* 0AC7C 808E14EC C42681A4 */  lwc1    $f6, %lo(D_808F81A4)($at)  
/* 0AC80 808E14F0 24190001 */  addiu   $t9, $zero, 0x0001         ## $t9 = 00000001
/* 0AC84 808E14F4 24090003 */  addiu   $t1, $zero, 0x0003         ## $t1 = 00000003
/* 0AC88 808E14F8 4606003C */  c.lt.s  $f0, $f6                   
/* 0AC8C 808E14FC 00000000 */  nop
/* 0AC90 808E1500 45000003 */  bc1f    .L808E1510                 
/* 0AC94 808E1504 00000000 */  nop
/* 0AC98 808E1508 100000A9 */  beq     $zero, $zero, .L808E17B0   
/* 0AC9C 808E150C A63901C2 */  sh      $t9, 0x01C2($s1)           ## 000001C2
.L808E1510:
/* 0ACA0 808E1510 100000A7 */  beq     $zero, $zero, .L808E17B0   
/* 0ACA4 808E1514 A62901C2 */  sh      $t1, 0x01C2($s1)           ## 000001C2
.L808E1518:
/* 0ACA8 808E1518 4614A102 */  mul.s   $f4, $f20, $f20            
/* 0ACAC 808E151C 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 0ACB0 808E1520 240A0005 */  addiu   $t2, $zero, 0x0005         ## $t2 = 00000005
/* 0ACB4 808E1524 460C6202 */  mul.s   $f8, $f12, $f12            
/* 0ACB8 808E1528 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0ACBC 808E152C 3C064040 */  lui     $a2, 0x4040                ## $a2 = 40400000
/* 0ACC0 808E1530 46021182 */  mul.s   $f6, $f2, $f2              
/* 0ACC4 808E1534 240B0030 */  addiu   $t3, $zero, 0x0030         ## $t3 = 00000030
/* 0ACC8 808E1538 46082280 */  add.s   $f10, $f4, $f8             
/* 0ACCC 808E153C 44812000 */  mtc1    $at, $f4                   ## $f4 = 25.00
/* 0ACD0 808E1540 46065000 */  add.s   $f0, $f10, $f6             
/* 0ACD4 808E1544 46000004 */  sqrt.s  $f0, $f0                   
/* 0ACD8 808E1548 4604003E */  c.le.s  $f0, $f4                   
/* 0ACDC 808E154C 00000000 */  nop
/* 0ACE0 808E1550 45000023 */  bc1f    .L808E15E0                 
/* 0ACE4 808E1554 00000000 */  nop
/* 0ACE8 808E1558 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 0ACEC 808E155C A7AA00BA */  sh      $t2, 0x00BA($sp)           
/* 0ACF0 808E1560 86270032 */  lh      $a3, 0x0032($s1)           ## 00000032
/* 0ACF4 808E1564 AFAB0014 */  sw      $t3, 0x0014($sp)           
/* 0ACF8 808E1568 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0ACFC 808E156C 0C00BDB5 */  jal     func_8002F6D4              
/* 0AD00 808E1570 E7B40010 */  swc1    $f20, 0x0010($sp)          
/* 0AD04 808E1574 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0AD08 808E1578 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 0AD0C 808E157C 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 0AD10 808E1580 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 0AD14 808E1584 2407390B */  addiu   $a3, $zero, 0x390B         ## $a3 = 0000390B
/* 0AD18 808E1588 8FA30064 */  lw      $v1, 0x0064($sp)           
/* 0AD1C 808E158C 240C0014 */  addiu   $t4, $zero, 0x0014         ## $t4 = 00000014
/* 0AD20 808E1590 3C02808E */  lui     $v0, %hi(D_808E4C58)       ## $v0 = 808E0000
/* 0AD24 808E1594 24424C58 */  addiu   $v0, $v0, %lo(D_808E4C58)  ## $v0 = 808E4C58
/* 0AD28 808E1598 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 0AD2C 808E159C A46C01BA */  sh      $t4, 0x01BA($v1)           ## 000001BA
.L808E15A0:
/* 0AD30 808E15A0 00506821 */  addu    $t5, $v0, $s0              
/* 0AD34 808E15A4 0010C040 */  sll     $t8, $s0,  1               
/* 0AD38 808E15A8 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0AD3C 808E15AC 00108400 */  sll     $s0, $s0, 16               
/* 0AD40 808E15B0 91AE0000 */  lbu     $t6, 0x0000($t5)           ## 00000000
/* 0AD44 808E15B4 00108403 */  sra     $s0, $s0, 16               
/* 0AD48 808E15B8 2A010012 */  slti    $at, $s0, 0x0012           
/* 0AD4C 808E15BC 00787821 */  addu    $t7, $v1, $t8              
/* 0AD50 808E15C0 1420FFF7 */  bne     $at, $zero, .L808E15A0     
/* 0AD54 808E15C4 A5EE04E4 */  sh      $t6, 0x04E4($t7)           ## 000004E4
/* 0AD58 808E15C8 3C014080 */  lui     $at, 0x4080                ## $at = 40800000
/* 0AD5C 808E15CC 44814000 */  mtc1    $at, $f8                   ## $f8 = 4.00
/* 0AD60 808E15D0 2419003C */  addiu   $t9, $zero, 0x003C         ## $t9 = 0000003C
/* 0AD64 808E15D4 A46002E6 */  sh      $zero, 0x02E6($v1)         ## 000002E6
/* 0AD68 808E15D8 A47902E8 */  sh      $t9, 0x02E8($v1)           ## 000002E8
/* 0AD6C 808E15DC E4680508 */  swc1    $f8, 0x0508($v1)           ## 00000508
.L808E15E0:
/* 0AD70 808E15E0 10000074 */  beq     $zero, $zero, .L808E17B4   
/* 0AD74 808E15E4 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
glabel L808E15E8
/* 0AD78 808E15E8 8FAA0064 */  lw      $t2, 0x0064($sp)           
/* 0AD7C 808E15EC 3C09808E */  lui     $t1, %hi(func_808DC14C)    ## $t1 = 808E0000
/* 0AD80 808E15F0 2529C14C */  addiu   $t1, $t1, %lo(func_808DC14C) ## $t1 = 808DC14C
/* 0AD84 808E15F4 8D4B0194 */  lw      $t3, 0x0194($t2)           ## 00000194
/* 0AD88 808E15F8 552B006E */  bnel    $t1, $t3, .L808E17B4       
/* 0AD8C 808E15FC 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 0AD90 808E1600 854C01C2 */  lh      $t4, 0x01C2($t2)           ## 000001C2
/* 0AD94 808E1604 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0AD98 808E1608 C7AC0074 */  lwc1    $f12, 0x0074($sp)          
/* 0AD9C 808E160C 15810068 */  bne     $t4, $at, .L808E17B0       
/* 0ADA0 808E1610 3C014198 */  lui     $at, 0x4198                ## $at = 41980000
/* 0ADA4 808E1614 44813000 */  mtc1    $at, $f6                   ## $f6 = 19.00
/* 0ADA8 808E1618 C62A0068 */  lwc1    $f10, 0x0068($s1)          ## 00000068
/* 0ADAC 808E161C 46108102 */  mul.s   $f4, $f16, $f16            
/* 0ADB0 808E1620 3C01432A */  lui     $at, 0x432A                ## $at = 432A0000
/* 0ADB4 808E1624 460A303E */  c.le.s  $f6, $f10                  
/* 0ADB8 808E1628 460C6202 */  mul.s   $f8, $f12, $f12            
/* 0ADBC 808E162C 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 0ADC0 808E1630 8FB80064 */  lw      $t8, 0x0064($sp)           
/* 0ADC4 808E1634 46129182 */  mul.s   $f6, $f18, $f18            
/* 0ADC8 808E1638 45000005 */  bc1f    .L808E1650                 
/* 0ADCC 808E163C 240E0008 */  addiu   $t6, $zero, 0x0008         ## $t6 = 00000008
/* 0ADD0 808E1640 3C01437A */  lui     $at, 0x437A                ## $at = 437A0000
/* 0ADD4 808E1644 44811000 */  mtc1    $at, $f2                   ## $f2 = 250.00
/* 0ADD8 808E1648 10000004 */  beq     $zero, $zero, .L808E165C   
/* 0ADDC 808E164C 46082280 */  add.s   $f10, $f4, $f8             
.L808E1650:
/* 0ADE0 808E1650 44811000 */  mtc1    $at, $f2                   ## $f2 = 250.00
/* 0ADE4 808E1654 00000000 */  nop
/* 0ADE8 808E1658 46082280 */  add.s   $f10, $f4, $f8             
.L808E165C:
/* 0ADEC 808E165C 240F0002 */  addiu   $t7, $zero, 0x0002         ## $t7 = 00000002
/* 0ADF0 808E1660 46065000 */  add.s   $f0, $f10, $f6             
/* 0ADF4 808E1664 46000004 */  sqrt.s  $f0, $f0                   
/* 0ADF8 808E1668 4602003C */  c.lt.s  $f0, $f2                   
/* 0ADFC 808E166C 00000000 */  nop
/* 0AE00 808E1670 45020050 */  bc1fl   .L808E17B4                 
/* 0AE04 808E1674 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 0AE08 808E1678 A30D01C0 */  sb      $t5, 0x01C0($t8)           ## 000001C0
/* 0AE0C 808E167C A62E01B6 */  sh      $t6, 0x01B6($s1)           ## 000001B6
/* 0AE10 808E1680 1000004B */  beq     $zero, $zero, .L808E17B0   
/* 0AE14 808E1684 A62F01C2 */  sh      $t7, 0x01C2($s1)           ## 000001C2
glabel L808E1688
/* 0AE18 808E1688 863901B6 */  lh      $t9, 0x01B6($s1)           ## 000001B6
/* 0AE1C 808E168C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0AE20 808E1690 24090001 */  addiu   $t1, $zero, 0x0001         ## $t1 = 00000001
/* 0AE24 808E1694 17210019 */  bne     $t9, $at, .L808E16FC       
/* 0AE28 808E1698 00000000 */  nop
/* 0AE2C 808E169C A7A900BA */  sh      $t1, 0x00BA($sp)           
/* 0AE30 808E16A0 C7AC0080 */  lwc1    $f12, 0x0080($sp)          
/* 0AE34 808E16A4 0C034199 */  jal     Math_Atan2S
              
/* 0AE38 808E16A8 4600A386 */  mov.s   $f14, $f20                 
/* 0AE3C 808E16AC A6220032 */  sh      $v0, 0x0032($s1)           ## 00000032
/* 0AE40 808E16B0 C7A40080 */  lwc1    $f4, 0x0080($sp)           
/* 0AE44 808E16B4 C7AE0084 */  lwc1    $f14, 0x0084($sp)          
/* 0AE48 808E16B8 46042202 */  mul.s   $f8, $f4, $f4              
/* 0AE4C 808E16BC 00000000 */  nop
/* 0AE50 808E16C0 4614A282 */  mul.s   $f10, $f20, $f20           
/* 0AE54 808E16C4 46085000 */  add.s   $f0, $f10, $f8             
/* 0AE58 808E16C8 0C034199 */  jal     Math_Atan2S
              
/* 0AE5C 808E16CC 46000304 */  sqrt.s  $f12, $f0                  
/* 0AE60 808E16D0 240B0002 */  addiu   $t3, $zero, 0x0002         ## $t3 = 00000002
/* 0AE64 808E16D4 A6220030 */  sh      $v0, 0x0030($s1)           ## 00000030
/* 0AE68 808E16D8 A62B01B8 */  sh      $t3, 0x01B8($s1)           ## 000001B8
/* 0AE6C 808E16DC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0AE70 808E16E0 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 0AE74 808E16E4 2405182A */  addiu   $a1, $zero, 0x182A         ## $a1 = 0000182A
/* 0AE78 808E16E8 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0AE7C 808E16EC 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 0AE80 808E16F0 240539CA */  addiu   $a1, $zero, 0x39CA         ## $a1 = 000039CA
/* 0AE84 808E16F4 1000002E */  beq     $zero, $zero, .L808E17B0   
/* 0AE88 808E16F8 A62001C2 */  sh      $zero, 0x01C2($s1)         ## 000001C2
glabel L808E16FC
.L808E16FC:
/* 0AE8C 808E16FC 46108182 */  mul.s   $f6, $f16, $f16            
/* 0AE90 808E1700 C7A20074 */  lwc1    $f2, 0x0074($sp)           
/* 0AE94 808E1704 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0AE98 808E1708 240A0003 */  addiu   $t2, $zero, 0x0003         ## $t2 = 00000003
/* 0AE9C 808E170C 46021102 */  mul.s   $f4, $f2, $f2              
/* 0AEA0 808E1710 26250024 */  addiu   $a1, $s1, 0x0024           ## $a1 = 00000024
/* 0AEA4 808E1714 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 0AEA8 808E1718 46129202 */  mul.s   $f8, $f18, $f18            
/* 0AEAC 808E171C 240739CC */  addiu   $a3, $zero, 0x39CC         ## $a3 = 000039CC
/* 0AEB0 808E1720 46043280 */  add.s   $f10, $f6, $f4             
/* 0AEB4 808E1724 44813000 */  mtc1    $at, $f6                   ## $f6 = 30.00
/* 0AEB8 808E1728 46085000 */  add.s   $f0, $f10, $f8             
/* 0AEBC 808E172C 46000004 */  sqrt.s  $f0, $f0                   
/* 0AEC0 808E1730 4606003C */  c.lt.s  $f0, $f6                   
/* 0AEC4 808E1734 00000000 */  nop
/* 0AEC8 808E1738 4502001E */  bc1fl   .L808E17B4                 
/* 0AECC 808E173C 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
/* 0AED0 808E1740 A7AA00BA */  sh      $t2, 0x00BA($sp)           
/* 0AED4 808E1744 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0AED8 808E1748 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 0AEDC 808E174C AFA50040 */  sw      $a1, 0x0040($sp)           
/* 0AEE0 808E1750 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0AEE4 808E1754 8FA50040 */  lw      $a1, 0x0040($sp)           
/* 0AEE8 808E1758 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 0AEEC 808E175C 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 0AEF0 808E1760 2407390B */  addiu   $a3, $zero, 0x390B         ## $a3 = 0000390B
/* 0AEF4 808E1764 10000013 */  beq     $zero, $zero, .L808E17B4   
/* 0AEF8 808E1768 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
glabel L808E176C
/* 0AEFC 808E176C 46108102 */  mul.s   $f4, $f16, $f16            
/* 0AF00 808E1770 C7A20074 */  lwc1    $f2, 0x0074($sp)           
/* 0AF04 808E1774 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 0AF08 808E1778 8FB80064 */  lw      $t8, 0x0064($sp)           
/* 0AF0C 808E177C 46021282 */  mul.s   $f10, $f2, $f2             
/* 0AF10 808E1780 240E0004 */  addiu   $t6, $zero, 0x0004         ## $t6 = 00000004
/* 0AF14 808E1784 46129182 */  mul.s   $f6, $f18, $f18            
/* 0AF18 808E1788 460A2200 */  add.s   $f8, $f4, $f10             
/* 0AF1C 808E178C 44812000 */  mtc1    $at, $f4                   ## $f4 = 100.00
/* 0AF20 808E1790 46064000 */  add.s   $f0, $f8, $f6              
/* 0AF24 808E1794 46000004 */  sqrt.s  $f0, $f0                   
/* 0AF28 808E1798 4604003C */  c.lt.s  $f0, $f4                   
/* 0AF2C 808E179C 00000000 */  nop
/* 0AF30 808E17A0 45000003 */  bc1f    .L808E17B0                 
/* 0AF34 808E17A4 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 0AF38 808E17A8 A30D01C0 */  sb      $t5, 0x01C0($t8)           ## 000001C0
/* 0AF3C 808E17AC A62E01C2 */  sh      $t6, 0x01C2($s1)           ## 000001C2
.L808E17B0:
/* 0AF40 808E17B0 4480A000 */  mtc1    $zero, $f20                ## $f20 = 0.00
.L808E17B4:
/* 0AF44 808E17B4 26300610 */  addiu   $s0, $s1, 0x0610           ## $s0 = 00000610
/* 0AF48 808E17B8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000610
/* 0AF4C 808E17BC 0C0189B7 */  jal     Collider_UpdateCylinder
              
/* 0AF50 808E17C0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0AF54 808E17C4 862F01B8 */  lh      $t7, 0x01B8($s1)           ## 000001B8
/* 0AF58 808E17C8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0AF5C 808E17CC 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0AF60 808E17D0 15E00004 */  bne     $t7, $zero, .L808E17E4     
/* 0AF64 808E17D4 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 0AF68 808E17D8 00812821 */  addu    $a1, $a0, $at              
/* 0AF6C 808E17DC 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 0AF70 808E17E0 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000610
.L808E17E4:
/* 0AF74 808E17E4 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
.L808E17E8:
/* 0AF78 808E17E8 3C018090 */  lui     $at, %hi(D_808F81A8)       ## $at = 80900000
/* 0AF7C 808E17EC C42A81A8 */  lwc1    $f10, %lo(D_808F81A8)($at) 
/* 0AF80 808E17F0 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0AF84 808E17F4 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 0AF88 808E17F8 E7B400A8 */  swc1    $f20, 0x00A8($sp)          
/* 0AF8C 808E17FC E7B400A0 */  swc1    $f20, 0x00A0($sp)          
/* 0AF90 808E1800 E7B400B4 */  swc1    $f20, 0x00B4($sp)          
/* 0AF94 808E1804 E7B400B0 */  swc1    $f20, 0x00B0($sp)          
/* 0AF98 808E1808 E7B400AC */  swc1    $f20, 0x00AC($sp)          
/* 0AF9C 808E180C 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0AFA0 808E1810 E7AA00A4 */  swc1    $f10, 0x00A4($sp)          
/* 0AFA4 808E1814 C6280024 */  lwc1    $f8, 0x0024($s1)           ## 00000024
/* 0AFA8 808E1818 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0AFAC 808E181C 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 0AFB0 808E1820 46080180 */  add.s   $f6, $f0, $f8              
/* 0AFB4 808E1824 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0AFB8 808E1828 E7A60094 */  swc1    $f6, 0x0094($sp)           
/* 0AFBC 808E182C C6240028 */  lwc1    $f4, 0x0028($s1)           ## 00000028
/* 0AFC0 808E1830 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0AFC4 808E1834 44816000 */  mtc1    $at, $f12                  ## $f12 = 30.00
/* 0AFC8 808E1838 46040280 */  add.s   $f10, $f0, $f4             
/* 0AFCC 808E183C 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0AFD0 808E1840 E7AA0098 */  swc1    $f10, 0x0098($sp)          
/* 0AFD4 808E1844 C628002C */  lwc1    $f8, 0x002C($s1)           ## 0000002C
/* 0AFD8 808E1848 3C0143FA */  lui     $at, 0x43FA                ## $at = 43FA0000
/* 0AFDC 808E184C 44816000 */  mtc1    $at, $f12                  ## $f12 = 500.00
/* 0AFE0 808E1850 46080180 */  add.s   $f6, $f0, $f8              
/* 0AFE4 808E1854 0C00CFBE */  jal     Rand_ZeroFloat
              
/* 0AFE8 808E1858 E7A6009C */  swc1    $f6, 0x009C($sp)           
/* 0AFEC 808E185C 3C01442F */  lui     $at, 0x442F                ## $at = 442F0000
/* 0AFF0 808E1860 44812000 */  mtc1    $at, $f4                   ## $f4 = 700.00
/* 0AFF4 808E1864 2419001E */  addiu   $t9, $zero, 0x001E         ## $t9 = 0000001E
/* 0AFF8 808E1868 AFB90014 */  sw      $t9, 0x0014($sp)           
/* 0AFFC 808E186C 46040280 */  add.s   $f10, $f0, $f4             
/* 0B000 808E1870 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0B004 808E1874 27A50094 */  addiu   $a1, $sp, 0x0094           ## $a1 = FFFFFFD4
/* 0B008 808E1878 27A600AC */  addiu   $a2, $sp, 0x00AC           ## $a2 = FFFFFFEC
/* 0B00C 808E187C E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 0B010 808E1880 0C235A6C */  jal     func_808D69B0              
/* 0B014 808E1884 27A700A0 */  addiu   $a3, $sp, 0x00A0           ## $a3 = FFFFFFE0
/* 0B018 808E1888 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0B01C 808E188C 00108400 */  sll     $s0, $s0, 16               
/* 0B020 808E1890 00108403 */  sra     $s0, $s0, 16               
/* 0B024 808E1894 2A010002 */  slti    $at, $s0, 0x0002           
/* 0B028 808E1898 1420FFD3 */  bne     $at, $zero, .L808E17E8     
/* 0B02C 808E189C 00000000 */  nop
/* 0B030 808E18A0 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 0B034 808E18A4 44813000 */  mtc1    $at, $f6                   ## $f6 = 10.00
/* 0B038 808E18A8 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 0B03C 808E18AC 3C0141A0 */  lui     $at, 0x41A0                ## $at = 41A00000
/* 0B040 808E18B0 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0B044 808E18B4 4606403C */  c.lt.s  $f8, $f6                   
/* 0B048 808E18B8 02202825 */  or      $a1, $s1, $zero            ## $a1 = 00000000
/* 0B04C 808E18BC 3C0741A0 */  lui     $a3, 0x41A0                ## $a3 = 41A00000
/* 0B050 808E18C0 24090004 */  addiu   $t1, $zero, 0x0004         ## $t1 = 00000004
/* 0B054 808E18C4 45020007 */  bc1fl   .L808E18E4                 
/* 0B058 808E18C8 C6200024 */  lwc1    $f0, 0x0024($s1)           ## 00000024
/* 0B05C 808E18CC 44812000 */  mtc1    $at, $f4                   ## $f4 = 20.00
/* 0B060 808E18D0 4406A000 */  mfc1    $a2, $f20                  
/* 0B064 808E18D4 AFA90014 */  sw      $t1, 0x0014($sp)           
/* 0B068 808E18D8 0C00B92D */  jal     Actor_UpdateBgCheckInfo              
/* 0B06C 808E18DC E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 0B070 808E18E0 C6200024 */  lwc1    $f0, 0x0024($s1)           ## 00000024
.L808E18E4:
/* 0B074 808E18E4 3C018090 */  lui     $at, %hi(D_808F81AC)       ## $at = 80900000
/* 0B078 808E18E8 C42281AC */  lwc1    $f2, %lo(D_808F81AC)($at)  
/* 0B07C 808E18EC 46000005 */  abs.s   $f0, $f0                   
/* 0B080 808E18F0 3C0143FA */  lui     $at, 0x43FA                ## $at = 43FA0000
/* 0B084 808E18F4 4600103C */  c.lt.s  $f2, $f0                   
/* 0B088 808E18F8 240B0004 */  addiu   $t3, $zero, 0x0004         ## $t3 = 00000004
/* 0B08C 808E18FC 4503000E */  bc1tl   .L808E1938                 
/* 0B090 808E1900 A7AB00BA */  sh      $t3, 0x00BA($sp)           
/* 0B094 808E1904 44815000 */  mtc1    $at, $f10                  ## $f10 = 500.00
/* 0B098 808E1908 C6280028 */  lwc1    $f8, 0x0028($s1)           ## 00000028
/* 0B09C 808E190C 4608503C */  c.lt.s  $f10, $f8                  
/* 0B0A0 808E1910 00000000 */  nop
/* 0B0A4 808E1914 45030008 */  bc1tl   .L808E1938                 
/* 0B0A8 808E1918 A7AB00BA */  sh      $t3, 0x00BA($sp)           
/* 0B0AC 808E191C C620002C */  lwc1    $f0, 0x002C($s1)           ## 0000002C
/* 0B0B0 808E1920 46000005 */  abs.s   $f0, $f0                   
/* 0B0B4 808E1924 4600103C */  c.lt.s  $f2, $f0                   
/* 0B0B8 808E1928 00000000 */  nop
/* 0B0BC 808E192C 45020003 */  bc1fl   .L808E193C                 
/* 0B0C0 808E1930 87AA00BA */  lh      $t2, 0x00BA($sp)           
/* 0B0C4 808E1934 A7AB00BA */  sh      $t3, 0x00BA($sp)           
.L808E1938:
/* 0B0C8 808E1938 87AA00BA */  lh      $t2, 0x00BA($sp)           
.L808E193C:
/* 0B0CC 808E193C 87B800BA */  lh      $t8, 0x00BA($sp)           
/* 0B0D0 808E1940 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0B0D4 808E1944 15400005 */  bne     $t2, $zero, .L808E195C     
/* 0B0D8 808E1948 00000000 */  nop
/* 0B0DC 808E194C 962C0088 */  lhu     $t4, 0x0088($s1)           ## 00000088
/* 0B0E0 808E1950 318D0001 */  andi    $t5, $t4, 0x0001           ## $t5 = 00000000
/* 0B0E4 808E1954 51A0007A */  beql    $t5, $zero, .L808E1B40     
/* 0B0E8 808E1958 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L808E195C:
/* 0B0EC 808E195C 17010011 */  bne     $t8, $at, .L808E19A4       
/* 0B0F0 808E1960 262F0024 */  addiu   $t7, $s1, 0x0024           ## $t7 = 00000024
/* 0B0F4 808E1964 3C0142C8 */  lui     $at, 0x42C8                ## $at = 42C80000
/* 0B0F8 808E1968 44816000 */  mtc1    $at, $f12                  ## $f12 = 100.00
/* 0B0FC 808E196C 0C00CFBE */  jal     Rand_ZeroFloat
              
/* 0B100 808E1970 00000000 */  nop
/* 0B104 808E1974 3C014396 */  lui     $at, 0x4396                ## $at = 43960000
/* 0B108 808E1978 44813000 */  mtc1    $at, $f6                   ## $f6 = 300.00
/* 0B10C 808E197C 3C014120 */  lui     $at, 0x4120                ## $at = 41200000
/* 0B110 808E1980 44815000 */  mtc1    $at, $f10                  ## $f10 = 10.00
/* 0B114 808E1984 46060100 */  add.s   $f4, $f0, $f6              
/* 0B118 808E1988 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 0B11C 808E198C 4481A000 */  mtc1    $at, $f20                  ## $f20 = 25.00
/* 0B120 808E1990 240E0028 */  addiu   $t6, $zero, 0x0028         ## $t6 = 00000028
/* 0B124 808E1994 E7A40058 */  swc1    $f4, 0x0058($sp)           
/* 0B128 808E1998 A7AE004E */  sh      $t6, 0x004E($sp)           
/* 0B12C 808E199C 10000015 */  beq     $zero, $zero, .L808E19F4   
/* 0B130 808E19A0 E7AA0054 */  swc1    $f10, 0x0054($sp)          
.L808E19A4:
/* 0B134 808E19A4 3C014348 */  lui     $at, 0x4348                ## $at = 43480000
/* 0B138 808E19A8 44816000 */  mtc1    $at, $f12                  ## $f12 = 200.00
/* 0B13C 808E19AC 0C00CFBE */  jal     Rand_ZeroFloat
              
/* 0B140 808E19B0 AFAF0040 */  sw      $t7, 0x0040($sp)           
/* 0B144 808E19B4 3C0143FA */  lui     $at, 0x43FA                ## $at = 43FA0000
/* 0B148 808E19B8 44814000 */  mtc1    $at, $f8                   ## $f8 = 500.00
/* 0B14C 808E19BC 3C014170 */  lui     $at, 0x4170                ## $at = 41700000
/* 0B150 808E19C0 44812000 */  mtc1    $at, $f4                   ## $f4 = 15.00
/* 0B154 808E19C4 46080180 */  add.s   $f6, $f0, $f8              
/* 0B158 808E19C8 3C0141F0 */  lui     $at, 0x41F0                ## $at = 41F00000
/* 0B15C 808E19CC 4481A000 */  mtc1    $at, $f20                  ## $f20 = 30.00
/* 0B160 808E19D0 24190046 */  addiu   $t9, $zero, 0x0046         ## $t9 = 00000046
/* 0B164 808E19D4 E7A60058 */  swc1    $f6, 0x0058($sp)           
/* 0B168 808E19D8 A7B9004E */  sh      $t9, 0x004E($sp)           
/* 0B16C 808E19DC 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0B170 808E19E0 8FA50040 */  lw      $a1, 0x0040($sp)           
/* 0B174 808E19E4 24060050 */  addiu   $a2, $zero, 0x0050         ## $a2 = 00000050
/* 0B178 808E19E8 2407390B */  addiu   $a3, $zero, 0x390B         ## $a3 = 0000390B
/* 0B17C 808E19EC 0C01AEB6 */  jal     Audio_PlaySoundAtPosition
              
/* 0B180 808E19F0 E7A40054 */  swc1    $f4, 0x0054($sp)           
.L808E19F4:
/* 0B184 808E19F4 87A9004E */  lh      $t1, 0x004E($sp)           
/* 0B188 808E19F8 00008025 */  or      $s0, $zero, $zero          ## $s0 = 00000000
/* 0B18C 808E19FC 262B0024 */  addiu   $t3, $s1, 0x0024           ## $t3 = 00000024
/* 0B190 808E1A00 5920002D */  blezl   $t1, .L808E1AB8            
/* 0B194 808E1A04 87B800BA */  lh      $t8, 0x00BA($sp)           
/* 0B198 808E1A08 AFAB0040 */  sw      $t3, 0x0040($sp)           
/* 0B19C 808E1A0C 87AA00BA */  lh      $t2, 0x00BA($sp)           
.L808E1A10:
/* 0B1A0 808E1A10 1140000B */  beq     $t2, $zero, .L808E1A40     
/* 0B1A4 808E1A14 00000000 */  nop
/* 0B1A8 808E1A18 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0B1AC 808E1A1C 4600A306 */  mov.s   $f12, $f20                 
/* 0B1B0 808E1A20 E7A000AC */  swc1    $f0, 0x00AC($sp)           
/* 0B1B4 808E1A24 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0B1B8 808E1A28 4600A306 */  mov.s   $f12, $f20                 
/* 0B1BC 808E1A2C E7A000B0 */  swc1    $f0, 0x00B0($sp)           
/* 0B1C0 808E1A30 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0B1C4 808E1A34 4600A306 */  mov.s   $f12, $f20                 
/* 0B1C8 808E1A38 1000000B */  beq     $zero, $zero, .L808E1A68   
/* 0B1CC 808E1A3C E7A000B4 */  swc1    $f0, 0x00B4($sp)           
.L808E1A40:
/* 0B1D0 808E1A40 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0B1D4 808E1A44 4600A306 */  mov.s   $f12, $f20                 
/* 0B1D8 808E1A48 3C0141C8 */  lui     $at, 0x41C8                ## $at = 41C80000
/* 0B1DC 808E1A4C 44816000 */  mtc1    $at, $f12                  ## $f12 = 25.00
/* 0B1E0 808E1A50 0C00CFBE */  jal     Rand_ZeroFloat
              
/* 0B1E4 808E1A54 E7A000AC */  swc1    $f0, 0x00AC($sp)           
/* 0B1E8 808E1A58 E7A000B0 */  swc1    $f0, 0x00B0($sp)           
/* 0B1EC 808E1A5C 0C00CFC8 */  jal     Rand_CenteredFloat
              
/* 0B1F0 808E1A60 4600A306 */  mov.s   $f12, $f20                 
/* 0B1F4 808E1A64 E7A000B4 */  swc1    $f0, 0x00B4($sp)           
.L808E1A68:
/* 0B1F8 808E1A68 C7AA0058 */  lwc1    $f10, 0x0058($sp)          
/* 0B1FC 808E1A6C C7A80054 */  lwc1    $f8, 0x0054($sp)           
/* 0B200 808E1A70 3C07808E */  lui     $a3, %hi(D_808E4C6C)       ## $a3 = 808E0000
/* 0B204 808E1A74 240C001E */  addiu   $t4, $zero, 0x001E         ## $t4 = 0000001E
/* 0B208 808E1A78 AFAC0018 */  sw      $t4, 0x0018($sp)           
/* 0B20C 808E1A7C 24E74C6C */  addiu   $a3, $a3, %lo(D_808E4C6C)  ## $a3 = 808E4C6C
/* 0B210 808E1A80 8FA400C4 */  lw      $a0, 0x00C4($sp)           
/* 0B214 808E1A84 8FA50040 */  lw      $a1, 0x0040($sp)           
/* 0B218 808E1A88 27A600AC */  addiu   $a2, $sp, 0x00AC           ## $a2 = FFFFFFEC
/* 0B21C 808E1A8C E7AA0010 */  swc1    $f10, 0x0010($sp)          
/* 0B220 808E1A90 0C235AAB */  jal     func_808D6AAC              
/* 0B224 808E1A94 E7A80014 */  swc1    $f8, 0x0014($sp)           
/* 0B228 808E1A98 87AD004E */  lh      $t5, 0x004E($sp)           
/* 0B22C 808E1A9C 26100001 */  addiu   $s0, $s0, 0x0001           ## $s0 = 00000001
/* 0B230 808E1AA0 00108400 */  sll     $s0, $s0, 16               
/* 0B234 808E1AA4 00108403 */  sra     $s0, $s0, 16               
/* 0B238 808E1AA8 020D082A */  slt     $at, $s0, $t5              
/* 0B23C 808E1AAC 5420FFD8 */  bnel    $at, $zero, .L808E1A10     
/* 0B240 808E1AB0 87AA00BA */  lh      $t2, 0x00BA($sp)           
/* 0B244 808E1AB4 87B800BA */  lh      $t8, 0x00BA($sp)           
.L808E1AB8:
/* 0B248 808E1AB8 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
/* 0B24C 808E1ABC 53020020 */  beql    $t8, $v0, .L808E1B40       
/* 0B250 808E1AC0 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0B254 808E1AC4 A62201A8 */  sh      $v0, 0x01A8($s1)           ## 000001A8
/* 0B258 808E1AC8 87AE00BA */  lh      $t6, 0x00BA($sp)           
/* 0B25C 808E1ACC 8FA500C4 */  lw      $a1, 0x00C4($sp)           
/* 0B260 808E1AD0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 0B264 808E1AD4 55C00004 */  bnel    $t6, $zero, .L808E1AE8     
/* 0B268 808E1AD8 87AF00BA */  lh      $t7, 0x00BA($sp)           
/* 0B26C 808E1ADC 0C2383D3 */  jal     func_808E0F4C              
/* 0B270 808E1AE0 26260024 */  addiu   $a2, $s1, 0x0024           ## $a2 = 00000024
/* 0B274 808E1AE4 87AF00BA */  lh      $t7, 0x00BA($sp)           
.L808E1AE8:
/* 0B278 808E1AE8 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 0B27C 808E1AEC 8FA40064 */  lw      $a0, 0x0064($sp)           
/* 0B280 808E1AF0 15E10005 */  bne     $t7, $at, .L808E1B08       
/* 0B284 808E1AF4 8FA500C4 */  lw      $a1, 0x00C4($sp)           
/* 0B288 808E1AF8 0C23719B */  jal     func_808DC66C              
/* 0B28C 808E1AFC 8FA40064 */  lw      $a0, 0x0064($sp)           
/* 0B290 808E1B00 1000000F */  beq     $zero, $zero, .L808E1B40   
/* 0B294 808E1B04 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L808E1B08:
/* 0B298 808E1B08 8C890194 */  lw      $t1, 0x0194($a0)           ## 00000194
/* 0B29C 808E1B0C 3C19808E */  lui     $t9, %hi(func_808DC14C)    ## $t9 = 808E0000
/* 0B2A0 808E1B10 2739C14C */  addiu   $t9, $t9, %lo(func_808DC14C) ## $t9 = 808DC14C
/* 0B2A4 808E1B14 5729000A */  bnel    $t9, $t1, .L808E1B40       
/* 0B2A8 808E1B18 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0B2AC 808E1B1C 0C236EBC */  jal     func_808DBAF0              
/* 0B2B0 808E1B20 8FA500C4 */  lw      $a1, 0x00C4($sp)           
/* 0B2B4 808E1B24 87AB00BA */  lh      $t3, 0x00BA($sp)           
/* 0B2B8 808E1B28 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0B2BC 808E1B2C 8FAC0064 */  lw      $t4, 0x0064($sp)           
/* 0B2C0 808E1B30 15610002 */  bne     $t3, $at, .L808E1B3C       
/* 0B2C4 808E1B34 240A007D */  addiu   $t2, $zero, 0x007D         ## $t2 = 0000007D
/* 0B2C8 808E1B38 A58A01B6 */  sh      $t2, 0x01B6($t4)           ## 000001B6
.L808E1B3C:
/* 0B2CC 808E1B3C 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L808E1B40:
/* 0B2D0 808E1B40 D7B40020 */  ldc1    $f20, 0x0020($sp)          
/* 0B2D4 808E1B44 8FB0002C */  lw      $s0, 0x002C($sp)           
/* 0B2D8 808E1B48 8FB10030 */  lw      $s1, 0x0030($sp)           
/* 0B2DC 808E1B4C 03E00008 */  jr      $ra                        
/* 0B2E0 808E1B50 27BD00C0 */  addiu   $sp, $sp, 0x00C0           ## $sp = 00000000
