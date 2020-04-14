.rdata
glabel D_80B99B04
    .asciz "Error 群れな敵 (%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80B99B30
    .asciz "../z_obj_mure.c"
    .balign 4

glabel D_80B99B40
    .asciz "Error 群れな敵 (%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80B99B6C
    .asciz "../z_obj_mure.c"
    .balign 4

glabel D_80B99B7C
    .asciz "群れな敵 (arg_data 0x%04x)(chNum(%d) ptn(%d) svNum(%d) type(%d))\n"
    .balign 4

glabel D_80B99BC0
    .asciz "Warning : 個体数が設定されていません(%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80B99C00
    .asciz "../z_obj_mure.c"
    .balign 4

.text
glabel ObjMure_Init
/* 000A8 80B98B48 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 000AC 80B98B4C AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 000B0 80B98B50 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 000B4 80B98B54 8487001C */  lh      $a3, 0x001C($a0)           ## 0000001C
/* 000B8 80B98B58 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 000BC 80B98B5C 240600ED */  addiu   $a2, $zero, 0x00ED         ## $a2 = 000000ED
/* 000C0 80B98B60 0007C203 */  sra     $t8, $a3,  8               
/* 000C4 80B98B64 33190007 */  andi    $t9, $t8, 0x0007           ## $t9 = 00000000
/* 000C8 80B98B68 A4990152 */  sh      $t9, 0x0152($a0)           ## 00000152
/* 000CC 80B98B6C 848B0152 */  lh      $t3, 0x0152($a0)           ## 00000152
/* 000D0 80B98B70 00077303 */  sra     $t6, $a3, 12               
/* 000D4 80B98B74 00074143 */  sra     $t0, $a3,  5               
/* 000D8 80B98B78 31CF000F */  andi    $t7, $t6, 0x000F           ## $t7 = 00000000
/* 000DC 80B98B7C 31090003 */  andi    $t1, $t0, 0x0003           ## $t1 = 00000000
/* 000E0 80B98B80 30EA001F */  andi    $t2, $a3, 0x001F           ## $t2 = 00000000
/* 000E4 80B98B84 29610004 */  slti    $at, $t3, 0x0004           
/* 000E8 80B98B88 A48F0150 */  sh      $t7, 0x0150($a0)           ## 00000150
/* 000EC 80B98B8C A4890154 */  sh      $t1, 0x0154($a0)           ## 00000154
/* 000F0 80B98B90 1420000A */  bne     $at, $zero, .L80B98BBC     
/* 000F4 80B98B94 A48A0156 */  sh      $t2, 0x0156($a0)           ## 00000156
/* 000F8 80B98B98 3C0480BA */  lui     $a0, %hi(D_80B99B04)       ## $a0 = 80BA0000
/* 000FC 80B98B9C 3C0580BA */  lui     $a1, %hi(D_80B99B30)       ## $a1 = 80BA0000
/* 00100 80B98BA0 24A59B30 */  addiu   $a1, $a1, %lo(D_80B99B30)  ## $a1 = 80B99B30
/* 00104 80B98BA4 0C00084C */  jal     osSyncPrintf
              
/* 00108 80B98BA8 24849B04 */  addiu   $a0, $a0, %lo(D_80B99B04)  ## $a0 = 80B99B04
/* 0010C 80B98BAC 0C00B55C */  jal     Actor_Kill
              
/* 00110 80B98BB0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00114 80B98BB4 1000002D */  beq     $zero, $zero, .L80B98C6C   
/* 00118 80B98BB8 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B98BBC:
/* 0011C 80B98BBC 860C0156 */  lh      $t4, 0x0156($s0)           ## 00000156
/* 00120 80B98BC0 3C0480BA */  lui     $a0, %hi(D_80B99B40)       ## $a0 = 80BA0000
/* 00124 80B98BC4 24849B40 */  addiu   $a0, $a0, %lo(D_80B99B40)  ## $a0 = 80B99B40
/* 00128 80B98BC8 29810005 */  slti    $at, $t4, 0x0005           
/* 0012C 80B98BCC 14200008 */  bne     $at, $zero, .L80B98BF0     
/* 00130 80B98BD0 240600F5 */  addiu   $a2, $zero, 0x00F5         ## $a2 = 000000F5
/* 00134 80B98BD4 3C0580BA */  lui     $a1, %hi(D_80B99B6C)       ## $a1 = 80BA0000
/* 00138 80B98BD8 0C00084C */  jal     osSyncPrintf
              
/* 0013C 80B98BDC 24A59B6C */  addiu   $a1, $a1, %lo(D_80B99B6C)  ## $a1 = 80B99B6C
/* 00140 80B98BE0 0C00B55C */  jal     Actor_Kill
              
/* 00144 80B98BE4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00148 80B98BE8 10000020 */  beq     $zero, $zero, .L80B98C6C   
/* 0014C 80B98BEC 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B98BF0:
/* 00150 80B98BF0 0C2E62C7 */  jal     func_80B98B1C              
/* 00154 80B98BF4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00158 80B98BF8 14400005 */  bne     $v0, $zero, .L80B98C10     
/* 0015C 80B98BFC 3C0D80BA */  lui     $t5, %hi(func_80B992E4)    ## $t5 = 80BA0000
/* 00160 80B98C00 0C00B55C */  jal     Actor_Kill
              
/* 00164 80B98C04 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00168 80B98C08 10000018 */  beq     $zero, $zero, .L80B98C6C   
/* 0016C 80B98C0C 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B98C10:
/* 00170 80B98C10 860E0154 */  lh      $t6, 0x0154($s0)           ## 00000154
/* 00174 80B98C14 25AD92E4 */  addiu   $t5, $t5, %lo(func_80B992E4) ## $t5 = FFFF92E4
/* 00178 80B98C18 AE0D014C */  sw      $t5, 0x014C($s0)           ## 0000014C
/* 0017C 80B98C1C 8605001C */  lh      $a1, 0x001C($s0)           ## 0000001C
/* 00180 80B98C20 86060150 */  lh      $a2, 0x0150($s0)           ## 00000150
/* 00184 80B98C24 86070152 */  lh      $a3, 0x0152($s0)           ## 00000152
/* 00188 80B98C28 AFAE0010 */  sw      $t6, 0x0010($sp)           
/* 0018C 80B98C2C 860F0156 */  lh      $t7, 0x0156($s0)           ## 00000156
/* 00190 80B98C30 3C0480BA */  lui     $a0, %hi(D_80B99B7C)       ## $a0 = 80BA0000
/* 00194 80B98C34 24849B7C */  addiu   $a0, $a0, %lo(D_80B99B7C)  ## $a0 = 80B99B7C
/* 00198 80B98C38 0C00084C */  jal     osSyncPrintf
              
/* 0019C 80B98C3C AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 001A0 80B98C40 0C2E6322 */  jal     func_80B98C88              
/* 001A4 80B98C44 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001A8 80B98C48 1C400007 */  bgtz    $v0, .L80B98C68            
/* 001AC 80B98C4C 3C0480BA */  lui     $a0, %hi(D_80B99BC0)       ## $a0 = 80BA0000
/* 001B0 80B98C50 3C0580BA */  lui     $a1, %hi(D_80B99C00)       ## $a1 = 80BA0000
/* 001B4 80B98C54 24A59C00 */  addiu   $a1, $a1, %lo(D_80B99C00)  ## $a1 = 80B99C00
/* 001B8 80B98C58 24849BC0 */  addiu   $a0, $a0, %lo(D_80B99BC0)  ## $a0 = 80B99BC0
/* 001BC 80B98C5C 2406010C */  addiu   $a2, $zero, 0x010C         ## $a2 = 0000010C
/* 001C0 80B98C60 0C00084C */  jal     osSyncPrintf
              
/* 001C4 80B98C64 8607001C */  lh      $a3, 0x001C($s0)           ## 0000001C
.L80B98C68:
/* 001C8 80B98C68 8FBF0024 */  lw      $ra, 0x0024($sp)           
.L80B98C6C:
/* 001CC 80B98C6C 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 001D0 80B98C70 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 001D4 80B98C74 03E00008 */  jr      $ra                        
/* 001D8 80B98C78 00000000 */  nop
