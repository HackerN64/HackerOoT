glabel func_8080FE2C
/* 0C0EC 8080FE2C 27BDFFF0 */  addiu   $sp, $sp, 0xFFF0           ## $sp = FFFFFFF0
/* 0C0F0 8080FE30 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 0C0F4 8080FE34 AFB1000C */  sw      $s1, 0x000C($sp)           
/* 0C0F8 8080FE38 AFB00008 */  sw      $s0, 0x0008($sp)           
/* 0C0FC 8080FE3C 34298000 */  ori     $t1, $at, 0x8000           ## $t1 = 00018000
/* 0C100 8080FE40 3C0B8013 */  lui     $t3, %hi(gSramSlotOffsets)
/* 0C104 8080FE44 256BA4E0 */  addiu   $t3, %lo(gSramSlotOffsets)
/* 0C108 8080FE48 00893021 */  addu    $a2, $a0, $t1              
/* 0C10C 8080FE4C 24100044 */  addiu   $s0, $zero, 0x0044         ## $s0 = 00000044
/* 0C110 8080FE50 24110041 */  addiu   $s1, $zero, 0x0041         ## $s1 = 00000041
/* 0C114 8080FE54 00001025 */  or      $v0, $zero, $zero          ## $v0 = 00000000
/* 0C118 8080FE58 240D004C */  addiu   $t5, $zero, 0x004C         ## $t5 = 0000004C
/* 0C11C 8080FE5C 240C0045 */  addiu   $t4, $zero, 0x0045         ## $t4 = 00000045
/* 0C120 8080FE60 240A005A */  addiu   $t2, $zero, 0x005A         ## $t2 = 0000005A
/* 0C124 8080FE64 84CE4A38 */  lh      $t6, 0x4A38($a2)           ## 00004A38
.L8080FE68:
/* 0C128 8080FE68 00021840 */  sll     $v1, $v0,  1               
/* 0C12C 8080FE6C 00837821 */  addu    $t7, $a0, $v1              
/* 0C130 8080FE70 104E0026 */  beq     $v0, $t6, .L8080FF0C       
/* 0C134 8080FE74 01E93821 */  addu    $a3, $t7, $t1              
/* 0C138 8080FE78 84F84A74 */  lh      $t8, 0x4A74($a3)           ## 00004A74
/* 0C13C 8080FE7C 3C010002 */  lui     $at, 0x0002                ## $at = 00020000
/* 0C140 8080FE80 00240821 */  addu    $at, $at, $a0              
/* 0C144 8080FE84 2719FFE7 */  addiu   $t9, $t8, 0xFFE7           ## $t9 = FFFFFFE7
/* 0C148 8080FE88 A4F94A74 */  sh      $t9, 0x4A74($a3)           ## 00004A74
/* 0C14C 8080FE8C 84E54A74 */  lh      $a1, 0x4A74($a3)           ## 00004A74
/* 0C150 8080FE90 01637021 */  addu    $t6, $t3, $v1              
/* 0C154 8080FE94 A425CA9A */  sh      $a1, -0x3566($at)          ## 0001CA9A
/* 0C158 8080FE98 A4C54A92 */  sh      $a1, 0x4A92($a2)           ## 00004A92
/* 0C15C 8080FE9C A4C54A94 */  sh      $a1, 0x4A94($a2)           ## 00004A94
/* 0C160 8080FEA0 8C9801E0 */  lw      $t8, 0x01E0($a0)           ## 000001E0
/* 0C164 8080FEA4 95CF0000 */  lhu     $t7, 0x0000($t6)           ## 00000000
/* 0C168 8080FEA8 01F84021 */  addu    $t0, $t7, $t8              
/* 0C16C 8080FEAC 9119001C */  lbu     $t9, 0x001C($t0)           ## 0000001C
/* 0C170 8080FEB0 51590011 */  beql    $t2, $t9, .L8080FEF8       
/* 0C174 8080FEB4 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
/* 0C178 8080FEB8 910E001D */  lbu     $t6, 0x001D($t0)           ## 0000001D
/* 0C17C 8080FEBC 518E000E */  beql    $t4, $t6, .L8080FEF8       
/* 0C180 8080FEC0 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
/* 0C184 8080FEC4 910F001E */  lbu     $t7, 0x001E($t0)           ## 0000001E
/* 0C188 8080FEC8 51AF000B */  beql    $t5, $t7, .L8080FEF8       
/* 0C18C 8080FECC 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
/* 0C190 8080FED0 9118001F */  lbu     $t8, 0x001F($t0)           ## 0000001F
/* 0C194 8080FED4 52180008 */  beql    $s0, $t8, .L8080FEF8       
/* 0C198 8080FED8 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
/* 0C19C 8080FEDC 91190020 */  lbu     $t9, 0x0020($t0)           ## 00000020
/* 0C1A0 8080FEE0 52390005 */  beql    $s1, $t9, .L8080FEF8       
/* 0C1A4 8080FEE4 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
/* 0C1A8 8080FEE8 910E0021 */  lbu     $t6, 0x0021($t0)           ## 00000021
/* 0C1AC 8080FEEC 554E0008 */  bnel    $t2, $t6, .L8080FF10       
/* 0C1B0 8080FEF0 24420001 */  addiu   $v0, $v0, 0x0001           ## $v0 = 00000001
/* 0C1B4 8080FEF4 84E34A74 */  lh      $v1, 0x4A74($a3)           ## 00004A74
.L8080FEF8:
/* 0C1B8 8080FEF8 84EF4A86 */  lh      $t7, 0x4A86($a3)           ## 00004A86
/* 0C1BC 8080FEFC A4E34A7A */  sh      $v1, 0x4A7A($a3)           ## 00004A7A
/* 0C1C0 8080FF00 25F8FFE1 */  addiu   $t8, $t7, 0xFFE1           ## $t8 = FFFFFFE1
/* 0C1C4 8080FF04 A4F84A86 */  sh      $t8, 0x4A86($a3)           ## 00004A86
/* 0C1C8 8080FF08 A4E34A80 */  sh      $v1, 0x4A80($a3)           ## 00004A80
.L8080FF0C:
/* 0C1CC 8080FF0C 24420001 */  addiu   $v0, $v0, 0x0001           ## $v0 = 00000002
.L8080FF10:
/* 0C1D0 8080FF10 00021400 */  sll     $v0, $v0, 16               
/* 0C1D4 8080FF14 00021403 */  sra     $v0, $v0, 16               
/* 0C1D8 8080FF18 28410003 */  slti    $at, $v0, 0x0003           
/* 0C1DC 8080FF1C 5420FFD2 */  bnel    $at, $zero, .L8080FE68     
/* 0C1E0 8080FF20 84CE4A38 */  lh      $t6, 0x4A38($a2)           ## 00004A38
/* 0C1E4 8080FF24 84D94A6E */  lh      $t9, 0x4A6E($a2)           ## 00004A6E
/* 0C1E8 8080FF28 84CF4A70 */  lh      $t7, 0x4A70($a2)           ## 00004A70
/* 0C1EC 8080FF2C 3C010002 */  lui     $at, 0x0002                ## $at = 00020000
/* 0C1F0 8080FF30 272EFFE1 */  addiu   $t6, $t9, 0xFFE1           ## $t6 = FFFFFFC8
/* 0C1F4 8080FF34 84D94A50 */  lh      $t9, 0x4A50($a2)           ## 00004A50
/* 0C1F8 8080FF38 A4CE4A6E */  sh      $t6, 0x4A6E($a2)           ## 00004A6E
/* 0C1FC 8080FF3C 25F8001F */  addiu   $t8, $t7, 0x001F           ## $t8 = 0000001F
/* 0C200 8080FF40 A4D84A70 */  sh      $t8, 0x4A70($a2)           ## 00004A70
/* 0C204 8080FF44 00240821 */  addu    $at, $at, $a0              
/* 0C208 8080FF48 272EFFFF */  addiu   $t6, $t9, 0xFFFF           ## $t6 = FFFFFFE6
/* 0C20C 8080FF4C A42ECA50 */  sh      $t6, -0x35B0($at)          ## 0001CA50
/* 0C210 8080FF50 84CF4A50 */  lh      $t7, 0x4A50($a2)           ## 00004A50
/* 0C214 8080FF54 3C010002 */  lui     $at, 0x0002                ## $at = 00020000
/* 0C218 8080FF58 00240821 */  addu    $at, $at, $a0              
/* 0C21C 8080FF5C 15E0000A */  bne     $t7, $zero, .L8080FF88     
/* 0C220 8080FF60 24180008 */  addiu   $t8, $zero, 0x0008         ## $t8 = 00000008
/* 0C224 8080FF64 A438CA50 */  sh      $t8, -0x35B0($at)          ## 0001CA50
/* 0C228 8080FF68 84D94A44 */  lh      $t9, 0x4A44($a2)           ## 00004A44
/* 0C22C 8080FF6C 3C010002 */  lui     $at, 0x0002                ## $at = 00020000
/* 0C230 8080FF70 00240821 */  addu    $at, $at, $a0              
/* 0C234 8080FF74 272E0001 */  addiu   $t6, $t9, 0x0001           ## $t6 = FFFFFFE8
/* 0C238 8080FF78 A42ECA44 */  sh      $t6, -0x35BC($at)          ## 0001CA44
/* 0C23C 8080FF7C 3C010002 */  lui     $at, 0x0002                ## $at = 00020000
/* 0C240 8080FF80 00240821 */  addu    $at, $at, $a0              
/* 0C244 8080FF84 A420CA3A */  sh      $zero, -0x35C6($at)        ## 0001CA3A
.L8080FF88:
/* 0C248 8080FF88 8FB00008 */  lw      $s0, 0x0008($sp)           
/* 0C24C 8080FF8C 8FB1000C */  lw      $s1, 0x000C($sp)           
/* 0C250 8080FF90 03E00008 */  jr      $ra                        
/* 0C254 8080FF94 27BD0010 */  addiu   $sp, $sp, 0x0010           ## $sp = 00000000
