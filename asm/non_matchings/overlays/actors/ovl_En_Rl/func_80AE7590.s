glabel func_80AE7590
/* 002E0 80AE7590 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 002E4 80AE7594 3C0E8016 */  lui     $t6, %hi(gSaveContext+0x1360)
/* 002E8 80AE7598 8DCEF9C0 */  lw      $t6, %lo(gSaveContext+0x1360)($t6)
/* 002EC 80AE759C AFBF0034 */  sw      $ra, 0x0034($sp)           
/* 002F0 80AE75A0 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 002F4 80AE75A4 AFA40038 */  sw      $a0, 0x0038($sp)           
/* 002F8 80AE75A8 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 002FC 80AE75AC 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00300 80AE75B0 15C10028 */  bne     $t6, $at, .L80AE7654       
/* 00304 80AE75B4 84A200A4 */  lh      $v0, 0x00A4($a1)           ## 000000A4
/* 00308 80AE75B8 24010044 */  addiu   $at, $zero, 0x0044         ## $at = 00000044
/* 0030C 80AE75BC 54410026 */  bnel    $v0, $at, .L80AE7658       
/* 00310 80AE75C0 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 00314 80AE75C4 90AF1D6C */  lbu     $t7, 0x1D6C($a1)           ## 00001D6C
/* 00318 80AE75C8 51E00023 */  beql    $t7, $zero, .L80AE7658     
/* 0031C 80AE75CC 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 00320 80AE75D0 8CA21DA4 */  lw      $v0, 0x1DA4($a1)           ## 00001DA4
/* 00324 80AE75D4 50400020 */  beql    $v0, $zero, .L80AE7658     
/* 00328 80AE75D8 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0032C 80AE75DC 94580000 */  lhu     $t8, 0x0000($v0)           ## 00000000
/* 00330 80AE75E0 24010002 */  addiu   $at, $zero, 0x0002         ## $at = 00000002
/* 00334 80AE75E4 5701001C */  bnel    $t8, $at, .L80AE7658       
/* 00338 80AE75E8 8FBF0034 */  lw      $ra, 0x0034($sp)           
/* 0033C 80AE75EC 8C8801A8 */  lw      $t0, 0x01A8($a0)           ## 000001A8
/* 00340 80AE75F0 3C0142A0 */  lui     $at, 0x42A0                ## $at = 42A00000
/* 00344 80AE75F4 24A41C24 */  addiu   $a0, $a1, 0x1C24           ## $a0 = 00001C24
/* 00348 80AE75F8 15000016 */  bne     $t0, $zero, .L80AE7654     
/* 0034C 80AE75FC 2406008B */  addiu   $a2, $zero, 0x008B         ## $a2 = 0000008B
/* 00350 80AE7600 8CA21C44 */  lw      $v0, 0x1C44($a1)           ## 00001C44
/* 00354 80AE7604 44813000 */  mtc1    $at, $f6                   ## $f6 = 80.00
/* 00358 80AE7608 2409000E */  addiu   $t1, $zero, 0x000E         ## $t1 = 0000000E
/* 0035C 80AE760C C4400024 */  lwc1    $f0, 0x0024($v0)           ## 00000024
/* 00360 80AE7610 C4440028 */  lwc1    $f4, 0x0028($v0)           ## 00000028
/* 00364 80AE7614 C44C002C */  lwc1    $f12, 0x002C($v0)          ## 0000002C
/* 00368 80AE7618 44070000 */  mfc1    $a3, $f0                   
/* 0036C 80AE761C 46062080 */  add.s   $f2, $f4, $f6              
/* 00370 80AE7620 AFA90024 */  sw      $t1, 0x0024($sp)           
/* 00374 80AE7624 AFA00020 */  sw      $zero, 0x0020($sp)         
/* 00378 80AE7628 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 0037C 80AE762C E7A20010 */  swc1    $f2, 0x0010($sp)           
/* 00380 80AE7630 AFA00018 */  sw      $zero, 0x0018($sp)         
/* 00384 80AE7634 0C00C7D4 */  jal     Actor_Spawn
              ## ActorSpawn
/* 00388 80AE7638 E7AC0014 */  swc1    $f12, 0x0014($sp)          
/* 0038C 80AE763C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00390 80AE7640 0C021344 */  jal     Item_Give              
/* 00394 80AE7644 2405006B */  addiu   $a1, $zero, 0x006B         ## $a1 = 0000006B
/* 00398 80AE7648 8FAB0038 */  lw      $t3, 0x0038($sp)           
/* 0039C 80AE764C 240A0001 */  addiu   $t2, $zero, 0x0001         ## $t2 = 00000001
/* 003A0 80AE7650 AD6A01A8 */  sw      $t2, 0x01A8($t3)           ## 000001A8
.L80AE7654:
/* 003A4 80AE7654 8FBF0034 */  lw      $ra, 0x0034($sp)           
.L80AE7658:
/* 003A8 80AE7658 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 003AC 80AE765C 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 003B0 80AE7660 03E00008 */  jr      $ra                        
/* 003B4 80AE7664 00000000 */  nop
