.rdata
glabel D_809CE420
    .asciz "../z_en_choo.c"
    .balign 4

glabel D_809CE430
    .asciz "../z_en_choo.c"
    .balign 4

glabel D_809CE440
    .asciz "../z_en_choo.c"
    .balign 4

.late_rodata
glabel D_809CE480
    .float 9.58738019108e-05

glabel D_809CE484
    .float 9.58738019108e-05

glabel D_809CE488
    .float 9.58738019108e-05

.text
glabel func_809CD144
/* 000D4 809CD144 27BDFF98 */  addiu   $sp, $sp, 0xFF98           ## $sp = FFFFFF98
/* 000D8 809CD148 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 000DC 809CD14C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 000E0 809CD150 AFA40068 */  sw      $a0, 0x0068($sp)           
/* 000E4 809CD154 AFA5006C */  sw      $a1, 0x006C($sp)           
/* 000E8 809CD158 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 000EC 809CD15C 3C06809D */  lui     $a2, %hi(D_809CE420)       ## $a2 = 809D0000
/* 000F0 809CD160 24C6E420 */  addiu   $a2, $a2, %lo(D_809CE420)  ## $a2 = 809CE420
/* 000F4 809CD164 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFD4
/* 000F8 809CD168 24070127 */  addiu   $a3, $zero, 0x0127         ## $a3 = 00000127
/* 000FC 809CD16C 0C031AB1 */  jal     Graph_OpenDisps              
/* 00100 809CD170 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00104 809CD174 8FAF006C */  lw      $t7, 0x006C($sp)           
/* 00108 809CD178 0C024F05 */  jal     func_80093C14              
/* 0010C 809CD17C 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 00110 809CD180 3C04809D */  lui     $a0, %hi(D_809CE3C0)       ## $a0 = 809D0000
/* 00114 809CD184 0C01DE1C */  jal     Math_Sins
              ## sins?
/* 00118 809CD188 8484E3C0 */  lh      $a0, %lo(D_809CE3C0)($a0)  
/* 0011C 809CD18C 3C01437A */  lui     $at, 0x437A                ## $at = 437A0000
/* 00120 809CD190 44812000 */  mtc1    $at, $f4                   ## $f4 = 250.00
/* 00124 809CD194 00000000 */  nop
/* 00128 809CD198 46040182 */  mul.s   $f6, $f0, $f4              
/* 0012C 809CD19C 4600320D */  trunc.w.s $f8, $f6                   
/* 00130 809CD1A0 44024000 */  mfc1    $v0, $f8                   
/* 00134 809CD1A4 00000000 */  nop
/* 00138 809CD1A8 04410003 */  bgez    $v0, .L809CD1B8            
/* 0013C 809CD1AC 28410100 */  slti    $at, $v0, 0x0100           
/* 00140 809CD1B0 10000006 */  beq     $zero, $zero, .L809CD1CC   
/* 00144 809CD1B4 AFA00058 */  sw      $zero, 0x0058($sp)         
.L809CD1B8:
/* 00148 809CD1B8 14200003 */  bne     $at, $zero, .L809CD1C8     
/* 0014C 809CD1BC 00401825 */  or      $v1, $v0, $zero            ## $v1 = 00000000
/* 00150 809CD1C0 10000001 */  beq     $zero, $zero, .L809CD1C8   
/* 00154 809CD1C4 240300FF */  addiu   $v1, $zero, 0x00FF         ## $v1 = 000000FF
.L809CD1C8:
/* 00158 809CD1C8 AFA30058 */  sw      $v1, 0x0058($sp)           
.L809CD1CC:
/* 0015C 809CD1CC 8FA2006C */  lw      $v0, 0x006C($sp)           
/* 00160 809CD1D0 27A40050 */  addiu   $a0, $sp, 0x0050           ## $a0 = FFFFFFE8
/* 00164 809CD1D4 845907A0 */  lh      $t9, 0x07A0($v0)           ## 000007A0
/* 00168 809CD1D8 00194080 */  sll     $t0, $t9,  2               
/* 0016C 809CD1DC 00484821 */  addu    $t1, $v0, $t0              
/* 00170 809CD1E0 0C016A5C */  jal     func_8005A970              
/* 00174 809CD1E4 8D250790 */  lw      $a1, 0x0790($t1)           ## 00000790
/* 00178 809CD1E8 87AA0052 */  lh      $t2, 0x0052($sp)           
/* 0017C 809CD1EC 3C01809D */  lui     $at, %hi(D_809CE480)       ## $at = 809D0000
/* 00180 809CD1F0 C432E480 */  lwc1    $f18, %lo(D_809CE480)($at) 
/* 00184 809CD1F4 448A5000 */  mtc1    $t2, $f10                  ## $f10 = 0.00
/* 00188 809CD1F8 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 0018C 809CD1FC 46805420 */  cvt.s.w $f16, $f10                 
/* 00190 809CD200 46128302 */  mul.s   $f12, $f16, $f18           
/* 00194 809CD204 0C034348 */  jal     Matrix_RotateY              
/* 00198 809CD208 00000000 */  nop
/* 0019C 809CD20C 87AB0050 */  lh      $t3, 0x0050($sp)           
/* 001A0 809CD210 3C01809D */  lui     $at, %hi(D_809CE484)       ## $at = 809D0000
/* 001A4 809CD214 C428E484 */  lwc1    $f8, %lo(D_809CE484)($at)  
/* 001A8 809CD218 448B2000 */  mtc1    $t3, $f4                   ## $f4 = 0.00
/* 001AC 809CD21C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 001B0 809CD220 468021A0 */  cvt.s.w $f6, $f4                   
/* 001B4 809CD224 46083302 */  mul.s   $f12, $f6, $f8             
/* 001B8 809CD228 0C0342DC */  jal     Matrix_RotateX              
/* 001BC 809CD22C 00000000 */  nop
/* 001C0 809CD230 87AC0054 */  lh      $t4, 0x0054($sp)           
/* 001C4 809CD234 3C01809D */  lui     $at, %hi(D_809CE488)       ## $at = 809D0000
/* 001C8 809CD238 C432E488 */  lwc1    $f18, %lo(D_809CE488)($at) 
/* 001CC 809CD23C 448C5000 */  mtc1    $t4, $f10                  ## $f10 = 0.00
/* 001D0 809CD240 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 001D4 809CD244 46805420 */  cvt.s.w $f16, $f10                 
/* 001D8 809CD248 46128302 */  mul.s   $f12, $f16, $f18           
/* 001DC 809CD24C 0C0343B5 */  jal     Matrix_RotateZ              
/* 001E0 809CD250 00000000 */  nop
/* 001E4 809CD254 3C04809D */  lui     $a0, %hi(D_809CE3C4)       ## $a0 = 809D0000
/* 001E8 809CD258 2484E3C4 */  addiu   $a0, $a0, %lo(D_809CE3C4)  ## $a0 = 809CE3C4
/* 001EC 809CD25C 0C0346BD */  jal     Matrix_MultVec3f              
/* 001F0 809CD260 27A5005C */  addiu   $a1, $sp, 0x005C           ## $a1 = FFFFFFF4
/* 001F4 809CD264 8FA20068 */  lw      $v0, 0x0068($sp)           
/* 001F8 809CD268 C7B20064 */  lwc1    $f18, 0x0064($sp)          
/* 001FC 809CD26C C7B0005C */  lwc1    $f16, 0x005C($sp)          
/* 00200 809CD270 C44A0040 */  lwc1    $f10, 0x0040($v0)          ## 00000040
/* 00204 809CD274 C4480038 */  lwc1    $f8, 0x0038($v0)           ## 00000038
/* 00208 809CD278 C446003C */  lwc1    $f6, 0x003C($v0)           ## 0000003C
/* 0020C 809CD27C 46125480 */  add.s   $f18, $f10, $f18           
/* 00210 809CD280 C7AA0060 */  lwc1    $f10, 0x0060($sp)          
/* 00214 809CD284 27A70050 */  addiu   $a3, $sp, 0x0050           ## $a3 = FFFFFFE8
/* 00218 809CD288 46104300 */  add.s   $f12, $f8, $f16            
/* 0021C 809CD28C 44069000 */  mfc1    $a2, $f18                  
/* 00220 809CD290 0C0345A5 */  jal     func_800D1694              
/* 00224 809CD294 460A3380 */  add.s   $f14, $f6, $f10            
/* 00228 809CD298 3C01809D */  lui     $at, %hi(D_809CE3BC)       ## $at = 809D0000
/* 0022C 809CD29C C42CE3BC */  lwc1    $f12, %lo(D_809CE3BC)($at) 
/* 00230 809CD2A0 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00234 809CD2A4 44066000 */  mfc1    $a2, $f12                  
/* 00238 809CD2A8 0C0342A3 */  jal     Matrix_Scale              
/* 0023C 809CD2AC 46006386 */  mov.s   $f14, $f12                 
/* 00240 809CD2B0 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00244 809CD2B4 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 00248 809CD2B8 35CE0003 */  ori     $t6, $t6, 0x0003           ## $t6 = DA380003
/* 0024C 809CD2BC 244D0008 */  addiu   $t5, $v0, 0x0008           ## $t5 = 00000008
/* 00250 809CD2C0 AE0D02D0 */  sw      $t5, 0x02D0($s0)           ## 000002D0
/* 00254 809CD2C4 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 00258 809CD2C8 8FAF006C */  lw      $t7, 0x006C($sp)           
/* 0025C 809CD2CC 3C05809D */  lui     $a1, %hi(D_809CE430)       ## $a1 = 809D0000
/* 00260 809CD2D0 24A5E430 */  addiu   $a1, $a1, %lo(D_809CE430)  ## $a1 = 809CE430
/* 00264 809CD2D4 8DE40000 */  lw      $a0, 0x0000($t7)           ## 00000000
/* 00268 809CD2D8 2406013D */  addiu   $a2, $zero, 0x013D         ## $a2 = 0000013D
/* 0026C 809CD2DC 0C0346A2 */  jal     Matrix_NewMtx              
/* 00270 809CD2E0 AFA20038 */  sw      $v0, 0x0038($sp)           
/* 00274 809CD2E4 8FA30038 */  lw      $v1, 0x0038($sp)           
/* 00278 809CD2E8 3C19FA00 */  lui     $t9, 0xFA00                ## $t9 = FA000000
/* 0027C 809CD2EC 37398080 */  ori     $t9, $t9, 0x8080           ## $t9 = FA008080
/* 00280 809CD2F0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00284 809CD2F4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00288 809CD2F8 3C01C8C8 */  lui     $at, 0xC8C8                ## $at = C8C80000
/* 0028C 809CD2FC 3421B400 */  ori     $at, $at, 0xB400           ## $at = C8C8B400
/* 00290 809CD300 24580008 */  addiu   $t8, $v0, 0x0008           ## $t8 = 00000008
/* 00294 809CD304 AE1802D0 */  sw      $t8, 0x02D0($s0)           ## 000002D0
/* 00298 809CD308 AC590000 */  sw      $t9, 0x0000($v0)           ## 00000000
/* 0029C 809CD30C 8FA80058 */  lw      $t0, 0x0058($sp)           
/* 002A0 809CD310 3C0DC8C8 */  lui     $t5, 0xC8C8                ## $t5 = C8C80000
/* 002A4 809CD314 35ADD2FF */  ori     $t5, $t5, 0xD2FF           ## $t5 = C8C8D2FF
/* 002A8 809CD318 310900FF */  andi    $t1, $t0, 0x00FF           ## $t1 = 00000000
/* 002AC 809CD31C 01215025 */  or      $t2, $t1, $at              ## $t2 = C8C8B400
/* 002B0 809CD320 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 002B4 809CD324 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 002B8 809CD328 3C0CFB00 */  lui     $t4, 0xFB00                ## $t4 = FB000000
/* 002BC 809CD32C 3C040401 */  lui     $a0, 0x0401                ## $a0 = 04010000
/* 002C0 809CD330 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 002C4 809CD334 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 002C8 809CD338 AC4D0004 */  sw      $t5, 0x0004($v0)           ## 00000004
/* 002CC 809CD33C AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 002D0 809CD340 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 002D4 809CD344 24840130 */  addiu   $a0, $a0, 0x0130           ## $a0 = 04010130
/* 002D8 809CD348 0004C100 */  sll     $t8, $a0,  4               
/* 002DC 809CD34C 0018CF02 */  srl     $t9, $t8, 28               
/* 002E0 809CD350 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 002E4 809CD354 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 002E8 809CD358 00194080 */  sll     $t0, $t9,  2               
/* 002EC 809CD35C 3C098016 */  lui     $t1, %hi(gSegments)
/* 002F0 809CD360 3C0FDE00 */  lui     $t7, 0xDE00                ## $t7 = DE000000
/* 002F4 809CD364 01284821 */  addu    $t1, $t1, $t0              
/* 002F8 809CD368 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 002FC 809CD36C AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 00300 809CD370 8D296FA8 */  lw      $t1, %lo(gSegments)($t1)
/* 00304 809CD374 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00308 809CD378 00815024 */  and     $t2, $a0, $at              
/* 0030C 809CD37C 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00310 809CD380 012A5821 */  addu    $t3, $t1, $t2              
/* 00314 809CD384 01616021 */  addu    $t4, $t3, $at              
/* 00318 809CD388 AC4C0004 */  sw      $t4, 0x0004($v0)           ## 00000004
/* 0031C 809CD38C 8FAD006C */  lw      $t5, 0x006C($sp)           
/* 00320 809CD390 3C06809D */  lui     $a2, %hi(D_809CE440)       ## $a2 = 809D0000
/* 00324 809CD394 24C6E440 */  addiu   $a2, $a2, %lo(D_809CE440)  ## $a2 = 809CE440
/* 00328 809CD398 27A4003C */  addiu   $a0, $sp, 0x003C           ## $a0 = FFFFFFD4
/* 0032C 809CD39C 24070146 */  addiu   $a3, $zero, 0x0146         ## $a3 = 00000146
/* 00330 809CD3A0 0C031AD5 */  jal     Graph_CloseDisps              
/* 00334 809CD3A4 8DA50000 */  lw      $a1, 0x0000($t5)           ## C8C8D2FF
/* 00338 809CD3A8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0033C 809CD3AC 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00340 809CD3B0 27BD0068 */  addiu   $sp, $sp, 0x0068           ## $sp = 00000000
/* 00344 809CD3B4 03E00008 */  jr      $ra                        
/* 00348 809CD3B8 00000000 */  nop
