glabel func_80B002D8
/* 02028 80B002D8 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 0202C 80B002DC AFBF001C */  sw      $ra, 0x001C($sp)           
/* 02030 80B002E0 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 02034 80B002E4 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 02038 80B002E8 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0203C 80B002EC 0C042F6F */  jal     func_8010BDBC              
/* 02040 80B002F0 24A420D8 */  addiu   $a0, $a1, 0x20D8           ## $a0 = 000020D8
/* 02044 80B002F4 24010006 */  addiu   $at, $zero, 0x0006         ## $at = 00000006
/* 02048 80B002F8 54410019 */  bnel    $v0, $at, .L80B00360       
/* 0204C 80B002FC 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 02050 80B00300 0C041AF2 */  jal     func_80106BC8              
/* 02054 80B00304 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02058 80B00308 50400015 */  beql    $v0, $zero, .L80B00360     
/* 0205C 80B0030C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 02060 80B00310 0C021CC3 */  jal     Rupees_ChangeBy              
/* 02064 80B00314 2404000A */  addiu   $a0, $zero, 0x000A         ## $a0 = 0000000A
/* 02068 80B00318 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 0206C 80B0031C 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 02070 80B00320 944E0EF6 */  lhu     $t6, 0x0EF6($v0)           ## 8015F556
/* 02074 80B00324 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 02078 80B00328 35CF0200 */  ori     $t7, $t6, 0x0200           ## $t7 = 00000200
/* 0207C 80B0032C 0C2BF90A */  jal     func_80AFE428              
/* 02080 80B00330 A44F0EF6 */  sh      $t7, 0x0EF6($v0)           ## 8015F556
/* 02084 80B00334 0C023C23 */  jal     Player_UnsetMask              
/* 02088 80B00338 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0208C 80B0033C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 02090 80B00340 0C021344 */  jal     Item_Give              
/* 02094 80B00344 2405002C */  addiu   $a1, $zero, 0x002C         ## $a1 = 0000002C
/* 02098 80B00348 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0209C 80B0034C 0C042DC8 */  jal     func_8010B720              
/* 020A0 80B00350 2405101F */  addiu   $a1, $zero, 0x101F         ## $a1 = 0000101F
/* 020A4 80B00354 0C2C00DC */  jal     func_80B00370              
/* 020A8 80B00358 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 020AC 80B0035C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B00360:
/* 020B0 80B00360 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 020B4 80B00364 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 020B8 80B00368 03E00008 */  jr      $ra                        
/* 020BC 80B0036C 00000000 */  nop
