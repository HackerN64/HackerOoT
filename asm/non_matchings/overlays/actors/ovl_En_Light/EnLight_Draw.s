.rdata
glabel D_80A9E8C0
    .asciz "../z_en_light.c"
    .balign 4

glabel D_80A9E8D0
    .asciz "../z_en_light.c"
    .balign 4

glabel D_80A9E8E0
    .asciz "../z_en_light.c"
    .balign 4

.late_rodata
glabel D_80A9E910
    .float 9.58738019108e-05

glabel D_80A9E914
    .float 3.14159274101

.text
glabel EnLight_Draw
/* 0096C 80A9E4AC 27BDFF70 */  addiu   $sp, $sp, 0xFF70           ## $sp = FFFFFF70
/* 00970 80A9E4B0 AFBF003C */  sw      $ra, 0x003C($sp)           
/* 00974 80A9E4B4 AFB00038 */  sw      $s0, 0x0038($sp)           
/* 00978 80A9E4B8 AFA40090 */  sw      $a0, 0x0090($sp)           
/* 0097C 80A9E4BC AFA50094 */  sw      $a1, 0x0094($sp)           
/* 00980 80A9E4C0 848F001C */  lh      $t7, 0x001C($a0)           ## 0000001C
/* 00984 80A9E4C4 3C0A80AA */  lui     $t2, %hi(D_80A9E840)       ## $t2 = 80AA0000
/* 00988 80A9E4C8 8CA50000 */  lw      $a1, 0x0000($a1)           ## 00000000
/* 0098C 80A9E4CC 31F8000F */  andi    $t8, $t7, 0x000F           ## $t8 = 00000000
/* 00990 80A9E4D0 0018C8C0 */  sll     $t9, $t8,  3               
/* 00994 80A9E4D4 254AE840 */  addiu   $t2, $t2, %lo(D_80A9E840)  ## $t2 = 80A9E840
/* 00998 80A9E4D8 032A4021 */  addu    $t0, $t9, $t2              
/* 0099C 80A9E4DC 3C0680AA */  lui     $a2, %hi(D_80A9E8C0)       ## $a2 = 80AA0000
/* 009A0 80A9E4E0 24C6E8C0 */  addiu   $a2, $a2, %lo(D_80A9E8C0)  ## $a2 = 80A9E8C0
/* 009A4 80A9E4E4 AFA80084 */  sw      $t0, 0x0084($sp)           
/* 009A8 80A9E4E8 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFDC
/* 009AC 80A9E4EC 240701B9 */  addiu   $a3, $zero, 0x01B9         ## $a3 = 000001B9
/* 009B0 80A9E4F0 0C031AB1 */  jal     Graph_OpenDisps              
/* 009B4 80A9E4F4 00A08025 */  or      $s0, $a1, $zero            ## $s0 = 00000000
/* 009B8 80A9E4F8 8FAC0094 */  lw      $t4, 0x0094($sp)           
/* 009BC 80A9E4FC 0C024F61 */  jal     func_80093D84              
/* 009C0 80A9E500 8D840000 */  lw      $a0, 0x0000($t4)           ## 00000000
/* 009C4 80A9E504 8FA90090 */  lw      $t1, 0x0090($sp)           
/* 009C8 80A9E508 3C18DB06 */  lui     $t8, 0xDB06                ## $t8 = DB060000
/* 009CC 80A9E50C 8FA80084 */  lw      $t0, 0x0084($sp)           
/* 009D0 80A9E510 852D001C */  lh      $t5, 0x001C($t1)           ## 0000001C
/* 009D4 80A9E514 37180020 */  ori     $t8, $t8, 0x0020           ## $t8 = DB060020
/* 009D8 80A9E518 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 009DC 80A9E51C 05A00047 */  bltz    $t5, .L80A9E63C            
/* 009E0 80A9E520 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 009E4 80A9E524 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 009E8 80A9E528 3C0FDB06 */  lui     $t7, 0xDB06                ## $t7 = DB060000
/* 009EC 80A9E52C 35EF0020 */  ori     $t7, $t7, 0x0020           ## $t7 = DB060020
/* 009F0 80A9E530 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 009F4 80A9E534 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 009F8 80A9E538 AC4F0000 */  sw      $t7, 0x0000($v0)           ## 00000000
/* 009FC 80A9E53C 8FB80094 */  lw      $t8, 0x0094($sp)           
/* 00A00 80A9E540 24190020 */  addiu   $t9, $zero, 0x0020         ## $t9 = 00000020
/* 00A04 80A9E544 240A0040 */  addiu   $t2, $zero, 0x0040         ## $t2 = 00000040
/* 00A08 80A9E548 8F040000 */  lw      $a0, 0x0000($t8)           ## DB060020
/* 00A0C 80A9E54C 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 00A10 80A9E550 AFAB0018 */  sw      $t3, 0x0018($sp)           
/* 00A14 80A9E554 AFA0001C */  sw      $zero, 0x001C($sp)         
/* 00A18 80A9E558 AFAA0014 */  sw      $t2, 0x0014($sp)           
/* 00A1C 80A9E55C AFB90010 */  sw      $t9, 0x0010($sp)           
/* 00A20 80A9E560 912C014C */  lbu     $t4, 0x014C($t1)           ## 0000014C
/* 00A24 80A9E564 24180080 */  addiu   $t8, $zero, 0x0080         ## $t8 = 00000080
/* 00A28 80A9E568 240F0020 */  addiu   $t7, $zero, 0x0020         ## $t7 = 00000020
/* 00A2C 80A9E56C 000C0823 */  subu    $at, $zero, $t4            
/* 00A30 80A9E570 00016880 */  sll     $t5, $at,  2               
/* 00A34 80A9E574 01A16821 */  addu    $t5, $t5, $at              
/* 00A38 80A9E578 000D6880 */  sll     $t5, $t5,  2               
/* 00A3C 80A9E57C 31AE01FF */  andi    $t6, $t5, 0x01FF           ## $t6 = 00000000
/* 00A40 80A9E580 AFAE0020 */  sw      $t6, 0x0020($sp)           
/* 00A44 80A9E584 AFAF0024 */  sw      $t7, 0x0024($sp)           
/* 00A48 80A9E588 AFB80028 */  sw      $t8, 0x0028($sp)           
/* 00A4C 80A9E58C AFA80084 */  sw      $t0, 0x0084($sp)           
/* 00A50 80A9E590 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00A54 80A9E594 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00A58 80A9E598 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00A5C 80A9E59C 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 00A60 80A9E5A0 AFA20068 */  sw      $v0, 0x0068($sp)           
/* 00A64 80A9E5A4 8FA30068 */  lw      $v1, 0x0068($sp)           
/* 00A68 80A9E5A8 8FA80084 */  lw      $t0, 0x0084($sp)           
/* 00A6C 80A9E5AC 3C190405 */  lui     $t9, 0x0405                ## $t9 = 04050000
/* 00A70 80A9E5B0 2739D4E0 */  addiu   $t9, $t9, 0xD4E0           ## $t9 = 0404D4E0
/* 00A74 80A9E5B4 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00A78 80A9E5B8 AFB90080 */  sw      $t9, 0x0080($sp)           
/* 00A7C 80A9E5BC 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00A80 80A9E5C0 3C0BFA00 */  lui     $t3, 0xFA00                ## $t3 = FA000000
/* 00A84 80A9E5C4 356B8080 */  ori     $t3, $t3, 0x8080           ## $t3 = FA008080
/* 00A88 80A9E5C8 244A0008 */  addiu   $t2, $v0, 0x0008           ## $t2 = 00000008
/* 00A8C 80A9E5CC AE0A02D0 */  sw      $t2, 0x02D0($s0)           ## 000002D0
/* 00A90 80A9E5D0 AC4B0000 */  sw      $t3, 0x0000($v0)           ## 00000000
/* 00A94 80A9E5D4 91180001 */  lbu     $t8, 0x0001($t0)           ## 00000001
/* 00A98 80A9E5D8 910D0000 */  lbu     $t5, 0x0000($t0)           ## 00000000
/* 00A9C 80A9E5DC 910C0002 */  lbu     $t4, 0x0002($t0)           ## 00000002
/* 00AA0 80A9E5E0 0018CC00 */  sll     $t9, $t8, 16               
/* 00AA4 80A9E5E4 000D7600 */  sll     $t6, $t5, 24               
/* 00AA8 80A9E5E8 01D95025 */  or      $t2, $t6, $t9              ## $t2 = 0404D4E0
/* 00AAC 80A9E5EC 910E0003 */  lbu     $t6, 0x0003($t0)           ## 00000003
/* 00AB0 80A9E5F0 000C6A00 */  sll     $t5, $t4,  8               
/* 00AB4 80A9E5F4 014D7825 */  or      $t7, $t2, $t5              ## $t7 = 0404D4E0
/* 00AB8 80A9E5F8 01EEC825 */  or      $t9, $t7, $t6              ## $t9 = 0404D4E0
/* 00ABC 80A9E5FC AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 00AC0 80A9E600 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00AC4 80A9E604 3C0CFB00 */  lui     $t4, 0xFB00                ## $t4 = FB000000
/* 00AC8 80A9E608 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00ACC 80A9E60C AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 00AD0 80A9E610 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 00AD4 80A9E614 910D0004 */  lbu     $t5, 0x0004($t0)           ## 00000004
/* 00AD8 80A9E618 910E0005 */  lbu     $t6, 0x0005($t0)           ## 00000005
/* 00ADC 80A9E61C 910A0006 */  lbu     $t2, 0x0006($t0)           ## 00000006
/* 00AE0 80A9E620 000DC600 */  sll     $t8, $t5, 24               
/* 00AE4 80A9E624 000ECC00 */  sll     $t9, $t6, 16               
/* 00AE8 80A9E628 03195825 */  or      $t3, $t8, $t9              ## $t3 = 0404D4E0
/* 00AEC 80A9E62C 000A6A00 */  sll     $t5, $t2,  8               
/* 00AF0 80A9E630 016D7825 */  or      $t7, $t3, $t5              ## $t7 = 0404D4E0
/* 00AF4 80A9E634 10000032 */  beq     $zero, $zero, .L80A9E700   
/* 00AF8 80A9E638 AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
.L80A9E63C:
/* 00AFC 80A9E63C 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00B00 80A9E640 240C0010 */  addiu   $t4, $zero, 0x0010         ## $t4 = 00000010
/* 00B04 80A9E644 240A0020 */  addiu   $t2, $zero, 0x0020         ## $t2 = 00000020
/* 00B08 80A9E648 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00B0C 80A9E64C AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 00B10 80A9E650 AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
/* 00B14 80A9E654 8FB90094 */  lw      $t9, 0x0094($sp)           
/* 00B18 80A9E658 240B0001 */  addiu   $t3, $zero, 0x0001         ## $t3 = 00000001
/* 00B1C 80A9E65C 00003825 */  or      $a3, $zero, $zero          ## $a3 = 00000000
/* 00B20 80A9E660 8F240000 */  lw      $a0, 0x0000($t9)           ## 0404D4E0
/* 00B24 80A9E664 AFAB0018 */  sw      $t3, 0x0018($sp)           
/* 00B28 80A9E668 AFAA0014 */  sw      $t2, 0x0014($sp)           
/* 00B2C 80A9E66C AFAC0010 */  sw      $t4, 0x0010($sp)           
/* 00B30 80A9E670 9123014C */  lbu     $v1, 0x014C($t1)           ## 0000014C
/* 00B34 80A9E674 240C0020 */  addiu   $t4, $zero, 0x0020         ## $t4 = 00000020
/* 00B38 80A9E678 24190010 */  addiu   $t9, $zero, 0x0010         ## $t9 = 00000010
/* 00B3C 80A9E67C 00030823 */  subu    $at, $zero, $v1            
/* 00B40 80A9E680 00017080 */  sll     $t6, $at,  2               
/* 00B44 80A9E684 01C17023 */  subu    $t6, $t6, $at              
/* 00B48 80A9E688 000E7040 */  sll     $t6, $t6,  1               
/* 00B4C 80A9E68C 00036840 */  sll     $t5, $v1,  1               
/* 00B50 80A9E690 31AF003F */  andi    $t7, $t5, 0x003F           ## $t7 = 00000000
/* 00B54 80A9E694 31D8007F */  andi    $t8, $t6, 0x007F           ## $t8 = 00000008
/* 00B58 80A9E698 AFB80020 */  sw      $t8, 0x0020($sp)           
/* 00B5C 80A9E69C AFAF001C */  sw      $t7, 0x001C($sp)           
/* 00B60 80A9E6A0 AFB90024 */  sw      $t9, 0x0024($sp)           
/* 00B64 80A9E6A4 AFAC0028 */  sw      $t4, 0x0028($sp)           
/* 00B68 80A9E6A8 0C0253D0 */  jal     Gfx_TwoTexScroll              
/* 00B6C 80A9E6AC AFA2005C */  sw      $v0, 0x005C($sp)           
/* 00B70 80A9E6B0 8FA8005C */  lw      $t0, 0x005C($sp)           
/* 00B74 80A9E6B4 3C0A0500 */  lui     $t2, 0x0500                ## $t2 = 05000000
/* 00B78 80A9E6B8 254A0440 */  addiu   $t2, $t2, 0x0440           ## $t2 = 05000440
/* 00B7C 80A9E6BC AD020004 */  sw      $v0, 0x0004($t0)           ## 00000004
/* 00B80 80A9E6C0 AFAA0080 */  sw      $t2, 0x0080($sp)           
/* 00B84 80A9E6C4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00B88 80A9E6C8 3C0DFA00 */  lui     $t5, 0xFA00                ## $t5 = FA000000
/* 00B8C 80A9E6CC 35ADC0C0 */  ori     $t5, $t5, 0xC0C0           ## $t5 = FA00C0C0
/* 00B90 80A9E6D0 244B0008 */  addiu   $t3, $v0, 0x0008           ## $t3 = 00000008
/* 00B94 80A9E6D4 AE0B02D0 */  sw      $t3, 0x02D0($s0)           ## 000002D0
/* 00B98 80A9E6D8 3C0FFFC8 */  lui     $t7, 0xFFC8                ## $t7 = FFC80000
/* 00B9C 80A9E6DC AC4F0004 */  sw      $t7, 0x0004($v0)           ## 00000004
/* 00BA0 80A9E6E0 AC4D0000 */  sw      $t5, 0x0000($v0)           ## 00000000
/* 00BA4 80A9E6E4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00BA8 80A9E6E8 3C18FB00 */  lui     $t8, 0xFB00                ## $t8 = FB000000
/* 00BAC 80A9E6EC 3C19FF00 */  lui     $t9, 0xFF00                ## $t9 = FF000000
/* 00BB0 80A9E6F0 244E0008 */  addiu   $t6, $v0, 0x0008           ## $t6 = 00000008
/* 00BB4 80A9E6F4 AE0E02D0 */  sw      $t6, 0x02D0($s0)           ## 000002D0
/* 00BB8 80A9E6F8 AC590004 */  sw      $t9, 0x0004($v0)           ## 00000004
/* 00BBC 80A9E6FC AC580000 */  sw      $t8, 0x0000($v0)           ## 00000000
.L80A9E700:
/* 00BC0 80A9E700 8FA20094 */  lw      $v0, 0x0094($sp)           
/* 00BC4 80A9E704 844C07A0 */  lh      $t4, 0x07A0($v0)           ## 000007A0
/* 00BC8 80A9E708 000C5080 */  sll     $t2, $t4,  2               
/* 00BCC 80A9E70C 004A5821 */  addu    $t3, $v0, $t2              
/* 00BD0 80A9E710 0C016A7D */  jal     func_8005A9F4              
/* 00BD4 80A9E714 8D640790 */  lw      $a0, 0x0790($t3)           ## 00000798
/* 00BD8 80A9E718 8FAD0090 */  lw      $t5, 0x0090($sp)           
/* 00BDC 80A9E71C 34018000 */  ori     $at, $zero, 0x8000         ## $at = 00008000
/* 00BE0 80A9E720 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00BE4 80A9E724 85AF00B6 */  lh      $t7, 0x00B6($t5)           ## 000000B6
/* 00BE8 80A9E728 004F7023 */  subu    $t6, $v0, $t7              
/* 00BEC 80A9E72C 01C1C021 */  addu    $t8, $t6, $at              
/* 00BF0 80A9E730 0018CC00 */  sll     $t9, $t8, 16               
/* 00BF4 80A9E734 00196403 */  sra     $t4, $t9, 16               
/* 00BF8 80A9E738 448C2000 */  mtc1    $t4, $f4                   ## $f4 = 0.00
/* 00BFC 80A9E73C 3C0180AA */  lui     $at, %hi(D_80A9E910)       ## $at = 80AA0000
/* 00C00 80A9E740 C428E910 */  lwc1    $f8, %lo(D_80A9E910)($at)  
/* 00C04 80A9E744 468021A0 */  cvt.s.w $f6, $f4                   
/* 00C08 80A9E748 46083302 */  mul.s   $f12, $f6, $f8             
/* 00C0C 80A9E74C 0C034348 */  jal     Matrix_RotateY              
/* 00C10 80A9E750 00000000 */  nop
/* 00C14 80A9E754 8FAA0090 */  lw      $t2, 0x0090($sp)           
/* 00C18 80A9E758 3C0180AA */  lui     $at, %hi(D_80A9E914)       ## $at = 80AA0000
/* 00C1C 80A9E75C 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00C20 80A9E760 854B001C */  lh      $t3, 0x001C($t2)           ## 0000001C
/* 00C24 80A9E764 316D0001 */  andi    $t5, $t3, 0x0001           ## $t5 = 00000000
/* 00C28 80A9E768 51A00004 */  beql    $t5, $zero, .L80A9E77C     
/* 00C2C 80A9E76C 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
/* 00C30 80A9E770 0C034348 */  jal     Matrix_RotateY              
/* 00C34 80A9E774 C42CE914 */  lwc1    $f12, %lo(D_80A9E914)($at) 
/* 00C38 80A9E778 3C013F80 */  lui     $at, 0x3F80                ## $at = 3F800000
.L80A9E77C:
/* 00C3C 80A9E77C 44816000 */  mtc1    $at, $f12                  ## $f12 = 1.00
/* 00C40 80A9E780 24070001 */  addiu   $a3, $zero, 0x0001         ## $a3 = 00000001
/* 00C44 80A9E784 44066000 */  mfc1    $a2, $f12                  
/* 00C48 80A9E788 0C0342A3 */  jal     Matrix_Scale              
/* 00C4C 80A9E78C 46006386 */  mov.s   $f14, $f12                 
/* 00C50 80A9E790 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00C54 80A9E794 3C0EDA38 */  lui     $t6, 0xDA38                ## $t6 = DA380000
/* 00C58 80A9E798 35CE0003 */  ori     $t6, $t6, 0x0003           ## $t6 = DA380003
/* 00C5C 80A9E79C 244F0008 */  addiu   $t7, $v0, 0x0008           ## $t7 = 00000008
/* 00C60 80A9E7A0 AE0F02D0 */  sw      $t7, 0x02D0($s0)           ## 000002D0
/* 00C64 80A9E7A4 AC4E0000 */  sw      $t6, 0x0000($v0)           ## 00000000
/* 00C68 80A9E7A8 8FB80094 */  lw      $t8, 0x0094($sp)           
/* 00C6C 80A9E7AC 3C0580AA */  lui     $a1, %hi(D_80A9E8D0)       ## $a1 = 80AA0000
/* 00C70 80A9E7B0 24A5E8D0 */  addiu   $a1, $a1, %lo(D_80A9E8D0)  ## $a1 = 80A9E8D0
/* 00C74 80A9E7B4 8F040000 */  lw      $a0, 0x0000($t8)           ## 00000000
/* 00C78 80A9E7B8 240601E8 */  addiu   $a2, $zero, 0x01E8         ## $a2 = 000001E8
/* 00C7C 80A9E7BC 0C0346A2 */  jal     Matrix_NewMtx              
/* 00C80 80A9E7C0 AFA20050 */  sw      $v0, 0x0050($sp)           
/* 00C84 80A9E7C4 8FA30050 */  lw      $v1, 0x0050($sp)           
/* 00C88 80A9E7C8 3C0CDE00 */  lui     $t4, 0xDE00                ## $t4 = DE000000
/* 00C8C 80A9E7CC 3C0680AA */  lui     $a2, %hi(D_80A9E8E0)       ## $a2 = 80AA0000
/* 00C90 80A9E7D0 AC620004 */  sw      $v0, 0x0004($v1)           ## 00000004
/* 00C94 80A9E7D4 8E0202D0 */  lw      $v0, 0x02D0($s0)           ## 000002D0
/* 00C98 80A9E7D8 24C6E8E0 */  addiu   $a2, $a2, %lo(D_80A9E8E0)  ## $a2 = 80A9E8E0
/* 00C9C 80A9E7DC 27A4006C */  addiu   $a0, $sp, 0x006C           ## $a0 = FFFFFFDC
/* 00CA0 80A9E7E0 24590008 */  addiu   $t9, $v0, 0x0008           ## $t9 = 00000008
/* 00CA4 80A9E7E4 AE1902D0 */  sw      $t9, 0x02D0($s0)           ## 000002D0
/* 00CA8 80A9E7E8 AC4C0000 */  sw      $t4, 0x0000($v0)           ## 00000000
/* 00CAC 80A9E7EC 8FAA0080 */  lw      $t2, 0x0080($sp)           
/* 00CB0 80A9E7F0 240701EB */  addiu   $a3, $zero, 0x01EB         ## $a3 = 000001EB
/* 00CB4 80A9E7F4 AC4A0004 */  sw      $t2, 0x0004($v0)           ## 00000004
/* 00CB8 80A9E7F8 8FAB0094 */  lw      $t3, 0x0094($sp)           
/* 00CBC 80A9E7FC 0C031AD5 */  jal     Graph_CloseDisps              
/* 00CC0 80A9E800 8D650000 */  lw      $a1, 0x0000($t3)           ## 00000000
/* 00CC4 80A9E804 8FBF003C */  lw      $ra, 0x003C($sp)           
/* 00CC8 80A9E808 8FB00038 */  lw      $s0, 0x0038($sp)           
/* 00CCC 80A9E80C 27BD0090 */  addiu   $sp, $sp, 0x0090           ## $sp = 00000000
/* 00CD0 80A9E810 03E00008 */  jr      $ra                        
/* 00CD4 80A9E814 00000000 */  nop
/* 00CD8 80A9E818 00000000 */  nop
/* 00CDC 80A9E81C 00000000 */  nop
