glabel func_80B5764C
/* 0429C 80B5764C 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 042A0 80B57650 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 042A4 80B57654 AFA40020 */  sw      $a0, 0x0020($sp)           
/* 042A8 80B57658 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 042AC 80B5765C 84A200A4 */  lh      $v0, 0x00A4($a1)           ## 000000A4
/* 042B0 80B57660 2401000E */  addiu   $at, $zero, 0x000E         ## $at = 0000000E
/* 042B4 80B57664 54410015 */  bnel    $v0, $at, .L80B576BC       
/* 042B8 80B57668 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 042BC 80B5766C 0C2D536D */  jal     func_80B54DB4              
/* 042C0 80B57670 00000000 */  nop
/* 042C4 80B57674 24010026 */  addiu   $at, $zero, 0x0026         ## $at = 00000026
/* 042C8 80B57678 1441000F */  bne     $v0, $at, .L80B576B8       
/* 042CC 80B5767C 8FAF0020 */  lw      $t7, 0x0020($sp)           
/* 042D0 80B57680 8DE20314 */  lw      $v0, 0x0314($t7)           ## 00000314
/* 042D4 80B57684 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 042D8 80B57688 24420001 */  addiu   $v0, $v0, 0x0001           ## $v0 = 00000001
/* 042DC 80B5768C 5441000B */  bnel    $v0, $at, .L80B576BC       
/* 042E0 80B57690 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 042E4 80B57694 0C02FF21 */  jal     Gameplay_InCsMode              
/* 042E8 80B57698 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 042EC 80B5769C 14400006 */  bne     $v0, $zero, .L80B576B8     
/* 042F0 80B576A0 8FA40024 */  lw      $a0, 0x0024($sp)           
/* 042F4 80B576A4 240503E8 */  addiu   $a1, $zero, 0x03E8         ## $a1 = 000003E8
/* 042F8 80B576A8 24060028 */  addiu   $a2, $zero, 0x0028         ## $a2 = 00000028
/* 042FC 80B576AC 8FA70020 */  lw      $a3, 0x0020($sp)           
/* 04300 80B576B0 0C02003E */  jal     func_800800F8              
/* 04304 80B576B4 AFA00010 */  sw      $zero, 0x0010($sp)         
.L80B576B8:
/* 04308 80B576B8 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B576BC:
/* 0430C 80B576BC 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 04310 80B576C0 03E00008 */  jr      $ra                        
/* 04314 80B576C4 00000000 */  nop
