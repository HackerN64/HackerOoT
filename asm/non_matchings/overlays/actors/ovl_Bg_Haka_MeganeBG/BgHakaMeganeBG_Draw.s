glabel BgHakaMeganeBG_Draw
/* 0054C 8087E37C 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 00550 8087E380 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00554 8087E384 8482001C */  lh      $v0, 0x001C($a0)           ## 0000001C
/* 00558 8087E388 00A03025 */  or      $a2, $a1, $zero            ## $a2 = 00000000
/* 0055C 8087E38C 00C02025 */  or      $a0, $a2, $zero            ## $a0 = 00000000
/* 00560 8087E390 14400007 */  bne     $v0, $zero, .L8087E3B0     
/* 00564 8087E394 00027080 */  sll     $t6, $v0,  2               
/* 00568 8087E398 00A02025 */  or      $a0, $a1, $zero            ## $a0 = 00000000
/* 0056C 8087E39C 3C050601 */  lui     $a1, 0x0601                ## $a1 = 06010000
/* 00570 8087E3A0 0C00D4C9 */  jal     Gfx_DrawDListXlu
              
/* 00574 8087E3A4 24A58EB0 */  addiu   $a1, $a1, 0x8EB0           ## $a1 = 06008EB0
/* 00578 8087E3A8 10000006 */  beq     $zero, $zero, .L8087E3C4   
/* 0057C 8087E3AC 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8087E3B0:
/* 00580 8087E3B0 3C058088 */  lui     $a1, %hi(D_8087E410)       ## $a1 = 80880000
/* 00584 8087E3B4 00AE2821 */  addu    $a1, $a1, $t6              
/* 00588 8087E3B8 0C00D498 */  jal     Gfx_DrawDListOpa
              
/* 0058C 8087E3BC 8CA5E410 */  lw      $a1, %lo(D_8087E410)($a1)  
/* 00590 8087E3C0 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8087E3C4:
/* 00594 8087E3C4 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00598 8087E3C8 03E00008 */  jr      $ra                        
/* 0059C 8087E3CC 00000000 */  nop
