.late_rodata
glabel jtbl_80A9D990
.word L80A9C8D0
.word L80A9C8D0
.word L80A9C8D0
.word L80A9C794
.word L80A9C844
.word L80A9C8B8
.word L80A9C710
.word L80A9C8D0
.word L80A9C8D0
.word L80A9C8D0

.text
glabel func_80A9C6C0
/* 00170 80A9C6C0 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00174 80A9C6C4 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00178 80A9C6C8 00803025 */  or      $a2, $a0, $zero            ## $a2 = 00000000
/* 0017C 80A9C6CC 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 00180 80A9C6D0 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00184 80A9C6D4 A7A80022 */  sh      $t0, 0x0022($sp)           
/* 00188 80A9C6D8 AFA60028 */  sw      $a2, 0x0028($sp)           
/* 0018C 80A9C6DC 0C042F6F */  jal     func_8010BDBC              
/* 00190 80A9C6E0 248420D8 */  addiu   $a0, $a0, 0x20D8           ## $a0 = 000020D8
/* 00194 80A9C6E4 2C41000A */  sltiu   $at, $v0, 0x000A           
/* 00198 80A9C6E8 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 0019C 80A9C6EC 8FA60028 */  lw      $a2, 0x0028($sp)           
/* 001A0 80A9C6F0 10200077 */  beq     $at, $zero, .L80A9C8D0     
/* 001A4 80A9C6F4 87A80022 */  lh      $t0, 0x0022($sp)           
/* 001A8 80A9C6F8 00027080 */  sll     $t6, $v0,  2               
/* 001AC 80A9C6FC 3C0180AA */  lui     $at, %hi(jtbl_80A9D990)       ## $at = 80AA0000
/* 001B0 80A9C700 002E0821 */  addu    $at, $at, $t6              
/* 001B4 80A9C704 8C2ED990 */  lw      $t6, %lo(jtbl_80A9D990)($at)  
/* 001B8 80A9C708 01C00008 */  jr      $t6                        
/* 001BC 80A9C70C 00000000 */  nop
glabel L80A9C710
/* 001C0 80A9C710 8FAF002C */  lw      $t7, 0x002C($sp)           
/* 001C4 80A9C714 24014012 */  addiu   $at, $zero, 0x4012         ## $at = 00004012
/* 001C8 80A9C718 00004025 */  or      $t0, $zero, $zero          ## $t0 = 00000000
/* 001CC 80A9C71C 95E2010E */  lhu     $v0, 0x010E($t7)           ## 0000010E
/* 001D0 80A9C720 10410007 */  beq     $v0, $at, .L80A9C740       
/* 001D4 80A9C724 2401401B */  addiu   $at, $zero, 0x401B         ## $at = 0000401B
/* 001D8 80A9C728 1041000C */  beq     $v0, $at, .L80A9C75C       
/* 001DC 80A9C72C 2401401F */  addiu   $at, $zero, 0x401F         ## $at = 0000401F
/* 001E0 80A9C730 10410012 */  beq     $v0, $at, .L80A9C77C       
/* 001E4 80A9C734 00000000 */  nop
/* 001E8 80A9C738 10000066 */  beq     $zero, $zero, .L80A9C8D4   
/* 001EC 80A9C73C 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80A9C740:
/* 001F0 80A9C740 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 001F4 80A9C744 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 001F8 80A9C748 94580F1E */  lhu     $t8, 0x0F1E($v0)           ## 8015F57E
/* 001FC 80A9C74C 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
/* 00200 80A9C750 37190200 */  ori     $t9, $t8, 0x0200           ## $t9 = 00000200
/* 00204 80A9C754 1000005E */  beq     $zero, $zero, .L80A9C8D0   
/* 00208 80A9C758 A4590F1E */  sh      $t9, 0x0F1E($v0)           ## 8015F57E
.L80A9C75C:
/* 0020C 80A9C75C 0C041AF2 */  jal     func_80106BC8              
/* 00210 80A9C760 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00214 80A9C764 14400003 */  bne     $v0, $zero, .L80A9C774     
/* 00218 80A9C768 00000000 */  nop
/* 0021C 80A9C76C 10000058 */  beq     $zero, $zero, .L80A9C8D0   
/* 00220 80A9C770 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
.L80A9C774:
/* 00224 80A9C774 10000056 */  beq     $zero, $zero, .L80A9C8D0   
/* 00228 80A9C778 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
.L80A9C77C:
/* 0022C 80A9C77C 3C028016 */  lui     $v0, %hi(gSaveContext)
/* 00230 80A9C780 2442E660 */  addiu   $v0, %lo(gSaveContext)
/* 00234 80A9C784 94490F1E */  lhu     $t1, 0x0F1E($v0)           ## 8015F57E
/* 00238 80A9C788 352A0200 */  ori     $t2, $t1, 0x0200           ## $t2 = 00000200
/* 0023C 80A9C78C 10000050 */  beq     $zero, $zero, .L80A9C8D0   
/* 00240 80A9C790 A44A0F1E */  sh      $t2, 0x0F1E($v0)           ## 8015F57E
glabel L80A9C794
/* 00244 80A9C794 9462010E */  lhu     $v0, 0x010E($v1)           ## 0000010E
/* 00248 80A9C798 24014014 */  addiu   $at, $zero, 0x4014         ## $at = 00004014
/* 0024C 80A9C79C 10410016 */  beq     $v0, $at, .L80A9C7F8       
/* 00250 80A9C7A0 2401401B */  addiu   $at, $zero, 0x401B         ## $at = 0000401B
/* 00254 80A9C7A4 5441004B */  bnel    $v0, $at, .L80A9C8D4       
/* 00258 80A9C7A8 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0025C 80A9C7AC 906B0208 */  lbu     $t3, 0x0208($v1)           ## 00000208
/* 00260 80A9C7B0 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 00264 80A9C7B4 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 00268 80A9C7B8 15600045 */  bne     $t3, $zero, .L80A9C8D0     
/* 0026C 80A9C7BC 24044802 */  addiu   $a0, $zero, 0x4802         ## $a0 = 00004802
/* 00270 80A9C7C0 3C0C8013 */  lui     $t4, %hi(D_801333E8)
/* 00274 80A9C7C4 258C33E8 */  addiu   $t4, %lo(D_801333E8)
/* 00278 80A9C7C8 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 0027C 80A9C7CC 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 00280 80A9C7D0 AFAC0014 */  sw      $t4, 0x0014($sp)           
/* 00284 80A9C7D4 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 00288 80A9C7D8 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 0028C 80A9C7DC 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 00290 80A9C7E0 A7A80022 */  sh      $t0, 0x0022($sp)           
/* 00294 80A9C7E4 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 00298 80A9C7E8 87A80022 */  lh      $t0, 0x0022($sp)           
/* 0029C 80A9C7EC 240D0001 */  addiu   $t5, $zero, 0x0001         ## $t5 = 00000001
/* 002A0 80A9C7F0 10000037 */  beq     $zero, $zero, .L80A9C8D0   
/* 002A4 80A9C7F4 A06D0208 */  sb      $t5, 0x0208($v1)           ## 00000208
.L80A9C7F8:
/* 002A8 80A9C7F8 906E0208 */  lbu     $t6, 0x0208($v1)           ## 00000208
/* 002AC 80A9C7FC 3C078013 */  lui     $a3, %hi(D_801333E0)
/* 002B0 80A9C800 24E733E0 */  addiu   $a3, %lo(D_801333E0)
/* 002B4 80A9C804 15C00032 */  bne     $t6, $zero, .L80A9C8D0     
/* 002B8 80A9C808 24044807 */  addiu   $a0, $zero, 0x4807         ## $a0 = 00004807
/* 002BC 80A9C80C 3C0F8013 */  lui     $t7, %hi(D_801333E8)
/* 002C0 80A9C810 25EF33E8 */  addiu   $t7, %lo(D_801333E8)
/* 002C4 80A9C814 3C058013 */  lui     $a1, %hi(D_801333D4)
/* 002C8 80A9C818 24A533D4 */  addiu   $a1, %lo(D_801333D4)
/* 002CC 80A9C81C AFAF0014 */  sw      $t7, 0x0014($sp)           
/* 002D0 80A9C820 24060004 */  addiu   $a2, $zero, 0x0004         ## $a2 = 00000004
/* 002D4 80A9C824 AFA70010 */  sw      $a3, 0x0010($sp)           
/* 002D8 80A9C828 0C03DCE3 */  jal     Audio_PlaySoundGeneral
              
/* 002DC 80A9C82C A7A80022 */  sh      $t0, 0x0022($sp)           
/* 002E0 80A9C830 8FA3002C */  lw      $v1, 0x002C($sp)           
/* 002E4 80A9C834 87A80022 */  lh      $t0, 0x0022($sp)           
/* 002E8 80A9C838 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 002EC 80A9C83C 10000024 */  beq     $zero, $zero, .L80A9C8D0   
/* 002F0 80A9C840 A0780208 */  sb      $t8, 0x0208($v1)           ## 00000208
glabel L80A9C844
/* 002F4 80A9C844 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 002F8 80A9C848 AFA60028 */  sw      $a2, 0x0028($sp)           
/* 002FC 80A9C84C 0C041AF2 */  jal     func_80106BC8              
/* 00300 80A9C850 A7A80022 */  sh      $t0, 0x0022($sp)           
/* 00304 80A9C854 8FA60028 */  lw      $a2, 0x0028($sp)           
/* 00308 80A9C858 1040001D */  beq     $v0, $zero, .L80A9C8D0     
/* 0030C 80A9C85C 87A80022 */  lh      $t0, 0x0022($sp)           
/* 00310 80A9C860 8FA7002C */  lw      $a3, 0x002C($sp)           
/* 00314 80A9C864 24014014 */  addiu   $at, $zero, 0x4014         ## $at = 00004014
/* 00318 80A9C868 3C090001 */  lui     $t1, 0x0001                ## $t1 = 00010000
/* 0031C 80A9C86C 94F9010E */  lhu     $t9, 0x010E($a3)           ## 0000010E
/* 00320 80A9C870 01264821 */  addu    $t1, $t1, $a2              
/* 00324 80A9C874 57210017 */  bnel    $t9, $at, .L80A9C8D4       
/* 00328 80A9C878 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 0032C 80A9C87C 912904BD */  lbu     $t1, 0x04BD($t1)           ## 000104BD
/* 00330 80A9C880 240A4016 */  addiu   $t2, $zero, 0x4016         ## $t2 = 00004016
/* 00334 80A9C884 3145FFFF */  andi    $a1, $t2, 0xFFFF           ## $a1 = 00004016
/* 00338 80A9C888 15200006 */  bne     $t1, $zero, .L80A9C8A4     
/* 0033C 80A9C88C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00340 80A9C890 00E02025 */  or      $a0, $a3, $zero            ## $a0 = 00000000
/* 00344 80A9C894 0C2A7524 */  jal     func_80A9D490              
/* 00348 80A9C898 00C02825 */  or      $a1, $a2, $zero            ## $a1 = 00000000
/* 0034C 80A9C89C 1000000C */  beq     $zero, $zero, .L80A9C8D0   
/* 00350 80A9C8A0 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
.L80A9C8A4:
/* 00354 80A9C8A4 A4EA010E */  sh      $t2, 0x010E($a3)           ## 0000010E
/* 00358 80A9C8A8 0C042DC8 */  jal     func_8010B720              
/* 0035C 80A9C8AC A7A80022 */  sh      $t0, 0x0022($sp)           
/* 00360 80A9C8B0 10000007 */  beq     $zero, $zero, .L80A9C8D0   
/* 00364 80A9C8B4 87A80022 */  lh      $t0, 0x0022($sp)           
glabel L80A9C8B8
/* 00368 80A9C8B8 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 0036C 80A9C8BC 0C041AF2 */  jal     func_80106BC8              
/* 00370 80A9C8C0 A7A80022 */  sh      $t0, 0x0022($sp)           
/* 00374 80A9C8C4 10400002 */  beq     $v0, $zero, .L80A9C8D0     
/* 00378 80A9C8C8 87A80022 */  lh      $t0, 0x0022($sp)           
/* 0037C 80A9C8CC 24080002 */  addiu   $t0, $zero, 0x0002         ## $t0 = 00000002
glabel L80A9C8D0
.L80A9C8D0:
/* 00380 80A9C8D0 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80A9C8D4:
/* 00384 80A9C8D4 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 00388 80A9C8D8 01001025 */  or      $v0, $t0, $zero            ## $v0 = 00000002
/* 0038C 80A9C8DC 03E00008 */  jr      $ra                        
/* 00390 80A9C8E0 00000000 */  nop
