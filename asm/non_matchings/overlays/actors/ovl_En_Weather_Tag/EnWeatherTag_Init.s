.rdata
glabel D_80B31E40
    .asciz "\n\n"
    .balign 4

glabel D_80B31E44
    .asciz "\x1b[33m☆☆☆☆☆ （;o;) くらいよー ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31E78
    .asciz "\n\n"
    .balign 4

glabel D_80B31E7C
    .asciz "\x1b[33m☆☆☆☆☆ くもり (._.) あーあ 憂鬱 ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31EB8
    .asciz "\n\n"
    .balign 4

glabel D_80B31EBC
    .asciz "\x1b[33m☆☆☆☆☆ ゆきがふるー あなたはこないー (._.) ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31F00
    .asciz "\n\n"
    .balign 4

glabel D_80B31F04
    .asciz "\x1b[33m☆☆☆☆☆ わわわわー なーがーさーきーはー (^o^) ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31F4C
    .asciz "\n\n"
    .balign 4

glabel D_80B31F50
    .asciz "\x1b[33m☆☆☆☆☆ くもり (._.) あーあ 憂鬱 ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31F8C
    .asciz "\n\n"
    .balign 4

glabel D_80B31F90
    .asciz "\x1b[33m☆☆☆☆☆ くもり雨雷 (;O;) うおお 憂鬱 ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B31FD0
    .asciz "\n\n"
    .balign 4

glabel D_80B31FD4
    .asciz "\x1b[33m☆☆☆☆☆ 砂漠が濃くなります ☆☆☆☆☆ \n\x1b[m"
    .balign 4

glabel D_80B32008
    .asciz "\n\n"
    .balign 4

glabel D_80B3200C
    .asciz "\x1b[33m☆☆☆☆☆ わわわわー なーがーさーきーはー (^o^) ☆☆☆☆☆ \n\x1b[m"
    .balign 4

.late_rodata
glabel jtbl_80B32054
.word L80B31080
.word L80B310B0
.word L80B310F8
.word L80B31148
.word L80B31198
.word L80B311E8
.word L80B3125C
.word L80B3128C
.word 0x00000000, 0x00000000, 0x00000000

.text
glabel EnWeatherTag_Init
/* 00014 80B31034 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 00018 80B31038 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 0001C 80B3103C AFB00018 */  sw      $s0, 0x0018($sp)           
/* 00020 80B31040 AFA50024 */  sw      $a1, 0x0024($sp)           
/* 00024 80B31044 8C8E0004 */  lw      $t6, 0x0004($a0)           ## 00000004
/* 00028 80B31048 8498001C */  lh      $t8, 0x001C($a0)           ## 0000001C
/* 0002C 80B3104C 2401FFFE */  addiu   $at, $zero, 0xFFFE         ## $at = FFFFFFFE
/* 00030 80B31050 01C17824 */  and     $t7, $t6, $at              
/* 00034 80B31054 3319000F */  andi    $t9, $t8, 0x000F           ## $t9 = 00000000
/* 00038 80B31058 2F210008 */  sltiu   $at, $t9, 0x0008           
/* 0003C 80B3105C 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00040 80B31060 10200094 */  beq     $at, $zero, .L80B312B4     
/* 00044 80B31064 AC8F0004 */  sw      $t7, 0x0004($a0)           ## 00000004
/* 00048 80B31068 0019C880 */  sll     $t9, $t9,  2               
/* 0004C 80B3106C 3C0180B3 */  lui     $at, %hi(jtbl_80B32054)       ## $at = 80B30000
/* 00050 80B31070 00390821 */  addu    $at, $at, $t9              
/* 00054 80B31074 8C392054 */  lw      $t9, %lo(jtbl_80B32054)($at)  
/* 00058 80B31078 03200008 */  jr      $t9                        
/* 0005C 80B3107C 00000000 */  nop
glabel L80B31080
/* 00060 80B31080 3C0480B3 */  lui     $a0, %hi(D_80B31E40)       ## $a0 = 80B30000
/* 00064 80B31084 0C00084C */  jal     osSyncPrintf
              
/* 00068 80B31088 24841E40 */  addiu   $a0, $a0, %lo(D_80B31E40)  ## $a0 = 80B31E40
/* 0006C 80B3108C 3C0480B3 */  lui     $a0, %hi(D_80B31E44)       ## $a0 = 80B30000
/* 00070 80B31090 0C00084C */  jal     osSyncPrintf
              
/* 00074 80B31094 24841E44 */  addiu   $a0, $a0, %lo(D_80B31E44)  ## $a0 = 80B31E44
/* 00078 80B31098 3C0580B3 */  lui     $a1, %hi(func_80B31658)    ## $a1 = 80B30000
/* 0007C 80B3109C 24A51658 */  addiu   $a1, $a1, %lo(func_80B31658) ## $a1 = 80B31658
/* 00080 80B310A0 0C2CC408 */  jal     func_80B31020              
/* 00084 80B310A4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00088 80B310A8 10000083 */  beq     $zero, $zero, .L80B312B8   
/* 0008C 80B310AC 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B310B0
/* 00090 80B310B0 3C0480B3 */  lui     $a0, %hi(D_80B31E78)       ## $a0 = 80B30000
/* 00094 80B310B4 0C00084C */  jal     osSyncPrintf
              
/* 00098 80B310B8 24841E78 */  addiu   $a0, $a0, %lo(D_80B31E78)  ## $a0 = 80B31E78
/* 0009C 80B310BC 3C0480B3 */  lui     $a0, %hi(D_80B31E7C)       ## $a0 = 80B30000
/* 000A0 80B310C0 0C00084C */  jal     osSyncPrintf
              
/* 000A4 80B310C4 24841E7C */  addiu   $a0, $a0, %lo(D_80B31E7C)  ## $a0 = 80B31E7C
/* 000A8 80B310C8 0C00D6D3 */  jal     Flags_GetEventChkInf
              
/* 000AC 80B310CC 24040018 */  addiu   $a0, $zero, 0x0018         ## $a0 = 00000018
/* 000B0 80B310D0 10400003 */  beq     $v0, $zero, .L80B310E0     
/* 000B4 80B310D4 00000000 */  nop
/* 000B8 80B310D8 0C00B55C */  jal     Actor_Kill
              
/* 000BC 80B310DC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B310E0:
/* 000C0 80B310E0 3C0580B3 */  lui     $a1, %hi(func_80B31700)    ## $a1 = 80B30000
/* 000C4 80B310E4 24A51700 */  addiu   $a1, $a1, %lo(func_80B31700) ## $a1 = 80B31700
/* 000C8 80B310E8 0C2CC408 */  jal     func_80B31020              
/* 000CC 80B310EC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 000D0 80B310F0 10000071 */  beq     $zero, $zero, .L80B312B8   
/* 000D4 80B310F4 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B310F8
/* 000D8 80B310F8 3C0480B3 */  lui     $a0, %hi(D_80B31EB8)       ## $a0 = 80B30000
/* 000DC 80B310FC 0C00084C */  jal     osSyncPrintf
              
/* 000E0 80B31100 24841EB8 */  addiu   $a0, $a0, %lo(D_80B31EB8)  ## $a0 = 80B31EB8
/* 000E4 80B31104 3C0480B3 */  lui     $a0, %hi(D_80B31EBC)       ## $a0 = 80B30000
/* 000E8 80B31108 0C00084C */  jal     osSyncPrintf
              
/* 000EC 80B3110C 24841EBC */  addiu   $a0, $a0, %lo(D_80B31EBC)  ## $a0 = 80B31EBC
/* 000F0 80B31110 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 000F4 80B31114 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 000F8 80B31118 94680EDC */  lhu     $t0, 0x0EDC($v1)           ## 8015F53C
/* 000FC 80B3111C 31090400 */  andi    $t1, $t0, 0x0400           ## $t1 = 00000000
/* 00100 80B31120 11200003 */  beq     $t1, $zero, .L80B31130     
/* 00104 80B31124 00000000 */  nop
/* 00108 80B31128 0C00B55C */  jal     Actor_Kill
              
/* 0010C 80B3112C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B31130:
/* 00110 80B31130 3C0580B3 */  lui     $a1, %hi(func_80B31850)    ## $a1 = 80B30000
/* 00114 80B31134 24A51850 */  addiu   $a1, $a1, %lo(func_80B31850) ## $a1 = 80B31850
/* 00118 80B31138 0C2CC408 */  jal     func_80B31020              
/* 0011C 80B3113C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00120 80B31140 1000005D */  beq     $zero, $zero, .L80B312B8   
/* 00124 80B31144 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B31148
/* 00128 80B31148 3C0480B3 */  lui     $a0, %hi(D_80B31F00)       ## $a0 = 80B30000
/* 0012C 80B3114C 0C00084C */  jal     osSyncPrintf
              
/* 00130 80B31150 24841F00 */  addiu   $a0, $a0, %lo(D_80B31F00)  ## $a0 = 80B31F00
/* 00134 80B31154 3C0480B3 */  lui     $a0, %hi(D_80B31F04)       ## $a0 = 80B30000
/* 00138 80B31158 0C00084C */  jal     osSyncPrintf
              
/* 0013C 80B3115C 24841F04 */  addiu   $a0, $a0, %lo(D_80B31F04)  ## $a0 = 80B31F04
/* 00140 80B31160 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00144 80B31164 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 00148 80B31168 946A0EDC */  lhu     $t2, 0x0EDC($v1)           ## 8015F53C
/* 0014C 80B3116C 314B0400 */  andi    $t3, $t2, 0x0400           ## $t3 = 00000000
/* 00150 80B31170 11600003 */  beq     $t3, $zero, .L80B31180     
/* 00154 80B31174 00000000 */  nop
/* 00158 80B31178 0C00B55C */  jal     Actor_Kill
              
/* 0015C 80B3117C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B31180:
/* 00160 80B31180 3C0580B3 */  lui     $a1, %hi(func_80B31924)    ## $a1 = 80B30000
/* 00164 80B31184 24A51924 */  addiu   $a1, $a1, %lo(func_80B31924) ## $a1 = 80B31924
/* 00168 80B31188 0C2CC408 */  jal     func_80B31020              
/* 0016C 80B3118C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00170 80B31190 10000049 */  beq     $zero, $zero, .L80B312B8   
/* 00174 80B31194 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B31198
/* 00178 80B31198 3C0480B3 */  lui     $a0, %hi(D_80B31F4C)       ## $a0 = 80B30000
/* 0017C 80B3119C 0C00084C */  jal     osSyncPrintf
              
/* 00180 80B311A0 24841F4C */  addiu   $a0, $a0, %lo(D_80B31F4C)  ## $a0 = 80B31F4C
/* 00184 80B311A4 3C0480B3 */  lui     $a0, %hi(D_80B31F50)       ## $a0 = 80B30000
/* 00188 80B311A8 0C00084C */  jal     osSyncPrintf
              
/* 0018C 80B311AC 24841F50 */  addiu   $a0, $a0, %lo(D_80B31F50)  ## $a0 = 80B31F50
/* 00190 80B311B0 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00194 80B311B4 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 00198 80B311B8 946C0EDC */  lhu     $t4, 0x0EDC($v1)           ## 8015F53C
/* 0019C 80B311BC 318D0200 */  andi    $t5, $t4, 0x0200           ## $t5 = 00000000
/* 001A0 80B311C0 11A00003 */  beq     $t5, $zero, .L80B311D0     
/* 001A4 80B311C4 00000000 */  nop
/* 001A8 80B311C8 0C00B55C */  jal     Actor_Kill
              
/* 001AC 80B311CC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B311D0:
/* 001B0 80B311D0 3C0580B3 */  lui     $a1, %hi(func_80B317A8)    ## $a1 = 80B30000
/* 001B4 80B311D4 24A517A8 */  addiu   $a1, $a1, %lo(func_80B317A8) ## $a1 = 80B317A8
/* 001B8 80B311D8 0C2CC408 */  jal     func_80B31020              
/* 001BC 80B311DC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 001C0 80B311E0 10000035 */  beq     $zero, $zero, .L80B312B8   
/* 001C4 80B311E4 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B311E8
/* 001C8 80B311E8 3C0480B3 */  lui     $a0, %hi(D_80B31F8C)       ## $a0 = 80B30000
/* 001CC 80B311EC 0C00084C */  jal     osSyncPrintf
              
/* 001D0 80B311F0 24841F8C */  addiu   $a0, $a0, %lo(D_80B31F8C)  ## $a0 = 80B31F8C
/* 001D4 80B311F4 3C0480B3 */  lui     $a0, %hi(D_80B31F90)       ## $a0 = 80B30000
/* 001D8 80B311F8 0C00084C */  jal     osSyncPrintf
              
/* 001DC 80B311FC 24841F90 */  addiu   $a0, $a0, %lo(D_80B31F90)  ## $a0 = 80B31F90
/* 001E0 80B31200 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 001E4 80B31204 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 001E8 80B31208 94620EDC */  lhu     $v0, 0x0EDC($v1)           ## 8015F53C
/* 001EC 80B3120C 304E0100 */  andi    $t6, $v0, 0x0100           ## $t6 = 00000000
/* 001F0 80B31210 11C0000A */  beq     $t6, $zero, .L80B3123C     
/* 001F4 80B31214 304F0200 */  andi    $t7, $v0, 0x0200           ## $t7 = 00000000
/* 001F8 80B31218 11E00008 */  beq     $t7, $zero, .L80B3123C     
/* 001FC 80B3121C 30580400 */  andi    $t8, $v0, 0x0400           ## $t8 = 00000000
/* 00200 80B31220 13000006 */  beq     $t8, $zero, .L80B3123C     
/* 00204 80B31224 3C198012 */  lui     $t9, %hi(gBitFlags+0x10)
/* 00208 80B31228 8F397130 */  lw      $t9, %lo(gBitFlags+0x10)($t9)
/* 0020C 80B3122C 8C6800A4 */  lw      $t0, 0x00A4($v1)           ## 8015E704
/* 00210 80B31230 03284824 */  and     $t1, $t9, $t0              
/* 00214 80B31234 11200003 */  beq     $t1, $zero, .L80B31244     
/* 00218 80B31238 00000000 */  nop
.L80B3123C:
/* 0021C 80B3123C 0C00B55C */  jal     Actor_Kill
              
/* 00220 80B31240 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B31244:
/* 00224 80B31244 3C0580B3 */  lui     $a1, %hi(func_80B31A10)    ## $a1 = 80B30000
/* 00228 80B31248 24A51A10 */  addiu   $a1, $a1, %lo(func_80B31A10) ## $a1 = 80B31A10
/* 0022C 80B3124C 0C2CC408 */  jal     func_80B31020              
/* 00230 80B31250 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00234 80B31254 10000018 */  beq     $zero, $zero, .L80B312B8   
/* 00238 80B31258 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B3125C
/* 0023C 80B3125C 3C0480B3 */  lui     $a0, %hi(D_80B31FD0)       ## $a0 = 80B30000
/* 00240 80B31260 0C00084C */  jal     osSyncPrintf
              
/* 00244 80B31264 24841FD0 */  addiu   $a0, $a0, %lo(D_80B31FD0)  ## $a0 = 80B31FD0
/* 00248 80B31268 3C0480B3 */  lui     $a0, %hi(D_80B31FD4)       ## $a0 = 80B30000
/* 0024C 80B3126C 0C00084C */  jal     osSyncPrintf
              
/* 00250 80B31270 24841FD4 */  addiu   $a0, $a0, %lo(D_80B31FD4)  ## $a0 = 80B31FD4
/* 00254 80B31274 3C0580B3 */  lui     $a1, %hi(func_80B31B24)    ## $a1 = 80B30000
/* 00258 80B31278 24A51B24 */  addiu   $a1, $a1, %lo(func_80B31B24) ## $a1 = 80B31B24
/* 0025C 80B3127C 0C2CC408 */  jal     func_80B31020              
/* 00260 80B31280 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00264 80B31284 1000000C */  beq     $zero, $zero, .L80B312B8   
/* 00268 80B31288 8FBF001C */  lw      $ra, 0x001C($sp)           
glabel L80B3128C
/* 0026C 80B3128C 3C0480B3 */  lui     $a0, %hi(D_80B32008)       ## $a0 = 80B30000
/* 00270 80B31290 0C00084C */  jal     osSyncPrintf
              
/* 00274 80B31294 24842008 */  addiu   $a0, $a0, %lo(D_80B32008)  ## $a0 = 80B32008
/* 00278 80B31298 3C0480B3 */  lui     $a0, %hi(D_80B3200C)       ## $a0 = 80B30000
/* 0027C 80B3129C 0C00084C */  jal     osSyncPrintf
              
/* 00280 80B312A0 2484200C */  addiu   $a0, $a0, %lo(D_80B3200C)  ## $a0 = 80B3200C
/* 00284 80B312A4 3C0580B3 */  lui     $a1, %hi(func_80B31C20)    ## $a1 = 80B30000
/* 00288 80B312A8 24A51C20 */  addiu   $a1, $a1, %lo(func_80B31C20) ## $a1 = 80B31C20
/* 0028C 80B312AC 0C2CC408 */  jal     func_80B31020              
/* 00290 80B312B0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B312B4:
/* 00294 80B312B4 8FBF001C */  lw      $ra, 0x001C($sp)           
.L80B312B8:
/* 00298 80B312B8 8FB00018 */  lw      $s0, 0x0018($sp)           
/* 0029C 80B312BC 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 002A0 80B312C0 03E00008 */  jr      $ra                        
/* 002A4 80B312C4 00000000 */  nop
