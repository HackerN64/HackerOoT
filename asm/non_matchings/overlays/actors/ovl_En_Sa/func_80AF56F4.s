.late_rodata
glabel jtbl_80AF74B0
.word L80AF57C4
.word L80AF57C4
.word L80AF573C
.word L80AF57C4
.word L80AF57C4
.word L80AF57C4
.word L80AF57C4
.word L80AF57C4
.word L80AF57C4
.word L80AF57C4

.text
glabel func_80AF56F4
/* 00194 80AF56F4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00198 80AF56F8 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 0019C 80AF56FC 00802825 */  or      $a1, $a0, $zero            ## $a1 = 00000000
/* 001A0 80AF5700 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 001A4 80AF5704 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 001A8 80AF5708 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
/* 001AC 80AF570C A7A3001E */  sh      $v1, 0x001E($sp)           
/* 001B0 80AF5710 0C2BD558 */  jal     func_80AF5560              
/* 001B4 80AF5714 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 001B8 80AF5718 2C41000A */  sltiu   $at, $v0, 0x000A           
/* 001BC 80AF571C 10200029 */  beq     $at, $zero, .L80AF57C4     
/* 001C0 80AF5720 87A3001E */  lh      $v1, 0x001E($sp)           
/* 001C4 80AF5724 00027080 */  sll     $t6, $v0,  2               
/* 001C8 80AF5728 3C0180AF */  lui     $at, %hi(jtbl_80AF74B0)       ## $at = 80AF0000
/* 001CC 80AF572C 002E0821 */  addu    $at, $at, $t6              
/* 001D0 80AF5730 8C2E74B0 */  lw      $t6, %lo(jtbl_80AF74B0)($at)  
/* 001D4 80AF5734 01C00008 */  jr      $t6                        
/* 001D8 80AF5738 00000000 */  nop
glabel L80AF573C
/* 001DC 80AF573C 8FAF0024 */  lw      $t7, 0x0024($sp)           
/* 001E0 80AF5740 24011002 */  addiu   $at, $zero, 0x1002         ## $at = 00001002
/* 001E4 80AF5744 95E2010E */  lhu     $v0, 0x010E($t7)           ## 0000010E
/* 001E8 80AF5748 10410007 */  beq     $v0, $at, .L80AF5768       
/* 001EC 80AF574C 24011031 */  addiu   $at, $zero, 0x1031         ## $at = 00001031
/* 001F0 80AF5750 1041000C */  beq     $v0, $at, .L80AF5784       
/* 001F4 80AF5754 24011047 */  addiu   $at, $zero, 0x1047         ## $at = 00001047
/* 001F8 80AF5758 10410014 */  beq     $v0, $at, .L80AF57AC       
/* 001FC 80AF575C 00000000 */  nop
/* 00200 80AF5760 10000018 */  beq     $zero, $zero, .L80AF57C4   
/* 00204 80AF5764 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80AF5768:
/* 00208 80AF5768 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0020C 80AF576C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00210 80AF5770 94580EF8 */  lhu     $t8, 0x0EF8($v0)           ## 8015F558
/* 00214 80AF5774 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 00218 80AF5778 37190002 */  ori     $t9, $t8, 0x0002           ## $t9 = 00000002
/* 0021C 80AF577C 10000011 */  beq     $zero, $zero, .L80AF57C4   
/* 00220 80AF5780 A4590EF8 */  sh      $t9, 0x0EF8($v0)           ## 8015F558
.L80AF5784:
/* 00224 80AF5784 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00228 80AF5788 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 0022C 80AF578C 94480ED4 */  lhu     $t0, 0x0ED4($v0)           ## 8015F534
/* 00230 80AF5790 944A0EF8 */  lhu     $t2, 0x0EF8($v0)           ## 8015F558
/* 00234 80AF5794 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 00238 80AF5798 35090008 */  ori     $t1, $t0, 0x0008           ## $t1 = 00000008
/* 0023C 80AF579C 354B0008 */  ori     $t3, $t2, 0x0008           ## $t3 = 00000008
/* 00240 80AF57A0 A4490ED4 */  sh      $t1, 0x0ED4($v0)           ## 8015F534
/* 00244 80AF57A4 10000007 */  beq     $zero, $zero, .L80AF57C4   
/* 00248 80AF57A8 A44B0EF8 */  sh      $t3, 0x0EF8($v0)           ## 8015F558
.L80AF57AC:
/* 0024C 80AF57AC 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00250 80AF57B0 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00254 80AF57B4 944C0EF8 */  lhu     $t4, 0x0EF8($v0)           ## 8015F558
/* 00258 80AF57B8 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
/* 0025C 80AF57BC 358D0020 */  ori     $t5, $t4, 0x0020           ## $t5 = 00000020
/* 00260 80AF57C0 A44D0EF8 */  sh      $t5, 0x0EF8($v0)           ## 8015F558
glabel L80AF57C4
.L80AF57C4:
/* 00264 80AF57C4 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00268 80AF57C8 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 0026C 80AF57CC 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
/* 00270 80AF57D0 03E00008 */  jr      $ra                        
/* 00274 80AF57D4 00000000 */  nop
