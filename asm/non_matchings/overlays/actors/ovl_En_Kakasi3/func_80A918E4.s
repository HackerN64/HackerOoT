.rdata
glabel D_80A91D94
    .asciz "\x1b[35m☆☆☆☆☆ まさか！ ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

glabel D_80A91DC0
    .asciz "\n\n"
    .balign 4

glabel D_80A91DC4
    .asciz "\x1b[36m☆☆☆☆☆ これで、他の奴もＯＫ！だ！ ☆☆☆☆☆ %d\n\x1b[m"
    .balign 4

.text
glabel func_80A918E4
/* 00BC4 80A918E4 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 00BC8 80A918E8 3C0E8016 */  lui     $t6, %hi(gGameInfo)
/* 00BCC 80A918EC 8DCEFA90 */  lw      $t6, %lo(gGameInfo)($t6)
/* 00BD0 80A918F0 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 00BD4 80A918F4 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 00BD8 80A918F8 AFB00014 */  sw      $s0, 0x0014($sp)           
/* 00BDC 80A918FC 85CF12DA */  lh      $t7, 0x12DA($t6)           ## 801612DA
/* 00BE0 80A91900 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 00BE4 80A91904 00808825 */  or      $s1, $a0, $zero            ## $s1 = 00000000
/* 00BE8 80A91908 11E00009 */  beq     $t7, $zero, .L80A91930     
/* 00BEC 80A9190C 8CA71C44 */  lw      $a3, 0x1C44($a1)           ## 00001C44
/* 00BF0 80A91910 3C050001 */  lui     $a1, 0x0001                ## $a1 = 00010000
/* 00BF4 80A91914 00B02821 */  addu    $a1, $a1, $s0              
/* 00BF8 80A91918 94A504C6 */  lhu     $a1, 0x04C6($a1)           ## 000104C6
/* 00BFC 80A9191C 3C0480A9 */  lui     $a0, %hi(D_80A91D94)       ## $a0 = 80A90000
/* 00C00 80A91920 24841D94 */  addiu   $a0, $a0, %lo(D_80A91D94)  ## $a0 = 80A91D94
/* 00C04 80A91924 0C00084C */  jal     osSyncPrintf
              
/* 00C08 80A91928 AFA70024 */  sw      $a3, 0x0024($sp)           
/* 00C0C 80A9192C 8FA70024 */  lw      $a3, 0x0024($sp)           
.L80A91930:
/* 00C10 80A91930 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00C14 80A91934 02011821 */  addu    $v1, $s0, $at              
/* 00C18 80A91938 946204C6 */  lhu     $v0, 0x04C6($v1)           ## 000004C6
/* 00C1C 80A9193C 24010004 */  addiu   $at, $zero, 0x0004         ## $at = 00000004
/* 00C20 80A91940 10410005 */  beq     $v0, $at, .L80A91958       
/* 00C24 80A91944 28410005 */  slti    $at, $v0, 0x0005           
/* 00C28 80A91948 14200019 */  bne     $at, $zero, .L80A919B0     
/* 00C2C 80A9194C 2841000B */  slti    $at, $v0, 0x000B           
/* 00C30 80A91950 50200018 */  beql    $at, $zero, .L80A919B4     
/* 00C34 80A91954 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
.L80A91958:
/* 00C38 80A91958 907803DC */  lbu     $t8, 0x03DC($v1)           ## 000003DC
/* 00C3C 80A9195C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C40 80A91960 240540A6 */  addiu   $a1, $zero, 0x40A6         ## $a1 = 000040A6
/* 00C44 80A91964 57000013 */  bnel    $t8, $zero, .L80A919B4     
/* 00C48 80A91968 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 00C4C 80A9196C 0C042DA0 */  jal     func_8010B680              
/* 00C50 80A91970 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00C54 80A91974 24190005 */  addiu   $t9, $zero, 0x0005         ## $t9 = 00000005
/* 00C58 80A91978 A6390196 */  sh      $t9, 0x0196($s1)           ## 00000196
/* 00C5C 80A9197C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C60 80A91980 0C0200FC */  jal     func_800803F0              
/* 00C64 80A91984 86250208 */  lh      $a1, 0x0208($s1)           ## 00000208
/* 00C68 80A91988 2408FFFF */  addiu   $t0, $zero, 0xFFFF         ## $t0 = FFFFFFFF
/* 00C6C 80A9198C A6280208 */  sh      $t0, 0x0208($s1)           ## 00000208
/* 00C70 80A91990 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00C74 80A91994 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00C78 80A91998 0C00B7D5 */  jal     func_8002DF54              
/* 00C7C 80A9199C 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 00C80 80A919A0 3C0980A9 */  lui     $t1, %hi(func_80A91A90)    ## $t1 = 80A90000
/* 00C84 80A919A4 25291A90 */  addiu   $t1, $t1, %lo(func_80A91A90) ## $t1 = 80A91A90
/* 00C88 80A919A8 10000034 */  beq     $zero, $zero, .L80A91A7C   
/* 00C8C 80A919AC AE29014C */  sw      $t1, 0x014C($s1)           ## 0000014C
.L80A919B0:
/* 00C90 80A919B0 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
.L80A919B4:
/* 00C94 80A919B4 54410026 */  bnel    $v0, $at, .L80A91A50       
/* 00C98 80A919B8 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 00C9C 80A919BC 906A03DC */  lbu     $t2, 0x03DC($v1)           ## 000003DC
/* 00CA0 80A919C0 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00CA4 80A919C4 00300821 */  addu    $at, $at, $s0              
/* 00CA8 80A919C8 15400020 */  bne     $t2, $zero, .L80A91A4C     
/* 00CAC 80A919CC 240B0004 */  addiu   $t3, $zero, 0x0004         ## $t3 = 00000004
/* 00CB0 80A919D0 A42B04C6 */  sh      $t3, 0x04C6($at)           ## 000104C6
/* 00CB4 80A919D4 3C0C8016 */  lui     $t4, %hi(gGameInfo)
/* 00CB8 80A919D8 8D8CFA90 */  lw      $t4, %lo(gGameInfo)($t4)
/* 00CBC 80A919DC 3C0480A9 */  lui     $a0, %hi(D_80A91DC0)       ## $a0 = 80A90000
/* 00CC0 80A919E0 24841DC0 */  addiu   $a0, $a0, %lo(D_80A91DC0)  ## $a0 = 80A91DC0
/* 00CC4 80A919E4 858D12DA */  lh      $t5, 0x12DA($t4)           ## 801612DA
/* 00CC8 80A919E8 51A00009 */  beql    $t5, $zero, .L80A91A10     
/* 00CCC 80A919EC 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
/* 00CD0 80A919F0 0C00084C */  jal     osSyncPrintf
              
/* 00CD4 80A919F4 AFA30020 */  sw      $v1, 0x0020($sp)           
/* 00CD8 80A919F8 8FA30020 */  lw      $v1, 0x0020($sp)           
/* 00CDC 80A919FC 3C0480A9 */  lui     $a0, %hi(D_80A91DC4)       ## $a0 = 80A90000
/* 00CE0 80A91A00 24841DC4 */  addiu   $a0, $a0, %lo(D_80A91DC4)  ## $a0 = 80A91DC4
/* 00CE4 80A91A04 0C00084C */  jal     osSyncPrintf
              
/* 00CE8 80A91A08 946504C6 */  lhu     $a1, 0x04C6($v1)           ## 000004C6
/* 00CEC 80A91A0C 240E0001 */  addiu   $t6, $zero, 0x0001         ## $t6 = 00000001
.L80A91A10:
/* 00CF0 80A91A10 A22E0195 */  sb      $t6, 0x0195($s1)           ## 00000195
/* 00CF4 80A91A14 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00CF8 80A91A18 240540A7 */  addiu   $a1, $zero, 0x40A7         ## $a1 = 000040A7
/* 00CFC 80A91A1C 0C042DA0 */  jal     func_8010B680              
/* 00D00 80A91A20 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00D04 80A91A24 240F0005 */  addiu   $t7, $zero, 0x0005         ## $t7 = 00000005
/* 00D08 80A91A28 A62F0196 */  sh      $t7, 0x0196($s1)           ## 00000196
/* 00D0C 80A91A2C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00D10 80A91A30 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00D14 80A91A34 0C00B7D5 */  jal     func_8002DF54              
/* 00D18 80A91A38 24060008 */  addiu   $a2, $zero, 0x0008         ## $a2 = 00000008
/* 00D1C 80A91A3C 3C1880A9 */  lui     $t8, %hi(func_80A91A90)    ## $t8 = 80A90000
/* 00D20 80A91A40 27181A90 */  addiu   $t8, $t8, %lo(func_80A91A90) ## $t8 = 80A91A90
/* 00D24 80A91A44 1000000D */  beq     $zero, $zero, .L80A91A7C   
/* 00D28 80A91A48 AE38014C */  sw      $t8, 0x014C($s1)           ## 0000014C
.L80A91A4C:
/* 00D2C 80A91A4C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
.L80A91A50:
/* 00D30 80A91A50 1441000A */  bne     $v0, $at, .L80A91A7C       
/* 00D34 80A91A54 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00D38 80A91A58 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 00D3C 80A91A5C 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00D40 80A91A60 0C2A43AF */  jal     func_80A90EBC              
/* 00D44 80A91A64 AFA70024 */  sw      $a3, 0x0024($sp)           
/* 00D48 80A91A68 8FA70024 */  lw      $a3, 0x0024($sp)           
/* 00D4C 80A91A6C 3C010080 */  lui     $at, 0x0080                ## $at = 00800000
/* 00D50 80A91A70 8CF90680 */  lw      $t9, 0x0680($a3)           ## 00000680
/* 00D54 80A91A74 03214025 */  or      $t0, $t9, $at              ## $t0 = 00800000
/* 00D58 80A91A78 ACE80680 */  sw      $t0, 0x0680($a3)           ## 00000680
.L80A91A7C:
/* 00D5C 80A91A7C 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00D60 80A91A80 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 00D64 80A91A84 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00D68 80A91A88 03E00008 */  jr      $ra                        
/* 00D6C 80A91A8C 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
