.late_rodata
glabel jtbl_80AC95CC
.word L80AC5070
.word L80AC50DC
.word L80AC512C
.word L80AC514C
.word L80AC516C
.word L80AC518C

.text
glabel func_80AC5014
/* 02374 80AC5014 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 02378 80AC5018 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0237C 80AC501C AFB10018 */  sw      $s1, 0x0018($sp)           
/* 02380 80AC5020 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 02384 80AC5024 90AE0252 */  lbu     $t6, 0x0252($a1)           ## 00000252
/* 02388 80AC5028 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 0238C 80AC502C 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 02390 80AC5030 000E7880 */  sll     $t7, $t6,  2               
/* 02394 80AC5034 00AFC021 */  addu    $t8, $a1, $t7              
/* 02398 80AC5038 8F050200 */  lw      $a1, 0x0200($t8)           ## 00000200
/* 0239C 80AC503C AFA50024 */  sw      $a1, 0x0024($sp)           
/* 023A0 80AC5040 8CB901BC */  lw      $t9, 0x01BC($a1)           ## 000001BC
/* 023A4 80AC5044 0320F809 */  jalr    $ra, $t9                   
/* 023A8 80AC5048 00000000 */  nop
/* 023AC 80AC504C 2C410006 */  sltiu   $at, $v0, 0x0006           
/* 023B0 80AC5050 10200054 */  beq     $at, $zero, .L80AC51A4     
/* 023B4 80AC5054 8FA70024 */  lw      $a3, 0x0024($sp)           
/* 023B8 80AC5058 00024080 */  sll     $t0, $v0,  2               
/* 023BC 80AC505C 3C0180AD */  lui     $at, %hi(jtbl_80AC95CC)       ## $at = 80AD0000
/* 023C0 80AC5060 00280821 */  addu    $at, $at, $t0              
/* 023C4 80AC5064 8C2895CC */  lw      $t0, %lo(jtbl_80AC95CC)($at)  
/* 023C8 80AC5068 01000008 */  jr      $t0                        
/* 023CC 80AC506C 00000000 */  nop
glabel L80AC5070
/* 023D0 80AC5070 84E9001C */  lh      $t1, 0x001C($a3)           ## 0000001C
/* 023D4 80AC5074 2401000C */  addiu   $at, $zero, 0x000C         ## $at = 0000000C
/* 023D8 80AC5078 3C0A8016 */  lui     $t2, %hi(gSaveContext+0xf06)
/* 023DC 80AC507C 1521000A */  bne     $t1, $at, .L80AC50A8       
/* 023E0 80AC5080 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 023E4 80AC5084 954AF566 */  lhu     $t2, %lo(gSaveContext+0xf06)($t2)
/* 023E8 80AC5088 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 023EC 80AC508C 314B0040 */  andi    $t3, $t2, 0x0040           ## $t3 = 00000000
/* 023F0 80AC5090 51600006 */  beql    $t3, $zero, .L80AC50AC     
/* 023F4 80AC5094 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 023F8 80AC5098 0C2B18B1 */  jal     func_80AC62C4              
/* 023FC 80AC509C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02400 80AC50A0 10000041 */  beq     $zero, $zero, .L80AC51A8   
/* 02404 80AC50A4 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80AC50A8:
/* 02408 80AC50A8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
.L80AC50AC:
/* 0240C 80AC50AC 0C2B13B2 */  jal     func_80AC4EC8              
/* 02410 80AC50B0 AFA70024 */  sw      $a3, 0x0024($sp)           
/* 02414 80AC50B4 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 02418 80AC50B8 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 0241C 80AC50BC A2000251 */  sb      $zero, 0x0251($s0)         ## 00000251
/* 02420 80AC50C0 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02424 80AC50C4 E60402D0 */  swc1    $f4, 0x02D0($s0)           ## 000002D0
/* 02428 80AC50C8 8CB901AC */  lw      $t9, 0x01AC($a1)           ## 000001AC
/* 0242C 80AC50CC 0320F809 */  jalr    $ra, $t9                   
/* 02430 80AC50D0 00000000 */  nop
/* 02434 80AC50D4 10000034 */  beq     $zero, $zero, .L80AC51A8   
/* 02438 80AC50D8 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80AC50DC
/* 0243C 80AC50DC AFA70024 */  sw      $a3, 0x0024($sp)           
/* 02440 80AC50E0 8CF901C0 */  lw      $t9, 0x01C0($a3)           ## 000001C0
/* 02444 80AC50E4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02448 80AC50E8 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 0244C 80AC50EC 0320F809 */  jalr    $ra, $t9                   
/* 02450 80AC50F0 00000000 */  nop
/* 02454 80AC50F4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02458 80AC50F8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0245C 80AC50FC 0C2B13F8 */  jal     func_80AC4FE0              
/* 02460 80AC5100 24060084 */  addiu   $a2, $zero, 0x0084         ## $a2 = 00000084
/* 02464 80AC5104 8FA50024 */  lw      $a1, 0x0024($sp)           
/* 02468 80AC5108 44803000 */  mtc1    $zero, $f6                 ## $f6 = 0.00
/* 0246C 80AC510C A2000251 */  sb      $zero, 0x0251($s0)         ## 00000251
/* 02470 80AC5110 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02474 80AC5114 E60602D0 */  swc1    $f6, 0x02D0($s0)           ## 000002D0
/* 02478 80AC5118 8CB901AC */  lw      $t9, 0x01AC($a1)           ## 000001AC
/* 0247C 80AC511C 0320F809 */  jalr    $ra, $t9                   
/* 02480 80AC5120 00000000 */  nop
/* 02484 80AC5124 10000020 */  beq     $zero, $zero, .L80AC51A8   
/* 02488 80AC5128 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80AC512C
/* 0248C 80AC512C 0C01E221 */  jal     func_80078884              
/* 02490 80AC5130 24044806 */  addiu   $a0, $zero, 0x4806         ## $a0 = 00004806
/* 02494 80AC5134 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 02498 80AC5138 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 0249C 80AC513C 0C2B13EB */  jal     func_80AC4FAC              
/* 024A0 80AC5140 24060086 */  addiu   $a2, $zero, 0x0086         ## $a2 = 00000086
/* 024A4 80AC5144 10000018 */  beq     $zero, $zero, .L80AC51A8   
/* 024A8 80AC5148 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80AC514C
/* 024AC 80AC514C 0C01E221 */  jal     func_80078884              
/* 024B0 80AC5150 24044806 */  addiu   $a0, $zero, 0x4806         ## $a0 = 00004806
/* 024B4 80AC5154 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 024B8 80AC5158 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 024BC 80AC515C 0C2B13EB */  jal     func_80AC4FAC              
/* 024C0 80AC5160 24060096 */  addiu   $a2, $zero, 0x0096         ## $a2 = 00000096
/* 024C4 80AC5164 10000010 */  beq     $zero, $zero, .L80AC51A8   
/* 024C8 80AC5168 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80AC516C
/* 024CC 80AC516C 0C01E221 */  jal     func_80078884              
/* 024D0 80AC5170 24044806 */  addiu   $a0, $zero, 0x4806         ## $a0 = 00004806
/* 024D4 80AC5174 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 024D8 80AC5178 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 024DC 80AC517C 0C2B13EB */  jal     func_80AC4FAC              
/* 024E0 80AC5180 24060085 */  addiu   $a2, $zero, 0x0085         ## $a2 = 00000085
/* 024E4 80AC5184 10000008 */  beq     $zero, $zero, .L80AC51A8   
/* 024E8 80AC5188 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80AC518C
/* 024EC 80AC518C 0C01E221 */  jal     func_80078884              
/* 024F0 80AC5190 24044806 */  addiu   $a0, $zero, 0x4806         ## $a0 = 00004806
/* 024F4 80AC5194 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 024F8 80AC5198 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 024FC 80AC519C 0C2B13EB */  jal     func_80AC4FAC              
/* 02500 80AC51A0 24060086 */  addiu   $a2, $zero, 0x0086         ## $a2 = 00000086
.L80AC51A4:
/* 02504 80AC51A4 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80AC51A8:
/* 02508 80AC51A8 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 0250C 80AC51AC 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 02510 80AC51B0 03E00008 */  jr      $ra                        
/* 02514 80AC51B4 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
