.rdata
glabel D_80B7B260
    .asciz "../z_fishing.c"
    .balign 4

glabel D_80B7B270
    .asciz "../z_fishing.c"
    .balign 4

glabel D_80B7B280
    .asciz "../z_fishing.c"
    .balign 4

glabel D_80B7B290
    .asciz "\x1b[32m"
    .balign 4

glabel D_80B7B298
    .asciz "\x1b[33m"
    .balign 4

glabel D_80B7B2A0
    .asciz "plays %x\n"
    .balign 4

glabel D_80B7B2AC
    .asciz "ys %x\n"
    .balign 4

glabel D_80B7B2B4
    .asciz "\x1b[m"
    .balign 4

.late_rodata
glabel D_80B7B7B4
    .float 0.003325

glabel D_80B7B7B8
    .float 0.00475

glabel D_80B7B7BC
    .float 3.14159274101

.text
glabel func_80B771CC
/* 0D82C 80B771CC 27BDFF68 */  addiu   $sp, $sp, 0xFF68           ## $sp = FFFFFF68
/* 0D830 80B771D0 3C0E80B8 */  lui     $t6, %hi(D_80B7E075)       ## $t6 = 80B80000
/* 0D834 80B771D4 91CEE075 */  lbu     $t6, %lo(D_80B7E075)($t6)  
/* 0D838 80B771D8 AFB10034 */  sw      $s1, 0x0034($sp)           
/* 0D83C 80B771DC AFB50044 */  sw      $s5, 0x0044($sp)           
/* 0D840 80B771E0 3C1180B8 */  lui     $s1, %hi(D_80B81FC8)       ## $s1 = 80B80000
/* 0D844 80B771E4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 0D848 80B771E8 AFBF0054 */  sw      $ra, 0x0054($sp)           
/* 0D84C 80B771EC AFBE0050 */  sw      $s8, 0x0050($sp)           
/* 0D850 80B771F0 AFB7004C */  sw      $s7, 0x004C($sp)           
/* 0D854 80B771F4 AFB60048 */  sw      $s6, 0x0048($sp)           
/* 0D858 80B771F8 AFB40040 */  sw      $s4, 0x0040($sp)           
/* 0D85C 80B771FC AFB3003C */  sw      $s3, 0x003C($sp)           
/* 0D860 80B77200 AFB20038 */  sw      $s2, 0x0038($sp)           
/* 0D864 80B77204 AFB00030 */  sw      $s0, 0x0030($sp)           
/* 0D868 80B77208 F7B80028 */  sdc1    $f24, 0x0028($sp)          
/* 0D86C 80B7720C F7B60020 */  sdc1    $f22, 0x0020($sp)          
/* 0D870 80B77210 F7B40018 */  sdc1    $f20, 0x0018($sp)          
/* 0D874 80B77214 AFA40098 */  sw      $a0, 0x0098($sp)           
/* 0D878 80B77218 0000A825 */  or      $s5, $zero, $zero          ## $s5 = 00000000
/* 0D87C 80B7721C 15C10004 */  bne     $t6, $at, .L80B77230       
/* 0D880 80B77220 26311FC8 */  addiu   $s1, $s1, %lo(D_80B81FC8)  ## $s1 = 80B81FC8
/* 0D884 80B77224 3C0180B8 */  lui     $at, %hi(D_80B7B7B4)       ## $at = 80B80000
/* 0D888 80B77228 10000003 */  beq     $zero, $zero, .L80B77238   
/* 0D88C 80B7722C C434B7B4 */  lwc1    $f20, %lo(D_80B7B7B4)($at) 
.L80B77230:
/* 0D890 80B77230 3C0180B8 */  lui     $at, %hi(D_80B7B7B8)       ## $at = 80B80000
/* 0D894 80B77234 C434B7B8 */  lwc1    $f20, %lo(D_80B7B7B8)($at) 
.L80B77238:
/* 0D898 80B77238 8FAF0098 */  lw      $t7, 0x0098($sp)           
/* 0D89C 80B7723C 3C0680B8 */  lui     $a2, %hi(D_80B7B260)       ## $a2 = 80B80000
/* 0D8A0 80B77240 24C6B260 */  addiu   $a2, $a2, %lo(D_80B7B260)  ## $a2 = 80B7B260
/* 0D8A4 80B77244 8DE50000 */  lw      $a1, 0x0000($t7)           ## 00000000
/* 0D8A8 80B77248 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFD8
/* 0D8AC 80B7724C 24071F70 */  addiu   $a3, $zero, 0x1F70         ## $a3 = 00001F70
/* 0D8B0 80B77250 0C031AB1 */  jal     Graph_OpenDisps              
/* 0D8B4 80B77254 00A09025 */  or      $s2, $a1, $zero            ## $s2 = 00000000
/* 0D8B8 80B77258 3C014700 */  lui     $at, 0x4700                ## $at = 47000000
/* 0D8BC 80B7725C 4481C000 */  mtc1    $at, $f24                  ## $f24 = 32768.00
/* 0D8C0 80B77260 3C0180B8 */  lui     $at, %hi(D_80B7B7BC)       ## $at = 80B80000
/* 0D8C4 80B77264 3C1E9B9B */  lui     $s8, 0x9B9B                ## $s8 = 9B9B0000
/* 0D8C8 80B77268 37DE9BFF */  ori     $s8, $s8, 0x9BFF           ## $s8 = 9B9B9BFF
/* 0D8CC 80B7726C C436B7BC */  lwc1    $f22, %lo(D_80B7B7BC)($at) 
/* 0D8D0 80B77270 0000A025 */  or      $s4, $zero, $zero          ## $s4 = 00000000
/* 0D8D4 80B77274 3C17FA00 */  lui     $s7, 0xFA00                ## $s7 = FA000000
/* 0D8D8 80B77278 3C16DE00 */  lui     $s6, 0xDE00                ## $s6 = DE000000
.L80B7727C:
/* 0D8DC 80B7727C 92380000 */  lbu     $t8, 0x0000($s1)           ## 80B81FC8
/* 0D8E0 80B77280 53000045 */  beql    $t8, $zero, .L80B77398     
/* 0D8E4 80B77284 26940001 */  addiu   $s4, $s4, 0x0001           ## $s4 = 00000001
/* 0D8E8 80B77288 16A0000F */  bne     $s5, $zero, .L80B772C8     
/* 0D8EC 80B7728C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 0D8F0 80B77290 8E4202C0 */  lw      $v0, 0x02C0($s2)           ## 000002C0
/* 0D8F4 80B77294 3C040601 */  lui     $a0, %hi(D_0600C220)                ## $a0 = 06010000
/* 0D8F8 80B77298 2484C220 */  addiu   $a0, $a0, %lo(D_0600C220)           ## $a0 = 0600C220
/* 0D8FC 80B7729C 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 0D900 80B772A0 AE5902C0 */  sw      $t9, 0x02C0($s2)           ## 000002C0
/* 0D904 80B772A4 AC440004 */  sw      $a0, 0x0004($v0)           ## 00000004
/* 0D908 80B772A8 AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
/* 0D90C 80B772AC 8E4202C0 */  lw      $v0, 0x02C0($s2)           ## 000002C0
/* 0D910 80B772B0 26B50001 */  addiu   $s5, $s5, 0x0001           ## $s5 = 00000001
/* 0D914 80B772B4 32B500FF */  andi    $s5, $s5, 0x00FF           ## $s5 = 00000001
/* 0D918 80B772B8 24480008 */  addiu   $t0, $v0, 0x0008           ## $t0 = 00000008
/* 0D91C 80B772BC AE4802C0 */  sw      $t0, 0x02C0($s2)           ## 000002C0
/* 0D920 80B772C0 AC5E0004 */  sw      $s8, 0x0004($v0)           ## 00000004
/* 0D924 80B772C4 AC570000 */  sw      $s7, 0x0000($v0)           ## 00000000
.L80B772C8:
/* 0D928 80B772C8 92290044 */  lbu     $t1, 0x0044($s1)           ## 80B8200C
/* 0D92C 80B772CC 3C130601 */  lui     $s3, %hi(D_0600C298)                ## $s3 = 06010000
/* 0D930 80B772D0 2673C298 */  addiu   $s3, $s3, %lo(D_0600C298)           ## $s3 = 0600C298
/* 0D934 80B772D4 51200030 */  beql    $t1, $zero, .L80B77398     
/* 0D938 80B772D8 26940001 */  addiu   $s4, $s4, 0x0001           ## $s4 = 00000002
/* 0D93C 80B772DC C62C0004 */  lwc1    $f12, 0x0004($s1)          ## 80B81FCC
/* 0D940 80B772E0 C62E0008 */  lwc1    $f14, 0x0008($s1)          ## 80B81FD0
/* 0D944 80B772E4 0C034261 */  jal     Matrix_Translate              
/* 0D948 80B772E8 8E26000C */  lw      $a2, 0x000C($s1)           ## 80B81FD4
/* 0D94C 80B772EC 862A003E */  lh      $t2, 0x003E($s1)           ## 80B82006
/* 0D950 80B772F0 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0D954 80B772F4 448A2000 */  mtc1    $t2, $f4                   ## $f4 = 0.00
/* 0D958 80B772F8 00000000 */  nop
/* 0D95C 80B772FC 468021A0 */  cvt.s.w $f6, $f4                   
/* 0D960 80B77300 46163202 */  mul.s   $f8, $f6, $f22             
/* 0D964 80B77304 0C034348 */  jal     Matrix_RotateY              
/* 0D968 80B77308 46184303 */  div.s   $f12, $f8, $f24            
/* 0D96C 80B7730C 862B003C */  lh      $t3, 0x003C($s1)           ## 80B82004
/* 0D970 80B77310 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 0D974 80B77314 448B5000 */  mtc1    $t3, $f10                  ## $f10 = 0.00
/* 0D978 80B77318 00000000 */  nop
/* 0D97C 80B7731C 46805420 */  cvt.s.w $f16, $f10                 
/* 0D980 80B77320 46008487 */  neg.s   $f18, $f16                 
/* 0D984 80B77324 46169102 */  mul.s   $f4, $f18, $f22            
/* 0D988 80B77328 0C0342DC */  jal     Matrix_RotateX              
/* 0D98C 80B7732C 46182303 */  div.s   $f12, $f4, $f24            
/* 0D990 80B77330 C626002C */  lwc1    $f6, 0x002C($s1)           ## 80B81FF4
/* 0D994 80B77334 4406A000 */  mfc1    $a2, $f20                  
/* 0D998 80B77338 4600A386 */  mov.s   $f14, $f20                 
/* 0D99C 80B7733C 46143302 */  mul.s   $f12, $f6, $f20            
/* 0D9A0 80B77340 0C0342A3 */  jal     Matrix_Scale              
/* 0D9A4 80B77344 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 0D9A8 80B77348 8E4202C0 */  lw      $v0, 0x02C0($s2)           ## 000002C0
/* 0D9AC 80B7734C 3C0DDA38 */  lui     $t5, 0xDA38                ## $t5 = DA380000
/* 0D9B0 80B77350 35AD0003 */  ori     $t5, $t5, 0x0003           ## $t5 = DA380003
/* 0D9B4 80B77354 244C0008 */  addiu   $t4, $v0, 0x0008           ## $t4 = 00000008
/* 0D9B8 80B77358 AE4C02C0 */  sw      $t4, 0x02C0($s2)           ## 000002C0
/* 0D9BC 80B7735C AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 0D9C0 80B77360 8FAE0098 */  lw      $t6, 0x0098($sp)           
/* 0D9C4 80B77364 3C0580B8 */  lui     $a1, %hi(D_80B7B270)       ## $a1 = 80B80000
/* 0D9C8 80B77368 24A5B270 */  addiu   $a1, $a1, %lo(D_80B7B270)  ## $a1 = 80B7B270
/* 0D9CC 80B7736C 24061F9D */  addiu   $a2, $zero, 0x1F9D         ## $a2 = 00001F9D
/* 0D9D0 80B77370 00408025 */  or      $s0, $v0, $zero            ## $s0 = 00000000
/* 0D9D4 80B77374 0C0346A2 */  jal     Matrix_NewMtx              
/* 0D9D8 80B77378 8DC40000 */  lw      $a0, 0x0000($t6)           ## 00000000
/* 0D9DC 80B7737C AE020004 */  sw      $v0, 0x0004($s0)           ## 00000004
/* 0D9E0 80B77380 8E4202C0 */  lw      $v0, 0x02C0($s2)           ## 000002C0
/* 0D9E4 80B77384 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 0D9E8 80B77388 AE4F02C0 */  sw      $t7, 0x02C0($s2)           ## 000002C0
/* 0D9EC 80B7738C AC530004 */  sw      $s3, 0x0004($v0)           ## 00000004
/* 0D9F0 80B77390 AC560000 */  sw      $s6, 0x0000($v0)           ## 00000000
/* 0D9F4 80B77394 26940001 */  addiu   $s4, $s4, 0x0001           ## $s4 = 00000003
.L80B77398:
/* 0D9F8 80B77398 0014A400 */  sll     $s4, $s4, 16               
/* 0D9FC 80B7739C 0014A403 */  sra     $s4, $s4, 16               
/* 0DA00 80B773A0 2A81003C */  slti    $at, $s4, 0x003C           
/* 0DA04 80B773A4 1420FFB5 */  bne     $at, $zero, .L80B7727C     
/* 0DA08 80B773A8 26310048 */  addiu   $s1, $s1, 0x0048           ## $s1 = 80B82010
/* 0DA0C 80B773AC 8FB80098 */  lw      $t8, 0x0098($sp)           
/* 0DA10 80B773B0 3C0680B8 */  lui     $a2, %hi(D_80B7B280)       ## $a2 = 80B80000
/* 0DA14 80B773B4 24C6B280 */  addiu   $a2, $a2, %lo(D_80B7B280)  ## $a2 = 80B7B280
/* 0DA18 80B773B8 27A40070 */  addiu   $a0, $sp, 0x0070           ## $a0 = FFFFFFD8
/* 0DA1C 80B773BC 24071FA3 */  addiu   $a3, $zero, 0x1FA3         ## $a3 = 00001FA3
/* 0DA20 80B773C0 0C031AD5 */  jal     Graph_CloseDisps              
/* 0DA24 80B773C4 8F050000 */  lw      $a1, 0x0000($t8)           ## 00000000
/* 0DA28 80B773C8 8FBF0054 */  lw      $ra, 0x0054($sp)           
/* 0DA2C 80B773CC D7B40018 */  ldc1    $f20, 0x0018($sp)          
/* 0DA30 80B773D0 D7B60020 */  ldc1    $f22, 0x0020($sp)          
/* 0DA34 80B773D4 D7B80028 */  ldc1    $f24, 0x0028($sp)          
/* 0DA38 80B773D8 8FB00030 */  lw      $s0, 0x0030($sp)           
/* 0DA3C 80B773DC 8FB10034 */  lw      $s1, 0x0034($sp)           
/* 0DA40 80B773E0 8FB20038 */  lw      $s2, 0x0038($sp)           
/* 0DA44 80B773E4 8FB3003C */  lw      $s3, 0x003C($sp)           
/* 0DA48 80B773E8 8FB40040 */  lw      $s4, 0x0040($sp)           
/* 0DA4C 80B773EC 8FB50044 */  lw      $s5, 0x0044($sp)           
/* 0DA50 80B773F0 8FB60048 */  lw      $s6, 0x0048($sp)           
/* 0DA54 80B773F4 8FB7004C */  lw      $s7, 0x004C($sp)           
/* 0DA58 80B773F8 8FBE0050 */  lw      $s8, 0x0050($sp)           
/* 0DA5C 80B773FC 03E00008 */  jr      $ra                        
/* 0DA60 80B77400 27BD0098 */  addiu   $sp, $sp, 0x0098           ## $sp = 00000000
