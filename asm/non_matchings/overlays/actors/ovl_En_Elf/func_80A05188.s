glabel func_80A05188
/* 03558 80A05188 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 0355C 80A0518C AFBF001C */  sw      $ra, 0x001C($sp)           
/* 03560 80A05190 AFB00018 */  sw      $s0, 0x0018($sp)           
/* 03564 80A05194 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 03568 80A05198 0C281379 */  jal     func_80A04DE4              
/* 0356C 80A0519C AFA40020 */  sw      $a0, 0x0020($sp)           
/* 03570 80A051A0 0C042F6F */  jal     func_8010BDBC              
/* 03574 80A051A4 260420D8 */  addiu   $a0, $s0, 0x20D8           ## $a0 = 000020D8
/* 03578 80A051A8 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 0357C 80A051AC 5441000F */  bnel    $v0, $at, .L80A051EC       
/* 03580 80A051B0 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 03584 80A051B4 0C041AF2 */  jal     func_80106BC8              
/* 03588 80A051B8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0358C 80A051BC 5040000B */  beql    $v0, $zero, .L80A051EC     
/* 03590 80A051C0 8FA40020 */  lw      $a0, 0x0020($sp)           
/* 03594 80A051C4 0C01B0AC */  jal     ElfMessage_GetSariaText              
/* 03598 80A051C8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 0359C 80A051CC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 035A0 80A051D0 0C042DC8 */  jal     func_8010B720              
/* 035A4 80A051D4 3045FFFF */  andi    $a1, $v0, 0xFFFF           ## $a1 = 00000000
/* 035A8 80A051D8 8FAF0020 */  lw      $t7, 0x0020($sp)           
/* 035AC 80A051DC 3C0E80A0 */  lui     $t6, %hi(func_80A05114)    ## $t6 = 80A00000
/* 035B0 80A051E0 25CE5114 */  addiu   $t6, $t6, %lo(func_80A05114) ## $t6 = 80A05114
/* 035B4 80A051E4 ADEE0130 */  sw      $t6, 0x0130($t7)           ## 00000130
/* 035B8 80A051E8 8FA40020 */  lw      $a0, 0x0020($sp)           
.L80A051EC:
/* 035BC 80A051EC 0C2813E5 */  jal     func_80A04F94              
/* 035C0 80A051F0 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 035C4 80A051F4 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 035C8 80A051F8 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 035CC 80A051FC 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 035D0 80A05200 03E00008 */  jr      $ra                        
/* 035D4 80A05204 00000000 */  nop
