.rdata
glabel D_809706AC
    .asciz "../z_demo_ec.c"
    .balign 4

glabel D_809706BC
    .asciz "../z_demo_ec.c"
    .balign 4

.text
glabel func_8096DD0C
/* 0085C 8096DD0C 27BDFFB8 */  addiu   $sp, $sp, 0xFFB8           ## $sp = FFFFFFB8
/* 00860 8096DD10 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00864 8096DD14 AFA40048 */  sw      $a0, 0x0048($sp)           
/* 00868 8096DD18 AFA5004C */  sw      $a1, 0x004C($sp)           
/* 0086C 8096DD1C 8C8F01A0 */  lw      $t7, 0x01A0($a0)           ## 000001A0
/* 00870 8096DD20 3C068097 */  lui     $a2, %hi(D_809706AC)       ## $a2 = 80970000
/* 00874 8096DD24 24C606AC */  addiu   $a2, $a2, %lo(D_809706AC)  ## $a2 = 809706AC
/* 00878 8096DD28 AFAF003C */  sw      $t7, 0x003C($sp)           
/* 0087C 8096DD2C 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 00880 8096DD30 27A40024 */  addiu   $a0, $sp, 0x0024           ## $a0 = FFFFFFDC
/* 00884 8096DD34 24070296 */  addiu   $a3, $zero, 0x0296         ## $a3 = 00000296
/* 00888 8096DD38 0C031AB1 */  jal     Graph_OpenDisps              
/* 0088C 8096DD3C AFA50038 */  sw      $a1, 0x0038($sp)           
/* 00890 8096DD40 8FA50038 */  lw      $a1, 0x0038($sp)           
/* 00894 8096DD44 8FA6004C */  lw      $a2, 0x004C($sp)           
/* 00898 8096DD48 3C08DB06 */  lui     $t0, 0xDB06                ## $t0 = DB060000
/* 0089C 8096DD4C 8CA302C0 */  lw      $v1, 0x02C0($a1)           ## 000002C0
/* 008A0 8096DD50 35080018 */  ori     $t0, $t0, 0x0018           ## $t0 = DB060018
/* 008A4 8096DD54 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 008A8 8096DD58 24790008 */  addiu   $t9, $v1, 0x0008           ## $t9 = 00000008
/* 008AC 8096DD5C ACB902C0 */  sw      $t9, 0x02C0($a1)           ## 000002C0
/* 008B0 8096DD60 AC680000 */  sw      $t0, 0x0000($v1)           ## 00000000
/* 008B4 8096DD64 8FA9003C */  lw      $t1, 0x003C($sp)           
/* 008B8 8096DD68 2407029E */  addiu   $a3, $zero, 0x029E         ## $a3 = 0000029E
/* 008BC 8096DD6C 00095100 */  sll     $t2, $t1,  4               
/* 008C0 8096DD70 01495021 */  addu    $t2, $t2, $t1              
/* 008C4 8096DD74 000A5080 */  sll     $t2, $t2,  2               
/* 008C8 8096DD78 00CA2021 */  addu    $a0, $a2, $t2              
/* 008CC 8096DD7C 00812021 */  addu    $a0, $a0, $at              
/* 008D0 8096DD80 8C8B17B4 */  lw      $t3, 0x17B4($a0)           ## 000017B4
/* 008D4 8096DD84 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 008D8 8096DD88 3C068097 */  lui     $a2, %hi(D_809706BC)       ## $a2 = 80970000
/* 008DC 8096DD8C AC6B0004 */  sw      $t3, 0x0004($v1)           ## 00000004
/* 008E0 8096DD90 8C8C17B4 */  lw      $t4, 0x17B4($a0)           ## 000017B4
/* 008E4 8096DD94 27A40024 */  addiu   $a0, $sp, 0x0024           ## $a0 = FFFFFFDC
/* 008E8 8096DD98 24C606BC */  addiu   $a2, $a2, %lo(D_809706BC)  ## $a2 = 809706BC
/* 008EC 8096DD9C 01816821 */  addu    $t5, $t4, $at              
/* 008F0 8096DDA0 3C018016 */  lui     $at, %hi(gSegments+0x18)
/* 008F4 8096DDA4 0C031AD5 */  jal     Graph_CloseDisps              
/* 008F8 8096DDA8 AC2D6FC0 */  sw      $t5, %lo(gSegments+0x18)($at)
/* 008FC 8096DDAC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00900 8096DDB0 27BD0048 */  addiu   $sp, $sp, 0x0048           ## $sp = 00000000
/* 00904 8096DDB4 03E00008 */  jr      $ra                        
/* 00908 8096DDB8 00000000 */  nop
