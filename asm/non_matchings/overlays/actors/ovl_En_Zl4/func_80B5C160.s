.late_rodata
glabel jtbl_80B5FBBC
.word L80B5C19C
.word L80B5C200
.word L80B5C254
.word L80B5C2F0
.word L80B5C330
.word L80B5C384
.word L80B5C3C4

.text
glabel func_80B5C160
/* 009B0 80B5C160 27BDFFE0 */  addiu   $sp, $sp, 0xFFE0           ## $sp = FFFFFFE0
/* 009B4 80B5C164 AFBF001C */  sw      $ra, 0x001C($sp)           
/* 009B8 80B5C168 AFB10018 */  sw      $s1, 0x0018($sp)           
/* 009BC 80B5C16C AFB00014 */  sw      $s0, 0x0014($sp)           
/* 009C0 80B5C170 90820208 */  lbu     $v0, 0x0208($a0)           ## 00000208
/* 009C4 80B5C174 00808025 */  or      $s0, $a0, $zero            ## $s0 = 00000000
/* 009C8 80B5C178 00A08825 */  or      $s1, $a1, $zero            ## $s1 = 00000000
/* 009CC 80B5C17C 2C410007 */  sltiu   $at, $v0, 0x0007           
/* 009D0 80B5C180 102000AA */  beq     $at, $zero, .L80B5C42C     
/* 009D4 80B5C184 00027080 */  sll     $t6, $v0,  2               
/* 009D8 80B5C188 3C0180B6 */  lui     $at, %hi(jtbl_80B5FBBC)       ## $at = 80B60000
/* 009DC 80B5C18C 002E0821 */  addu    $at, $at, $t6              
/* 009E0 80B5C190 8C2EFBBC */  lw      $t6, %lo(jtbl_80B5FBBC)($at)  
/* 009E4 80B5C194 01C00008 */  jr      $t6                        
/* 009E8 80B5C198 00000000 */  nop
glabel L80B5C19C
/* 009EC 80B5C19C 3C014248 */  lui     $at, 0x4248                ## $at = 42480000
/* 009F0 80B5C1A0 44812000 */  mtc1    $at, $f4                   ## $f4 = 50.00
/* 009F4 80B5C1A4 C6060164 */  lwc1    $f6, 0x0164($s0)           ## 00000164
/* 009F8 80B5C1A8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 009FC 80B5C1AC 46062032 */  c.eq.s  $f4, $f6                   
/* 00A00 80B5C1B0 00000000 */  nop
/* 00A04 80B5C1B4 45020004 */  bc1fl   .L80B5C1C8                 
/* 00A08 80B5C1B8 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
/* 00A0C 80B5C1BC 0C00BE0A */  jal     Audio_PlayActorSound2
              
/* 00A10 80B5C1C0 2405686A */  addiu   $a1, $zero, 0x686A         ## $a1 = 0000686A
/* 00A14 80B5C1C4 02002025 */  or      $a0, $s0, $zero            ## $a0 = 00000000
.L80B5C1C8:
/* 00A18 80B5C1C8 0C2D6FE4 */  jal     func_80B5BF90              
/* 00A1C 80B5C1CC 24050004 */  addiu   $a1, $zero, 0x0004         ## $a1 = 00000004
/* 00A20 80B5C1D0 14400003 */  bne     $v0, $zero, .L80B5C1E0     
/* 00A24 80B5C1D4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A28 80B5C1D8 10000094 */  beq     $zero, $zero, .L80B5C42C   
/* 00A2C 80B5C1DC 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
.L80B5C1E0:
/* 00A30 80B5C1E0 2405702E */  addiu   $a1, $zero, 0x702E         ## $a1 = 0000702E
/* 00A34 80B5C1E4 0C042DA0 */  jal     func_8010B680              
/* 00A38 80B5C1E8 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00A3C 80B5C1EC 920F0208 */  lbu     $t7, 0x0208($s0)           ## 00000208
/* 00A40 80B5C1F0 25F80001 */  addiu   $t8, $t7, 0x0001           ## $t8 = 00000001
/* 00A44 80B5C1F4 A2180208 */  sb      $t8, 0x0208($s0)           ## 00000208
/* 00A48 80B5C1F8 1000008C */  beq     $zero, $zero, .L80B5C42C   
/* 00A4C 80B5C1FC 330200FF */  andi    $v0, $t8, 0x00FF           ## $v0 = 00000001
glabel L80B5C200
/* 00A50 80B5C200 0C042F6F */  jal     func_8010BDBC              
/* 00A54 80B5C204 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 00A58 80B5C208 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00A5C 80B5C20C 1441000F */  bne     $v0, $at, .L80B5C24C       
/* 00A60 80B5C210 00000000 */  nop
/* 00A64 80B5C214 0C041AF2 */  jal     func_80106BC8              
/* 00A68 80B5C218 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A6C 80B5C21C 1040000B */  beq     $v0, $zero, .L80B5C24C     
/* 00A70 80B5C220 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A74 80B5C224 0C2D6DEC */  jal     func_80B5B7B0              
/* 00A78 80B5C228 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00A7C 80B5C22C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00A80 80B5C230 2405702F */  addiu   $a1, $zero, 0x702F         ## $a1 = 0000702F
/* 00A84 80B5C234 0C042DA0 */  jal     func_8010B680              
/* 00A88 80B5C238 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00A8C 80B5C23C 92190208 */  lbu     $t9, 0x0208($s0)           ## 00000208
/* 00A90 80B5C240 A6000214 */  sh      $zero, 0x0214($s0)         ## 00000214
/* 00A94 80B5C244 27280001 */  addiu   $t0, $t9, 0x0001           ## $t0 = 00000001
/* 00A98 80B5C248 A2080208 */  sb      $t0, 0x0208($s0)           ## 00000208
.L80B5C24C:
/* 00A9C 80B5C24C 10000077 */  beq     $zero, $zero, .L80B5C42C   
/* 00AA0 80B5C250 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
glabel L80B5C254
/* 00AA4 80B5C254 0C042F6F */  jal     func_8010BDBC              
/* 00AA8 80B5C258 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 00AAC 80B5C25C 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00AB0 80B5C260 14410021 */  bne     $v0, $at, .L80B5C2E8       
/* 00AB4 80B5C264 00000000 */  nop
/* 00AB8 80B5C268 0C041AF2 */  jal     func_80106BC8              
/* 00ABC 80B5C26C 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00AC0 80B5C270 1040001D */  beq     $v0, $zero, .L80B5C2E8     
/* 00AC4 80B5C274 3C0C8016 */  lui     $t4, %hi(gSegments)
/* 00AC8 80B5C278 3C020200 */  lui     $v0, %hi(D_02003994)                ## $v0 = 02000000
/* 00ACC 80B5C27C 24423994 */  addiu   $v0, $v0, %lo(D_02003994)           ## $v0 = 02003994
/* 00AD0 80B5C280 00024900 */  sll     $t1, $v0,  4               
/* 00AD4 80B5C284 00095702 */  srl     $t2, $t1, 28               
/* 00AD8 80B5C288 000A5880 */  sll     $t3, $t2,  2               
/* 00ADC 80B5C28C 018B6021 */  addu    $t4, $t4, $t3              
/* 00AE0 80B5C290 3C0100FF */  lui     $at, 0x00FF                ## $at = 00FF0000
/* 00AE4 80B5C294 8D8C6FA8 */  lw      $t4, %lo(gSegments)($t4)
/* 00AE8 80B5C298 3421FFFF */  ori     $at, $at, 0xFFFF           ## $at = 00FFFFFF
/* 00AEC 80B5C29C 00416824 */  and     $t5, $v0, $at              
/* 00AF0 80B5C2A0 3C018000 */  lui     $at, 0x8000                ## $at = 80000000
/* 00AF4 80B5C2A4 018D7021 */  addu    $t6, $t4, $t5              
/* 00AF8 80B5C2A8 01C17821 */  addu    $t7, $t6, $at              
/* 00AFC 80B5C2AC AE2F1D68 */  sw      $t7, 0x1D68($s1)           ## 00001D68
/* 00B00 80B5C2B0 3C018016 */  lui     $at, %hi(gSaveContext+0x1414)
/* 00B04 80B5C2B4 24180001 */  addiu   $t8, $zero, 0x0001         ## $t8 = 00000001
/* 00B08 80B5C2B8 A038FA74 */  sb      $t8, %lo(gSaveContext+0x1414)($at)
/* 00B0C 80B5C2BC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B10 80B5C2C0 0C2D6E22 */  jal     func_80B5B888              
/* 00B14 80B5C2C4 00002825 */  or      $a1, $zero, $zero          ## $a1 = 00000000
/* 00B18 80B5C2C8 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00B1C 80B5C2CC 00310821 */  addu    $at, $at, $s1              
/* 00B20 80B5C2D0 24190037 */  addiu   $t9, $zero, 0x0037         ## $t9 = 00000037
/* 00B24 80B5C2D4 A03903DC */  sb      $t9, 0x03DC($at)           ## 000103DC
/* 00B28 80B5C2D8 92080208 */  lbu     $t0, 0x0208($s0)           ## 00000208
/* 00B2C 80B5C2DC A6000214 */  sh      $zero, 0x0214($s0)         ## 00000214
/* 00B30 80B5C2E0 25090001 */  addiu   $t1, $t0, 0x0001           ## $t1 = 00000001
/* 00B34 80B5C2E4 A2090208 */  sb      $t1, 0x0208($s0)           ## 00000208
.L80B5C2E8:
/* 00B38 80B5C2E8 10000050 */  beq     $zero, $zero, .L80B5C42C   
/* 00B3C 80B5C2EC 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
glabel L80B5C2F0
/* 00B40 80B5C2F0 860A0214 */  lh      $t2, 0x0214($s0)           ## 00000214
/* 00B44 80B5C2F4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B48 80B5C2F8 240570F9 */  addiu   $a1, $zero, 0x70F9         ## $a1 = 000070F9
/* 00B4C 80B5C2FC 254B0001 */  addiu   $t3, $t2, 0x0001           ## $t3 = 00000001
/* 00B50 80B5C300 A60B0214 */  sh      $t3, 0x0214($s0)           ## 00000214
/* 00B54 80B5C304 860C0214 */  lh      $t4, 0x0214($s0)           ## 00000214
/* 00B58 80B5C308 2981002D */  slti    $at, $t4, 0x002D           
/* 00B5C 80B5C30C 14200006 */  bne     $at, $zero, .L80B5C328     
/* 00B60 80B5C310 00000000 */  nop
/* 00B64 80B5C314 0C042DA0 */  jal     func_8010B680              
/* 00B68 80B5C318 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00B6C 80B5C31C 920D0208 */  lbu     $t5, 0x0208($s0)           ## 00000208
/* 00B70 80B5C320 25AE0001 */  addiu   $t6, $t5, 0x0001           ## $t6 = 00000001
/* 00B74 80B5C324 A20E0208 */  sb      $t6, 0x0208($s0)           ## 00000208
.L80B5C328:
/* 00B78 80B5C328 10000040 */  beq     $zero, $zero, .L80B5C42C   
/* 00B7C 80B5C32C 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
glabel L80B5C330
/* 00B80 80B5C330 0C042F6F */  jal     func_8010BDBC              
/* 00B84 80B5C334 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 00B88 80B5C338 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00B8C 80B5C33C 1441000F */  bne     $v0, $at, .L80B5C37C       
/* 00B90 80B5C340 00000000 */  nop
/* 00B94 80B5C344 0C041AF2 */  jal     func_80106BC8              
/* 00B98 80B5C348 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00B9C 80B5C34C 1040000B */  beq     $v0, $zero, .L80B5C37C     
/* 00BA0 80B5C350 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BA4 80B5C354 0C2D6E22 */  jal     func_80B5B888              
/* 00BA8 80B5C358 24050001 */  addiu   $a1, $zero, 0x0001         ## $a1 = 00000001
/* 00BAC 80B5C35C 3C010001 */  lui     $at, 0x0001                ## $at = 00010000
/* 00BB0 80B5C360 00310821 */  addu    $at, $at, $s1              
/* 00BB4 80B5C364 240F0037 */  addiu   $t7, $zero, 0x0037         ## $t7 = 00000037
/* 00BB8 80B5C368 A02F03DC */  sb      $t7, 0x03DC($at)           ## 000103DC
/* 00BBC 80B5C36C 92180208 */  lbu     $t8, 0x0208($s0)           ## 00000208
/* 00BC0 80B5C370 A6000214 */  sh      $zero, 0x0214($s0)         ## 00000214
/* 00BC4 80B5C374 27190001 */  addiu   $t9, $t8, 0x0001           ## $t9 = 00000001
/* 00BC8 80B5C378 A2190208 */  sb      $t9, 0x0208($s0)           ## 00000208
.L80B5C37C:
/* 00BCC 80B5C37C 1000002B */  beq     $zero, $zero, .L80B5C42C   
/* 00BD0 80B5C380 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
glabel L80B5C384
/* 00BD4 80B5C384 86080214 */  lh      $t0, 0x0214($s0)           ## 00000214
/* 00BD8 80B5C388 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00BDC 80B5C38C 240570FA */  addiu   $a1, $zero, 0x70FA         ## $a1 = 000070FA
/* 00BE0 80B5C390 25090001 */  addiu   $t1, $t0, 0x0001           ## $t1 = 00000001
/* 00BE4 80B5C394 A6090214 */  sh      $t1, 0x0214($s0)           ## 00000214
/* 00BE8 80B5C398 860A0214 */  lh      $t2, 0x0214($s0)           ## 00000214
/* 00BEC 80B5C39C 2941000A */  slti    $at, $t2, 0x000A           
/* 00BF0 80B5C3A0 14200006 */  bne     $at, $zero, .L80B5C3BC     
/* 00BF4 80B5C3A4 00000000 */  nop
/* 00BF8 80B5C3A8 0C042DA0 */  jal     func_8010B680              
/* 00BFC 80B5C3AC 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
/* 00C00 80B5C3B0 920B0208 */  lbu     $t3, 0x0208($s0)           ## 00000208
/* 00C04 80B5C3B4 256C0001 */  addiu   $t4, $t3, 0x0001           ## $t4 = 00000001
/* 00C08 80B5C3B8 A20C0208 */  sb      $t4, 0x0208($s0)           ## 00000208
.L80B5C3BC:
/* 00C0C 80B5C3BC 1000001B */  beq     $zero, $zero, .L80B5C42C   
/* 00C10 80B5C3C0 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
glabel L80B5C3C4
/* 00C14 80B5C3C4 0C042F6F */  jal     func_8010BDBC              
/* 00C18 80B5C3C8 262420D8 */  addiu   $a0, $s1, 0x20D8           ## $a0 = 000020D8
/* 00C1C 80B5C3CC 24010005 */  addiu   $at, $zero, 0x0005         ## $at = 00000005
/* 00C20 80B5C3D0 54410016 */  bnel    $v0, $at, .L80B5C42C       
/* 00C24 80B5C3D4 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
/* 00C28 80B5C3D8 0C041AF2 */  jal     func_80106BC8              
/* 00C2C 80B5C3DC 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00C30 80B5C3E0 10400011 */  beq     $v0, $zero, .L80B5C428     
/* 00C34 80B5C3E4 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00C38 80B5C3E8 0C2D6DEC */  jal     func_80B5B7B0              
/* 00C3C 80B5C3EC 24050002 */  addiu   $a1, $zero, 0x0002         ## $a1 = 00000002
/* 00C40 80B5C3F0 3C0580B6 */  lui     $a1, %hi(D_80B5E7B8)       ## $a1 = 80B60000
/* 00C44 80B5C3F4 24A5E7B8 */  addiu   $a1, $a1, %lo(D_80B5E7B8)  ## $a1 = 80B5E7B8
/* 00C48 80B5C3F8 2604014C */  addiu   $a0, $s0, 0x014C           ## $a0 = 0000014C
/* 00C4C 80B5C3FC 0C00D3B0 */  jal     func_80034EC0              
/* 00C50 80B5C400 24060016 */  addiu   $a2, $zero, 0x0016         ## $a2 = 00000016
/* 00C54 80B5C404 920D0208 */  lbu     $t5, 0x0208($s0)           ## 00000208
/* 00C58 80B5C408 A200020E */  sb      $zero, 0x020E($s0)         ## 0000020E
/* 00C5C 80B5C40C A6000214 */  sh      $zero, 0x0214($s0)         ## 00000214
/* 00C60 80B5C410 25AE0001 */  addiu   $t6, $t5, 0x0001           ## $t6 = 00000001
/* 00C64 80B5C414 A20E0208 */  sb      $t6, 0x0208($s0)           ## 00000208
/* 00C68 80B5C418 02202025 */  or      $a0, $s1, $zero            ## $a0 = 00000000
/* 00C6C 80B5C41C 240570FB */  addiu   $a1, $zero, 0x70FB         ## $a1 = 000070FB
/* 00C70 80B5C420 0C042DA0 */  jal     func_8010B680              
/* 00C74 80B5C424 00003025 */  or      $a2, $zero, $zero          ## $a2 = 00000000
.L80B5C428:
/* 00C78 80B5C428 92020208 */  lbu     $v0, 0x0208($s0)           ## 00000208
.L80B5C42C:
/* 00C7C 80B5C42C 24010007 */  addiu   $at, $zero, 0x0007         ## $at = 00000007
/* 00C80 80B5C430 14410003 */  bne     $v0, $at, .L80B5C440       
/* 00C84 80B5C434 8FB00014 */  lw      $s0, 0x0014($sp)           
/* 00C88 80B5C438 10000002 */  beq     $zero, $zero, .L80B5C444   
/* 00C8C 80B5C43C 24030001 */  addiu   $v1, $zero, 0x0001         ## $v1 = 00000001
.L80B5C440:
/* 00C90 80B5C440 00001825 */  or      $v1, $zero, $zero          ## $v1 = 00000000
.L80B5C444:
/* 00C94 80B5C444 8FBF001C */  lw      $ra, 0x001C($sp)           
/* 00C98 80B5C448 8FB10018 */  lw      $s1, 0x0018($sp)           
/* 00C9C 80B5C44C 27BD0020 */  addiu   $sp, $sp, 0x0020           ## $sp = 00000000
/* 00CA0 80B5C450 03E00008 */  jr      $ra                        
/* 00CA4 80B5C454 00601025 */  or      $v0, $v1, $zero            ## $v0 = 00000000
