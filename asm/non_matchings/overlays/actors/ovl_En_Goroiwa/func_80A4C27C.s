.rdata
glabel D_80A4DF30
    .asciz "Error : レールデータ不正(点が重なっている)"
    .balign 4

glabel D_80A4DF5C
    .asciz "(%s %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80A4DF78
    .asciz "../z_en_gr.c"
    .balign 4

.text
glabel func_80A4C27C
/* 005DC 80A4C27C 27BDFFD8 */  addiu   $sp, $sp, 0xFFD8           ## $sp = FFFFFFD8
/* 005E0 80A4C280 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 005E4 80A4C284 848F001C */  lh      $t7, 0x001C($a0)           ## 0000001C
/* 005E8 80A4C288 3C0E0001 */  lui     $t6, 0x0001                ## $t6 = 00010000
/* 005EC 80A4C28C 01C57021 */  addu    $t6, $t6, $a1              
/* 005F0 80A4C290 8DCE1E08 */  lw      $t6, 0x1E08($t6)           ## 00011E08
/* 005F4 80A4C294 31F800FF */  andi    $t8, $t7, 0x00FF           ## $t8 = 00000000
/* 005F8 80A4C298 0018C8C0 */  sll     $t9, $t8,  3               
/* 005FC 80A4C29C 01D93021 */  addu    $a2, $t6, $t9              
/* 00600 80A4C2A0 848E01CE */  lh      $t6, 0x01CE($a0)           ## 000001CE
/* 00604 80A4C2A4 240A0006 */  addiu   $t2, $zero, 0x0006         ## $t2 = 00000006
/* 00608 80A4C2A8 8CC20004 */  lw      $v0, 0x0004($a2)           ## 00000004
/* 0060C 80A4C2AC 01CA0019 */  multu   $t6, $t2                   
/* 00610 80A4C2B0 3C0F8016 */  lui     $t7, %hi(gSegments)
/* 00614 80A4C2B4 00025900 */  sll     $t3, $v0,  4               
/* 00618 80A4C2B8 000B6702 */  srl     $t4, $t3, 28               
/* 0061C 80A4C2BC 848B01CC */  lh      $t3, 0x01CC($a0)           ## 000001CC
/* 00620 80A4C2C0 000C6880 */  sll     $t5, $t4,  2               
/* 00624 80A4C2C4 01ED7821 */  addu    $t7, $t7, $t5              
/* 00628 80A4C2C8 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 0062C 80A4C2CC 8DEF6FA8 */  lw      $t7, %lo(gSegments)($t7)
/* 00630 80A4C2D0 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00634 80A4C2D4 0000C812 */  mflo    $t9                        
/* 00638 80A4C2D8 0041C024 */  and     $t8, $v0, $at              
/* 0063C 80A4C2DC 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00640 80A4C2E0 016A0019 */  multu   $t3, $t2                   
/* 00644 80A4C2E4 01F81821 */  addu    $v1, $t7, $t8              
/* 00648 80A4C2E8 00611821 */  addu    $v1, $v1, $at              
/* 0064C 80A4C2EC 00794021 */  addu    $t0, $v1, $t9              
/* 00650 80A4C2F0 850F0000 */  lh      $t7, 0x0000($t0)           ## 00000000
/* 00654 80A4C2F4 00803825 */  or      $a3, $a0, $zero            ## $a3 = 00000000
/* 00658 80A4C2F8 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 0065C 80A4C2FC 00006012 */  mflo    $t4                        
/* 00660 80A4C300 006C4821 */  addu    $t1, $v1, $t4              
/* 00664 80A4C304 852D0000 */  lh      $t5, 0x0000($t1)           ## 00000000
/* 00668 80A4C308 15AF0022 */  bne     $t5, $t7, .L80A4C394       
/* 0066C 80A4C30C 00000000 */  nop
/* 00670 80A4C310 85380004 */  lh      $t8, 0x0004($t1)           ## 00000004
/* 00674 80A4C314 850E0004 */  lh      $t6, 0x0004($t0)           ## 00000004
/* 00678 80A4C318 170E001E */  bne     $t8, $t6, .L80A4C394       
/* 0067C 80A4C31C 00000000 */  nop
/* 00680 80A4C320 85220002 */  lh      $v0, 0x0002($t1)           ## 00000002
/* 00684 80A4C324 85030002 */  lh      $v1, 0x0002($t0)           ## 00000002
/* 00688 80A4C328 3C0480A5 */  lui     $a0, %hi(D_80A4DF30)       ## $a0 = 80A50000
/* 0068C 80A4C32C 2484DF30 */  addiu   $a0, $a0, %lo(D_80A4DF30)  ## $a0 = 80A4DF30
/* 00690 80A4C330 54430012 */  bnel    $v0, $v1, .L80A4C37C       
/* 00694 80A4C334 0043082A */  slt     $at, $v0, $v1              
/* 00698 80A4C338 AFA70028 */  sw      $a3, 0x0028($sp)           
/* 0069C 80A4C33C AFA8001C */  sw      $t0, 0x001C($sp)           
/* 006A0 80A4C340 0C00084C */  jal     osSyncPrintf
              
/* 006A4 80A4C344 AFA90018 */  sw      $t1, 0x0018($sp)           
/* 006A8 80A4C348 8FB90028 */  lw      $t9, 0x0028($sp)           
/* 006AC 80A4C34C 3C0480A5 */  lui     $a0, %hi(D_80A4DF5C)       ## $a0 = 80A50000
/* 006B0 80A4C350 3C0580A5 */  lui     $a1, %hi(D_80A4DF78)       ## $a1 = 80A50000
/* 006B4 80A4C354 24A5DF78 */  addiu   $a1, $a1, %lo(D_80A4DF78)  ## $a1 = 80A4DF78
/* 006B8 80A4C358 2484DF5C */  addiu   $a0, $a0, %lo(D_80A4DF5C)  ## $a0 = 80A4DF5C
/* 006BC 80A4C35C 2406022F */  addiu   $a2, $zero, 0x022F         ## $a2 = 0000022F
/* 006C0 80A4C360 0C00084C */  jal     osSyncPrintf
              
/* 006C4 80A4C364 8727001C */  lh      $a3, 0x001C($t9)           ## 0000001C
/* 006C8 80A4C368 8FA8001C */  lw      $t0, 0x001C($sp)           
/* 006CC 80A4C36C 8FA90018 */  lw      $t1, 0x0018($sp)           
/* 006D0 80A4C370 85030002 */  lh      $v1, 0x0002($t0)           ## 00000002
/* 006D4 80A4C374 85220002 */  lh      $v0, 0x0002($t1)           ## 00000002
/* 006D8 80A4C378 0043082A */  slt     $at, $v0, $v1              
.L80A4C37C:
/* 006DC 80A4C37C 10200003 */  beq     $at, $zero, .L80A4C38C     
/* 006E0 80A4C380 00000000 */  nop
/* 006E4 80A4C384 10000003 */  beq     $zero, $zero, .L80A4C394   
/* 006E8 80A4C388 24020001 */  addiu   $v0, $zero, 0x0001         ## $v0 = 00000001
.L80A4C38C:
/* 006EC 80A4C38C 10000001 */  beq     $zero, $zero, .L80A4C394   
/* 006F0 80A4C390 2402FFFF */  addiu   $v0, $zero, 0xFFFF         ## $v0 = FFFFFFFF
.L80A4C394:
/* 006F4 80A4C394 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 006F8 80A4C398 27BD0028 */  addiu   $sp, $sp, 0x0028           ## $sp = 00000000
/* 006FC 80A4C39C 03E00008 */  jr      $ra                        
/* 00700 80A4C3A0 00000000 */  nop
