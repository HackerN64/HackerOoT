glabel func_80925C18
/* 0A118 80925C18 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 0A11C 80925C1C 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
/* 0A120 80925C20 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0A124 80925C24 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 0A128 80925C28 84431314 */  lh      $v1, 0x1314($v0)           ## 80161314
/* 0A12C 80925C2C 3C041001 */  lui     $a0, 0x1001                ## $a0 = 10010000
/* 0A130 80925C30 348400FF */  ori     $a0, $a0, 0x00FF           ## $a0 = 100100FF
/* 0A134 80925C34 1060000F */  beq     $v1, $zero, .L80925C74     
/* 0A138 80925C38 246EFFFF */  addiu   $t6, $v1, 0xFFFF           ## $t6 = FFFFFFFF
/* 0A13C 80925C3C 0C03E803 */  jal     Audio_SetBGM
              
/* 0A140 80925C40 A44E1314 */  sh      $t6, 0x1314($v0)           ## 80161314
/* 0A144 80925C44 3C0F8016 */  lui     $t7, %hi(gGameInfo)
/* 0A148 80925C48 8DEFFA90 */  lw      $t7, %lo(gGameInfo)($t7)
/* 0A14C 80925C4C 3C058092 */  lui     $a1, %hi(D_80926518)       ## $a1 = 80920000
/* 0A150 80925C50 3C048092 */  lui     $a0, %hi(D_8092650C)       ## $a0 = 80920000
/* 0A154 80925C54 85F81316 */  lh      $t8, 0x1316($t7)           ## 80161316
/* 0A158 80925C58 2484650C */  addiu   $a0, $a0, %lo(D_8092650C)  ## $a0 = 8092650C
/* 0A15C 80925C5C 0018C840 */  sll     $t9, $t8,  1               
/* 0A160 80925C60 00B92821 */  addu    $a1, $a1, $t9              
/* 0A164 80925C64 0C01E245 */  jal     func_80078914              
/* 0A168 80925C68 94A56518 */  lhu     $a1, %lo(D_80926518)($a1)  
/* 0A16C 80925C6C 3C028016 */  lui     $v0, %hi(gGameInfo)
/* 0A170 80925C70 8C42FA90 */  lw      $v0, %lo(gGameInfo)($v0)
.L80925C74:
/* 0A174 80925C74 84481318 */  lh      $t0, 0x1318($v0)           ## 80161318
/* 0A178 80925C78 3C098016 */  lui     $t1, %hi(gGameInfo)
/* 0A17C 80925C7C 51000006 */  beql    $t0, $zero, .L80925C98     
/* 0A180 80925C80 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0A184 80925C84 A4401318 */  sh      $zero, 0x1318($v0)         ## 80161318
/* 0A188 80925C88 8D29FA90 */  lw      $t1, %lo(gGameInfo)($t1)
/* 0A18C 80925C8C 0C03E803 */  jal     Audio_SetBGM
              
/* 0A190 80925C90 9524131A */  lhu     $a0, 0x131A($t1)           ## 8016131A
/* 0A194 80925C94 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L80925C98:
/* 0A198 80925C98 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 0A19C 80925C9C 03E00008 */  jr      $ra                        
/* 0A1A0 80925CA0 00000000 */  nop
/* 0A1A4 80925CA4 00000000 */  nop
/* 0A1A8 80925CA8 00000000 */  nop
/* 0A1AC 80925CAC 00000000 */  nop
