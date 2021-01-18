.rdata
glabel D_8098E1D0
    .asciz "../z_demo_kekkai.c"
    .balign 4

glabel D_8098E1E4
    .asciz "\"当ったよ\" = %s\n"
    .balign 4

glabel D_8098E1F8
    .asciz "当ったよ"
    .balign 4

.text
glabel func_8098D87C
/* 008AC 8098D87C 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 008B0 8098D880 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 008B4 8098D884 AFB10020 */  sw      $s1, 0x0020($sp)           
/* 008B8 8098D888 AFB0001C */  sw      $s0, 0x001C($sp)           
/* 008BC 8098D88C 908E015C */  lbu     $t6, 0x015C($a0)           ## 0000015C
/* 008C0 8098D890 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 008C4 8098D894 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 008C8 8098D898 31CF0002 */  andi    $t7, $t6, 0x0002           ## $t7 = 00000000
/* 008CC 8098D89C 11E00008 */  beq     $t7, $zero, .L8098D8C0     
/* 008D0 8098D8A0 3C0140A0 */  lui     $at, 0x40A0                ## $at = 40A00000
/* 008D4 8098D8A4 44810000 */  mtc1    $at, $f0                   ## $f0 = 5.00
/* 008D8 8098D8A8 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 008DC 8098D8AC 8607008A */  lh      $a3, 0x008A($s0)           ## 0000008A
/* 008E0 8098D8B0 44060000 */  mfc1    $a2, $f0                   
/* 008E4 8098D8B4 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 008E8 8098D8B8 0C00BDC7 */  jal     func_8002F71C              
/* 008EC 8098D8BC E7A00010 */  swc1    $f0, 0x0010($sp)           
.L8098D8C0:
/* 008F0 8098D8C0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 008F4 8098D8C4 34211E60 */  ori     $at, $at, 0x1E60           ## $at = 00011E60
/* 008F8 8098D8C8 02212821 */  addu    $a1, $s1, $at              
/* 008FC 8098D8CC 2606014C */  addiu   $a2, $s0, 0x014C           ## $a2 = 0000014C
/* 00900 8098D8D0 AFA60028 */  sw      $a2, 0x0028($sp)           
/* 00904 8098D8D4 AFA5002C */  sw      $a1, 0x002C($sp)           
/* 00908 8098D8D8 0C0175E7 */  jal     CollisionCheck_SetAT
              ## CollisionCheck_setAT
/* 0090C 8098D8DC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00910 8098D8E0 8FA60028 */  lw      $a2, 0x0028($sp)           
/* 00914 8098D8E4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00918 8098D8E8 0C017713 */  jal     CollisionCheck_SetOC
              ## CollisionCheck_setOC
/* 0091C 8098D8EC 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 00920 8098D8F0 921801A9 */  lbu     $t8, 0x01A9($s0)           ## 000001A9
/* 00924 8098D8F4 33190002 */  andi    $t9, $t8, 0x0002           ## $t9 = 00000000
/* 00928 8098D8F8 53200026 */  beql    $t9, $zero, .L8098D994     
/* 0092C 8098D8FC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00930 8098D900 0C01E221 */  jal     func_80078884              
/* 00934 8098D904 24044802 */  addiu   $a0, $zero, 0x4802         ## $a0 = 00004802
/* 00938 8098D908 3C048099 */  lui     $a0, %hi(D_8098E1D0)       ## $a0 = 80990000
/* 0093C 8098D90C 2484E1D0 */  addiu   $a0, $a0, %lo(D_8098E1D0)  ## $a0 = 8098E1D0
/* 00940 8098D910 0C000B84 */  jal     LogUtils_LogThreadId
              
/* 00944 8098D914 2405023C */  addiu   $a1, $zero, 0x023C         ## $a1 = 0000023C
/* 00948 8098D918 3C048099 */  lui     $a0, %hi(D_8098E1E4)       ## $a0 = 80990000
/* 0094C 8098D91C 3C058099 */  lui     $a1, %hi(D_8098E1F8)       ## $a1 = 80990000
/* 00950 8098D920 24A5E1F8 */  addiu   $a1, $a1, %lo(D_8098E1F8)  ## $a1 = 8098E1F8
/* 00954 8098D924 0C00084C */  jal     osSyncPrintf
              
/* 00958 8098D928 2484E1E4 */  addiu   $a0, $a0, %lo(D_8098E1E4)  ## $a0 = 8098E1E4
/* 0095C 8098D92C 8609001C */  lh      $t1, 0x001C($s0)           ## 0000001C
/* 00960 8098D930 3C088099 */  lui     $t0, %hi(func_8098D71C)    ## $t0 = 80990000
/* 00964 8098D934 2508D71C */  addiu   $t0, $t0, %lo(func_8098D71C) ## $t0 = 8098D71C
/* 00968 8098D938 3C028099 */  lui     $v0, %hi(D_8098E14C)       ## $v0 = 80990000
/* 0096C 8098D93C 00095080 */  sll     $t2, $t1,  2               
/* 00970 8098D940 AE080130 */  sw      $t0, 0x0130($s0)           ## 00000130
/* 00974 8098D944 A60001F4 */  sh      $zero, 0x01F4($s0)         ## 000001F4
/* 00978 8098D948 004A1021 */  addu    $v0, $v0, $t2              
/* 0097C 8098D94C 8C42E14C */  lw      $v0, %lo(D_8098E14C)($v0)  
/* 00980 8098D950 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 00984 8098D954 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00988 8098D958 00026100 */  sll     $t4, $v0,  4               
/* 0098C 8098D95C 000C6F02 */  srl     $t5, $t4, 28               
/* 00990 8098D960 000D7080 */  sll     $t6, $t5,  2               
/* 00994 8098D964 01EE7821 */  addu    $t7, $t7, $t6              
/* 00998 8098D968 8DEF6FA8 */  lw      $t7, %lo(gSegments)($t7)
/* 0099C 8098D96C 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 009A0 8098D970 00415824 */  and     $t3, $v0, $at              
/* 009A4 8098D974 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 009A8 8098D978 016FC021 */  addu    $t8, $t3, $t7              
/* 009AC 8098D97C 0301C821 */  addu    $t9, $t8, $at              
/* 009B0 8098D980 AE391D68 */  sw      $t9, 0x1D68($s1)           ## 00001D68
/* 009B4 8098D984 3C018016 */  lui     $at, %hi(gSaveContext+0x1414)
/* 009B8 8098D988 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 009BC 8098D98C A028FA74 */  sb      $t0, %lo(gSaveContext+0x1414)($at)
/* 009C0 8098D990 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
.L8098D994:
/* 009C4 8098D994 8FA5002C */  lw      $a1, 0x002C($sp)           
/* 009C8 8098D998 0C01767D */  jal     CollisionCheck_SetAC
              ## CollisionCheck_setAC
/* 009CC 8098D99C 26060198 */  addiu   $a2, $s0, 0x0198           ## $a2 = 00000198
/* 009D0 8098D9A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 009D4 8098D9A4 0C00BE5D */  jal     func_8002F974              
/* 009D8 8098D9A8 240520ED */  addiu   $a1, $zero, 0x20ED         ## $a1 = 000020ED
/* 009DC 8098D9AC 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 009E0 8098D9B0 8FB0001C */  lw      $s0, 0x001C($sp)           
/* 009E4 8098D9B4 8FB10020 */  lw      $s1, 0x0020($sp)           
/* 009E8 8098D9B8 03E00008 */  jr      $ra                        
/* 009EC 8098D9BC 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
