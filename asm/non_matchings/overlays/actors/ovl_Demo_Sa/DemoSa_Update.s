.rdata
glabel D_80990EA0
    .asciz "[31mメインモードがおかしい!!!!!!!!!!!!!!!!!!!!!!!!!\n[m"
    .balign 4

.text
glabel DemoSa_Update
/* 018F0 8098FD50 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 018F4 8098FD54 AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 018F8 8098FD58 8C820198 */  lw      $v0, 0x0198($a0)           ## 00000198
/* 018FC 8098FD5C 04400008 */  bltz    $v0, .L8098FD80            
/* 01900 8098FD60 28410015 */  slti    $at, $v0, 0x0015           
/* 01904 8098FD64 10200006 */  beq     $at, $zero, .L8098FD80     
/* 01908 8098FD68 00027080 */  sll     $t6, $v0,  2               
/* 0190C 8098FD6C 3C038099 */  lui     $v1, %hi(D_80990D5C)       ## $v1 = 80990000
/* 01910 8098FD70 006E1821 */  addu    $v1, $v1, $t6              
/* 01914 8098FD74 8C630D5C */  lw      $v1, %lo(D_80990D5C)($v1)  
/* 01918 8098FD78 14600006 */  bne     $v1, $zero, .L8098FD94     
/* 0191C 8098FD7C 00000000 */  nop
.L8098FD80:
/* 01920 8098FD80 3C048099 */  lui     $a0, %hi(D_80990EA0)       ## $a0 = 80990000
/* 01924 8098FD84 0C00084C */  jal     osSyncPrintf
              
/* 01928 8098FD88 24840EA0 */  addiu   $a0, $a0, %lo(D_80990EA0)  ## $a0 = 80990EA0
/* 0192C 8098FD8C 10000004 */  beq     $zero, $zero, .L8098FDA0   
/* 01930 8098FD90 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8098FD94:
/* 01934 8098FD94 0060F809 */  jalr    $ra, $v1                   
/* 01938 8098FD98 00000000 */  nop
/* 0193C 8098FD9C 8FBF0014 */  lw      $ra, 0x0014($sp)           
.L8098FDA0:
/* 01940 8098FDA0 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 01944 8098FDA4 03E00008 */  jr      $ra                        
/* 01948 8098FDA8 00000000 */  nop
