.late_rodata
glabel D_80A9C318
    .float 0.2

glabel D_80A9C31C
    .float 0.1

.text
glabel func_80A9B174
/* 001D4 80A9B174 44856000 */  mtc1    $a1, $f12                  ## $f12 = 0.00
/* 001D8 80A9B178 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 001DC 80A9B17C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 001E0 80A9B180 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 001E4 80A9B184 0C03F66B */  jal     Math_Rand_ZeroOne
              ## Rand.Next() float
/* 001E8 80A9B188 E7AC001C */  swc1    $f12, 0x001C($sp)          
/* 001EC 80A9B18C 3C0180AA */  lui     $at, %hi(D_80A9C318)       ## $at = 80AA0000
/* 001F0 80A9B190 C424C318 */  lwc1    $f4, %lo(D_80A9C318)($at)  
/* 001F4 80A9B194 3C0180AA */  lui     $at, %hi(D_80A9C31C)       ## $at = 80AA0000
/* 001F8 80A9B198 C428C31C */  lwc1    $f8, %lo(D_80A9C31C)($at)  
/* 001FC 80A9B19C 46040182 */  mul.s   $f6, $f0, $f4              
/* 00200 80A9B1A0 C7AC001C */  lwc1    $f12, 0x001C($sp)          
/* 00204 80A9B1A4 8FA40018 */  lw      $a0, 0x0018($sp)           
/* 00208 80A9B1A8 C4820000 */  lwc1    $f2, 0x0000($a0)           ## 00000000
/* 0020C 80A9B1AC C48E0004 */  lwc1    $f14, 0x0004($a0)          ## 00000004
/* 00210 80A9B1B0 46083281 */  sub.s   $f10, $f6, $f8             
/* 00214 80A9B1B4 C4900008 */  lwc1    $f16, 0x0008($a0)          ## 00000008
/* 00218 80A9B1B8 460C5482 */  mul.s   $f18, $f10, $f12           
/* 0021C 80A9B1BC 46126300 */  add.s   $f12, $f12, $f18           
/* 00220 80A9B1C0 460C1102 */  mul.s   $f4, $f2, $f12             
/* 00224 80A9B1C4 00000000 */  nop
/* 00228 80A9B1C8 460C7202 */  mul.s   $f8, $f14, $f12            
/* 0022C 80A9B1CC 00000000 */  nop
/* 00230 80A9B1D0 460C8482 */  mul.s   $f18, $f16, $f12           
/* 00234 80A9B1D4 46041181 */  sub.s   $f6, $f2, $f4              
/* 00238 80A9B1D8 46087281 */  sub.s   $f10, $f14, $f8            
/* 0023C 80A9B1DC E4860000 */  swc1    $f6, 0x0000($a0)           ## 00000000
/* 00240 80A9B1E0 46128101 */  sub.s   $f4, $f16, $f18            
/* 00244 80A9B1E4 E48A0004 */  swc1    $f10, 0x0004($a0)          ## 00000004
/* 00248 80A9B1E8 E4840008 */  swc1    $f4, 0x0008($a0)           ## 00000008
/* 0024C 80A9B1EC 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00250 80A9B1F0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00254 80A9B1F4 03E00008 */  jr      $ra                        
/* 00258 80A9B1F8 00000000 */  nop
