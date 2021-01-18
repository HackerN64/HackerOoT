/*
 * File: z_en_anubice_tag.c
 * Overlay: ovl_En_Anubice_Tag
 * Description: Spawns and manages the Anubis enemy
 */

#include "z_en_anubice_tag.h"
#include "vt.h"

#define FLAGS 0x00000010

#define THIS ((EnAnubiceTag*)thisx)

void EnAnubiceTag_Init(Actor* thisx, GlobalContext* globalCtx);
void EnAnubiceTag_Destroy(Actor* thisx, GlobalContext* globalCtx);
void EnAnubiceTag_Update(Actor* thisx, GlobalContext* globalCtx);
void EnAnubiceTag_Draw(Actor* thisx, GlobalContext* globalCtx);

void EnAnubiceTag_SpawnAnubis(EnAnubiceTag* this, GlobalContext* globalCtx);
void EnAnubiceTag_ManageAnubis(EnAnubiceTag* this, GlobalContext* globalCtx);

const ActorInit En_Anubice_Tag_InitVars = {
    ACTOR_EN_ANUBICE_TAG,
    ACTORCAT_SWITCH,
    FLAGS,
    OBJECT_GAMEPLAY_KEEP,
    sizeof(EnAnubiceTag),
    (ActorFunc)EnAnubiceTag_Init,
    (ActorFunc)EnAnubiceTag_Destroy,
    (ActorFunc)EnAnubiceTag_Update,
    (ActorFunc)EnAnubiceTag_Draw,
};

void EnAnubiceTag_Init(Actor* thisx, GlobalContext* globalCtx) {
    EnAnubiceTag* this = THIS;

    osSyncPrintf("\n\n");
    // "Anubis control tag generated"
    osSyncPrintf(VT_FGCOL(GREEN) "☆☆☆☆☆ アヌビス制御タグ発生 ☆☆☆☆☆ %d\n" VT_RST, this->actor.params);

    if (this->actor.params < -1) {
        this->actor.params = 0;
    }
    if (this->actor.params != 0) {
        this->triggerRange = this->actor.params * 40.0f;
    }
    this->actionFunc = EnAnubiceTag_SpawnAnubis;
}

void EnAnubiceTag_Destroy(Actor* thisx, GlobalContext* globalCtx) {
}

void EnAnubiceTag_SpawnAnubis(EnAnubiceTag* this, GlobalContext* globalCtx) {
    this->anubis =
        Actor_SpawnAsChild(&globalCtx->actorCtx, &this->actor, globalCtx, ACTOR_EN_ANUBICE, this->actor.world.pos.x,
                           this->actor.world.pos.y, this->actor.world.pos.z, 0, this->actor.yawTowardsPlayer, 0, 0);

    if (this->anubis != NULL) {
        this->actionFunc = EnAnubiceTag_ManageAnubis;
    }
}

void EnAnubiceTag_ManageAnubis(EnAnubiceTag* this, GlobalContext* globalCtx) {
    EnAnubice* anubis;
    Vec3f offset;

    if (this->anubis != NULL) {
        anubis = this->anubis;
        if (anubis->actor.update == NULL) {
            return;
        }
    } else {
        Actor_Kill(&this->actor);
        return;
    }

    if (anubis->unk_25A != 0) {
        Actor_Kill(&this->actor);
        return;
    }

    if (this->actor.xzDistToPlayer < (200.0f + this->triggerRange)) {
        if (anubis->unk_260 == 0) {
            if (anubis->unk_262 == 0) {
                anubis->unk_25E = 1;
                offset.x = -Math_SinS(this->actor.yawTowardsPlayer) * this->actor.xzDistToPlayer;
                offset.z = -Math_CosS(this->actor.yawTowardsPlayer) * this->actor.xzDistToPlayer;
                Math_ApproachF(&anubis->actor.world.pos.x, (this->actor.world.pos.x + offset.x), 0.3f, 10.0f);
                Math_ApproachF(&anubis->actor.world.pos.z, (this->actor.world.pos.z + offset.z), 0.3f, 10.0f);
                return;
            }
        }
    } else {
        if (anubis->unk_25E != 0) {
            anubis->unk_260 = 1;
        }
    }
}

void EnAnubiceTag_Update(Actor* thisx, GlobalContext* globalCtx) {
    EnAnubiceTag* this = THIS;

    this->actionFunc(this, globalCtx);
}

void EnAnubiceTag_Draw(Actor* thisx, GlobalContext* globalCtx) {
    EnAnubiceTag* this = THIS;

    if (BREG(0) != 0) {
        DebugDisplay_AddObject(this->actor.world.pos.x, this->actor.world.pos.y, this->actor.world.pos.z,
                               this->actor.world.rot.x, this->actor.world.rot.y, this->actor.world.rot.z, 1.0f, 1.0f,
                               1.0f, 0xFF, 0, 0, 0xFF, 4, globalCtx->state.gfxCtx);
    }
}
