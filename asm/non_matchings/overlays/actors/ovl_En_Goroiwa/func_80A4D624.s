.rdata
glabel D_80A4E044
    .asciz "\x1b[36m"
    .balign 4

glabel D_80A4E04C
    .asciz "Player ぶっ飛ばし\n"
    .balign 4

glabel D_80A4E060
    .asciz "\x1b[m"
    .balign 4

.text
glabel func_80A4D624
/* 01984 80A4D624 27BDFFD0 */  addiu   $sp, $sp, 0xFFD0           ## $sp = FFFFFFD0
/* 01988 80A4D628 AFBF0024 */  sw      $ra, 0x0024($sp)           
/* 0198C 80A4D62C AFB00020 */  sw      $s0, 0x0020($sp)           
/* 01990 80A4D630 AFA50034 */  sw      $a1, 0x0034($sp)           
/* 01994 80A4D634 90820160 */  lbu     $v0, 0x0160($a0)           ## 00000160
/* 01998 80A4D638 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 0199C 80A4D63C 2401FFFB */  addiu   $at, $zero, 0xFFFB         ## $at = FFFFFFFB
/* 019A0 80A4D640 304E0002 */  andi    $t6, $v0, 0x0002           ## $t6 = 00000000
/* 019A4 80A4D644 11C00047 */  beq     $t6, $zero, .L80A4D764     
/* 019A8 80A4D648 304FFFFD */  andi    $t7, $v0, 0xFFFD           ## $t7 = 00000000
/* 019AC 80A4D64C 8488008A */  lh      $t0, 0x008A($a0)           ## 0000008A
/* 019B0 80A4D650 84890032 */  lh      $t1, 0x0032($a0)           ## 00000032
/* 019B4 80A4D654 909801D3 */  lbu     $t8, 0x01D3($a0)           ## 000001D3
/* 019B8 80A4D658 A08F0160 */  sb      $t7, 0x0160($a0)           ## 00000160
/* 019BC 80A4D65C 01091823 */  subu    $v1, $t0, $t1              
/* 019C0 80A4D660 00031C00 */  sll     $v1, $v1, 16               
/* 019C4 80A4D664 00031C03 */  sra     $v1, $v1, 16               
/* 019C8 80A4D668 0301C824 */  and     $t9, $t8, $at              
/* 019CC 80A4D66C 2861C001 */  slti    $at, $v1, 0xC001           
/* 019D0 80A4D670 14200015 */  bne     $at, $zero, .L80A4D6C8     
/* 019D4 80A4D674 A09901D3 */  sb      $t9, 0x01D3($a0)           ## 000001D3
/* 019D8 80A4D678 28614000 */  slti    $at, $v1, 0x4000           
/* 019DC 80A4D67C 50200013 */  beql    $at, $zero, .L80A4D6CC     
/* 019E0 80A4D680 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
/* 019E4 80A4D684 848C001C */  lh      $t4, 0x001C($a0)           ## 0000001C
/* 019E8 80A4D688 372B0004 */  ori     $t3, $t9, 0x0004           ## $t3 = 00000004
/* 019EC 80A4D68C A08B01D3 */  sb      $t3, 0x01D3($a0)           ## 000001D3
/* 019F0 80A4D690 000C6A83 */  sra     $t5, $t4, 10               
/* 019F4 80A4D694 31AE0001 */  andi    $t6, $t5, 0x0001           ## $t6 = 00000000
/* 019F8 80A4D698 15C00006 */  bne     $t6, $zero, .L80A4D6B4     
/* 019FC 80A4D69C 00000000 */  nop
/* 01A00 80A4D6A0 848F0018 */  lh      $t7, 0x0018($a0)           ## 00000018
/* 01A04 80A4D6A4 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01A08 80A4D6A8 31F80001 */  andi    $t8, $t7, 0x0001           ## $t8 = 00000000
/* 01A0C 80A4D6AC 53010007 */  beql    $t8, $at, .L80A4D6CC       
/* 01A10 80A4D6B0 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
.L80A4D6B4:
/* 01A14 80A4D6B4 0C293059 */  jal     func_80A4C164              
/* 01A18 80A4D6B8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01A1C 80A4D6BC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01A20 80A4D6C0 0C292F95 */  jal     func_80A4BE54              
/* 01A24 80A4D6C4 8FA50034 */  lw      $a1, 0x0034($sp)           
.L80A4D6C8:
/* 01A28 80A4D6C8 44802000 */  mtc1    $zero, $f4                 ## $f4 = 0.00
.L80A4D6CC:
/* 01A2C 80A4D6CC 8607008A */  lh      $a3, 0x008A($s0)           ## 0000008A
/* 01A30 80A4D6D0 AFA00014 */  sw      $zero, 0x0014($sp)         
/* 01A34 80A4D6D4 8FA40034 */  lw      $a0, 0x0034($sp)           
/* 01A38 80A4D6D8 02002825 */  or      $a1, $s0, $zero            ## $a1 = 00000000
/* 01A3C 80A4D6DC 3C064000 */  lui     $a2, 0x4000                ## $a2 = 40000000
/* 01A40 80A4D6E0 0C00BDB5 */  jal     func_8002F6D4              
/* 01A44 80A4D6E4 E7A40010 */  swc1    $f4, 0x0010($sp)           
/* 01A48 80A4D6E8 3C0480A5 */  lui     $a0, %hi(D_80A4E044)       ## $a0 = 80A50000
/* 01A4C 80A4D6EC 0C00084C */  jal     osSyncPrintf
              
/* 01A50 80A4D6F0 2484E044 */  addiu   $a0, $a0, %lo(D_80A4E044)  ## $a0 = 80A4E044
/* 01A54 80A4D6F4 3C0480A5 */  lui     $a0, %hi(D_80A4E04C)       ## $a0 = 80A50000
/* 01A58 80A4D6F8 0C00084C */  jal     osSyncPrintf
              
/* 01A5C 80A4D6FC 2484E04C */  addiu   $a0, $a0, %lo(D_80A4E04C)  ## $a0 = 80A4E04C
/* 01A60 80A4D700 3C0480A5 */  lui     $a0, %hi(D_80A4E060)       ## $a0 = 80A50000
/* 01A64 80A4D704 0C00084C */  jal     osSyncPrintf
              
/* 01A68 80A4D708 2484E060 */  addiu   $a0, $a0, %lo(D_80A4E060)  ## $a0 = 80A4E060
/* 01A6C 80A4D70C 8619001C */  lh      $t9, 0x001C($s0)           ## 0000001C
/* 01A70 80A4D710 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01A74 80A4D714 00194283 */  sra     $t0, $t9, 10               
/* 01A78 80A4D718 31090001 */  andi    $t1, $t0, 0x0001           ## $t1 = 00000000
/* 01A7C 80A4D71C 00095080 */  sll     $t2, $t1,  2               
/* 01A80 80A4D720 3C1980A5 */  lui     $t9, %hi(D_80A4DF20)       ## $t9 = 80A50000
/* 01A84 80A4D724 032AC821 */  addu    $t9, $t9, $t2              
/* 01A88 80A4D728 8F39DF20 */  lw      $t9, %lo(D_80A4DF20)($t9)  
/* 01A8C 80A4D72C 0320F809 */  jalr    $ra, $t9                   
/* 01A90 80A4D730 00000000 */  nop
/* 01A94 80A4D734 8FAB0034 */  lw      $t3, 0x0034($sp)           
/* 01A98 80A4D738 2405083E */  addiu   $a1, $zero, 0x083E         ## $a1 = 0000083E
/* 01A9C 80A4D73C 0C00BDF7 */  jal     func_8002F7DC              
/* 01AA0 80A4D740 8D641C44 */  lw      $a0, 0x1C44($t3)           ## 00001C44
/* 01AA4 80A4D744 860C0018 */  lh      $t4, 0x0018($s0)           ## 00000018
/* 01AA8 80A4D748 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01AAC 80A4D74C 240E0032 */  addiu   $t6, $zero, 0x0032         ## $t6 = 00000032
/* 01AB0 80A4D750 318D0001 */  andi    $t5, $t4, 0x0001           ## $t5 = 00000000
/* 01AB4 80A4D754 55A10056 */  bnel    $t5, $at, .L80A4D8B0       
/* 01AB8 80A4D758 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01ABC 80A4D75C 10000053 */  beq     $zero, $zero, .L80A4D8AC   
/* 01AC0 80A4D760 A60E01C8 */  sh      $t6, 0x01C8($s0)           ## 000001C8
.L80A4D764:
/* 01AC4 80A4D764 860F001C */  lh      $t7, 0x001C($s0)           ## 0000001C
/* 01AC8 80A4D768 3C1980A5 */  lui     $t9, %hi(D_80A4DF18)       ## $t9 = 80A50000
/* 01ACC 80A4D76C 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01AD0 80A4D770 000FC283 */  sra     $t8, $t7, 10               
/* 01AD4 80A4D774 33080001 */  andi    $t0, $t8, 0x0001           ## $t0 = 00000000
/* 01AD8 80A4D778 00084880 */  sll     $t1, $t0,  2               
/* 01ADC 80A4D77C 0329C821 */  addu    $t9, $t9, $t1              
/* 01AE0 80A4D780 8F39DF18 */  lw      $t9, %lo(D_80A4DF18)($t9)  
/* 01AE4 80A4D784 8FA50034 */  lw      $a1, 0x0034($sp)           
/* 01AE8 80A4D788 0320F809 */  jalr    $ra, $t9                   
/* 01AEC 80A4D78C 00000000 */  nop
/* 01AF0 80A4D790 50400047 */  beql    $v0, $zero, .L80A4D8B0     
/* 01AF4 80A4D794 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01AF8 80A4D798 8603001C */  lh      $v1, 0x001C($s0)           ## 0000001C
/* 01AFC 80A4D79C 24010001 */  addiu   $at, $zero, 0x0001         ## $at = 00000001
/* 01B00 80A4D7A0 00031A03 */  sra     $v1, $v1,  8               
/* 01B04 80A4D7A4 30630003 */  andi    $v1, $v1, 0x0003           ## $v1 = 00000000
/* 01B08 80A4D7A8 00031C00 */  sll     $v1, $v1, 16               
/* 01B0C 80A4D7AC 00031C03 */  sra     $v1, $v1, 16               
/* 01B10 80A4D7B0 5461000D */  bnel    $v1, $at, .L80A4D7E8       
/* 01B14 80A4D7B4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B18 80A4D7B8 860201CE */  lh      $v0, 0x01CE($s0)           ## 000001CE
/* 01B1C 80A4D7BC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B20 80A4D7C0 8FA50034 */  lw      $a1, 0x0034($sp)           
/* 01B24 80A4D7C4 10400004 */  beq     $v0, $zero, .L80A4D7D8     
/* 01B28 80A4D7C8 00000000 */  nop
/* 01B2C 80A4D7CC 860A01CA */  lh      $t2, 0x01CA($s0)           ## 000001CA
/* 01B30 80A4D7D0 55420005 */  bnel    $t2, $v0, .L80A4D7E8       
/* 01B34 80A4D7D4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D7D8:
/* 01B38 80A4D7D8 0C29343F */  jal     func_80A4D0FC              
/* 01B3C 80A4D7DC A7A30028 */  sh      $v1, 0x0028($sp)           
/* 01B40 80A4D7E0 87A30028 */  lh      $v1, 0x0028($sp)           
/* 01B44 80A4D7E4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D7E8:
/* 01B48 80A4D7E8 8FA50034 */  lw      $a1, 0x0034($sp)           
/* 01B4C 80A4D7EC 0C29341D */  jal     func_80A4D074              
/* 01B50 80A4D7F0 A7A30028 */  sh      $v1, 0x0028($sp)           
/* 01B54 80A4D7F4 87A30028 */  lh      $v1, 0x0028($sp)           
/* 01B58 80A4D7F8 24010003 */  addiu   $at, $zero, 0x0003         ## $at = 00000003
/* 01B5C 80A4D7FC 5461000C */  bnel    $v1, $at, .L80A4D830       
/* 01B60 80A4D800 860C001C */  lh      $t4, 0x001C($s0)           ## 0000001C
/* 01B64 80A4D804 860201CC */  lh      $v0, 0x01CC($s0)           ## 000001CC
/* 01B68 80A4D808 10400004 */  beq     $v0, $zero, .L80A4D81C     
/* 01B6C 80A4D80C 00000000 */  nop
/* 01B70 80A4D810 860B01CA */  lh      $t3, 0x01CA($s0)           ## 000001CA
/* 01B74 80A4D814 55620006 */  bnel    $t3, $v0, .L80A4D830       
/* 01B78 80A4D818 860C001C */  lh      $t4, 0x001C($s0)           ## 0000001C
.L80A4D81C:
/* 01B7C 80A4D81C 0C293677 */  jal     func_80A4D9DC              
/* 01B80 80A4D820 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B84 80A4D824 10000022 */  beq     $zero, $zero, .L80A4D8B0   
/* 01B88 80A4D828 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01B8C 80A4D82C 860C001C */  lh      $t4, 0x001C($s0)           ## 0000001C
.L80A4D830:
/* 01B90 80A4D830 000C6A83 */  sra     $t5, $t4, 10               
/* 01B94 80A4D834 31AE0001 */  andi    $t6, $t5, 0x0001           ## $t6 = 00000000
/* 01B98 80A4D838 15C0001A */  bne     $t6, $zero, .L80A4D8A4     
/* 01B9C 80A4D83C 00000000 */  nop
/* 01BA0 80A4D840 860201CC */  lh      $v0, 0x01CC($s0)           ## 000001CC
/* 01BA4 80A4D844 10400017 */  beq     $v0, $zero, .L80A4D8A4     
/* 01BA8 80A4D848 00000000 */  nop
/* 01BAC 80A4D84C 860F01CA */  lh      $t7, 0x01CA($s0)           ## 000001CA
/* 01BB0 80A4D850 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BB4 80A4D854 11E20013 */  beq     $t7, $v0, .L80A4D8A4       
/* 01BB8 80A4D858 00000000 */  nop
/* 01BBC 80A4D85C 0C29309F */  jal     func_80A4C27C              
/* 01BC0 80A4D860 8FA50034 */  lw      $a1, 0x0034($sp)           
/* 01BC4 80A4D864 18400005 */  blez    $v0, .L80A4D87C            
/* 01BC8 80A4D868 00000000 */  nop
/* 01BCC 80A4D86C 0C29369F */  jal     func_80A4DA7C              
/* 01BD0 80A4D870 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BD4 80A4D874 1000000E */  beq     $zero, $zero, .L80A4D8B0   
/* 01BD8 80A4D878 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D87C:
/* 01BDC 80A4D87C 04410005 */  bgez    $v0, .L80A4D894            
/* 01BE0 80A4D880 00000000 */  nop
/* 01BE4 80A4D884 0C2936E4 */  jal     func_80A4DB90              
/* 01BE8 80A4D888 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BEC 80A4D88C 10000008 */  beq     $zero, $zero, .L80A4D8B0   
/* 01BF0 80A4D890 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D894:
/* 01BF4 80A4D894 0C293578 */  jal     func_80A4D5E0              
/* 01BF8 80A4D898 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 01BFC 80A4D89C 10000004 */  beq     $zero, $zero, .L80A4D8B0   
/* 01C00 80A4D8A0 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D8A4:
/* 01C04 80A4D8A4 0C293578 */  jal     func_80A4D5E0              
/* 01C08 80A4D8A8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D8AC:
/* 01C0C 80A4D8AC 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80A4D8B0:
/* 01C10 80A4D8B0 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 01C14 80A4D8B4 240520B8 */  addiu   $a1, $zero, 0x20B8         ## $a1 = 000020B8
/* 01C18 80A4D8B8 8FBF0024 */  lw      $ra, 0x0024($sp)           
/* 01C1C 80A4D8BC 8FB00020 */  lw      $s0, 0x0020($sp)           
/* 01C20 80A4D8C0 27BD0030 */  addiu   $sp, $sp, 0x0030           ## $sp = 00000000
/* 01C24 80A4D8C4 03E00008 */  jr      $ra                        
/* 01C28 80A4D8C8 00000000 */  nop
