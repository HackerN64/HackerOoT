glabel func_808B8BB4
/* 002A4 808B8BB4 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 002A8 808B8BB8 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 002AC 808B8BBC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 002B0 808B8BC0 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 002B4 808B8BC4 3C05808C */  lui     $a1, %hi(D_808B911C)       ## $a1 = 808C0000
/* 002B8 808B8BC8 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 002BC 808B8BCC 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 002C0 808B8BD0 24A5911C */  addiu   $a1, $a1, %lo(D_808B911C)  ## $a1 = 808B911C
/* 002C4 808B8BD4 3C0E8016 */  lui     $t6, %hi(gSaveContext+4)
/* 002C8 808B8BD8 8DCEE664 */  lw      $t6, %lo(gSaveContext+4)($t6)
/* 002CC 808B8BDC 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 002D0 808B8BE0 24020011 */  addiu   $v0, $zero, 0x0011         ## $v0 = 00000011
/* 002D4 808B8BE4 11C00003 */  beq     $t6, $zero, .L808B8BF4     
/* 002D8 808B8BE8 00000000 */  nop
/* 002DC 808B8BEC 10000001 */  beq     $zero, $zero, .L808B8BF4   
/* 002E0 808B8BF0 24020005 */  addiu   $v0, $zero, 0x0005         ## $v0 = 00000005
.L808B8BF4:
/* 002E4 808B8BF4 54410006 */  bnel    $v0, $at, .L808B8C10       
/* 002E8 808B8BF8 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 002EC 808B8BFC 0C22E40C */  jal     func_808B9030              
/* 002F0 808B8C00 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 002F4 808B8C04 1000001E */  beq     $zero, $zero, .L808B8C80   
/* 002F8 808B8C08 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 002FC 808B8C0C 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
.L808B8C10:
/* 00300 808B8C10 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 00304 808B8C14 00052A03 */  sra     $a1, $a1,  8               
/* 00308 808B8C18 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 0030C 808B8C1C 30A5003F */  andi    $a1, $a1, 0x003F           ## $a1 = 00000000
/* 00310 808B8C20 10400014 */  beq     $v0, $zero, .L808B8C74     
/* 00314 808B8C24 00000000 */  nop
/* 00318 808B8C28 0C22E40C */  jal     func_808B9030              
/* 0031C 808B8C2C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00320 808B8C30 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00324 808B8C34 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 00328 808B8C38 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 0032C 808B8C3C 44812000 */  mtc1    $at, $f4                   ## $f4 = 80.00
/* 00330 808B8C40 C6080008 */  lwc1    $f8, 0x0008($s0)           ## 00000008
/* 00334 808B8C44 86040032 */  lh      $a0, 0x0032($s0)           ## 00000032
/* 00338 808B8C48 46040182 */  mul.s   $f6, $f0, $f4              
/* 0033C 808B8C4C 46083280 */  add.s   $f10, $f6, $f8             
/* 00340 808B8C50 0C01DE0D */  jal     Math_Coss
              ## coss?
/* 00344 808B8C54 E60A0024 */  swc1    $f10, 0x0024($s0)          ## 00000024
/* 00348 808B8C58 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 0034C 808B8C5C 44818000 */  mtc1    $at, $f16                  ## $f16 = 80.00
/* 00350 808B8C60 C6040010 */  lwc1    $f4, 0x0010($s0)           ## 00000010
/* 00354 808B8C64 46100482 */  mul.s   $f18, $f0, $f16            
/* 00358 808B8C68 46049180 */  add.s   $f6, $f18, $f4             
/* 0035C 808B8C6C 10000003 */  beq     $zero, $zero, .L808B8C7C   
/* 00360 808B8C70 E606002C */  swc1    $f6, 0x002C($s0)           ## 0000002C
.L808B8C74:
/* 00364 808B8C74 0C22E399 */  jal     func_808B8E64              
/* 00368 808B8C78 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L808B8C7C:
/* 0036C 808B8C7C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L808B8C80:
/* 00370 808B8C80 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00374 808B8C84 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00378 808B8C88 03E00008 */  jr      $ra                        
/* 0037C 808B8C8C 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
