glabel func_80A3E578
/* 00008 80A3E578 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0000C 80A3E57C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00010 80A3E580 84A3001C */  lh      $v1, 0x001C($a1)           ## 0000001C
/* 00014 80A3E584 8C861C44 */  lw      $a2, 0x1C44($a0)           ## 00001C44
/* 00018 80A3E588 306200F0 */  andi    $v0, $v1, 0x00F0           ## $v0 = 00000000
/* 0001C 80A3E58C 28410071 */  slti    $at, $v0, 0x0071           
/* 00020 80A3E590 14200005 */  bne     $at, $zero, .L80A3E5A8     
/* 00024 80A3E594 24010090 */  addiu   $at, $zero, 0x0090         ## $at = 00000090
/* 00028 80A3E598 1041000B */  beq     $v0, $at, .L80A3E5C8       
/* 0002C 80A3E59C 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00030 80A3E5A0 100000D5 */  beq     $zero, $zero, .L80A3E8F8   
/* 00034 80A3E5A4 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A3E5A8:
/* 00038 80A3E5A8 2C410071 */  sltiu   $at, $v0, 0x0071           
/* 0003C 80A3E5AC 102000D1 */  beq     $at, $zero, .L80A3E8F4     
/* 00040 80A3E5B0 00027080 */  sll     $t6, $v0,  2               
/* 00044 80A3E5B4 3C0180A4 */  lui     $at, %hi(jtbl_80A41CB0)       ## $at = 80A40000
/* 00048 80A3E5B8 002E0821 */  addu    $at, $at, $t6              
/* 0004C 80A3E5BC 8C2E1CB0 */  lw      $t6, %lo(jtbl_80A41CB0)($at)  
/* 00050 80A3E5C0 01C00008 */  jr      $t6                        
/* 00054 80A3E5C4 00000000 */  nop
.L80A3E5C8:
/* 00058 80A3E5C8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0005C 80A3E5CC 906F003E */  lbu     $t7, 0x003E($v1)           ## 8015E69E
/* 00060 80A3E5D0 3C188012 */  lui     $t8, %hi(gItemSlots+0x2d)
/* 00064 80A3E5D4 11E00003 */  beq     $t7, $zero, .L80A3E5E4     
/* 00068 80A3E5D8 00000000 */  nop
/* 0006C 80A3E5DC 100000C6 */  beq     $zero, $zero, .L80A3E8F8   
/* 00070 80A3E5E0 2402305E */  addiu   $v0, $zero, 0x305E         ## $v0 = 0000305E
.L80A3E5E4:
/* 00074 80A3E5E4 93187491 */  lbu     $t8, %lo(gItemSlots+0x2d)($t8)
/* 00078 80A3E5E8 0078C821 */  addu    $t9, $v1, $t8              
/* 0007C 80A3E5EC 93220074 */  lbu     $v0, 0x0074($t9)           ## 00000074
/* 00080 80A3E5F0 28410037 */  slti    $at, $v0, 0x0037           
/* 00084 80A3E5F4 5420000B */  bnel    $at, $zero, .L80A3E624     
/* 00088 80A3E5F8 28410036 */  slti    $at, $v0, 0x0036           
/* 0008C 80A3E5FC 0C01DD73 */  jal     func_800775CC              
/* 00090 80A3E600 00000000 */  nop
/* 00094 80A3E604 28410003 */  slti    $at, $v0, 0x0003           
/* 00098 80A3E608 14200003 */  bne     $at, $zero, .L80A3E618     
/* 0009C 80A3E60C 00000000 */  nop
/* 000A0 80A3E610 100000B9 */  beq     $zero, $zero, .L80A3E8F8   
/* 000A4 80A3E614 2402305E */  addiu   $v0, $zero, 0x305E         ## $v0 = 0000305E
.L80A3E618:
/* 000A8 80A3E618 100000B7 */  beq     $zero, $zero, .L80A3E8F8   
/* 000AC 80A3E61C 2402305D */  addiu   $v0, $zero, 0x305D         ## $v0 = 0000305D
/* 000B0 80A3E620 28410036 */  slti    $at, $v0, 0x0036           
.L80A3E624:
/* 000B4 80A3E624 14200004 */  bne     $at, $zero, .L80A3E638     
/* 000B8 80A3E628 2408000E */  addiu   $t0, $zero, 0x000E         ## $t0 = 0000000E
/* 000BC 80A3E62C A0C80693 */  sb      $t0, 0x0693($a2)           ## 00000693
/* 000C0 80A3E630 100000B1 */  beq     $zero, $zero, .L80A3E8F8   
/* 000C4 80A3E634 24023059 */  addiu   $v0, $zero, 0x3059         ## $v0 = 00003059
.L80A3E638:
/* 000C8 80A3E638 28410034 */  slti    $at, $v0, 0x0034           
/* 000CC 80A3E63C 14200003 */  bne     $at, $zero, .L80A3E64C     
/* 000D0 80A3E640 2409000B */  addiu   $t1, $zero, 0x000B         ## $t1 = 0000000B
/* 000D4 80A3E644 100000AC */  beq     $zero, $zero, .L80A3E8F8   
/* 000D8 80A3E648 24023058 */  addiu   $v0, $zero, 0x3058         ## $v0 = 00003058
.L80A3E64C:
/* 000DC 80A3E64C A0C90693 */  sb      $t1, 0x0693($a2)           ## 00000693
/* 000E0 80A3E650 100000A9 */  beq     $zero, $zero, .L80A3E8F8   
/* 000E4 80A3E654 24023053 */  addiu   $v0, $zero, 0x3053         ## $v0 = 00003053
glabel L80A3E658
/* 000E8 80A3E658 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 000EC 80A3E65C 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 000F0 80A3E660 3C028012 */  lui     $v0, %hi(gBitFlags+4)
/* 000F4 80A3E664 8C427124 */  lw      $v0, %lo(gBitFlags+4)($v0)
/* 000F8 80A3E668 8C6A00A4 */  lw      $t2, 0x00A4($v1)           ## 8015E704
/* 000FC 80A3E66C 3C0E8012 */  lui     $t6, %hi(gEquipShifts+2)
/* 00100 80A3E670 004A5824 */  and     $t3, $v0, $t2              
/* 00104 80A3E674 11600009 */  beq     $t3, $zero, .L80A3E69C     
/* 00108 80A3E678 00000000 */  nop
/* 0010C 80A3E67C 946C0F18 */  lhu     $t4, 0x0F18($v1)           ## 8015F578
/* 00110 80A3E680 318D8000 */  andi    $t5, $t4, 0x8000           ## $t5 = 00000000
/* 00114 80A3E684 11A00003 */  beq     $t5, $zero, .L80A3E694     
/* 00118 80A3E688 00000000 */  nop
/* 0011C 80A3E68C 1000009A */  beq     $zero, $zero, .L80A3E8F8   
/* 00120 80A3E690 24023042 */  addiu   $v0, $zero, 0x3042         ## $v0 = 00003042
.L80A3E694:
/* 00124 80A3E694 10000098 */  beq     $zero, $zero, .L80A3E8F8   
/* 00128 80A3E698 24023041 */  addiu   $v0, $zero, 0x3041         ## $v0 = 00003041
.L80A3E69C:
/* 0012C 80A3E69C 91CE71F2 */  lbu     $t6, %lo(gEquipShifts+2)($t6)
/* 00130 80A3E6A0 9478009C */  lhu     $t8, 0x009C($v1)           ## 8015E6FC
/* 00134 80A3E6A4 01C27804 */  sllv    $t7, $v0, $t6              
/* 00138 80A3E6A8 01F8C824 */  and     $t9, $t7, $t8              
/* 0013C 80A3E6AC 57200006 */  bnel    $t9, $zero, .L80A3E6C8     
/* 00140 80A3E6B0 94690F18 */  lhu     $t1, 0x0F18($v1)           ## 8015F578
/* 00144 80A3E6B4 94620F18 */  lhu     $v0, 0x0F18($v1)           ## 8015F578
/* 00148 80A3E6B8 30482000 */  andi    $t0, $v0, 0x2000           ## $t0 = 00002000
/* 0014C 80A3E6BC 11000009 */  beq     $t0, $zero, .L80A3E6E4     
/* 00150 80A3E6C0 304B0200 */  andi    $t3, $v0, 0x0200           ## $t3 = 00000000
/* 00154 80A3E6C4 94690F18 */  lhu     $t1, 0x0F18($v1)           ## 8015F578
.L80A3E6C8:
/* 00158 80A3E6C8 312A4000 */  andi    $t2, $t1, 0x4000           ## $t2 = 00000000
/* 0015C 80A3E6CC 11400003 */  beq     $t2, $zero, .L80A3E6DC     
/* 00160 80A3E6D0 00000000 */  nop
/* 00164 80A3E6D4 10000088 */  beq     $zero, $zero, .L80A3E8F8   
/* 00168 80A3E6D8 24023038 */  addiu   $v0, $zero, 0x3038         ## $v0 = 00003038
.L80A3E6DC:
/* 0016C 80A3E6DC 10000086 */  beq     $zero, $zero, .L80A3E8F8   
/* 00170 80A3E6E0 24023037 */  addiu   $v0, $zero, 0x3037         ## $v0 = 00003037
.L80A3E6E4:
/* 00174 80A3E6E4 11600007 */  beq     $t3, $zero, .L80A3E704     
/* 00178 80A3E6E8 304C0400 */  andi    $t4, $v0, 0x0400           ## $t4 = 00000000
/* 0017C 80A3E6EC 11800003 */  beq     $t4, $zero, .L80A3E6FC     
/* 00180 80A3E6F0 00000000 */  nop
/* 00184 80A3E6F4 10000080 */  beq     $zero, $zero, .L80A3E8F8   
/* 00188 80A3E6F8 24023033 */  addiu   $v0, $zero, 0x3033         ## $v0 = 00003033
.L80A3E6FC:
/* 0018C 80A3E6FC 1000007E */  beq     $zero, $zero, .L80A3E8F8   
/* 00190 80A3E700 24023032 */  addiu   $v0, $zero, 0x3032         ## $v0 = 00003032
.L80A3E704:
/* 00194 80A3E704 1000007C */  beq     $zero, $zero, .L80A3E8F8   
/* 00198 80A3E708 24023030 */  addiu   $v0, $zero, 0x3030         ## $v0 = 00003030
glabel L80A3E70C
/* 0019C 80A3E70C 0C00B2D0 */  jal     Flags_GetSwitch
              
/* 001A0 80A3E710 00032A03 */  sra     $a1, $v1,  8               
/* 001A4 80A3E714 10400003 */  beq     $v0, $zero, .L80A3E724     
/* 001A8 80A3E718 00000000 */  nop
/* 001AC 80A3E71C 10000076 */  beq     $zero, $zero, .L80A3E8F8   
/* 001B0 80A3E720 24023052 */  addiu   $v0, $zero, 0x3052         ## $v0 = 00003052
.L80A3E724:
/* 001B4 80A3E724 10000074 */  beq     $zero, $zero, .L80A3E8F8   
/* 001B8 80A3E728 24023051 */  addiu   $v0, $zero, 0x3051         ## $v0 = 00003051
glabel L80A3E72C
/* 001BC 80A3E72C 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 001C0 80A3E730 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 001C4 80A3E734 3C0D8012 */  lui     $t5, %hi(gBitFlags+0x4c)
/* 001C8 80A3E738 8DAD716C */  lw      $t5, %lo(gBitFlags+0x4c)($t5)
/* 001CC 80A3E73C 8C6E00A4 */  lw      $t6, 0x00A4($v1)           ## 8015E704
/* 001D0 80A3E740 01AE7824 */  and     $t7, $t5, $t6              
/* 001D4 80A3E744 51E00004 */  beql    $t7, $zero, .L80A3E758     
/* 001D8 80A3E748 94780ED8 */  lhu     $t8, 0x0ED8($v1)           ## 8015F538
/* 001DC 80A3E74C 1000006A */  beq     $zero, $zero, .L80A3E8F8   
/* 001E0 80A3E750 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 001E4 80A3E754 94780ED8 */  lhu     $t8, 0x0ED8($v1)           ## 8015F538
.L80A3E758:
/* 001E8 80A3E758 33190008 */  andi    $t9, $t8, 0x0008           ## $t9 = 00000000
/* 001EC 80A3E75C 53200004 */  beql    $t9, $zero, .L80A3E770     
/* 001F0 80A3E760 94680F14 */  lhu     $t0, 0x0F14($v1)           ## 8015F574
/* 001F4 80A3E764 10000064 */  beq     $zero, $zero, .L80A3E8F8   
/* 001F8 80A3E768 24023021 */  addiu   $v0, $zero, 0x3021         ## $v0 = 00003021
/* 001FC 80A3E76C 94680F14 */  lhu     $t0, 0x0F14($v1)           ## 8015F574
.L80A3E770:
/* 00200 80A3E770 31090001 */  andi    $t1, $t0, 0x0001           ## $t1 = 00000000
/* 00204 80A3E774 11200003 */  beq     $t1, $zero, .L80A3E784     
/* 00208 80A3E778 00000000 */  nop
/* 0020C 80A3E77C 1000005E */  beq     $zero, $zero, .L80A3E8F8   
/* 00210 80A3E780 2402302A */  addiu   $v0, $zero, 0x302A         ## $v0 = 0000302A
.L80A3E784:
/* 00214 80A3E784 1000005C */  beq     $zero, $zero, .L80A3E8F8   
/* 00218 80A3E788 24023008 */  addiu   $v0, $zero, 0x3008         ## $v0 = 00003008
glabel L80A3E78C
/* 0021C 80A3E78C 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00220 80A3E790 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 00224 80A3E794 3C0A8012 */  lui     $t2, %hi(gBitFlags+0x4c)
/* 00228 80A3E798 8D4A716C */  lw      $t2, %lo(gBitFlags+0x4c)($t2)
/* 0022C 80A3E79C 8C6B00A4 */  lw      $t3, 0x00A4($v1)           ## 8015E704
/* 00230 80A3E7A0 014B6024 */  and     $t4, $t2, $t3              
/* 00234 80A3E7A4 51800004 */  beql    $t4, $zero, .L80A3E7B8     
/* 00238 80A3E7A8 946D0ED8 */  lhu     $t5, 0x0ED8($v1)           ## 8015F538
/* 0023C 80A3E7AC 10000052 */  beq     $zero, $zero, .L80A3E8F8   
/* 00240 80A3E7B0 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 00244 80A3E7B4 946D0ED8 */  lhu     $t5, 0x0ED8($v1)           ## 8015F538
.L80A3E7B8:
/* 00248 80A3E7B8 31AE0008 */  andi    $t6, $t5, 0x0008           ## $t6 = 00000000
/* 0024C 80A3E7BC 11C00003 */  beq     $t6, $zero, .L80A3E7CC     
/* 00250 80A3E7C0 00000000 */  nop
/* 00254 80A3E7C4 1000004C */  beq     $zero, $zero, .L80A3E8F8   
/* 00258 80A3E7C8 24023026 */  addiu   $v0, $zero, 0x3026         ## $v0 = 00003026
.L80A3E7CC:
/* 0025C 80A3E7CC 1000004A */  beq     $zero, $zero, .L80A3E8F8   
/* 00260 80A3E7D0 24023009 */  addiu   $v0, $zero, 0x3009         ## $v0 = 00003009
glabel L80A3E7D4
/* 00264 80A3E7D4 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00268 80A3E7D8 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 0026C 80A3E7DC 3C0F8012 */  lui     $t7, %hi(gBitFlags+0x4c)
/* 00270 80A3E7E0 8DEF716C */  lw      $t7, %lo(gBitFlags+0x4c)($t7)
/* 00274 80A3E7E4 8C7800A4 */  lw      $t8, 0x00A4($v1)           ## 8015E704
/* 00278 80A3E7E8 01F8C824 */  and     $t9, $t7, $t8              
/* 0027C 80A3E7EC 53200004 */  beql    $t9, $zero, .L80A3E800     
/* 00280 80A3E7F0 94680ED8 */  lhu     $t0, 0x0ED8($v1)           ## 8015F538
/* 00284 80A3E7F4 10000040 */  beq     $zero, $zero, .L80A3E8F8   
/* 00288 80A3E7F8 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 0028C 80A3E7FC 94680ED8 */  lhu     $t0, 0x0ED8($v1)           ## 8015F538
.L80A3E800:
/* 00290 80A3E800 31090008 */  andi    $t1, $t0, 0x0008           ## $t1 = 00000000
/* 00294 80A3E804 11200003 */  beq     $t1, $zero, .L80A3E814     
/* 00298 80A3E808 00000000 */  nop
/* 0029C 80A3E80C 1000003A */  beq     $zero, $zero, .L80A3E8F8   
/* 002A0 80A3E810 24023026 */  addiu   $v0, $zero, 0x3026         ## $v0 = 00003026
.L80A3E814:
/* 002A4 80A3E814 10000038 */  beq     $zero, $zero, .L80A3E8F8   
/* 002A8 80A3E818 2402300A */  addiu   $v0, $zero, 0x300A         ## $v0 = 0000300A
glabel L80A3E81C
/* 002AC 80A3E81C 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 002B0 80A3E820 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 002B4 80A3E824 3C0A8012 */  lui     $t2, %hi(gBitFlags+0x4c)
/* 002B8 80A3E828 8D4A716C */  lw      $t2, %lo(gBitFlags+0x4c)($t2)
/* 002BC 80A3E82C 8C6B00A4 */  lw      $t3, 0x00A4($v1)           ## 8015E704
/* 002C0 80A3E830 014B6024 */  and     $t4, $t2, $t3              
/* 002C4 80A3E834 51800004 */  beql    $t4, $zero, .L80A3E848     
/* 002C8 80A3E838 946D0F16 */  lhu     $t5, 0x0F16($v1)           ## 8015F576
/* 002CC 80A3E83C 1000002E */  beq     $zero, $zero, .L80A3E8F8   
/* 002D0 80A3E840 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 002D4 80A3E844 946D0F16 */  lhu     $t5, 0x0F16($v1)           ## 8015F576
.L80A3E848:
/* 002D8 80A3E848 31AE0001 */  andi    $t6, $t5, 0x0001           ## $t6 = 00000000
/* 002DC 80A3E84C 11C00003 */  beq     $t6, $zero, .L80A3E85C     
/* 002E0 80A3E850 00000000 */  nop
/* 002E4 80A3E854 10000028 */  beq     $zero, $zero, .L80A3E8F8   
/* 002E8 80A3E858 24023015 */  addiu   $v0, $zero, 0x3015         ## $v0 = 00003015
.L80A3E85C:
/* 002EC 80A3E85C 10000026 */  beq     $zero, $zero, .L80A3E8F8   
/* 002F0 80A3E860 24023014 */  addiu   $v0, $zero, 0x3014         ## $v0 = 00003014
glabel L80A3E864
/* 002F4 80A3E864 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 002F8 80A3E868 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 002FC 80A3E86C 3C0F8012 */  lui     $t7, %hi(gBitFlags+0x4c)
/* 00300 80A3E870 8DEF716C */  lw      $t7, %lo(gBitFlags+0x4c)($t7)
/* 00304 80A3E874 8C7800A4 */  lw      $t8, 0x00A4($v1)           ## 8015E704
/* 00308 80A3E878 01F8C824 */  and     $t9, $t7, $t8              
/* 0030C 80A3E87C 53200004 */  beql    $t9, $zero, .L80A3E890     
/* 00310 80A3E880 94680F16 */  lhu     $t0, 0x0F16($v1)           ## 8015F576
/* 00314 80A3E884 1000001C */  beq     $zero, $zero, .L80A3E8F8   
/* 00318 80A3E888 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 0031C 80A3E88C 94680F16 */  lhu     $t0, 0x0F16($v1)           ## 8015F576
.L80A3E890:
/* 00320 80A3E890 31090010 */  andi    $t1, $t0, 0x0010           ## $t1 = 00000000
/* 00324 80A3E894 11200003 */  beq     $t1, $zero, .L80A3E8A4     
/* 00328 80A3E898 00000000 */  nop
/* 0032C 80A3E89C 10000016 */  beq     $zero, $zero, .L80A3E8F8   
/* 00330 80A3E8A0 24023017 */  addiu   $v0, $zero, 0x3017         ## $v0 = 00003017
.L80A3E8A4:
/* 00334 80A3E8A4 10000014 */  beq     $zero, $zero, .L80A3E8F8   
/* 00338 80A3E8A8 24023016 */  addiu   $v0, $zero, 0x3016         ## $v0 = 00003016
glabel L80A3E8AC
/* 0033C 80A3E8AC 3C038016 */  lui     $v1, %hi(gSaveContext)
/* 00340 80A3E8B0 2463E660 */  addiu   $v1, %lo(gSaveContext)
/* 00344 80A3E8B4 3C0A8012 */  lui     $t2, %hi(gBitFlags+0x4c)
/* 00348 80A3E8B8 8D4A716C */  lw      $t2, %lo(gBitFlags+0x4c)($t2)
/* 0034C 80A3E8BC 8C6B00A4 */  lw      $t3, 0x00A4($v1)           ## 8015E704
/* 00350 80A3E8C0 014B6024 */  and     $t4, $t2, $t3              
/* 00354 80A3E8C4 51800004 */  beql    $t4, $zero, .L80A3E8D8     
/* 00358 80A3E8C8 946D0F16 */  lhu     $t5, 0x0F16($v1)           ## 8015F576
/* 0035C 80A3E8CC 1000000A */  beq     $zero, $zero, .L80A3E8F8   
/* 00360 80A3E8D0 24023027 */  addiu   $v0, $zero, 0x3027         ## $v0 = 00003027
/* 00364 80A3E8D4 946D0F16 */  lhu     $t5, 0x0F16($v1)           ## 8015F576
.L80A3E8D8:
/* 00368 80A3E8D8 31AE0100 */  andi    $t6, $t5, 0x0100           ## $t6 = 00000000
/* 0036C 80A3E8DC 11C00003 */  beq     $t6, $zero, .L80A3E8EC     
/* 00370 80A3E8E0 00000000 */  nop
/* 00374 80A3E8E4 10000004 */  beq     $zero, $zero, .L80A3E8F8   
/* 00378 80A3E8E8 24023019 */  addiu   $v0, $zero, 0x3019         ## $v0 = 00003019
.L80A3E8EC:
/* 0037C 80A3E8EC 10000002 */  beq     $zero, $zero, .L80A3E8F8   
/* 00380 80A3E8F0 24023018 */  addiu   $v0, $zero, 0x3018         ## $v0 = 00003018
glabel L80A3E8F4
.L80A3E8F4:
/* 00384 80A3E8F4 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
.L80A3E8F8:
/* 00388 80A3E8F8 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 0038C 80A3E8FC 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00390 80A3E900 03E00008 */  jr      $ra                        
/* 00394 80A3E904 00000000 */  nop
