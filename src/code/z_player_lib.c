#include <ultra64.h>
#include <global.h>

typedef struct {
    u8 unk_0;
    u16 unk_2;
} Struct_8008F2F8;

// TODO decompile data

extern SkeletonHeader* D_80125B70[];

extern s16 D_80125B78[];

extern u8 D_80125C44[];

extern Struct_8008F2F8 D_80125C88[];

extern u8 D_80125C98[];

extern UNK_TYPE D_80125F18[];

extern UNK_TYPE D_80125F20[];

extern UNK_TYPE D_80125F28[];

extern UNK_TYPE D_80125F30[];

extern UNK_TYPE D_80125F38[];

extern UNK_PTR D_80125F40[];

extern u8 D_8012607C[];

extern f32 D_801260D0;

extern Vec3f D_801260A4;
extern Vec3f D_801260B0;
extern Vec3f D_801260BC;
extern Vec3f D_801260C8;

extern Vec3f D_80126080;
extern Vec3f D_8012608C;
extern Vec3f D_80126098;

// TODO decompile bss

extern u8 D_80160008[]; // TODO check type

// Segment Addresses

extern LinkAnimetionEntry D_04003238;
extern UNK_TYPE D_0602A738;
extern UNK_TYPE D_0602CB48;

void func_8008E750(GlobalContext* globalCtx, Player* player) {
    s32 currentBoots;
    s16* temp_var;

    REG(27) = 0x7D0;
    REG(48) = 0x172;

    currentBoots = player->currentBoots;
    if (currentBoots == 0) {
        if (LINK_IS_CHILD) {
            currentBoots = 5;
        }
    } else if (currentBoots == 1) {
        if ((s32)(player->stateFlags1 * 0x10) < 0) {
            currentBoots = 4;
        }
        REG(27) = 0x1F4;
        REG(48) = 0x64;
    }

    temp_var = (s16*)&D_80125B78 + (currentBoots * 0x11);
    REG(19) = temp_var[0];
    REG(30) = temp_var[1];
    REG(32) = temp_var[2];
    REG(34) = temp_var[3];
    REG(35) = temp_var[4];
    REG(36) = temp_var[5];
    REG(37) = temp_var[6];
    REG(38) = temp_var[7];
    REG(43) = temp_var[8];
    REG(45) = temp_var[9];
    REG(68) = temp_var[10];
    REG(69) = temp_var[11];
    IREG(66) = temp_var[12];
    IREG(67) = temp_var[13];
    IREG(68) = temp_var[14];
    IREG(69) = temp_var[15];
    MREG(95) = temp_var[16];
    if (globalCtx->roomCtx.curRoom.unk_03 == 2) {
        REG(45) = 0x1F4;
    }
}

s32 func_8008E8DC(GlobalContext* globalCtx, Player* player) {
    return (player->stateFlags1 & 0x20000080 || player->action || globalCtx->sceneLoadFlag == 0x14 ||
            player->stateFlags1 & 1 || player->unk_692 & 0x80 ||
            (gSaveContext.unk_13F0 && func_8008F0D8(player, player->unk_154) >= 0));
}

s32 func_8008E988(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    return func_8008E8DC(globalCtx, player) || player->unk_6AD == 4;
}

s32 func_8008E9C4(Player* player) {
    return player->stateFlags1 & 0x10;
}

s32 func_8008E9D0(Player* player) {
    return LINK_IS_CHILD && player->currentShield == 2;
}

s32 func_8008E9F8(Player* player, s32 arg1) {
    s32 temp_v1 = D_80125C44[arg1];

    if (temp_v1 == 2 && func_8008E9D0(player) != 0) {
        return 1;
    } else {
        return temp_v1;
    }
}

#ifdef NON_MATCHING
// Regalloc only
void func_8008EA40(Player* player) {
    if (player->stateFlags1 & 0x400000) {
        if ((player->unk_154 < 0) || (player->heldItemActionParam == player->unk_154)) {
            if (func_8008F1A0(player) == 0 && func_8008E9D0(player) == 0) {
                player->unk_15D = 0xA;
                player->unk_160 = gSaveContext.linkAge + &D_80125F40[10];
                if (player->unk_15E == 0x12) {
                    player->unk_15E = 0x10;
                } else if (player->unk_15E == 0x13) {
                    player->unk_15E = 0x11;
                }
                player->unk_168 = gSaveContext.linkAge + &D_80125F40[player->unk_15E];
                player->unk_15B = 2;
                player->unk_154 = -1;
            }
        }
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008EA40.s")
#endif

#ifdef NON_MATCHING
// Regalloc, gSaveContext and D_80125F40 hi/lo pairs swapped
void func_8008EB2C(Player* player, s32 arg1) {
    player->unk_15C = D_80125C98[(arg1 * 5) + 1];
    player->unk_15D = D_80125C98[(arg1 * 5) + 2];
    player->unk_15E = D_80125C98[(arg1 * 5) + 3];
    player->unk_164 = gSaveContext.linkAge + &D_80125F40[D_80125C98[(arg1 * 5) + 1]];
    player->unk_160 = gSaveContext.linkAge + &D_80125F40[D_80125C98[(arg1 * 5) + 2]];
    player->unk_168 = gSaveContext.linkAge + &D_80125F40[D_80125C98[(arg1 * 5) + 3]];
    player->unk_16C = gSaveContext.linkAge + &D_80125F40[D_80125C98[(arg1 * 5) + 4]];
    func_8008EA40(player);
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008EB2C.s")
#endif

void func_8008EC04(Player* player, s32 arg1) {
    player->unk_158 = arg1;
    if (arg1 == 1) {
        player->unk_15B = 0;
    } else {
        player->unk_15B = D_80125C98[arg1 * 5];
    }
    if (player->unk_15B < 3 && player->currentShield == 0) {
        player->unk_15B = 0;
    }
    func_8008EB2C(player, arg1);
}

void func_8008EC70(Player* player) {
    player->unk_154 = player->heldItemActionParam;
    func_8008EC04(player, func_8008E9F8(player, player->heldItemActionParam));
    player->unk_6AD = 0;
}

void func_8008ECAC(GlobalContext* globalCtx, Player* player) {
    s32 sword;

    if (player->action != 0x56) {
        player->currentShield = CUR_EQUIP_VALUE(EQUIP_SHIELD);
        player->currentTunic = CUR_EQUIP_VALUE(EQUIP_TUNIC) - 1;
        player->currentBoots = CUR_EQUIP_VALUE(EQUIP_BOOTS) - 1;

        if (gSaveContext.buttonStatus[EQUIP_SWORD] == ITEM_NONE) {
            sword = ITEM_NONE;
            player->currentSword = sword;
        } else {
            if (gSaveContext.equips.buttonItems[EQUIP_SWORD] == ITEM_SWORD_KNIFE) {
                sword = ITEM_SWORD_BGS;
            } else {
                sword = gSaveContext.equips.buttonItems[EQUIP_SWORD];
            }
            player->currentSword = sword;
        }

        func_8008EC04(player, func_8008E9F8(player, player->heldItemActionParam));
        func_8008E750(globalCtx, player);
    }
}

void func_8008ED9C(GlobalContext* globalCtx, Player* player, s32 item, s32 arg2) {
    Inventory_UpdateBottleItem(globalCtx, item, player->heldItemCButtonIdx);
    if (item != ITEM_BOTTLE) {
        player->unk_152 = item;
        player->heldItemActionParam = arg2;
    }
    player->unk_154 = arg2;
}

void func_8008EDF0(Player* player) {
    player->unk_664 = NULL;
    player->stateFlags2 &= ~0x2000;
}

void func_8008EE08(Player* player) {
    if ((player->actor.bgCheckFlags & 1) || (player->stateFlags1 & 0x8A00000) ||
        ((player->stateFlags1 & 0xC0000) == 0 && (player->actor.posRot.pos.y - player->actor.groundY) < 100.0f)) {
        player->stateFlags1 &= 0xBFF07FFF;
    } else if ((player->stateFlags1 & 0x2C0000) == 0) {
        player->stateFlags1 |= 0x80000;
    }
    func_8008EDF0(player);
}

void func_8008EEAC(GlobalContext* globalCtx, Actor* arg1) {
    Player* player;

    player = PLAYER;
    func_8008EE08(player);
    player->unk_664 = arg1;
    player->unk_684 = arg1;
    player->stateFlags1 |= 0x10000;
    Camera_SetParam(Gameplay_GetCamera(globalCtx, 0), 8, arg1);
    func_8005A444(Gameplay_GetCamera(globalCtx, 0), 2);
}

s32 func_8008EF30(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    return player->stateFlags1 & 0x800000;
}

s32 func_8008EF44(GlobalContext* globalCtx, s32 arg1) {
    globalCtx->unk_11E5C = (arg1 + 1);
    return 1;
}

s32 func_8008EF5C(GlobalContext* globalCtx, Vec3f* pos, f32 radius, f32 arg3) {
    s32 pad;
    Vec3f diff;
    Player* player;

    player = PLAYER;
    if ((player->heldItemActionParam == 6) && (player->stickFlameTimer != 0)) {
        Math_Vec3f_Diff(&player->swordDimensions.tip, pos, &diff);
        return ((diff.x * diff.x) + (diff.z * diff.z)) <= (radius * radius) && 0.0f <= diff.y && diff.y <= arg3;
    } else {
        return false;
    }
}

s32 func_8008F034() {
    s32 temp_v1;

    temp_v1 = (s32)(gSaveContext.upgrades & gUpgradeMasks[2]) >> gUpgradeShifts[2];
    if (LINK_IS_ADULT) {
        return temp_v1;
    } else if (temp_v1 != 0) {
        return 1;
    } else {
        return 0;
    }
}

u8 func_8008F080(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    return player->currentMask;
}

Player* func_8008F08C(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    player->currentMask = 0;
    return player;
}

s32 func_8008F098(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    return player->currentShield == 3;
}

s32 func_8008F0AC(GlobalContext* globalCtx) {
    Player* player = PLAYER;
    return player->unk_15D == 0xa && player->currentShield == 3;
}

s32 func_8008F0D8(Player* player, s32 arg1) {
    s32 temp_v0 = arg1 - 0x15;
    if (temp_v0 >= 0 && temp_v0 < 6) {
        return temp_v0;
    }
    return -1;
}

s32 func_8008F104(Player* player) {
    return player->heldItemActionParam == 0x10 || player->heldItemActionParam == 0x11;
}

s32 func_8008F128(Player* player) {
    return func_8008F104(player) && player->heldActor == NULL;
}

s32 func_8008F158(s32 arg0) {
    s32 temp_v0 = arg0 - 2;
    if (temp_v0 > 0 && temp_v0 < 6) {
        return temp_v0;
    }
    return 0;
}

void func_8008F180(Player* player) {
    func_8008F158(player->heldItemActionParam);
}

s32 func_8008F1A0(Player* player) {
    if (player->heldItemActionParam >= 5 && player->heldItemActionParam < 8) {
        return 1;
    }
    return 0;
}

s32 func_8008F1CC(Player* player) {
    return player->heldItemActionParam == 5 && gSaveContext.bgsHitsLeft <= 0.0f;
}

s32 func_8008F224(Player* player, s32 arg1) {
    s32 temp_v0 = arg1 - 0x1E;
    if (temp_v0 >= 0 && temp_v0 < 0xD) {
        return temp_v0;
    }
    return -1;
}

void func_8008F250(Player* player) {
    func_8008F224(player, player->heldItemActionParam);
}

s32 func_8008F270(Player* player, s32 arg1) {
    s32 temp_v0 = arg1 - 0x12;
    if (temp_v0 >= 0 && temp_v0 < 2) {
        return temp_v0;
    }
    return -1;
}

s32 func_8008F29C(Player* player) {
    return func_8008F270(player, player->heldItemActionParam);
}

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008F2BC.s")

s32 func_8008F2F8(GlobalContext* globalCtx) {
    Player* player;
    Struct_8008F2F8* temp_a3;
    s32 phi_v1;

    player = PLAYER;
    if (globalCtx->roomCtx.curRoom.unk_02 == 3) {
        phi_v1 = 0;
    } else if (((s32)player->unk_840 >= 0x51) && (player->currentBoots == 1 || (s32)player->unk_840 >= 0x12C)) {
        phi_v1 = (player->currentBoots == 1 && (player->actor.bgCheckFlags & 1)) ? 1 : 3;
    } else if (((s32)player->stateFlags1 * 0x10) < 0) {
        phi_v1 = 2;
    } else {
        return 0;
    }
    if (func_8008E988(globalCtx) == 0) {
        temp_a3 = &D_80125C88[phi_v1];
        if (!temp_a3) {}
        if (temp_a3->unk_0 != 0 && !(gSaveContext.unk_13C6 & temp_a3->unk_0) &&
            ((phi_v1 == 0 && player->currentTunic != 1) ||
             ((phi_v1 == 1 || phi_v1 == 3) && player->currentBoots == 1 && player->currentTunic != 2))) {
            func_8010B680(globalCtx, temp_a3->unk_2, NULL);
            gSaveContext.unk_13C6 |= temp_a3->unk_0;
        }
    }
    return phi_v1 + 1;
}

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008F470.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008F87C.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8008FCC8.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80090014.s")

#ifdef NON_MATCHING
// Regalloc only
s32 func_800902F0(s32 arg0, s32 arg1, UNK_PTR** arg2, s32 arg3, s32 arg4, Player* player) {
    if (func_8008FCC8(arg0, arg1, arg2, arg3, arg4, player) == 0) {
        if (player->unk_6AD != 2) {
            *arg2 = NULL;
        } else {
            if (arg1 == 0xF) {
                *arg2 = D_80125F18[gSaveContext.linkAge];
            } else if (arg1 == 0x10) {
                *arg2 = D_80125F20[gSaveContext.linkAge];
            } else if (arg1 == 0x11) {
                *arg2 = D_80125F28[gSaveContext.linkAge];
            } else if (arg1 == 0x12) {
                *arg2 = D_80125F30[gSaveContext.linkAge];
            } else if (arg1 == 0x13) {
                *arg2 = func_8008F104(player) ? &D_0602A738 : D_80125F38[gSaveContext.linkAge];
            } else {
                *arg2 = NULL;
            }
        }
    }
    return 0;
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_800902F0.s")
#endif

s32 func_80090440(s32 arg0, s32 arg1, UNK_PTR** arg2, s32 arg3, s32 arg4, Player* player) {
    if (func_8008FCC8(arg0, arg1, arg2, arg3, arg4, player) == 0) {
        *arg2 = NULL;
    }
    return 0;
}

u8 func_80090480(GlobalContext* globalCtx, Collider* collider, Struct_80090480_arg2* arg2, Vec3f* arg3, Vec3f* arg4) {
    if (arg2->active == 0) {
        if (collider != NULL) {
            Collider_QuadSetAT(globalCtx, collider);
        }
        Math_Vec3f_Copy(&arg2->tip, arg3);
        Math_Vec3f_Copy(&arg2->base, arg4);
        arg2->active = 1;
        return 1;
    } else {
        if (arg2->tip.x == arg3->x && arg2->tip.y == arg3->y && arg2->tip.z == arg3->z && arg2->base.x == arg4->x &&
            arg2->base.y == arg4->y && arg2->base.z == arg4->z) {
            if (collider != NULL) {
                Collider_QuadSetAT(globalCtx, collider);
            }
            return 0;
        }
        if (collider != NULL) {
            func_80062734(collider, arg4, arg3, &arg2->base, &arg2->tip);
            CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, collider);
        }
        Math_Vec3f_Copy(&arg2->base, arg4);
        Math_Vec3f_Copy(&arg2->tip, arg3);
        arg2->active = 1;
        return 1;
    }
}

void func_80090604(GlobalContext* globalCtx, Player* player, ColliderQuad* collider, ColliderQuadDimInit* quadInit) {
    Vec3f d;
    Vec3f c;
    Vec3f b;
    Vec3f a;

    if ((s32)(player->stateFlags1 << 9) < 0) {
        player->unk_5F8 = D_8012607C[player->currentShield];
        Matrix_MultVec3f(&quadInit->quad[0], &a);
        Matrix_MultVec3f(&quadInit->quad[1], &b);
        Matrix_MultVec3f(&quadInit->quad[2], &c);
        Matrix_MultVec3f(&quadInit->quad[3], &d);
        func_80062734(collider, &a, &b, &c, &d);
        CollisionCheck_SetAC(globalCtx, &globalCtx->colChkCtx, &collider->base);
        CollisionCheck_SetAT(globalCtx, &globalCtx->colChkCtx, &collider->base);
    }
}

void func_800906D4(GlobalContext* globalCtx, Player* player, ColliderTrisItemDimInit* trisInit) {
    Vec3f sp44;
    Vec3f sp38;
    Vec3f sp2C;

    Matrix_MultVec3f(&D_801260A4, &sp2C);
    Matrix_MultVec3f(&D_801260B0, &sp38);
    Matrix_MultVec3f(&D_801260BC, &sp44);
    if (func_80090480(globalCtx, NULL, &player->swordDimensions, &trisInit->vtx[0], &sp2C) != 0 &&
        (s32)(player->stateFlags1 << 9) >= 0) {
        EffectBlure_AddVertex(Effect_GetByIndex(player->swordEffectId), &player->swordDimensions.tip,
                              &player->swordDimensions.base);
    }
    if (player->swordState > 0 && ((player->swordAnimation < 0x18) || ((s32)(player->stateFlags2 << 0xE) < 0))) {
        func_80090480(globalCtx, &player->unk_4E4, &player->unk_8D0, &trisInit->vtx[1], &sp38);
        func_80090480(globalCtx, &player->unk_564, &player->unk_8EC, &trisInit->vtx[2], &sp44);
    }
}

void func_800907E4(GlobalContext* globalCtx, Player* player, Vec3f* arg2, s32 arg3) {
    f32 sp4C;

    sp4C = (player->exchangeItemId != 0) ? 6.0f : 14.0f;
    OPEN_DISPS(globalCtx->state.gfxCtx, "../z_player_lib.c", 0x961);
    gSegments[6] = VIRTUAL_TO_PHYSICAL(player->getItemModel);

    gSPSegment(oGfxCtx->polyOpa.p++, 0x06, player->getItemModel);
    gSPSegment(oGfxCtx->polyXlu.p++, 0x06, player->getItemModel);

    Matrix_Translate(arg2->x + (Math_Sins(player->actor.shape.rot.y) * 3.3f), arg2->y + sp4C,
                     arg2->z + ((3.3f + (IREG(90) / 10.0f)) * Math_Coss(player->actor.shape.rot.y)), MTXMODE_NEW);
    Matrix_RotateRPY(0, globalCtx->gameplayFrames * 1000, 0, MTXMODE_APPLY);
    Matrix_Scale(0.2f, 0.2f, 0.2f, MTXMODE_APPLY);
    func_800694A0(globalCtx, arg3 - 1);
    CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_player_lib.c", 0x975);
}

void func_800909B4(GlobalContext* globalCtx, Player* player) {
    if ((player->unk_170 == 0) || !osRecvMesg(&player->unk_194, NULL, OS_MESG_NOBLOCK)) {
        player->unk_170 = 0;
        func_800907E4(globalCtx, player, &D_80160008, ABS(player->overheadItemId));
    }
}

void func_80090A28(Player* player, ColliderTrisItemDimInit* trisInit) {
    D_8012608C.x = D_80126080.x;
    if (player->unk_845 >= 3) {
        player->unk_845 += 1;
        D_8012608C.x *= (1.0f + ((9 - player->unk_845) * 0.10000000149011612f));
    }
    D_8012608C.x += 1200.0f;
    D_80126098.x = D_8012608C.x;
    Matrix_MultVec3f(&D_80126080, &trisInit->vtx[0]);
    Matrix_MultVec3f(&D_8012608C, &trisInit->vtx[1]);
    Matrix_MultVec3f(&D_80126098, &trisInit->vtx[2]);
}

#ifdef NON_MATCHING
// This function needs a bit of work still, but should be functionally equivalent.
// The biggest differences are in loads/stores of .data variables,
// also regalloc past Matrix_NewMtx and a minor stack difference.
void func_80090AFC(GlobalContext* globalCtx, Player* player, f32 arg2) {
    f32 sp9C;
    f32 sp98;
    Vec3f sp8C;
    Vec3f sp80;
    Vec3f sp74;
    Vec3f sp68;
    f32 sp64;
    f32 sp60;

    D_801260D0 = 0.0f;
    Matrix_MultVec3f(&D_801260C8, &sp8C);
    D_801260D0 = arg2;
    Matrix_MultVec3f(&D_801260C8, &sp80);

    if (func_8003E188(&globalCtx->colCtx, &sp8C, &sp80, &sp74, &sp9C, 1, 1, 1, 1, &sp98) != 0) {
        OPEN_DISPS(globalCtx->state.gfxCtx, "../z_player_lib.c", 0xA0C);

        oGfxCtx->overlay.p = Gfx_CallSetupDL(oGfxCtx->overlay.p, 7);

        SkinMatrix_Vec3fMtxFMultXYZW(&globalCtx->mf_11D60, &sp74, &sp68, &sp64);

        sp60 = (sp64 < 200.0f) ? 0.07999999821186066f : (sp64 / 200.0f) * 0.07999999821186066f;

        Matrix_Translate(sp74.x, sp74.y, sp74.z, MTXMODE_NEW);
        Matrix_Scale(sp60, sp60, sp60, MTXMODE_APPLY);

        gSPMatrix(oGfxCtx->overlay.p++, Matrix_NewMtx(globalCtx->state.gfxCtx, "../z_player_lib.c", 0xA1B),
                  G_MTX_NOPUSH | G_MTX_LOAD | G_MTX_MODELVIEW);
        gSPSegment(oGfxCtx->overlay.p++, 0x06, globalCtx->objectCtx.status[player->actor.objBankIndex].segment);
        gSPDisplayList(oGfxCtx->overlay.p++, &D_0602CB48);

        CLOSE_DISPS(globalCtx->state.gfxCtx, "../z_player_lib.c", 0xA20);
    }
}
#else
#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80090AFC.s")
#endif

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80090D20.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80091738.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80091880.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_80091A24.s")

#pragma GLOBAL_ASM("asm/non_matchings/code/z_player_lib/func_8009214C.s")
