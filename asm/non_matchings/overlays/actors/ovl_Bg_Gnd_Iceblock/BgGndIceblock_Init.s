.rdata
glabel D_8087A790
    .asciz "../z_bg_gnd_iceblock.c"
    .balign 4

glabel D_8087A7A8
    .asciz "thisx->world.position.x = %f\n"
    .balign 4

glabel D_8087A7C8
    .asciz "0"
    .balign 4

glabel D_8087A7CC
    .asciz "../z_bg_gnd_iceblock.c"
    .balign 4

.late_rodata
glabel D_8087A7E4
    .float 2792.0

glabel D_8087A7E8
    .float 3032.0

.text
glabel BgGndIceblock_Init
/* 00000 80879AA0 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 00004 80879AA4 AFA50034 */  sw      $a1, 0x0034($sp)           
/* 00008 80879AA8 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0000C 80879AAC AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00010 80879AB0 3C058088 */  lui     $a1, %hi(D_8087A754)       ## $a1 = 80880000
/* 00014 80879AB4 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00018 80879AB8 AFA00024 */  sw      $zero, 0x0024($sp)         
/* 0001C 80879ABC 0C01E037 */  jal     Actor_ProcessInitChain
              
/* 00020 80879AC0 24A5A754 */  addiu   $a1, $a1, %lo(D_8087A754)  ## $a1 = 8087A754
/* 00024 80879AC4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00028 80879AC8 0C010D20 */  jal     DynaPolyInfo_SetActorMove
              
/* 0002C 80879ACC 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00030 80879AD0 3C040600 */  lui     $a0, %hi(D_06004618)                ## $a0 = 06000000
/* 00034 80879AD4 24844618 */  addiu   $a0, $a0, %lo(D_06004618)           ## $a0 = 06004618
/* 00038 80879AD8 0C010620 */  jal     DynaPolyInfo_Alloc
              
/* 0003C 80879ADC 27A50024 */  addiu   $a1, $sp, 0x0024           ## $a1 = FFFFFFF4
/* 00040 80879AE0 8E0F0008 */  lw      $t7, 0x0008($s0)           ## 00000008
/* 00044 80879AE4 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 00048 80879AE8 8E0E000C */  lw      $t6, 0x000C($s0)           ## 0000000C
/* 0004C 80879AEC AE0F0168 */  sw      $t7, 0x0168($s0)           ## 00000168
/* 00050 80879AF0 8E0F0010 */  lw      $t7, 0x0010($s0)           ## 00000010
/* 00054 80879AF4 3C188088 */  lui     $t8, %hi(func_8087A0C8)    ## $t8 = 80880000
/* 00058 80879AF8 2718A0C8 */  addiu   $t8, $t8, %lo(func_8087A0C8) ## $t8 = 8087A0C8
/* 0005C 80879AFC AE180164 */  sw      $t8, 0x0164($s0)           ## 00000164
/* 00060 80879B00 AE0E016C */  sw      $t6, 0x016C($s0)           ## 0000016C
/* 00064 80879B04 AE0F0170 */  sw      $t7, 0x0170($s0)           ## 00000170
/* 00068 80879B08 8FA70024 */  lw      $a3, 0x0024($sp)           
/* 0006C 80879B0C 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00070 80879B10 0C00FA9D */  jal     DynaPolyInfo_RegisterActor
              ## DynaPolyInfo_setActor
/* 00074 80879B14 24850810 */  addiu   $a1, $a0, 0x0810           ## $a1 = 00000810
/* 00078 80879B18 AE02014C */  sw      $v0, 0x014C($s0)           ## 0000014C
/* 0007C 80879B1C 3C018088 */  lui     $at, %hi(D_8087A7E4)       ## $at = 80880000
/* 00080 80879B20 C424A7E4 */  lwc1    $f4, %lo(D_8087A7E4)($at)  
/* 00084 80879B24 C6000024 */  lwc1    $f0, 0x0024($s0)           ## 00000024
/* 00088 80879B28 24190007 */  addiu   $t9, $zero, 0x0007         ## $t9 = 00000007
/* 0008C 80879B2C 3C018088 */  lui     $at, %hi(D_8087A7E8)       ## $at = 80880000
/* 00090 80879B30 46002032 */  c.eq.s  $f4, $f0                   
/* 00094 80879B34 00000000 */  nop
/* 00098 80879B38 45000005 */  bc1f    .L80879B50                 
/* 0009C 80879B3C 00000000 */  nop
/* 000A0 80879B40 A600001C */  sh      $zero, 0x001C($s0)         ## 0000001C
/* 000A4 80879B44 3C018088 */  lui     $at, %hi(D_8087AC40)       ## $at = 80880000
/* 000A8 80879B48 1000001D */  beq     $zero, $zero, .L80879BC0   
/* 000AC 80879B4C A039AC40 */  sb      $t9, %lo(D_8087AC40)($at)  
.L80879B50:
/* 000B0 80879B50 C426A7E8 */  lwc1    $f6, %lo(D_8087A7E8)($at)  
/* 000B4 80879B54 3C048088 */  lui     $a0, %hi(D_8087A790)       ## $a0 = 80880000
/* 000B8 80879B58 24080001 */  addiu   $t0, $zero, 0x0001         ## $t0 = 00000001
/* 000BC 80879B5C 46003032 */  c.eq.s  $f6, $f0                   
/* 000C0 80879B60 3C018088 */  lui     $at, %hi(D_8087AC41)       ## $at = 80880000
/* 000C4 80879B64 2409000E */  addiu   $t1, $zero, 0x000E         ## $t1 = 0000000E
/* 000C8 80879B68 2484A790 */  addiu   $a0, $a0, %lo(D_8087A790)  ## $a0 = 8087A790
/* 000CC 80879B6C 45000004 */  bc1f    .L80879B80                 
/* 000D0 80879B70 00000000 */  nop
/* 000D4 80879B74 A608001C */  sh      $t0, 0x001C($s0)           ## 0000001C
/* 000D8 80879B78 10000011 */  beq     $zero, $zero, .L80879BC0   
/* 000DC 80879B7C A029AC41 */  sb      $t1, %lo(D_8087AC41)($at)  
.L80879B80:
/* 000E0 80879B80 0C000B84 */  jal     LogUtils_LogThreadId
              
/* 000E4 80879B84 2405008A */  addiu   $a1, $zero, 0x008A         ## $a1 = 0000008A
/* 000E8 80879B88 C6080024 */  lwc1    $f8, 0x0024($s0)           ## 00000024
/* 000EC 80879B8C 3C048088 */  lui     $a0, %hi(D_8087A7A8)       ## $a0 = 80880000
/* 000F0 80879B90 2484A7A8 */  addiu   $a0, $a0, %lo(D_8087A7A8)  ## $a0 = 8087A7A8
/* 000F4 80879B94 460042A1 */  cvt.d.s $f10, $f8                  
/* 000F8 80879B98 44075000 */  mfc1    $a3, $f10                  
/* 000FC 80879B9C 44065800 */  mfc1    $a2, $f11                  
/* 00100 80879BA0 0C00084C */  jal     osSyncPrintf
              
/* 00104 80879BA4 00000000 */  nop
/* 00108 80879BA8 3C048088 */  lui     $a0, %hi(D_8087A7C8)       ## $a0 = 80880000
/* 0010C 80879BAC 3C058088 */  lui     $a1, %hi(D_8087A7CC)       ## $a1 = 80880000
/* 00110 80879BB0 24A5A7CC */  addiu   $a1, $a1, %lo(D_8087A7CC)  ## $a1 = 8087A7CC
/* 00114 80879BB4 2484A7C8 */  addiu   $a0, $a0, %lo(D_8087A7C8)  ## $a0 = 8087A7C8
/* 00118 80879BB8 0C0007FC */  jal     __assert
              
/* 0011C 80879BBC 2406008B */  addiu   $a2, $zero, 0x008B         ## $a2 = 0000008B
.L80879BC0:
/* 00120 80879BC0 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00124 80879BC4 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 00128 80879BC8 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 0012C 80879BCC 03E00008 */  jr      $ra                        
/* 00130 80879BD0 00000000 */  nop
