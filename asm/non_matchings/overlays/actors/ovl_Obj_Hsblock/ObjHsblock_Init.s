glabel ObjHsblock_Init
/* 00114 80B93C74 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00118 80B93C78 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 0011C 80B93C7C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00120 80B93C80 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00124 80B93C84 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00128 80B93C88 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 0012C 80B93C8C 3C0680B9 */  lui     $a2, %hi(D_80B940DC)       ## $a2 = 80B90000
/* 00130 80B93C90 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00134 80B93C94 31CF0003 */  andi    $t7, $t6, 0x0003           ## $t7 = 00000000
/* 00138 80B93C98 000FC080 */  sll     $t8, $t7,  2               
/* 0013C 80B93C9C 00D83021 */  addu    $a2, $a2, $t8              
/* 00140 80B93CA0 0C2E4EDA */  jal     func_80B93B68              
/* 00144 80B93CA4 8CC640DC */  lw      $a2, %lo(D_80B940DC)($a2)  
/* 00148 80B93CA8 3C0580B9 */  lui     $a1, %hi(D_80B940CC)       ## $a1 = 80B90000
/* 0014C 80B93CAC 24A540CC */  addiu   $a1, $a1, %lo(D_80B940CC)  ## $a1 = 80B940CC
/* 00150 80B93CB0 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 00154 80B93CB4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00158 80B93CB8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0015C 80B93CBC 0C2E4EFC */  jal     func_80B93BF0              
/* 00160 80B93CC0 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 00164 80B93CC4 8603001C */  lh      $v1, 0x001C($s0)           ## 0000001C
/* 00168 80B93CC8 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0016C 80B93CCC 30620003 */  andi    $v0, $v1, 0x0003           ## $v0 = 00000000
/* 00170 80B93CD0 10400006 */  beq     $v0, $zero, .L80B93CEC     
/* 00174 80B93CD4 00000000 */  nop
/* 00178 80B93CD8 10410008 */  beq     $v0, $at, .L80B93CFC       
/* 0017C 80B93CDC 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00180 80B93CE0 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00184 80B93CE4 14410010 */  bne     $v0, $at, .L80B93D28       
/* 00188 80B93CE8 00000000 */  nop
.L80B93CEC:
/* 0018C 80B93CEC 0C2E4F64 */  jal     func_80B93D90              
/* 00190 80B93CF0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00194 80B93CF4 1000000C */  beq     $zero, $zero, .L80B93D28   
/* 00198 80B93CF8 00000000 */  nop
.L80B93CFC:
/* 0019C 80B93CFC 00032A03 */  sra     $a1, $v1,  8               
/* 001A0 80B93D00 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 001A4 80B93D04 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 001A8 80B93D08 10400005 */  beq     $v0, $zero, .L80B93D20     
/* 001AC 80B93D0C 00000000 */  nop
/* 001B0 80B93D10 0C2E4F64 */  jal     func_80B93D90              
/* 001B4 80B93D14 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001B8 80B93D18 10000003 */  beq     $zero, $zero, .L80B93D28   
/* 001BC 80B93D1C 00000000 */  nop
.L80B93D20:
/* 001C0 80B93D20 0C2E4F6C */  jal     func_80B93DB0              
/* 001C4 80B93D24 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B93D28:
/* 001C8 80B93D28 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 001CC 80B93D2C 2442FA90 */  addiu   $v0, %lo(gGameInfo)
/* 001D0 80B93D30 8C590000 */  lw      $t9, 0x0000($v0)           ## 8015FA90
/* 001D4 80B93D34 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
/* 001D8 80B93D38 A723116E */  sh      $v1, 0x116E($t9)           ## 0000116E
/* 001DC 80B93D3C 8C480000 */  lw      $t0, 0x0000($v0)           ## 8015FA90
/* 001E0 80B93D40 A5031170 */  sh      $v1, 0x1170($t0)           ## 00001170
/* 001E4 80B93D44 8C490000 */  lw      $t1, 0x0000($v0)           ## 8015FA90
/* 001E8 80B93D48 A5231172 */  sh      $v1, 0x1172($t1)           ## 00001172
/* 001EC 80B93D4C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 001F0 80B93D50 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 001F4 80B93D54 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 001F8 80B93D58 03E00008 */  jr      $ra                        
/* 001FC 80B93D5C 00000000 */  nop
