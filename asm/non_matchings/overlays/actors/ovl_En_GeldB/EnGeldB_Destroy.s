glabel EnGeldB_Destroy
/* 00228 80A35538 27BDFFE8 */  addiu   $sp, $sp, 0xFFE8           ## $sp = FFFFFFE8
/* 0022C 80A3553C AFBF0014 */  sw      $ra, 0x0014($sp)           
/* 00230 80A35540 AFA40018 */  sw      $a0, 0x0018($sp)           
/* 00234 80A35544 0C03D6D6 */  jal     func_800F5B58              
/* 00238 80A35548 AFA5001C */  sw      $a1, 0x001C($sp)           
/* 0023C 80A3554C 8FAE0018 */  lw      $t6, 0x0018($sp)           
/* 00240 80A35550 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00244 80A35554 0C009C27 */  jal     Effect_Delete              
/* 00248 80A35558 8DC5031C */  lw      $a1, 0x031C($t6)           ## 0000031C
/* 0024C 80A3555C 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 00250 80A35560 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00254 80A35564 0C017232 */  jal     Collider_DestroyTris              
/* 00258 80A35568 24A503EC */  addiu   $a1, $a1, 0x03EC           ## $a1 = 000003EC
/* 0025C 80A3556C 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 00260 80A35570 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00264 80A35574 0C0170EB */  jal     Collider_DestroyCylinder
              
/* 00268 80A35578 24A50320 */  addiu   $a1, $a1, 0x0320           ## $a1 = 00000320
/* 0026C 80A3557C 8FA50018 */  lw      $a1, 0x0018($sp)           
/* 00270 80A35580 8FA4001C */  lw      $a0, 0x001C($sp)           
/* 00274 80A35584 0C017418 */  jal     Collider_DestroyQuad              
/* 00278 80A35588 24A5036C */  addiu   $a1, $a1, 0x036C           ## $a1 = 0000036C
/* 0027C 80A3558C 8FBF0014 */  lw      $ra, 0x0014($sp)           
/* 00280 80A35590 27BD0018 */  addiu   $sp, $sp, 0x0018           ## $sp = 00000000
/* 00284 80A35594 03E00008 */  jr      $ra                        
/* 00288 80A35598 00000000 */  nop
