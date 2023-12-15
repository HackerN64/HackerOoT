#include "global.h"
#include "quake.h"
#include "terminal.h"
#include "overlays/actors/ovl_En_Sw/z_en_sw.h"

static s16 sDisableAttention = false;
static s16 sUnused = -1;
static s32 sPrevFrameCs1100 = -4096;

#include "z_onepointdemo_data.inc.c"

Vec3f OnePointCutscene_AddVecGeoToVec3f(Vec3f* a, VecGeo* geo) {
    Vec3f sum;
    Vec3f b = OLib_VecGeoToVec3f(geo);

    sum.x = a->x + b.x;
    sum.y = a->y + b.y;
    sum.z = a->z + b.z;

    return sum;
}

s16 OnePointCutscene_Vec3fYaw(Vec3f* vec1, Vec3f* vec2) {
    return CAM_DEG_TO_BINANG(RAD_TO_DEG(Math_FAtan2F(vec2->x - vec1->x, vec2->z - vec1->z)));
}

void OnePointCutscene_Vec3sToVec3f(Vec3f* src, Vec3s* dst) {
    dst->x = src->x;
    dst->y = src->y;
    dst->z = src->z;
}

s32 OnePointCutscene_BgCheckLineTest(CollisionContext* colCtx, Vec3f* vec1, Vec3f* vec2) {
    Vec3f posResult;
    s32 bgId;
    CollisionPoly* outPoly = NULL;

    return BgCheck_CameraLineTest1(colCtx, vec1, vec2, &posResult, &outPoly, true, true, true, false, &bgId);
}

f32 OnePointCutscene_RaycastDown(CollisionContext* colCtx, Vec3f* pos) {
    CollisionPoly* outPoly;
    s32 bgId;

    return BgCheck_EntityRaycastDown3(colCtx, &outPoly, &bgId, pos);
}

void OnePointCutscene_SetCsCamPoints(Camera* camera, s16 actionParameters, s16 initTimer, CutsceneCameraPoint* atPoints,
                                     CutsceneCameraPoint* eyePoints) {
    OnePointCamData* onePointCamData = &camera->paramData.demo9.onePointCamData;

    onePointCamData->atPoints = atPoints;
    onePointCamData->eyePoints = eyePoints;
    onePointCamData->actionParameters = actionParameters;
    onePointCamData->initTimer = initTimer;
}

s32 OnePointCutscene_SetInfo(PlayState* play, s16 subCamId, s16 csId, Actor* actor, s16 timer) {
    Camera* subCam = play->cameraPtrs[subCamId];
    Camera* childCam = play->cameraPtrs[subCam->childCamId];
    Camera* mainCam = play->cameraPtrs[CAM_ID_MAIN];
    Player* player = mainCam->player;
    VecGeo spD0;
    s32 i;
    Vec3f spC0;
    Vec3f spB4;
    PosRot spA0;
    PosRot sp8C;
    f32 tempRand;
    OnePointCsInfo* csInfo = &subCam->paramData.uniq9.csInfo;

    switch (csId) {
        case 1020: // smoothly return to main camera from current view
            if (timer < 20) {
                timer = 20;
            }
            D_801208EC[0].atTargetInit = play->view.at;
            D_801208EC[0].eyeTargetInit = play->view.eye;
            D_801208EC[0].fovTargetInit = play->view.fovy;
            D_801208EC[1].atTargetInit = mainCam->at;
            D_801208EC[1].eyeTargetInit = mainCam->eye;
            D_801208EC[1].fovTargetInit = mainCam->fov;
            D_801208EC[1].timerInit = timer - 1;
            subCam->timer = timer + 1;
            D_801208EC[1].lerpStepScale = 1.0f / (0.5f * timer);

            csInfo->keyFrames = D_801208EC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801208EC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 1030:
            D_80120964[0].atTargetInit = play->view.at;
            D_80120964[0].eyeTargetInit = play->view.eye;
            D_80120964[0].fovTargetInit = play->view.fovy;
            spD0 = OLib_Vec3fDiffToVecGeo(&mainCam->at, &mainCam->eye);
            D_80120964[1].eyeTargetInit.y = CAM_BINANG_TO_DEG(spD0.yaw);
            D_80120964[1].timerInit = timer - 1;

            csInfo->keyFrames = D_80120964;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120964);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 5000:
            D_801209B4[0].atTargetInit = D_801209B4[1].atTargetInit = play->view.at;
            D_801209B4[0].eyeTargetInit = play->view.eye;
            D_801209B4[0].fovTargetInit = D_801209B4[2].fovTargetInit = play->view.fovy;
            spD0 = OLib_Vec3fDiffToVecGeo(&actor->focus.pos, &mainCam->at);
            spD0.r = mainCam->dist;
            D_801209B4[1].eyeTargetInit = OnePointCutscene_AddVecGeoToVec3f(&D_801209B4[1].atTargetInit, &spD0);
            D_801209B4[1].atTargetInit.y += 20.0f;

            csInfo->keyFrames = D_801209B4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801209B4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 5010: // attention cutscene
            // Setup keyFrames in `Camera_Demo5`
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_ATTENTION);
            Play_SetCameraAtEye(play, subCamId, &mainCam->at, &mainCam->eye);
            subCam->roll = 0;
            break;

        case 9500:
            csInfo->keyFrames = D_80120A54;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120A54);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 2260:
            D_80120ACC[0].atTargetInit.x = D_80120ACC[2].atTargetInit.x =
                ((mainCam->play->state.frames & 1) ? -10.0f : 10.0f) + (Rand_ZeroOne() * 8.0f);

            D_80120ACC[0].eyeTargetInit.x = D_80120ACC[2].eyeTargetInit.x =
                ((mainCam->play->state.frames & 1) ? 20.0f : -20.0f) + (Rand_ZeroOne() * 5.0f);

            csInfo->keyFrames = D_80120ACC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120ACC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 2270:
            csInfo->keyFrames = D_80120B94;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120B94);

            for (i = 0; i < csInfo->keyFrameCount - 3; i++) {
                if (D_80120B94[i].actionFlags != ONEPOINT_CS_ACTION(ONEPOINT_CS_ACTION_ID_15, false, true)) {
                    D_80120B94[i].atTargetInit.x = Rand_ZeroOne() * 5.0f;
                    D_80120B94[i].atTargetInit.z = (Rand_ZeroOne() * 30.0f) + 10.0f;
                    D_80120B94[i].eyeTargetInit.x = (Rand_ZeroOne() * 100.0f) + 20.0f;
                    D_80120B94[i].eyeTargetInit.z = (Rand_ZeroOne() * 80.0f) + 50.0f;
                }
            }

            D_80120B94[subCamId - 1].eyeTargetInit.y =
                ((mainCam->play->state.frames & 1) ? 3.0f : -3.0f) + Rand_ZeroOne();
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_5);
            Quake_SetSpeed(i, 400);
            Quake_SetPerturbations(i, 4, 5, 40, 0x3C);
            Quake_SetDuration(i, 1600);
            break;

        case 2280:
            csInfo->keyFrames = D_80120D4C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120D4C);

            for (i = 0; i < csInfo->keyFrameCount - 3; i++) {
                if (D_80120D4C[i].actionFlags != ONEPOINT_CS_ACTION(ONEPOINT_CS_ACTION_ID_15, false, true)) {
                    D_80120D4C[i].atTargetInit.x = Rand_ZeroOne() * 20.0f;
                    D_80120D4C[i].atTargetInit.z = (Rand_ZeroOne() * 40.0f) + 10.0f;
                    D_80120D4C[i].eyeTargetInit.x = (Rand_ZeroOne() * 40.0f) + 60.0f;
                    D_80120D4C[i].eyeTargetInit.z = (Rand_ZeroOne() * 40.0f) + 80.0f;
                }
            }
            D_80120D4C[subCamId - 1].eyeTargetInit.y =
                ((mainCam->play->state.frames & 1) ? 3.0f : -3.0f) + Rand_ZeroOne();
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_5);
            Quake_SetSpeed(i, 400);
            Quake_SetPerturbations(i, 2, 3, 200, 0x32);
            Quake_SetDuration(i, 9999);
            break;

        case 2220:
            csInfo->keyFrames = D_80120E64;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120E64);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_5);
            Quake_SetSpeed(i, 400);
            Quake_SetPerturbations(i, 2, 2, 50, 0);
            Quake_SetDuration(i, 280);
            break;

        case 2230:
            if (player->actor.world.pos.z < 1000.0f) {
                D_80120FA4[0].eyeTargetInit.x = -D_80120FA4[0].eyeTargetInit.x;
                D_80120FA4[2].eyeTargetInit.x = -D_80120FA4[2].eyeTargetInit.x;
            }

            csInfo->keyFrames = D_80120FA4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80120FA4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 2340:
            csInfo->keyFrames = D_80121094;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121094);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_5);
            Quake_SetSpeed(i, 400);
            Quake_SetPerturbations(i, 2, 2, 50, 0);
            Quake_SetDuration(i, 60);
            break;

        case 2350:
            csInfo->keyFrames = D_8012110C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012110C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 2200: {
            s16 sp82;
            s16 sp80;
            s16 sp7E;
            s16 sp7C;

            Actor_GetScreenPos(play, &player->actor, &sp82, &sp7E);
            Actor_GetScreenPos(play, actor, &sp80, &sp7C);
            if ((sp82 > 0) && (sp82 < 320) && (sp7E > 0) && (sp7E < 240) && (sp80 > 0) && (sp80 < 320) && (sp7C > 0) &&
                (sp7C < 240) &&
                !OnePointCutscene_BgCheckLineTest(&play->colCtx, &actor->focus.pos, &player->actor.focus.pos)) {
                D_80121184[0].atTargetInit.x = (play->view.at.x + actor->focus.pos.x) * 0.5f;
                D_80121184[0].atTargetInit.y = (play->view.at.y + actor->focus.pos.y) * 0.5f;
                D_80121184[0].atTargetInit.z = (play->view.at.z + actor->focus.pos.z) * 0.5f;
                D_80121184[0].eyeTargetInit = play->view.eye;
                D_80121184[0].eyeTargetInit.y = player->actor.focus.pos.y + 20.0f;
                D_80121184[0].fovTargetInit = mainCam->fov * 0.75f;

                csInfo->keyFrames = D_80121184;
                csInfo->keyFrameCount = ARRAY_COUNT(D_80121184);
            } else {
                D_801211D4[0].atTargetInit.x = actor->focus.pos.x;
                D_801211D4[0].atTargetInit.y = actor->focus.pos.y - 5.0f;
                D_801211D4[0].atTargetInit.z = actor->focus.pos.z;
                spC0 = ((EnSw*)actor)->unk_364;
                osSyncPrintf("%s(%d): xyz_t: %s (%f %f %f)\n", "../z_onepointdemo.c", 1671, "&cp", spC0.x, spC0.y,
                             spC0.z);
                D_801211D4[0].eyeTargetInit.x = (actor->focus.pos.x + (120.0f * spC0.x)) - (Rand_ZeroOne() * 20.0f);
                D_801211D4[0].eyeTargetInit.y = actor->focus.pos.y + (120.0f * spC0.y) + 20.0f;
                D_801211D4[0].eyeTargetInit.z = (actor->focus.pos.z + (120.0f * spC0.z)) - (Rand_ZeroOne() * 20.0f);

                csInfo->keyFrames = D_801211D4;
                csInfo->keyFrameCount = ARRAY_COUNT(D_801211D4);
            }
            Play_ChangeCameraStatus(play, CAM_ID_MAIN, CAM_STAT_UNK3);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
        } break;

        case 2290: {
            Actor* rideActor = player->rideActor;

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            if (rideActor != NULL) {
                rideActor->freezeTimer = 180;
            }

            csInfo->keyFrames = D_80121224;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121224);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
        } break;

        case 5120:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);

            csInfo->keyFrames = D_80121314;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121314);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4510:
            D_8012133C[0].eyeTargetInit = actor->world.pos;
            D_8012133C[0].eyeTargetInit.y = player->actor.world.pos.y + 40.0f;
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);

            csInfo->keyFrames = D_8012133C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012133C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4500:
            spA0 = Actor_GetFocus(actor);
            spC0 = spA0.pos;
            spC0.y = OnePointCutscene_RaycastDown(&play->colCtx, &spC0) + 40.0f;
            spD0.r = 150.0f;
            spD0.yaw = spA0.rot.y;
            spD0.pitch = 0x3E8;

            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            subCam->roll = 0;
            subCam->fov = 50.0f;
            if (subCam->childCamId != CAM_ID_MAIN) {
                OnePointCutscene_EndCutscene(play, subCam->childCamId);
            }
            break;

        case 2210:
            spD0 = OLib_Vec3fDiffToVecGeo(&player->actor.world.pos, &actor->world.pos);
            D_801213B4[0].eyeTargetInit.y = D_801213B4[1].eyeTargetInit.y = D_801213B4[2].eyeTargetInit.y =
                D_801213B4[2].atTargetInit.y = CAM_BINANG_TO_DEG(spD0.yaw);
            if (Rand_ZeroOne() < 0.0f) {
                D_801213B4[3].eyeTargetInit.x = -D_801213B4[3].eyeTargetInit.x;
            }
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);

            csInfo->keyFrames = D_801213B4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801213B4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 1010:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &childCam->at, &childCam->eye);
            Play_SetCameraFov(play, subCamId, childCam->fov);
            Play_SetCameraRoll(play, subCamId, childCam->roll);
            break;

        case 9601: // Leaving a crawlspace forwards
            Play_RequestCameraSetting(play, subCamId, CAM_SET_CS_3);
            Play_RequestCameraSetting(play, CAM_ID_MAIN, mainCam->prevSetting);
            OnePointCutscene_SetCsCamPoints(subCam, sCrawlspaceActionParam | 0x1000, sCrawlspaceTimer,
                                            sCrawlspaceAtPoints, sCrawlspaceForwardsEyePoints);
            break;

        case 9602: // Leaving a crawlspace backwards
            Play_RequestCameraSetting(play, subCamId, CAM_SET_CS_3);
            Play_RequestCameraSetting(play, CAM_ID_MAIN, mainCam->prevSetting);
            OnePointCutscene_SetCsCamPoints(subCam, sCrawlspaceActionParam | 0x1000, sCrawlspaceTimer,
                                            sCrawlspaceAtPoints, sCrawlspaceBackwardsEyePoints);
            break;

        case 4175:
            csInfo->keyFrames = D_8012147C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012147C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4180:
            spC0.x = -1881.0f;
            spC0.y = 766.0f;
            spC0.z = -330.0f;
            spB4.x = -1979.0f;
            spB4.y = 703.0f;
            spB4.z = -269.0f;
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 6;
            subCam->fov = 75.0f;
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            break;

        case 3040:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            D_8012151C[0].timerInit = timer - 1;

            csInfo->keyFrames = D_8012151C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012151C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3020:
            D_8012156C[1].timerInit = timer - 1;
            if (mainCam->play->state.frames & 1) {
                D_8012156C[0].atTargetInit.x = -D_8012156C[0].atTargetInit.x;
                D_8012156C[0].eyeTargetInit.x = -D_8012156C[0].eyeTargetInit.x;
                D_8012156C[1].atTargetInit.x = -D_8012156C[1].atTargetInit.x;
                D_8012156C[1].eyeTargetInit.x = -D_8012156C[1].eyeTargetInit.x;
            }
            tempRand = Rand_ZeroOne() * 15.0f;
            D_8012156C[0].eyeTargetInit.x += tempRand;
            D_8012156C[1].eyeTargetInit.x += tempRand;

            csInfo->keyFrames = D_8012156C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012156C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            break;

        case 3010:
            D_801215BC[0].timerInit = timer;

            csInfo->keyFrames = D_801215BC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801215BC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3070:
            csInfo->keyFrames = D_801215E4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801215E4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 22000);
            Quake_SetPerturbations(i, 2, 0, 200, 0);
            Quake_SetDuration(i, 10);
            break;

        case 3080:
            csInfo->keyFrames = D_80121774;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121774);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3090:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);

            csInfo->keyFrames = D_80121814;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121814);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3100:
            VEC_SET(spB4, 0.0f, -280.0f, -1400.0f);

            spA0 = Actor_GetFocus(actor);
            spC0 = spA0.pos;
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_PIVOT_VERTICAL);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0;
            subCam->fov = 70.0f;
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            break;

        case 3380:
        case 3065:
            csInfo->keyFrames = D_801218B4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801218B4);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 24000);
            Quake_SetPerturbations(i, 2, 0, 0, 0);
            Quake_SetDuration(i, 160);
            break;

        case 3060:
            csInfo->keyFrames = D_80121904;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121904);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3050:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_CS_3);
            Player_SetCsActionWithHaltedActors(play, &player->actor, PLAYER_CSACTION_5);
            OnePointCutscene_SetCsCamPoints(subCam, D_80120304 | 0x2000, D_80120300, D_8012013C, D_8012021C);
            Sfx_PlaySfxCentered(NA_SE_SY_CORRECT_CHIME);
            OnePointCutscene_Vec3sToVec3f(&mainCam->at, &D_8012013C[D_801202FC - 2].pos);
            OnePointCutscene_Vec3sToVec3f(&mainCam->eye, &D_8012021C[D_801202FC - 2].pos);
            D_8012013C[D_801202FC - 3].pos.x +=
                (D_8012013C[D_801202FC - 2].pos.x - D_8012013C[D_801202FC - 3].pos.x) / 2;
            D_8012013C[D_801202FC - 3].pos.y +=
                (D_8012013C[D_801202FC - 2].pos.y - D_8012013C[D_801202FC - 3].pos.y) / 2;
            D_8012013C[D_801202FC - 3].pos.z +=
                (D_8012013C[D_801202FC - 2].pos.z - D_8012013C[D_801202FC - 3].pos.z) / 2;
            D_8012021C[D_801202FC - 3].pos.x +=
                (D_8012021C[D_801202FC - 2].pos.x - D_8012021C[D_801202FC - 3].pos.x) / 2;
            D_8012021C[D_801202FC - 3].pos.y +=
                (D_8012021C[D_801202FC - 2].pos.y - D_8012021C[D_801202FC - 3].pos.y) / 2;
            D_8012021C[D_801202FC - 3].pos.z +=
                (D_8012021C[D_801202FC - 2].pos.z - D_8012021C[D_801202FC - 3].pos.z) / 2;

            i = Quake_Request(mainCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 30000);
            Quake_SetPerturbations(i, 2, 1, 1, 0);
            Quake_SetDuration(i, 200);
            break;

        case 3120:
            csInfo->keyFrames = D_80121954[-(timer + 101)];
            subCam->timer = 100;
            subCam->stateFlags |= CAM_STATE_CHECK_WATER;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121954[0]);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3130:
            csInfo->keyFrames = D_80121A44;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121A44);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            subCam->stateFlags |= CAM_STATE_CHECK_WATER;
            break;

        case 3140:
            D_80121C24[0].atTargetInit = play->view.at;
            D_80121C24[0].eyeTargetInit = play->view.eye;
            D_80121C24[0].fovTargetInit = play->view.fovy;

            csInfo->keyFrames = D_80121C24;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121C24);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3150:
            spC0.x = 1890.0f;
            spC0.y = 886.0f;
            spC0.z = -1432.0f;
            spB4.x = 1729.0f;
            spB4.y = 995.0f;
            spB4.z = -1405.0f;
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0x50;
            subCam->fov = 55.0f;
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            break;

        case 3170:
            spA0 = Actor_GetWorld(actor);
            spC0 = spA0.pos;
            spD0.pitch = -0x5DC;
            spC0.y += 50.0f;
            spD0.r = 250.0f;
            spA0 = Actor_GetWorld(&player->actor);
            spD0.yaw = OnePointCutscene_Vec3fYaw(&spC0, &spA0.pos) - 0x7D0;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            Play_CopyCamera(play, CAM_ID_MAIN, subCamId);
            subCam->roll = -1;
            subCam->fov = 55.0f;
            Player_SetCsAction(play, actor, PLAYER_CSACTION_1);
            break;

        case 3160:
            spA0 = Actor_GetWorld(actor);
            spC0 = spA0.pos;
            spD0.pitch = 0;
            spD0.yaw = spA0.rot.y;
            spD0.r = 150.0f;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0;
            subCam->fov = 55.0f;
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            break;

        case 3180:
            spA0 = Actor_GetWorldPosShapeRot(actor);
            spC0 = spA0.pos;
            spC0.y += 120.0f;
            spD0.r = 300.0f;
            spD0.yaw = spA0.rot.y;
            spD0.pitch = -0xAF0;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0;
            subCam->fov = 60.0f;
            Player_SetCsAction(play, actor, PLAYER_CSACTION_1);
            break;

        case 3190:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FOREST_DEFEAT_POE);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Player_SetCsAction(play, actor, PLAYER_CSACTION_12);
            break;

        case 3230:
            spC0.x = 120.0f;
            spC0.y = 265.0f;
            spC0.z = -1570.0f;
            spB4.x = 80.0f;
            spB4.y = 445.0f;
            spB4.z = -1425.0f;
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0x1E;
            subCam->fov = 75.0f;
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            spA0 = Actor_GetWorldPosShapeRot(actor);
            sp8C = Actor_GetFocus(&player->actor);
            spC0.x = sp8C.pos.x;
            spC0.y = sp8C.pos.y + 70.0f;
            spC0.z = sp8C.pos.z;
            spD0 = OLib_Vec3fDiffToVecGeo(&spA0.pos, &sp8C.pos);
            spD0.pitch = 0x5DC;
            spD0.r = 120.0f;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_SetCameraAtEye(play, CAM_ID_MAIN, &spC0, &spB4);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 22000);
            Quake_SetPerturbations(i, 1, 0, 0, 0);
            Quake_SetDuration(i, 90);
            break;

        case 6010:
            spA0 = Actor_GetWorld(actor);
            spC0 = spA0.pos;
            spD0.pitch = 0;
            spC0.y += 70.0f;
            spD0.yaw = spA0.rot.y + 0x7FFF;
            spD0.r = 300.0f;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0;
            subCam->fov = 45.0f;
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            break;

        case 3220:
            spA0 = Actor_GetFocus(actor);
            spC0 = spA0.pos;
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_PIVOT_VERTICAL);
            spA0 = Actor_GetWorld(&player->actor);
            spD0 = OLib_Vec3fDiffToVecGeo(&spC0, &spA0.pos);
            spD0.yaw += 0x3E8;
            spD0.r = 400.0f;
            spB4 = OnePointCutscene_AddVecGeoToVec3f(&spC0, &spD0);
            spB4.y = spA0.pos.y + 60.0f;
            Play_SetCameraAtEye(play, subCamId, &spC0, &spB4);
            subCam->roll = 0;
            subCam->fov = 75.0f;
            player->actor.shape.rot.y = player->actor.world.rot.y = player->yaw = spD0.yaw + 0x7FFF;
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            break;

        case 3240:
            D_80121D3C[2].timerInit = timer - 5;

            csInfo->keyFrames = D_80121D3C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121D3C);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 6001:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_CS_3);
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            spA0 = Actor_GetWorld(actor);
            if (spA0.pos.z > -750.0f) {
                OnePointCutscene_SetCsCamPoints(subCam, D_801208E8, D_801208E4, D_801206A0, D_80120820);
            } else {
                OnePointCutscene_SetCsCamPoints(subCam, D_801208E8, D_801208E4, D_801206A0, D_80120760);
            }

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 0, 0, 20, 0);
            Quake_SetDuration(i, D_801208E4 - 10);
            break;

        case 3400:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_CS_3);
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            OnePointCutscene_SetCsCamPoints(subCam, D_8012069C | 0x2000, D_80120698, D_801204D4, D_801205B4);
            OnePointCutscene_Vec3sToVec3f(&mainCam->eye, &D_801205B4[D_80120694 - 2].pos);
            OnePointCutscene_Vec3sToVec3f(&mainCam->at, &D_801204D4[D_80120694 - 2].pos);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 0x4E20);
            Quake_SetPerturbations(i, 1, 0, 50, 0);
            Quake_SetDuration(i, D_80120698 - 20);
            break;

        case 3390:
            player->actor.shape.rot.y = player->actor.world.rot.y = player->yaw = -0x3FD9;

            csInfo->keyFrames = D_80121DB4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121DB4);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3310:
            Play_RequestCameraSetting(play, subCamId, CAM_SET_FIRE_STAIRCASE);
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_CopyCamera(play, subCamId, CAM_ID_MAIN);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 2, 0, 0, 0);
            Quake_SetDuration(i, timer);
            break;

        case 3290:
            D_80121F1C[0].atTargetInit = play->view.at;
            D_80121F1C[0].eyeTargetInit = play->view.eye;
            D_80121F1C[0].fovTargetInit = play->view.fovy;
            spA0 = Actor_GetFocus(actor);
            player->actor.shape.rot.y = player->actor.world.rot.y = player->yaw = spA0.rot.y;

            csInfo->keyFrames = D_80121F1C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121F1C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 12000);
            Quake_SetPerturbations(i, 0, 0, 1000, 0);
            Quake_SetDuration(i, 5);
            break;

        case 3340:
            D_80121FBC[0].atTargetInit = play->view.at;
            D_80121FBC[0].eyeTargetInit = play->view.eye;
            D_80121FBC[0].fovTargetInit = play->view.fovy;

            csInfo->keyFrames = D_80121FBC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80121FBC);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 12000);
            Quake_SetPerturbations(i, 0, 0, 1000, 0);
            Quake_SetDuration(i, 5);
            break;

        case 3360:
            csInfo->keyFrames = D_8012205C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012205C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3350:
            D_801220D4[0].atTargetInit = play->view.at;
            D_801220D4[0].eyeTargetInit = play->view.eye;
            D_801220D4[0].fovTargetInit = play->view.fovy;
            if (actor->world.pos.x > 0.0f) {
                D_801220D4[1].rollTargetInit = -D_801220D4[1].rollTargetInit;
                D_801220D4[2].rollTargetInit = -D_801220D4[2].rollTargetInit;
                D_801220D4[1].atTargetInit.x = -D_801220D4[1].atTargetInit.x;
                D_801220D4[1].atTargetInit.y = 50.0f;
                D_801220D4[1].eyeTargetInit.y = 80.0f;
                D_801220D4[1].eyeTargetInit.x = -D_801220D4[1].eyeTargetInit.x;
            }
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);

            csInfo->keyFrames = D_801220D4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801220D4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3330:
            csInfo->keyFrames = D_8012219C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012219C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3410:
            csInfo->keyFrames = D_801222B4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801222B4);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 4, 0, 0, 0);
            Quake_SetDuration(i, 20);
            break;

        case 3450:
            csInfo->keyFrames = D_8012237C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012237C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 2, 0, 0, 0);
            Quake_SetDuration(i, 10);
            break;

        case 3440:
            csInfo->keyFrames = D_801223CC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801223CC);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            player->stateFlags1 |= PLAYER_STATE1_29;
            player->actor.freezeTimer = 90;

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 2, 0, 0, 0);
            Quake_SetDuration(i, 10);
            break;

        case 3430:
            csInfo->keyFrames = D_801224BC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801224BC);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_1);
            Quake_SetSpeed(i, 32000);
            Quake_SetPerturbations(i, 1, 0, 10, 0);
            Quake_SetDuration(i, 20);
            break;

        case 4100:
            csInfo->keyFrames = D_801225D4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801225D4);

            player->actor.shape.rot.y = player->actor.world.rot.y = player->yaw = 0x3FFC;
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            break;

        case 4110:
            csInfo->keyFrames = D_8012269C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012269C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4120:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            D_80122714[1].timerInit = 80;
            csInfo->keyFrames = D_80122714;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122714);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4140:
            csInfo->keyFrames = D_801227B4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801227B4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            break;

        case 4150:
            csInfo->keyFrames = D_801228A4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801228A4);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4160:
            csInfo->keyFrames = D_8012296C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012296C);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4170:
            csInfo->keyFrames = D_80122A0C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122A0C);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4190:
            csInfo->keyFrames = D_80122A5C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122A5C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4200:
            csInfo->keyFrames = D_80122B9C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122B9C);

            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_8);
            Camera_RequestMode(mainCam, CAM_MODE_NORMAL);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4210:
            player->actor.freezeTimer = timer;

            csInfo->keyFrames = D_80122C14;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122C14);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 12000);
            Quake_SetPerturbations(i, 0, 1, 100, 0);
            Quake_SetDuration(i, timer - 80);
            break;

        case 4220:
            csInfo->keyFrames = (player->actor.world.pos.z < -15.0f) ? D_80122C3C : D_80122C64;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122C3C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            Player_SetCsAction(play, &player->actor, PLAYER_CSACTION_1);

            i = Quake_Request(subCam, QUAKE_TYPE_3);
            Quake_SetSpeed(i, 12000);
            Quake_SetPerturbations(i, 0, 1, 10, 0);
            Quake_SetDuration(i, timer - 10);
            break;

        case 4221:
            csInfo->keyFrames = D_80122C8C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122C8C);

            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3260:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            D_80122CB4[1].timerInit = timer - 5;

            csInfo->keyFrames = D_80122CB4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122CB4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 3261:
            Player_SetCsActionWithHaltedActors(play, NULL, PLAYER_CSACTION_8);
            D_80122D04[1].timerInit = timer - 10;

            csInfo->keyFrames = D_80122D04;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122D04);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 8010:
            csInfo->keyFrames = D_80122D54;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122D54);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 8002:
            csInfo->keyFrames = D_80122DCC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122DCC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 8700:
            spA0 = Actor_GetFocus(actor);
            sp8C = Actor_GetFocus(&player->actor);
            D_80122E44[timer & 1][0].atTargetInit.y = ((spA0.pos.y - sp8C.pos.y) / 10.0f) + 90.0f;
            D_80122E44[timer & 1][5].atTargetInit = mainCam->at;

            csInfo->keyFrames = D_80122E44[timer & 1];
            csInfo->keyFrameCount = ARRAY_COUNT(D_80122E44[0]);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 1100: {
            s32 tempDiff = play->state.frames - sPrevFrameCs1100;

            if ((tempDiff > 3600) || (tempDiff < -3600)) {
                csInfo->keyFrames = D_80123074;
                csInfo->keyFrameCount = ARRAY_COUNT(D_80123074);
            } else {
                if (play->state.frames & 1) {
                    D_8012313C[0].rollTargetInit = -D_8012313C[0].rollTargetInit;
                    D_8012313C[0].atTargetInit.y = -D_8012313C[0].atTargetInit.y;
                    D_8012313C[0].eyeTargetInit.y = -D_8012313C[0].eyeTargetInit.y;
                    D_8012313C[1].atTargetInit.y = -D_8012313C[1].atTargetInit.y;
                }
                csInfo->keyFrames = D_8012313C;
                csInfo->keyFrameCount = ARRAY_COUNT(D_8012313C);
            }
            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            sPrevFrameCs1100 = play->state.frames;

        } break;

        case 9806:
            subCam->timer = -99;
            if (Play_CamIsNotFixed(play)) {
                Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_TURN_AROUND);
                subCam->data2 = 0xC;
            } else {
                Play_CopyCamera(play, subCamId, CAM_ID_MAIN);
                Play_RequestCameraSetting(play, subCamId, CAM_SET_FREE2);
            }
            break;

        case 9908:
            if (Play_CamIsNotFixed(play)) {
                D_801231B4[0].eyeTargetInit.z = D_801231B4[1].eyeTargetInit.z = !LINK_IS_ADULT ? 100.0f : 120.0f;

                if (player->stateFlags1 & PLAYER_STATE1_27) {
                    D_801231B4[2].atTargetInit.z = 0.0f;
                }
                spA0 = Actor_GetWorldPosShapeRot(&player->actor);
                spD0 = OLib_Vec3fDiffToVecGeo(&spA0.pos, &mainCam->at);
                spD0.yaw -= spA0.rot.y;
                D_801231B4[3].atTargetInit = OLib_VecGeoToVec3f(&spD0);
                spD0 = OLib_Vec3fDiffToVecGeo(&spA0.pos, &mainCam->eye);
                spD0.yaw -= spA0.rot.y;
                D_801231B4[3].eyeTargetInit = OLib_VecGeoToVec3f(&spD0);
                D_801231B4[3].fovTargetInit = mainCam->fov;
                D_801231B4[3].timerInit = timer - 50;

                csInfo->keyFrames = D_801231B4;
                csInfo->keyFrameCount = ARRAY_COUNT(D_801231B4);

                Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            } else {
                D_80123254[1].timerInit = timer - 1;
                D_80123254[0].fovTargetInit = mainCam->fov;
                D_80123254[0].atTargetInit = D_80123254[1].atTargetInit = mainCam->at;
                D_80123254[0].eyeTargetInit = D_80123254[1].eyeTargetInit = mainCam->eye;

                csInfo->keyFrames = D_80123254;
                csInfo->keyFrameCount = ARRAY_COUNT(D_80123254);

                Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            }
            break;

        case 1000:
            D_801232A4[0].atTargetInit = play->view.at;
            D_801232A4[0].eyeTargetInit = play->view.eye;
            D_801232A4[0].fovTargetInit = play->view.fovy;

            csInfo->keyFrames = D_801232A4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801232A4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 8603:
            csInfo->keyFrames = D_801232CC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801232CC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 8604:
            csInfo->keyFrames = D_80123394;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80123394);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4000:
            csInfo->keyFrames = D_8012345C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012345C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4010:
            csInfo->keyFrames = D_801234FC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801234FC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4011:
            csInfo->keyFrames = D_801235C4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801235C4);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4020:
            csInfo->keyFrames = D_8012368C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012368C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4021:
            csInfo->keyFrames = D_8012372C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012372C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 4022:
            subCam->timer = D_801237CC[0].timerInit + D_801237CC[3].timerInit + D_801237CC[1].timerInit +
                            D_801237CC[2].timerInit + D_801237CC[4].timerInit;

            csInfo->keyFrames = D_801237CC;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801237CC);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 9703:
            D_80123894[0].atTargetInit = play->view.at;
            D_80123894[0].eyeTargetInit = play->view.eye;
            D_80123894[0].fovTargetInit = play->view.fovy;
            if (LINK_IS_ADULT) {
                D_80123894[1].atTargetInit.y = 60.0f;
                D_80123894[1].eyeTargetInit.y = 52.0f;
            }

            csInfo->keyFrames = D_80123894;
            csInfo->keyFrameCount = ARRAY_COUNT(D_80123894);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 9704:
            D_8012390C[0].atTargetInit = play->view.at;
            D_8012390C[0].eyeTargetInit = play->view.eye;
            D_8012390C[0].fovTargetInit = play->view.fovy;

            csInfo->keyFrames = D_8012390C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012390C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 9705:
            D_8012395C[0].atTargetInit = play->view.at;
            D_8012395C[0].eyeTargetInit = play->view.eye;
            D_8012395C[0].fovTargetInit = play->view.fovy;

            csInfo->keyFrames = D_8012395C;
            csInfo->keyFrameCount = ARRAY_COUNT(D_8012395C);

            Play_InitCameraDataUsingPlayer(play, subCamId, player, CAM_SET_CS_C);
            break;

        case 5110:
            D_801239D4[1].timerInit = 10;

            csInfo->keyFrames = D_801239D4;
            csInfo->keyFrameCount = ARRAY_COUNT(D_801239D4);

            Play_InitCameraDataUsingPlayer(play, subCamId, (Player*)actor, CAM_SET_CS_C);
            break;

        default:
            osSyncPrintf(VT_COL(RED, WHITE) "onepointdemo camera: demo number not found !! (%d)\n" VT_RST, csId);
            break;
    }
    return 0;
}

s16 OnePointCutscene_SetAsChild(PlayState* play, s16 newCamId, s16 parentCamId) {
    s16 prevCamId = play->cameraPtrs[parentCamId]->childCamId;

    play->cameraPtrs[newCamId]->parentCamId = parentCamId;
    play->cameraPtrs[parentCamId]->childCamId = newCamId;

    return prevCamId;
}

/**
 * Removes a cutscene camera from the list. Returns the parent cam if the removed camera is active, otherwise returns
 * CAM_ID_NONE
 */
s32 OnePointCutscene_RemoveCamera(PlayState* play, s16 subCamId) {
    Camera* subCam = play->cameraPtrs[subCamId];
    s32 nextCamId;

    if (subCam->camId == CHILD_CAM(subCam)->parentCamId) {
        CHILD_CAM(subCam)->parentCamId = subCam->parentCamId;
    }
    if (subCam->camId == PARENT_CAM(subCam)->childCamId) {
        PARENT_CAM(subCam)->childCamId = subCam->childCamId;
    }
    nextCamId = (play->activeCamId == subCamId) ? subCam->parentCamId : CAM_ID_NONE;
    subCam->parentCamId = CAM_ID_MAIN;
    subCam->childCamId = subCam->parentCamId;
    subCam->timer = -1;
    Play_ClearCamera(subCam->play, subCam->camId);
    return nextCamId;
}

#define vChildCamId temp2
#define vSubCamStatus temp1
#define vCurCamId temp2
#define vNextCamId temp1

/**
 * Creates a cutscene subcamera with the specified ID, duration, and targeted actor. The camera is placed into the
 * cutscene queue in front of the specified camera, then all lower priority demos in front of it are removed from the
 * queue.
 */
s16 OnePointCutscene_Init(PlayState* play, s16 csId, s16 timer, Actor* actor, s16 parentCamId) {
    s16 temp1;
    s16 temp2;
    s16 subCamId;
    Camera* subCam;

    if (parentCamId == CAM_ID_NONE) {
        parentCamId = play->activeCamId;
    }
    subCamId = Play_CreateSubCamera(play);
    if (subCamId == CAM_ID_NONE) {
        osSyncPrintf(VT_COL(RED, WHITE) "onepoint demo: error: too many cameras ... give up! type=%d\n" VT_RST, csId);
        return CAM_ID_NONE;
    }

    // Inserts the cutscene camera into the cutscene queue in front of parentCam

    vChildCamId = play->cameraPtrs[parentCamId]->childCamId;
    vSubCamStatus = CAM_STAT_ACTIVE;
    if (vChildCamId >= CAM_ID_SUB_FIRST) {
        OnePointCutscene_SetAsChild(play, vChildCamId, subCamId);
        vSubCamStatus = CAM_STAT_WAIT;
    } else {
        Interface_ChangeHudVisibilityMode(HUD_VISIBILITY_NOTHING_ALT);
    }
    OnePointCutscene_SetAsChild(play, subCamId, parentCamId);

    subCam = play->cameraPtrs[subCamId];

    subCam->timer = timer;
    subCam->target = actor;

    subCam->at = play->view.at;
    subCam->eye = play->view.eye;
    subCam->fov = play->view.fovy;

    subCam->csId = csId;

    if (parentCamId == CAM_ID_MAIN) {
        Play_ChangeCameraStatus(play, parentCamId, CAM_STAT_UNK3);
    } else {
        Play_ChangeCameraStatus(play, parentCamId, CAM_STAT_WAIT);
    }
    OnePointCutscene_SetInfo(play, subCamId, csId, actor, timer);
    Play_ChangeCameraStatus(play, subCamId, vSubCamStatus);

    // Removes all lower priority cutscenes in front of this cutscene from the queue.
    vCurCamId = subCamId;
    vNextCamId = play->cameraPtrs[subCamId]->childCamId;

    while (vNextCamId >= CAM_ID_SUB_FIRST) {
        s16 nextCsId = play->cameraPtrs[vNextCamId]->csId;
        s16 thisCsId = play->cameraPtrs[subCamId]->csId;

        if ((nextCsId / 100) < (thisCsId / 100)) {
            osSyncPrintf(VT_COL(YELLOW, BLACK) "onepointdemo camera[%d]: killed 'coz low priority (%d < %d)\n" VT_RST,
                         vNextCamId, nextCsId, thisCsId);
            if (play->cameraPtrs[vNextCamId]->csId != 5010) {
                if ((vNextCamId = OnePointCutscene_RemoveCamera(play, vNextCamId)) != CAM_ID_NONE) {
                    Play_ChangeCameraStatus(play, vNextCamId, CAM_STAT_ACTIVE);
                }
            } else {
                vCurCamId = vNextCamId;
                OnePointCutscene_EndCutscene(play, vNextCamId);
            }
        } else {
            vCurCamId = vNextCamId;
        }
        vNextCamId = play->cameraPtrs[vCurCamId]->childCamId;
    }
    return subCamId;
}

/**
 *  Ends the cutscene in subCamId by setting its timer to 0. For attention cutscenes, it is set to 5 instead.
 */
s16 OnePointCutscene_EndCutscene(PlayState* play, s16 subCamId) {
    if (subCamId == CAM_ID_NONE) {
        subCamId = play->activeCamId;
    }
    if (play->cameraPtrs[subCamId] != NULL) {
        osSyncPrintf("onepointdemo camera[%d]: delete timer=%d next=%d\n", subCamId, play->cameraPtrs[subCamId]->timer,
                     play->cameraPtrs[subCamId]->parentCamId);
        if (play->cameraPtrs[subCamId]->csId == 5010) {
            play->cameraPtrs[subCamId]->timer = 5;
        } else {
            play->cameraPtrs[subCamId]->timer = 0;
        }
    }
    return subCamId;
}

#define vTargetCat temp1
#define vParentCamId temp1
#define vLastHigherCat temp2
#define vSubCamId temp2

/**
 *  Adds an attention cutscene to the cutscene queue.
 */
s32 OnePointCutscene_Attention(PlayState* play, Actor* actor) {
    Camera* parentCam;
    s32 temp1;
    s32 temp2;
    s32 timer;

    if (sDisableAttention) {
        osSyncPrintf(VT_COL(YELLOW, BLACK) "actor attention demo camera: canceled by other camera\n" VT_RST);
        return CAM_ID_NONE;
    }
    sUnused = -1;

    parentCam = play->cameraPtrs[CAM_ID_MAIN];
    if (parentCam->mode == CAM_MODE_FOLLOW_BOOMERANG) {
        osSyncPrintf(VT_COL(YELLOW, BLACK) "actor attention demo camera: change mode BOOKEEPON -> NORMAL\n" VT_RST);
        Camera_RequestMode(parentCam, CAM_MODE_NORMAL);
    }

    // Finds the camera of the first actor attention demo with a lower category actor, or the first non-attention demo
    // after at least one attention demo.

    vLastHigherCat = -1;
    while (parentCam->childCamId != CAM_ID_MAIN) {
        parentCam = play->cameraPtrs[parentCam->childCamId];
        if (parentCam == NULL) {
            break;
        } else if (parentCam->setting != CAM_SET_CS_ATTENTION) {
            if (vLastHigherCat == -1) {
                continue;
            } else {
                break;
            }
        } else {
            vTargetCat = parentCam->target->category;
            if (actor->category > vTargetCat) {
                break;
            }
            vLastHigherCat = vTargetCat;
        }
    }
    // Actorcat is only undefined if the actor is in a higher category than all other attention cutscenes. In this case,
    // it goes in the first position of the list. Otherwise, it goes in the index found in the loop.
    vParentCamId = (vLastHigherCat == -1) ? CAM_ID_MAIN : parentCam->camId;

    switch (actor->category) {
        case ACTORCAT_SWITCH:
        case ACTORCAT_BG:
        case ACTORCAT_PLAYER:
        case ACTORCAT_PROP:
        case ACTORCAT_DOOR:
            timer = 30;
            break;
        case ACTORCAT_NPC:
        case ACTORCAT_ITEMACTION:
        case ACTORCAT_CHEST:
            timer = 100;
            break;
        case ACTORCAT_EXPLOSIVE:
        case ACTORCAT_ENEMY:
        case ACTORCAT_MISC:
        case ACTORCAT_BOSS:
        default:
            osSyncPrintf(VT_COL(YELLOW, BLACK) "actor attention demo camera: %d: unkown part of actor %d\n" VT_RST,
                         play->state.frames, actor->category);
            timer = 30;
            break;
    }
    osSyncPrintf(VT_FGCOL(CYAN) "%06u:" VT_RST " actor attention demo camera: request %d ", play->state.frames,
                 actor->category);

    // If the previous attention cutscene has an actor in the same category, skip this actor.
    if (actor->category == vLastHigherCat) {
        osSyncPrintf("→ " VT_FGCOL(MAGENTA) "×" VT_RST " (%d)\n", actor->id);
        return CAM_ID_NONE;
    }
    osSyncPrintf("→ " VT_FGCOL(BLUE) "○" VT_RST " (%d)\n", actor->id);
    vSubCamId = OnePointCutscene_Init(play, 5010, timer, actor, vParentCamId);
    if (vSubCamId == CAM_ID_NONE) {
        osSyncPrintf(VT_COL(RED, WHITE) "actor attention demo: give up! \n" VT_RST, actor->id);
        return CAM_ID_NONE;
    } else {
        s32* data = (s32*)&play->cameraPtrs[vSubCamId]->data1;

        *data = NA_SE_SY_CORRECT_CHIME;
        return vSubCamId;
    }
}

/**
 *  Adds an attention cutscene to the cutscene queue with the specified sound effect
 */
s32 OnePointCutscene_AttentionSetSfx(PlayState* play, Actor* actor, s32 sfxId) {
    s32 subCamId = OnePointCutscene_Attention(play, actor);

    if (subCamId != CAM_ID_NONE) {
        s32* data = (s32*)&play->cameraPtrs[subCamId]->data1;

        *data = sfxId;
    }
    return subCamId;
}

// unused
void OnePointCutscene_EnableAttention(void) {
    sDisableAttention = false;
}

// unused
void OnePointCutscene_DisableAttention(void) {
    sDisableAttention = true;
}

s32 OnePointCutscene_CheckForCategory(PlayState* play, s32 actorCategory) {
    Camera* parentCam = play->cameraPtrs[CAM_ID_MAIN];

    while (parentCam->childCamId != CAM_ID_MAIN) {
        parentCam = play->cameraPtrs[parentCam->childCamId];
        if ((parentCam == NULL) || (parentCam->setting != CAM_SET_CS_ATTENTION)) {
            break;
        } else if (actorCategory == parentCam->target->category) {
            return true;
        }
    }
    return false;
}

// unused, also empty.
void OnePointCutscene_Noop(PlayState* play, s32 arg1) {
}
