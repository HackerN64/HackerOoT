.rdata
glabel D_80893150
    .asciz "Warning : move BG 登録失敗(%s %d)(name %d)(arg_data 0x%04x)\n"
    .balign 4

glabel D_80893190
    .asciz "../z_bg_jya_1flift.c"
    .balign 4

.text
glabel func_80892B60
/* 00000 80892B60 27BDFFC8 */  addiu   $sp, $sp, 0xFFC8           ## $sp = FFFFFFC8
/* 00004 80892B64 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 00008 80892B68 AFB00020 */  sw      $s0, 0x0020($sp)           
/* 0000C 80892B6C AFA5003C */  sw      $a1, 0x003C($sp)           
/* 00010 80892B70 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 00014 80892B74 AFA60040 */  sw      $a2, 0x0040($sp)           
/* 00018 80892B78 AFA00030 */  sw      $zero, 0x0030($sp)         
/* 0001C 80892B7C 0C010D20 */  jal     DynaPolyInfo_SetActorMove
              
/* 00020 80892B80 00E02825 */  or      $a1, $a3, $zero            ## $a1 = 00000000
/* 00024 80892B84 8FA40040 */  lw      $a0, 0x0040($sp)           
/* 00028 80892B88 0C010620 */  jal     DynaPolyInfo_Alloc
              
/* 0002C 80892B8C 27A50030 */  addiu   $a1, $sp, 0x0030           ## $a1 = FFFFFFF8
/* 00030 80892B90 8FA4003C */  lw      $a0, 0x003C($sp)           
/* 00034 80892B94 02003025 */  or      $a2, $s0, $zero            ## $a2 = 00000000
/* 00038 80892B98 8FA70030 */  lw      $a3, 0x0030($sp)           
/* 0003C 80892B9C 0C00FA9D */  jal     DynaPolyInfo_RegisterActor
              ## DynaPolyInfo_setActor
/* 00040 80892BA0 24850810 */  addiu   $a1, $a0, 0x0810           ## $a1 = 00000810
/* 00044 80892BA4 24010032 */  addiu   $at, $zero, 0x0032         ## $at = 00000032
/* 00048 80892BA8 1441000A */  bne     $v0, $at, .L80892BD4       
/* 0004C 80892BAC AE02014C */  sw      $v0, 0x014C($s0)           ## 0000014C
/* 00050 80892BB0 860E001C */  lh      $t6, 0x001C($s0)           ## 0000001C
/* 00054 80892BB4 3C048089 */  lui     $a0, %hi(D_80893150)       ## $a0 = 80890000
/* 00058 80892BB8 3C058089 */  lui     $a1, %hi(D_80893190)       ## $a1 = 80890000
/* 0005C 80892BBC 86070000 */  lh      $a3, 0x0000($s0)           ## 00000000
/* 00060 80892BC0 24A53190 */  addiu   $a1, $a1, %lo(D_80893190)  ## $a1 = 80893190
/* 00064 80892BC4 24843150 */  addiu   $a0, $a0, %lo(D_80893150)  ## $a0 = 80893150
/* 00068 80892BC8 240600B3 */  addiu   $a2, $zero, 0x00B3         ## $a2 = 000000B3
/* 0006C 80892BCC 0C00084C */  jal     osSyncPrintf
              
/* 00070 80892BD0 AFAE0010 */  sw      $t6, 0x0010($sp)           
.L80892BD4:
/* 00074 80892BD4 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 00078 80892BD8 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 0007C 80892BDC 27BD0038 */  addiu   $sp, $sp, 0x0038           ## $sp = 00000000
/* 00080 80892BE0 03E00008 */  jr      $ra                        
/* 00084 80892BE4 00000000 */  nop
