#include "gameplay_keep.h"
#include "extracted/ntsc-1.2/assets/misc/link_animetion/link_animetion.h"

#include "array_count.h"
#include "camera.h"
#include "gfx.h"
#include "stdbool.h"
#include "sys_matrix.h"
#include "ultra64.h"

u64 gHilite1Tex[TEX_LEN(u64, gHilite1Tex_WIDTH, gHilite1Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gHilite1Tex.rgba16.inc.c"
};

u64 gHilite2Tex[TEX_LEN(u64, gHilite2Tex_WIDTH, gHilite2Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gHilite2Tex.rgba16.inc.c"
};

u64 gHylianShieldDesignTex[TEX_LEN(u64, gHylianShieldDesignTex_WIDTH, gHylianShieldDesignTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gHylianShieldDesignTex.rgba16.inc.c"
};

u64 gOcarinaofTimeDesignTex[TEX_LEN(u64, gOcarinaofTimeDesignTex_WIDTH, gOcarinaofTimeDesignTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gOcarinaofTimeDesignTex.rgba16.inc.c"
};

u64 gBottleGlassTex[TEX_LEN(u64, gBottleGlassTex_WIDTH, gBottleGlassTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gBottleGlassTex.rgba16.inc.c"
};

u64 gDekuStickTex[TEX_LEN(u64, gDekuStickTex_WIDTH, gDekuStickTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDekuStickTex.i8.inc.c"
};

u64 gLinkHairTex[TEX_LEN(u64, gLinkHairTex_WIDTH, gLinkHairTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gLinkHairTex.rgba16.inc.c"
};

u64 gLinkTunic1Tex[TEX_LEN(u64, gLinkTunic1Tex_WIDTH, gLinkTunic1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gLinkTunic1Tex.i8.inc.c"
};

u64 gLinkTunic2Tex[TEX_LEN(u64, gLinkTunic2Tex_WIDTH, gLinkTunic2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gLinkTunic2Tex.i8.inc.c"
};

u64 gLinkTunic3Tex[TEX_LEN(u64, gLinkTunic3Tex_WIDTH, gLinkTunic3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gLinkTunic3Tex.i8.inc.c"
};

Vec3s gLinkPauseChildJointTable[] = {
#include "assets/objects/gameplay_keep/gLinkPauseChildJointTable.inc.c"
};

Vec3s gLinkPauseChildDekuShieldJointTable[] = {
#include "assets/objects/gameplay_keep/gLinkPauseChildDekuShieldJointTable.inc.c"
};

Vec3s gLinkPauseAdultBgsJointTable[] = {
#include "assets/objects/gameplay_keep/gLinkPauseAdultBgsJointTable.inc.c"
};

Vec3s gLinkPauseAdultJointTable[] = {
#include "assets/objects/gameplay_keep/gLinkPauseAdultJointTable.inc.c"
};

Vec3s gLinkPauseAdultShieldJointTable[] = {
#include "assets/objects/gameplay_keep/gLinkPauseAdultShieldJointTable.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_DDbox_open = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_DDbox_open.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_Tbox_open = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_Tbox_open.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_atozusari = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_atozusari.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_bashi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_bashi.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_doorA_link = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_doorA_link.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_doorB_link = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_doorB_link.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_futtobi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_futtobi.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_get1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_get1.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_get2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_get2.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_get3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_get3.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_goto_future = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_goto_future.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_koutai = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_koutai.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_koutai_kennuki = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_koutai_kennuki.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_koutai_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_koutai_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_mimawasi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_mimawasi.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_mimawasi_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_mimawasi_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_miokuri = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_miokuri.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_miokuri_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_miokuri_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_nozoki = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_nozoki.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_return_to_future = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_return_to_future.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_standup = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_standup.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_demo_standup_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_demo_standup_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_endAL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_endAL.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_endAR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_endAR.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_endBL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_endBL.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_endBR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_endBR.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_startA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_startA.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_startB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_startB.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_upL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_upL.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_climb_upR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_climb_upR.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_normal_defense_ALL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_normal_defense_ALL.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_negaeri = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_negaeri.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_okiagari = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_okiagari.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_tatiagari = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_tatiagari.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_wait1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_wait1.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_wait2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_wait2.inc.c"
};

LinkAnimationHeader gPlayerAnim_clink_op3_wait3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_clink_op3_wait3.inc.c"
};

LinkAnimationHeader gPlayerAnim_d_link_imanodare = {
#include "assets/objects/gameplay_keep/gPlayerAnim_d_link_imanodare.inc.c"
};

LinkAnimationHeader gPlayerAnim_d_link_orooro = {
#include "assets/objects/gameplay_keep/gPlayerAnim_d_link_orooro.inc.c"
};

LinkAnimationHeader gPlayerAnim_d_link_orowait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_d_link_orowait.inc.c"
};

LinkAnimationHeader gPlayerAnim_demo_link_nwait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_demo_link_nwait.inc.c"
};

LinkAnimationHeader gPlayerAnim_demo_link_orosuu = {
#include "assets/objects/gameplay_keep/gPlayerAnim_demo_link_orosuu.inc.c"
};

LinkAnimationHeader gPlayerAnim_demo_link_tewatashi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_demo_link_tewatashi.inc.c"
};

LinkAnimationHeader gPlayerAnim_demo_link_twait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_demo_link_twait.inc.c"
};

LinkAnimationHeader gPlayerAnim_kolink_odoroki_demo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_kolink_odoroki_demo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_LLside_kiru_endL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_LLside_kiru_endL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_LLside_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_LLside_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_LRside_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_LRside_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_LRside_kiru_finsh_endL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_LRside_kiru_finsh_endL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lnormal_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lnormal_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lnormal_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lnormal_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lpierce_kiru_endL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lpierce_kiru_endL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lpierce_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lpierce_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lrolling_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lrolling_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lside_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lside_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Lside_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Lside_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Rside_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Rside_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_Rside_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_Rside_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_anchor2fighter = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_anchor2fighter.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_back_brake = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_back_brake.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_back_hitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_back_hitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_back_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_back_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_bom_side_walkL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_bom_side_walkL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_bom_side_walkR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_bom_side_walkR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_defense_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_defense_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_defense_long_hitL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_defense_long_hitL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_defense_long_hitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_defense_long_hitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_front_hitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_front_hitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_jump_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_jump_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_landingR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_landingR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_normal_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_normal_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_pierce_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_pierce_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_pierce_kiru_finsh_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_pierce_kiru_finsh_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_power_kiru_wait_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_power_kiru_wait_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_rolling_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_rolling_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_side_walkL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_side_walkL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_side_walkR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_side_walkR.inc.c"
};

LinkAnimationHeader gPlayerAnim_002578 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002578.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL2defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL2defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL2defense_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL2defense_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL_defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL_defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL_defense_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL_defense_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_0025A8 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_0025A8.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitL_pierce_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitL_pierce_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_0025B8 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_0025B8.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR2defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR2defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR2defense_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR2defense_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR_defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR_defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR_defense_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR_defense_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_0025E8 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_0025E8.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_anchor_waitR_pierce_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_anchor_waitR_pierce_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_catch = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_catch.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throwL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throwL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throwR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throwR.inc.c"
};

LinkAnimationHeader gPlayerAnim_002610 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002610.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throw_side_walkL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throw_side_walkL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throw_side_walkR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throw_side_walkR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throw_wait2waitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throw_wait2waitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throw_waitL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throw_waitL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_boom_throw_waitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_boom_throw_waitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_bug_in = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_bug_in.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_bug_miss = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_bug_miss.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_bug_out = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_bug_out.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_drink_demo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_drink_demo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_drink_demo_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_drink_demo_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_drink_demo_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_drink_demo_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_drink_demo_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_drink_demo_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_fish_in = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_fish_in.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_fish_miss = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_fish_miss.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_fish_out = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_fish_out.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_read = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_read.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bottle_read_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bottle_read_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_bow_ready = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_bow_ready.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_bow_shoot = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_bow_shoot.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_bow_shoot_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_bow_shoot_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_bow_shoot_next = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_bow_shoot_next.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_bow_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_bow_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_defense_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_defense_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_side_runL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_side_runL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_side_runR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_side_runR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_side_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_side_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_bow_walk2ready = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_bow_walk2ready.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_child_tunnel_door = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_child_tunnel_door.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_child_tunnel_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_child_tunnel_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_child_tunnel_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_child_tunnel_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_DDbox_open = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_DDbox_open.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_Tbox_open = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_Tbox_open.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_back_to_past = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_back_to_past.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_baru_op1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_baru_op1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_baru_op2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_baru_op2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_baru_op3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_baru_op3.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_bikkuri = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_bikkuri.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_doorA_link = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_doorA_link.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_doorA_link_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_doorA_link_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_doorB_link = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_doorB_link.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_doorB_link_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_doorB_link_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_furimuki2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_furimuki2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_furimuki2_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_furimuki2_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_furimuki = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_furimuki.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_get_itemA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_get_itemA.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_get_itemB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_get_itemB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_goma_furimuki = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_goma_furimuki.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_gurad = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_gurad.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_gurad_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_gurad_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_jibunmiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_jibunmiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kakeyori = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kakeyori.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kakeyori_mimawasi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kakeyori_mimawasi.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kakeyori_miokuri = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kakeyori_miokuri.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kakeyori_miokuri_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kakeyori_miokuri_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kakeyori_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kakeyori_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kaoage = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kaoage.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kaoage_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kaoage_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kenmiru1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kenmiru1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kenmiru1_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kenmiru1_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kenmiru2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kenmiru2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kenmiru2_modori = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kenmiru2_modori.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kenmiru2_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kenmiru2_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_kousan = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_kousan.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_look_hand = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_look_hand.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_look_hand_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_look_hand_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_nozokikomi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_nozokikomi.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_nozokikomi_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_nozokikomi_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_return_to_past = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_return_to_past.inc.c"
};

LinkAnimationHeader gPlayerAnim_002840 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002840.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_sita_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_sita_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_ue = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_ue.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_ue_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_ue_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_warp = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_warp.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_zeldamiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_zeldamiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_demo_zeldamiru_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_demo_zeldamiru_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_derth_rebirth = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_derth_rebirth.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LLside_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LLside_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LLside_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LLside_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LLside_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LLside_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LLside_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LLside_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LRside_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LRside_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LRside_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LRside_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LRside_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LRside_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_LRside_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_LRside_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lnormal_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lnormal_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lnormal_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lnormal_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lnormal_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lnormal_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lnormal_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lnormal_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpierce_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpierce_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpierce_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpierce_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpierce_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpierce_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpierce_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpierce_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_jump_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_jump_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_jump_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_jump_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_jump_kiru_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_jump_kiru_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_kiru_side_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_kiru_side_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_kiru_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_kiru_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_kiru_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_kiru_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_kiru_wait_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_kiru_wait_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lpower_kiru_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lpower_kiru_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lrolling_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lrolling_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lrolling_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lrolling_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_jump_endL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_jump_endL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_jump_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_jump_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Lside_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Lside_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_jump_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_jump_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_jump_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_jump_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Rside_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Rside_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Wrolling_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Wrolling_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_Wrolling_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_Wrolling_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_backturn_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_backturn_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_backturn_jump_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_backturn_jump_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_backturn_jump_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_backturn_jump_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_damage_run = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_damage_run.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_damage_run_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_damage_run_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_defense_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_defense_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_defense_long_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_defense_long_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_defense_long_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_defense_long_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_defense_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_defense_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_fighter2long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_fighter2long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_front_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_front_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_front_jump_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_front_jump_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_front_jump_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_front_jump_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_heavy_run_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_heavy_run_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_jump_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_jump_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_jump_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_jump_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_jump_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_jump_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_jump_rollkiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_jump_rollkiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_landing_roll_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_landing_roll_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal2fighter = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal2fighter.inc.c"
};

LinkAnimationHeader gPlayerAnim_002A78 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002A78.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal_kiru_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal_kiru_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_normal_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_normal_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_pierce_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_pierce_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_pierce_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_pierce_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_pierce_kiru_finsh = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_pierce_kiru_finsh.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_pierce_kiru_finsh_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_pierce_kiru_finsh_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_jump_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_jump_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_002AD0 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002AD0.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_side_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_side_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_startL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_startL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_wait_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_wait_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_power_kiru_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_power_kiru_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_reboundR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_reboundR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_rebound = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_rebound.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_rebound_longR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_rebound_longR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_rebound_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_rebound_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_rolling_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_rolling_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_rolling_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_rolling_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_run = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_run.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_run_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_run_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_002B48 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002B48.inc.c"
};

LinkAnimationHeader gPlayerAnim_002B50 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002B50.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_side_walkL_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_side_walkL_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_side_walkR_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_side_walkR_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_side_walk_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_side_walk_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_turn_kiruL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_turn_kiruL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_turn_kiruL_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_turn_kiruL_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_turn_kiruR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_turn_kiruR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_turn_kiruR_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_turn_kiruR_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_upper_kiruR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_upper_kiruR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_upper_pierce_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_upper_pierce_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_upper_pierce_kiru_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_upper_pierce_kiru_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_wait2waitL_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_wait2waitL_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_wait2waitR_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_wait2waitR_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_waitL2wait_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_waitL2wait_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_waitL_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_waitL_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_waitR2wait_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_waitR2wait_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_waitR_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_waitR_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_002BD8 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002BD8.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_wait_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_wait_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_walk_endL_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_walk_endL_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_walk_endR_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_walk_endR_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fighter_walk_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fighter_walk_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_fish_catch = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_fish_catch.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_fish_catch_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_fish_catch_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_reel_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_reel_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_reel_left = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_reel_left.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_reel_right = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_reel_right.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_reel_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_reel_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_throw = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_throw.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_fishing_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_fishing_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_hit_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_hit_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_hit_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_hit_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_long2free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_long2free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_long2long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_long2long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_normal2long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_normal2long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_side_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_side_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_side_hit_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_side_hit_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hammer_side_hit_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hammer_side_hit_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hatto_demo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hatto_demo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_fly_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_fly_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_fly_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_fly_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_shot_ready = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_shot_ready.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_side_runL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_side_runL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_side_runR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_side_runR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_side_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_side_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_hook_walk2ready = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_hook_walk2ready.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_last_hit_motion1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_last_hit_motion1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_last_hit_motion2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_last_hit_motion2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_honoo1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_honoo1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_honoo2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_honoo2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_honoo3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_honoo3.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_kaze1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_kaze1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_kaze2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_kaze2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_kaze3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_kaze3.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_tamashii1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_tamashii1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_tamashii2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_tamashii2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_tamashii3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_tamashii3.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_tame = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_tame.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_magic_tame_kaijyo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_magic_tame_kaijyo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_100step_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_100step_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_150step_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_150step_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_250jump_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_250jump_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_002D50 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_002D50.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_45_turn = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_45_turn.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_45_turn_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_45_turn_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_hold2upL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_hold2upL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_sideL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_sideL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_sideR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_sideR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_startA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_startA.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_startB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_startB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_upL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_upL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_Fclimb_upR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_Fclimb_upR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_brake = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_brake.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_brake_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_brake_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_downA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_downA.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_downB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_downB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_down_wake = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_down_wake.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_run = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_run.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_shitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_shitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_shit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_shit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_back_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_back_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_backspace = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_backspace.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_box_kick = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_box_kick.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_carryB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_carryB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_carryB_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_carryB_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_carryB_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_carryB_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check_end_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check_end_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_check_wait_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_check_wait_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_endAL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_endAL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_endAR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_endAR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_endBL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_endBL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_endBR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_endBR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_startA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_startA.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_startB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_startB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_upL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_upL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_upR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_upR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_climb_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_climb_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_damage_run_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_damage_run_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_end_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_end_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_kiru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_kiru.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_defense_wait_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_defense_wait_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_down_slope_slip = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_down_slope_slip.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_down_slope_slip_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_down_slope_slip_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_down_slope_slip_end_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_down_slope_slip_end_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_down_slope_slip_end_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_down_slope_slip_end_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_electric_shock = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_electric_shock.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_electric_shock_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_electric_shock_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_fall = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_fall.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_fall_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_fall_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_fall_up_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_fall_up_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_fall_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_fall_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_fighter2free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_fighter2free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_free2bom = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_free2bom.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_free2fighter_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_free2fighter_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_free2freeB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_free2freeB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_free2free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_free2free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_downA = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_downA.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_downB = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_downB.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_down_wake = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_down_wake.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_shitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_shitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_front_shit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_front_shit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_give_other = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_give_other.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_hang_up_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_hang_up_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_heavy_carry = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_heavy_carry.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_heavy_carry_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_heavy_carry_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_heavy_run = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_heavy_run.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_heavy_run_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_heavy_run_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_hip_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_hip_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_hip_down_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_hip_down_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_hip_down_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_hip_down_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_ice_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_ice_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump2landing = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump2landing.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_hold = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_hold.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_hold_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_hold_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_up_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_up_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_climb_wait_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_climb_wait_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_jump_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_jump_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_landing = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_landing.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_landing_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_landing_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_landing_roll = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_landing_roll.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_landing_roll_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_landing_roll_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_landing_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_landing_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_light_bom = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_light_bom.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_light_bom_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_light_bom_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_long2bom = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_long2bom.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_nocarry_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_nocarry_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_nocarry_free_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_nocarry_free_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_nocarry_free_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_nocarry_free_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_normal2bom = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_normal2bom.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_normal2fighter = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_normal2fighter.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_normal2fighter_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_normal2fighter_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_normal2free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_normal2free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_okarina_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_okarina_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_okarina_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_okarina_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_okarina_swing = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_okarina_swing.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pull_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pull_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pull_end_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pull_end_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pull_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pull_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pull_start_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pull_start_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pulling = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pulling.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pulling_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pulling_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_push_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_push_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_push_fall = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_push_fall.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_push_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_push_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_push_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_push_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_push_wait_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_push_wait_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_pushing = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_pushing.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_put = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_put.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_put_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_put_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_re_dead_attack = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_re_dead_attack.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_re_dead_attack_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_re_dead_attack_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_rebound = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_rebound.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run_jump = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run_jump.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run_jump_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run_jump_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run_jump_water_fall = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run_jump_water_fall.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_run_jump_water_fall_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_run_jump_water_fall_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_short_landing = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_short_landing.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_short_landing_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_short_landing_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_side_walkL_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_side_walkL_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_side_walkR_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_side_walkR_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_side_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_side_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_side_walk_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_side_walk_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_take_out = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_take_out.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_talk_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_talk_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_talk_free_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_talk_free_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_talk_navi = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_talk_navi.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_talk_navi_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_talk_navi_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_throw = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_throw.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_throw_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_throw_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_up_slope_slip = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_up_slope_slip.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_up_slope_slip_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_up_slope_slip_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_up_slope_slip_end_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_up_slope_slip_end_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_up_slope_slip_end_long = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_up_slope_slip_end_long.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait2waitL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait2waitL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait2waitR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait2waitR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitF_typeA_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitF_typeA_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitF_typeB_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitF_typeB_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitF_typeC_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitF_typeC_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitL2wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitL2wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitL_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitL_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitR2wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitR2wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_waitR_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_waitR_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait_typeA_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait_typeA_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait_typeB_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait_typeB_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wait_typeC_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wait_typeC_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_wakeup = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_wakeup.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk_endL = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk_endL.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk_endL_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk_endL_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk_endR = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk_endR.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk_endR_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk_endR_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_normal_walk_free = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_normal_walk_free.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_okarina_warp_goal = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_okarina_warp_goal.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_okiru_demo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_okiru_demo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_shagamu_demo = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_shagamu_demo.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_silver_carry = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_silver_carry.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_silver_throw = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_silver_throw.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_silver_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_silver_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_Lside_swim = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_Lside_swim.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_Rside_swim = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_Rside_swim.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_back_swim = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_back_swim.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_land2swim_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_land2swim_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_15step_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_15step_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_dead = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_dead.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_deep_end = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_deep_end.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_deep_start = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_deep_start.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_get = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_get.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_hit = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_hit.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_swim_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_swim_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_swimer_wait2swim_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_swimer_wait2swim_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_fastrun = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_fastrun.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_fastrun_muti = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_fastrun_muti.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_jump100 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_jump100.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_jump200 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_jump200.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_slowrun = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_slowrun.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_slowrun_muti = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_slowrun_muti.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_stand = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_stand.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_stop = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_stop.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_walk2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_walk2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_walk = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_walk.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_anim_walk_muti = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_anim_walk_muti.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_left_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_left_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_left_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_left_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_right_down = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_right_down.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_right_up = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_right_up.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_stop_muti = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_stop_muti.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_wait_1 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_wait_1.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_wait_2 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_wait_2.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_uma_wait_3 = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_uma_wait_3.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_waitF_heat1_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_waitF_heat1_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_waitF_heat2_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_waitF_heat2_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_waitF_itemA_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_waitF_itemA_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_waitF_itemB_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_waitF_itemB_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_waitF_typeD_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_waitF_typeD_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_heat1_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_heat1_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_heat2_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_heat2_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_itemA_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_itemA_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_itemB_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_itemB_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_itemC_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_itemC_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_itemD1_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_itemD1_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_itemD2_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_itemD2_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_link_wait_typeD_20f = {
#include "assets/objects/gameplay_keep/gPlayerAnim_link_wait_typeD_20f.inc.c"
};

LinkAnimationHeader gPlayerAnim_lkt_nwait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_lkt_nwait.inc.c"
};

LinkAnimationHeader gPlayerAnim_nw_modoru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_nw_modoru.inc.c"
};

LinkAnimationHeader gPlayerAnim_o_get_ato = {
#include "assets/objects/gameplay_keep/gPlayerAnim_o_get_ato.inc.c"
};

LinkAnimationHeader gPlayerAnim_o_get_mae = {
#include "assets/objects/gameplay_keep/gPlayerAnim_o_get_mae.inc.c"
};

LinkAnimationHeader gPlayerAnim_om_get = {
#include "assets/objects/gameplay_keep/gPlayerAnim_om_get.inc.c"
};

LinkAnimationHeader gPlayerAnim_om_get_mae = {
#include "assets/objects/gameplay_keep/gPlayerAnim_om_get_mae.inc.c"
};

LinkAnimationHeader gPlayerAnim_sude_nwait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_sude_nwait.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_1kyoro = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_1kyoro.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_2kyoro = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_2kyoro.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_bouzen = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_bouzen.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_hajikareru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_hajikareru.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_kamaeru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_kamaeru.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_ken_miru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_ken_miru.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_kennasi_w = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_kennasi_w.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_kw = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_kw.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_mukinaoru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_mukinaoru.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_okarina_get = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_okarina_get.inc.c"
};

LinkAnimationHeader gPlayerAnim_L_sagaru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_L_sagaru.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_ha = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_ha.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_m_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_m_wait.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_miageru = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_miageru.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_muku = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_muku.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_otituku_w = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_otituku_w.inc.c"
};

LinkAnimationHeader gPlayerAnim_Link_ue_wait = {
#include "assets/objects/gameplay_keep/gPlayerAnim_Link_ue_wait.inc.c"
};

u8 gameplay_keep_zeros_0034F8[8] = { 0 };

Vtx gDebugPyramidVtx[] = {
#include "assets/objects/gameplay_keep/gDebugPyramidVtx.inc.c"
};

Gfx gDebugPyramidDL[6] = {
#include "assets/objects/gameplay_keep/gDebugPyramidDL.inc.c"
};

u64 gDebugCircleTex[TEX_LEN(u64, gDebugCircleTex_WIDTH, gDebugCircleTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDebugCircleTex.i8.inc.c"
};

u64 gDebugBallTex[TEX_LEN(u64, gDebugBallTex_WIDTH, gDebugBallTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDebugBallTex.i8.inc.c"
};

u64 gDebugCursorTex[TEX_LEN(u64, gDebugCursorTex_WIDTH, gDebugCursorTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDebugCursorTex.i8.inc.c"
};

u64 gDebugCrossTex[TEX_LEN(u64, gDebugCrossTex_WIDTH, gDebugCrossTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDebugCrossTex.i8.inc.c"
};

Gfx gDebugArrowDL[12] = {
#include "assets/objects/gameplay_keep/gDebugArrowDL.inc.c"
};

Vtx gDebugArrowVtx[] = {
#include "assets/objects/gameplay_keep/gDebugArrowVtx.inc.c"
};

Gfx gDebugCameraDL[15] = {
#include "assets/objects/gameplay_keep/gDebugCameraDL.inc.c"
};

Vtx gDebugCameraVtx[] = {
#include "assets/objects/gameplay_keep/gDebugCameraVtx.inc.c"
};

Vtx gDebugCheckeredFloorVtx[] = {
#include "assets/objects/gameplay_keep/gDebugCheckeredFloorVtx.inc.c"
};

Gfx gDebugCheckeredFloorDL[18] = {
#include "assets/objects/gameplay_keep/gDebugCheckeredFloorDL.inc.c"
};

u64 gDebugCheckeredFloorTex[TEX_LEN(u64, gDebugCheckeredFloorTex_WIDTH, gDebugCheckeredFloorTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gDebugCheckeredFloorTex.ia4.inc.c"
};

Vtx gDebugSpriteVtx[] = {
#include "assets/objects/gameplay_keep/gDebugSpriteVtx.inc.c"
};

Gfx gDebugSpriteDL[3] = {
#include "assets/objects/gameplay_keep/gDebugSpriteDL.inc.c"
};

s16 gArrow1FrameData[] = {
#include "assets/objects/gameplay_keep/gArrow1FrameData.inc.c"
};

JointIndex gArrow1JointIndices[] = {
#include "assets/objects/gameplay_keep/gArrow1JointIndices.inc.c"
};

AnimationHeader gArrow1Anim = {
#include "assets/objects/gameplay_keep/gArrow1Anim.inc.c"
};

s16 gArrow2FrameData[] = {
#include "assets/objects/gameplay_keep/gArrow2FrameData.inc.c"
};

JointIndex gArrow2JointIndices[] = {
#include "assets/objects/gameplay_keep/gArrow2JointIndices.inc.c"
};

AnimationHeader gArrow2Anim = {
#include "assets/objects/gameplay_keep/gArrow2Anim.inc.c"
};

u8 gameplay_keep_zeros_00437C[4] = { 0 };

u64 gArrowShaftTex[TEX_LEN(u64, gArrowShaftTex_WIDTH, gArrowShaftTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gArrowShaftTex.rgba16.inc.c"
};

u64 gArrowFletchingTex[TEX_LEN(u64, gArrowFletchingTex_WIDTH, gArrowFletchingTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gArrowFletchingTex.rgba16.inc.c"
};

Vtx gArrowNearVtx[] = {
#include "assets/objects/gameplay_keep/gArrowNearVtx.inc.c"
};

Gfx gArrowNearDL[60] = {
#include "assets/objects/gameplay_keep/gArrowNearDL.inc.c"
};

Vtx gArrowFarVtx[] = {
#include "assets/objects/gameplay_keep/gArrowFarVtx.inc.c"
};

Gfx gArrowFarDL[52] = {
#include "assets/objects/gameplay_keep/gArrowFarDL.inc.c"
};

LodLimb gameplay_keep_005FC0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_005FC0_Limb.inc.c"
};

LodLimb gameplay_keep_005FD0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_005FD0_Limb.inc.c"
};

LodLimb gameplay_keep_005FE0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_005FE0_Limb.inc.c"
};

LodLimb gameplay_keep_005FF0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_005FF0_Limb.inc.c"
};

void* gArrowLimbs[] = {
#include "assets/objects/gameplay_keep/gArrowLimbs.inc.c"
};

SkeletonHeader gArrowSkel = {
#include "assets/objects/gameplay_keep/gArrowSkel.inc.c"
};

u8 gameplay_keep_zeros_006018[8] = { 0 };

u64 gUnknownEffBlureTex[TEX_LEN(u64, gUnknownEffBlureTex_WIDTH, gUnknownEffBlureTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffBlureTex.i8.inc.c"
};

u64 gBombBodyTex[TEX_LEN(u64, gBombBodyTex_WIDTH, gBombBodyTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gBombBodyTex.ia8.inc.c"
};

Vtx gBombBodyVtx[] = {
#include "assets/objects/gameplay_keep/gBombBodyVtx.inc.c"
};

Gfx gBombBodyDL[17] = {
#include "assets/objects/gameplay_keep/gBombBodyDL.inc.c"
};

u8 gameplay_keep_zeros_0078E8[8] = { 0 };

u64 gBombCapTex[TEX_LEN(u64, gBombCapTex_WIDTH, gBombCapTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gBombCapTex.rgba16.inc.c"
};

Vtx gBombCapVtx[] = {
#include "assets/objects/gameplay_keep/gBombCapVtx.inc.c"
};

Gfx gBombCapDL[24] = {
#include "assets/objects/gameplay_keep/gBombCapDL.inc.c"
};

u64 gBombchuBodyTex[TEX_LEN(u64, gBombchuBodyTex_WIDTH, gBombchuBodyTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gBombchuBodyTex.rgba16.inc.c"
};

Vtx gBombchuVtx[] = {
#include "assets/objects/gameplay_keep/gBombchuVtx.inc.c"
};

Gfx gBombchuDL[45] = {
#include "assets/objects/gameplay_keep/gBombchuDL.inc.c"
};

u8 gameplay_keep_zeros_007F78[8] = { 0 };

u64 gEffBombExplosion1Tex[TEX_LEN(u64, gEffBombExplosion1Tex_WIDTH, gEffBombExplosion1Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion1Tex.ia16.inc.c"
};

u64 gEffBombExplosion2Tex[TEX_LEN(u64, gEffBombExplosion2Tex_WIDTH, gEffBombExplosion2Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion2Tex.ia16.inc.c"
};

u64 gEffBombExplosion3Tex[TEX_LEN(u64, gEffBombExplosion3Tex_WIDTH, gEffBombExplosion3Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion3Tex.ia16.inc.c"
};

u64 gEffBombExplosion4Tex[TEX_LEN(u64, gEffBombExplosion4Tex_WIDTH, gEffBombExplosion4Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion4Tex.ia16.inc.c"
};

u64 gEffBombExplosion5Tex[TEX_LEN(u64, gEffBombExplosion5Tex_WIDTH, gEffBombExplosion5Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion5Tex.ia16.inc.c"
};

u64 gEffBombExplosion6Tex[TEX_LEN(u64, gEffBombExplosion6Tex_WIDTH, gEffBombExplosion6Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion6Tex.ia16.inc.c"
};

u64 gEffBombExplosion7Tex[TEX_LEN(u64, gEffBombExplosion7Tex_WIDTH, gEffBombExplosion7Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion7Tex.ia16.inc.c"
};

u64 gEffBombExplosion8Tex[TEX_LEN(u64, gEffBombExplosion8Tex_WIDTH, gEffBombExplosion8Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion8Tex.ia16.inc.c"
};

Gfx gEffBombExplosion1DL[13] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion1DL.inc.c"
};

Gfx gEffBombExplosion2DL[11] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion2DL.inc.c"
};

Gfx gEffBombExplosion3DL[3] = {
#include "assets/objects/gameplay_keep/gEffBombExplosion3DL.inc.c"
};

Vtx gEffBombExplosionVtx[] = {
#include "assets/objects/gameplay_keep/gEffBombExplosionVtx.inc.c"
};

u8 gameplay_keep_zeros_00C098[8] = { 0 };

Vtx gEffFragments1Vtx[] = {
#include "assets/objects/gameplay_keep/gEffFragments1Vtx.inc.c"
};

Gfx gEffFragments1DL[18] = {
#include "assets/objects/gameplay_keep/gEffFragments1DL.inc.c"
};

u64 gWitheredLeafTex[TEX_LEN(u64, gWitheredLeafTex_WIDTH, gWitheredLeafTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gWitheredLeafTex.rgba16.inc.c"
};

Vtx gBoomerangVtx[] = {
#include "assets/objects/gameplay_keep/gBoomerangVtx.inc.c"
};

Gfx gUnknownBlankDL[1] = {
#include "assets/objects/gameplay_keep/gUnknownBlankDL.inc.c"
};

Gfx gBoomerangDL[46] = {
#include "assets/objects/gameplay_keep/gBoomerangDL.inc.c"
};

Gfx gBoomerangRefDL[2] = {
#include "assets/objects/gameplay_keep/gBoomerangRefDL.inc.c"
};

u8 gameplay_keep_zeros_00C818[8] = { 0 };

Gfx gCompassArrowDL[5] = {
#include "assets/objects/gameplay_keep/gCompassArrowDL.inc.c"
};

Vtx gCompassArrowVtx[] = {
#include "assets/objects/gameplay_keep/gCompassArrowVtx.inc.c"
};

u8 gameplay_keep_zeros_00C878[8] = { 0 };

Vtx gameplay_keep_Vtx_00C880[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_00C880.inc.c"
};

Gfx gGameplayKeepDL_C8B0[14] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_C8B0.inc.c"
};

Vtx gLockOnArrowVtx[] = {
#include "assets/objects/gameplay_keep/gLockOnArrowVtx.inc.c"
};

Gfx gLockOnArrowDL[34] = {
#include "assets/objects/gameplay_keep/gLockOnArrowDL.inc.c"
};

u64 gHilite3Tex[TEX_LEN(u64, gHilite3Tex_WIDTH, gHilite3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gHilite3Tex.i8.inc.c"
};

Vtx gEffFragments2Vtx[] = {
#include "assets/objects/gameplay_keep/gEffFragments2Vtx.inc.c"
};

Gfx gEffFragments2DL[7] = {
#include "assets/objects/gameplay_keep/gEffFragments2DL.inc.c"
};

u8 gameplay_keep_zeros_00CE58[8] = { 0 };

u64 gGameplayKeepTex_CE60[TEX_LEN(u64, gGameplayKeepTex_CE60_WIDTH, gGameplayKeepTex_CE60_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_CE60.ia8.inc.c"
};

u64 gSelectionCursorTex[TEX_LEN(u64, gSelectionCursorTex_WIDTH, gSelectionCursorTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSelectionCursorTex.ia4.inc.c"
};

u64 gControlStickTex[TEX_LEN(u64, gControlStickTex_WIDTH, gControlStickTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gControlStickTex.ia8.inc.c"
};

u64 gArrowCursorTex[TEX_LEN(u64, gArrowCursorTex_WIDTH, gArrowCursorTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gArrowCursorTex.ia8.inc.c"
};

Vtx gUnusedRockFragmentVtx[] = {
#include "assets/objects/gameplay_keep/gUnusedRockFragmentVtx.inc.c"
};

Gfx gUnusedRockFragmentDL[32] = {
#include "assets/objects/gameplay_keep/gUnusedRockFragmentDL.inc.c"
};

Gfx gBoulderFragmentsDL[27] = {
#include "assets/objects/gameplay_keep/gBoulderFragmentsDL.inc.c"
};

Vtx gBoulderFragmentsVtx[] = {
#include "assets/objects/gameplay_keep/gBoulderFragmentsVtx.inc.c"
};

u8 gameplay_keep_zeros_00D978[8] = { 0 };

u64 gRockFragment1Tex[TEX_LEN(u64, gRockFragment1Tex_WIDTH, gRockFragment1Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRockFragment1Tex.rgba16.inc.c"
};

u64 gRockFragment2Tex[TEX_LEN(u64, gRockFragment2Tex_WIDTH, gRockFragment2Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRockFragment2Tex.rgba16.inc.c"
};

s16 gDoorChildOpeningLeftFrameData[] = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningLeftFrameData.inc.c"
};

JointIndex gDoorChildOpeningLeftJointIndices[] = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningLeftJointIndices.inc.c"
};

AnimationHeader gDoorChildOpeningLeftAnim = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningLeftAnim.inc.c"
};

u8 gameplay_keep_zeros_00EA64[12] = { 0 };

s16 gDoorChildOpeningRightFrameData[] = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningRightFrameData.inc.c"
};

JointIndex gDoorChildOpeningRightJointIndices[] = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningRightJointIndices.inc.c"
};

AnimationHeader gDoorChildOpeningRightAnim = {
#include "assets/objects/gameplay_keep/gDoorChildOpeningRightAnim.inc.c"
};

s16 gDoorAdultOpeningLeftFrameData[] = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningLeftFrameData.inc.c"
};

JointIndex gDoorAdultOpeningLeftJointIndices[] = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningLeftJointIndices.inc.c"
};

AnimationHeader gDoorAdultOpeningLeftAnim = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningLeftAnim.inc.c"
};

u8 gameplay_keep_zeros_00EC08[8] = { 0 };

Vtx gDoorLeftVtx[] = {
#include "assets/objects/gameplay_keep/gDoorLeftVtx.inc.c"
};

Vtx gDoorRightVtx[] = {
#include "assets/objects/gameplay_keep/gDoorRightVtx.inc.c"
};

Vtx gDoorFrameVtx[] = {
#include "assets/objects/gameplay_keep/gDoorFrameVtx.inc.c"
};

Gfx gDoorFrameDL[17] = {
#include "assets/objects/gameplay_keep/gDoorFrameDL.inc.c"
};

Gfx gDoorLeftDL[41] = {
#include "assets/objects/gameplay_keep/gDoorLeftDL.inc.c"
};

Gfx gDoorRightDL[39] = {
#include "assets/objects/gameplay_keep/gDoorRightDL.inc.c"
};

u64 gWoodenDoorTex[TEX_LEN(u64, gWoodenDoorTex_WIDTH, gWoodenDoorTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gWoodenDoorTex.rgba16.inc.c"
};

StandardLimb gameplay_keep_0103D8_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0103D8_Limb.inc.c"
};

StandardLimb gameplay_keep_0103E4_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0103E4_Limb.inc.c"
};

StandardLimb gameplay_keep_0103F0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0103F0_Limb.inc.c"
};

StandardLimb gameplay_keep_0103FC_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0103FC_Limb.inc.c"
};

void* gDoorLimbs[] = {
#include "assets/objects/gameplay_keep/gDoorLimbs.inc.c"
};

SkeletonHeader gDoorSkel = {
#include "assets/objects/gameplay_keep/gDoorSkel.inc.c"
};

s16 gDoorAdultOpeningRightFrameData[] = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningRightFrameData.inc.c"
};

JointIndex gDoorAdultOpeningRightJointIndices[] = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningRightJointIndices.inc.c"
};

AnimationHeader gDoorAdultOpeningRightAnim = {
#include "assets/objects/gameplay_keep/gDoorAdultOpeningRightAnim.inc.c"
};

u8 gameplay_keep_zeros_0104E8[8] = { 0 };

Gfx gEffDustDL[11] = {
#include "assets/objects/gameplay_keep/gEffDustDL.inc.c"
};

Vtx gEffDustVtx[] = {
#include "assets/objects/gameplay_keep/gEffDustVtx.inc.c"
};

u8 gameplay_keep_zeros_010588[8] = { 0 };

Vtx gEffFlashVtx[] = {
#include "assets/objects/gameplay_keep/gEffFlashVtx.inc.c"
};

Gfx gEffFlash1DL[15] = {
#include "assets/objects/gameplay_keep/gEffFlash1DL.inc.c"
};

Gfx gEffFlash2DL[16] = {
#include "assets/objects/gameplay_keep/gEffFlash2DL.inc.c"
};

u64 gFlashTex[TEX_LEN(u64, gFlashTex_WIDTH, gFlashTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gFlashTex.i8.inc.c"
};

u8 gameplay_keep_zeros_0116C8[8] = { 0 };

u64 gTorchFlameTex[TEX_LEN(u64, gTorchFlameTex_WIDTH, gTorchFlameTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gTorchFlameTex.i8.inc.c"
};

u64 gEffUnknown1Tex[TEX_LEN(u64, gEffUnknown1Tex_WIDTH, gEffUnknown1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown1Tex.i8.inc.c"
};

Vtx gSpinAttack1Vtx[] = {
#include "assets/objects/gameplay_keep/gSpinAttack1Vtx.inc.c"
};

Vtx gSpinAttack2Vtx[] = {
#include "assets/objects/gameplay_keep/gSpinAttack2Vtx.inc.c"
};

Gfx gSpinAttack1DL[36] = {
#include "assets/objects/gameplay_keep/gSpinAttack1DL.inc.c"
};

Gfx gSpinAttack2DL[36] = {
#include "assets/objects/gameplay_keep/gSpinAttack2DL.inc.c"
};

Vtx gSpinAttack3Vtx[] = {
#include "assets/objects/gameplay_keep/gSpinAttack3Vtx.inc.c"
};

Vtx gSpinAttack4Vtx[] = {
#include "assets/objects/gameplay_keep/gSpinAttack4Vtx.inc.c"
};

Gfx gSpinAttack3DL[36] = {
#include "assets/objects/gameplay_keep/gSpinAttack3DL.inc.c"
};

Gfx gSpinAttack4DL[36] = {
#include "assets/objects/gameplay_keep/gSpinAttack4DL.inc.c"
};

u64 gFlameWall1Tex[TEX_LEN(u64, gFlameWall1Tex_WIDTH, gFlameWall1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gFlameWall1Tex.i8.inc.c"
};

u64 gFlameWall2Tex[TEX_LEN(u64, gFlameWall2Tex_WIDTH, gFlameWall2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gFlameWall2Tex.i8.inc.c"
};

Vtx gSpinAttackChargingVtx[] = {
#include "assets/objects/gameplay_keep/gSpinAttackChargingVtx.inc.c"
};

Gfx gSpinAttackChargingDL[29] = {
#include "assets/objects/gameplay_keep/gSpinAttackChargingDL.inc.c"
};

u8 gameplay_keep_zeros_013B98[8] = { 0 };

u64 gEffUnknown2Tex[TEX_LEN(u64, gEffUnknown2Tex_WIDTH, gEffUnknown2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown2Tex.i8.inc.c"
};

u64 gEffUnknown3Tex[TEX_LEN(u64, gEffUnknown3Tex_WIDTH, gEffUnknown3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown3Tex.i8.inc.c"
};

Vtx gUnusedBeamBladeVtx[] = {
#include "assets/objects/gameplay_keep/gUnusedBeamBladeVtx.inc.c"
};

Gfx gUnusedBeamBladeDL[37] = {
#include "assets/objects/gameplay_keep/gUnusedBeamBladeDL.inc.c"
};

u8 gameplay_keep_zeros_014F88[8] = { 0 };

s16 gFairyFrameData[] = {
#include "assets/objects/gameplay_keep/gFairyFrameData.inc.c"
};

JointIndex gFairyJointIndices[] = {
#include "assets/objects/gameplay_keep/gFairyJointIndices.inc.c"
};

AnimationHeader gFairyAnim = {
#include "assets/objects/gameplay_keep/gFairyAnim.inc.c"
};

u8 gameplay_keep_zeros_015054[12] = { 0 };

u64 gFairyWingTex[TEX_LEN(u64, gFairyWingTex_WIDTH, gFairyWingTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gFairyWingTex.i8.inc.c"
};

Vtx gFairyWing1Vtx[] = {
#include "assets/objects/gameplay_keep/gFairyWing1Vtx.inc.c"
};

Gfx gFairyWing1DL[17] = {
#include "assets/objects/gameplay_keep/gFairyWing1DL.inc.c"
};

Vtx gFairyWing2Vtx[] = {
#include "assets/objects/gameplay_keep/gFairyWing2Vtx.inc.c"
};

Gfx gFairyWing2DL[17] = {
#include "assets/objects/gameplay_keep/gFairyWing2DL.inc.c"
};

Vtx gFairyWing3Vtx[] = {
#include "assets/objects/gameplay_keep/gFairyWing3Vtx.inc.c"
};

Gfx gFairyWing3DL[17] = {
#include "assets/objects/gameplay_keep/gFairyWing3DL.inc.c"
};

Vtx gFairyWing4Vtx[] = {
#include "assets/objects/gameplay_keep/gFairyWing4Vtx.inc.c"
};

Gfx gFairyWing4DL[17] = {
#include "assets/objects/gameplay_keep/gFairyWing4DL.inc.c"
};

Vtx gGlowCircleVtx[] = {
#include "assets/objects/gameplay_keep/gGlowCircleVtx.inc.c"
};

Gfx gGlowCircleTextureLoadDL[8] = {
#include "assets/objects/gameplay_keep/gGlowCircleTextureLoadDL.inc.c"
};

Gfx gGlowCircleDL[4] = {
#include "assets/objects/gameplay_keep/gGlowCircleDL.inc.c"
};

Gfx gGlowCircleSmallDL[45] = {
#include "assets/objects/gameplay_keep/gGlowCircleSmallDL.inc.c"
};

Vtx gGlowCircleSmallVtx[] = {
#include "assets/objects/gameplay_keep/gGlowCircleSmallVtx.inc.c"
};

u64 gUnusedFairyWingTex[TEX_LEN(u64, gUnusedFairyWingTex_WIDTH, gUnusedFairyWingTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnusedFairyWingTex.rgba16.inc.c"
};

StandardLimb gameplay_keep_016E08_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E08_Limb.inc.c"
};

StandardLimb gameplay_keep_016E14_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E14_Limb.inc.c"
};

StandardLimb gameplay_keep_016E20_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E20_Limb.inc.c"
};

StandardLimb gameplay_keep_016E2C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E2C_Limb.inc.c"
};

StandardLimb gameplay_keep_016E38_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E38_Limb.inc.c"
};

StandardLimb gameplay_keep_016E44_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E44_Limb.inc.c"
};

StandardLimb gameplay_keep_016E50_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E50_Limb.inc.c"
};

StandardLimb gameplay_keep_016E5C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E5C_Limb.inc.c"
};

StandardLimb gameplay_keep_016E68_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E68_Limb.inc.c"
};

StandardLimb gameplay_keep_016E74_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E74_Limb.inc.c"
};

StandardLimb gameplay_keep_016E80_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E80_Limb.inc.c"
};

StandardLimb gameplay_keep_016E8C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E8C_Limb.inc.c"
};

StandardLimb gameplay_keep_016E98_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016E98_Limb.inc.c"
};

StandardLimb gameplay_keep_016EA4_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_016EA4_Limb.inc.c"
};

void* gFairyLimbs[] = {
#include "assets/objects/gameplay_keep/gFairyLimbs.inc.c"
};

SkeletonHeader gFairySkel = {
#include "assets/objects/gameplay_keep/gFairySkel.inc.c"
};

u64 gUnknownCircle3Tex[TEX_LEN(u64, gUnknownCircle3Tex_WIDTH, gUnknownCircle3Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gUnknownCircle3Tex.i4.inc.c"
};

u64 gUnknownCircle4Tex[TEX_LEN(u64, gUnknownCircle4Tex_WIDTH, gUnknownCircle4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownCircle4Tex.i8.inc.c"
};

u64 gHilite4Tex[TEX_LEN(u64, gHilite4Tex_WIDTH, gHilite4Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gHilite4Tex.rgba16.inc.c"
};

u64 gEffUnknown4Tex[TEX_LEN(u64, gEffUnknown4Tex_WIDTH, gEffUnknown4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown4Tex.i8.inc.c"
};

u64 gEffUnknown5Tex[TEX_LEN(u64, gEffUnknown5Tex_WIDTH, gEffUnknown5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown5Tex.i8.inc.c"
};

Vtx gEffFireCircleVtx[] = {
#include "assets/objects/gameplay_keep/gEffFireCircleVtx.inc.c"
};

Gfx gEffFireCircleDL[30] = {
#include "assets/objects/gameplay_keep/gEffFireCircleDL.inc.c"
};

s16 gFishOutOfWaterFrameData[] = {
#include "assets/objects/gameplay_keep/gFishOutOfWaterFrameData.inc.c"
};

JointIndex gFishOutOfWaterJointIndices[] = {
#include "assets/objects/gameplay_keep/gFishOutOfWaterJointIndices.inc.c"
};

AnimationHeader gFishOutOfWaterAnim = {
#include "assets/objects/gameplay_keep/gFishOutOfWaterAnim.inc.c"
};

u8 gameplay_keep_zeros_018AAC[4] = { 0 };

Vtx gameplay_keep_Vtx_018AB0[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_018AB0.inc.c"
};

Vtx gameplay_keep_Vtx_018AF0[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_018AF0.inc.c"
};

Vtx gameplay_keep_Vtx_018BF0[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_018BF0.inc.c"
};

Gfx gameplay_keep_018D50_DL[20] = {
#include "assets/objects/gameplay_keep/gameplay_keep_018D50_DL.inc.c"
};

Gfx gameplay_keep_018DF0_DL[35] = {
#include "assets/objects/gameplay_keep/gameplay_keep_018DF0_DL.inc.c"
};

Gfx gameplay_keep_018F08_DL[35] = {
#include "assets/objects/gameplay_keep/gameplay_keep_018F08_DL.inc.c"
};

u64 gFishTailTex[TEX_LEN(u64, gFishTailTex_WIDTH, gFishTailTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gFishTailTex.rgba16.inc.c"
};

u64 gFishBodyTex[TEX_LEN(u64, gFishBodyTex_WIDTH, gFishBodyTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gFishBodyTex.rgba16.inc.c"
};

StandardLimb gameplay_keep_019420_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_019420_Limb.inc.c"
};

StandardLimb gameplay_keep_01942C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_01942C_Limb.inc.c"
};

StandardLimb gameplay_keep_019438_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_019438_Limb.inc.c"
};

StandardLimb gameplay_keep_019444_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_019444_Limb.inc.c"
};

StandardLimb gameplay_keep_019450_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_019450_Limb.inc.c"
};

StandardLimb gameplay_keep_01945C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_01945C_Limb.inc.c"
};

void* gFishLimbs[] = {
#include "assets/objects/gameplay_keep/gFishLimbs.inc.c"
};

FlexSkeletonHeader gFishSkel = {
#include "assets/objects/gameplay_keep/gFishSkel.inc.c"
};

u8 gameplay_keep_zeros_01948C[4] = { 0 };

s16 gFishInWaterFrameData[] = {
#include "assets/objects/gameplay_keep/gFishInWaterFrameData.inc.c"
};

JointIndex gFishInWaterJointIndices[] = {
#include "assets/objects/gameplay_keep/gFishInWaterJointIndices.inc.c"
};

AnimationHeader gFishInWaterAnim = {
#include "assets/objects/gameplay_keep/gFishInWaterAnim.inc.c"
};

u8 gameplay_keep_zeros_01954C[4] = { 0 };

u64 gEffShockwaveTex[TEX_LEN(u64, gEffShockwaveTex_WIDTH, gEffShockwaveTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffShockwaveTex.i8.inc.c"
};

Gfx gEffShockwaveDL[14] = {
#include "assets/objects/gameplay_keep/gEffShockwaveDL.inc.c"
};

Vtx gGameplayKeepVtx_01A120[] = {
#include "assets/objects/gameplay_keep/gGameplayKeepVtx_01A120.inc.c"
};

Gfx gEffBubbleDL[15] = {
#include "assets/objects/gameplay_keep/gEffBubbleDL.inc.c"
};

Vtx gEffBubbleVtx[] = {
#include "assets/objects/gameplay_keep/gEffBubbleVtx.inc.c"
};

u8 gameplay_keep_zeros_01A6B8[8] = { 0 };

u64 gEffFireFootprint1Tex[TEX_LEN(u64, gEffFireFootprint1Tex_WIDTH, gEffFireFootprint1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint1Tex.ia8.inc.c"
};

u64 gEffFireFootprint2Tex[TEX_LEN(u64, gEffFireFootprint2Tex_WIDTH, gEffFireFootprint2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint2Tex.ia8.inc.c"
};

u64 gEffFireFootprint3Tex[TEX_LEN(u64, gEffFireFootprint3Tex_WIDTH, gEffFireFootprint3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint3Tex.ia8.inc.c"
};

u64 gEffFireFootprint4Tex[TEX_LEN(u64, gEffFireFootprint4Tex_WIDTH, gEffFireFootprint4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint4Tex.ia8.inc.c"
};

u64 gEffFireFootprint5Tex[TEX_LEN(u64, gEffFireFootprint5Tex_WIDTH, gEffFireFootprint5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint5Tex.ia8.inc.c"
};

u64 gEffFireFootprint6Tex[TEX_LEN(u64, gEffFireFootprint6Tex_WIDTH, gEffFireFootprint6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint6Tex.ia8.inc.c"
};

u64 gEffFireFootprint7Tex[TEX_LEN(u64, gEffFireFootprint7Tex_WIDTH, gEffFireFootprint7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint7Tex.ia8.inc.c"
};

u64 gEffFireFootprint8Tex[TEX_LEN(u64, gEffFireFootprint8Tex_WIDTH, gEffFireFootprint8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffFireFootprint8Tex.ia8.inc.c"
};

Gfx gEffFireFootprintDL[12] = {
#include "assets/objects/gameplay_keep/gEffFireFootprintDL.inc.c"
};

Vtx gEffFireFootprintVtx[] = {
#include "assets/objects/gameplay_keep/gEffFireFootprintVtx.inc.c"
};

u64 gEffUnusedBubbles1Tex[TEX_LEN(u64, gEffUnusedBubbles1Tex_WIDTH, gEffUnusedBubbles1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles1Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles2Tex[TEX_LEN(u64, gEffUnusedBubbles2Tex_WIDTH, gEffUnusedBubbles2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles2Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles3Tex[TEX_LEN(u64, gEffUnusedBubbles3Tex_WIDTH, gEffUnusedBubbles3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles3Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles4Tex[TEX_LEN(u64, gEffUnusedBubbles4Tex_WIDTH, gEffUnusedBubbles4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles4Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles5Tex[TEX_LEN(u64, gEffUnusedBubbles5Tex_WIDTH, gEffUnusedBubbles5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles5Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles6Tex[TEX_LEN(u64, gEffUnusedBubbles6Tex_WIDTH, gEffUnusedBubbles6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles6Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles7Tex[TEX_LEN(u64, gEffUnusedBubbles7Tex_WIDTH, gEffUnusedBubbles7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles7Tex.ia8.inc.c"
};

u64 gEffUnusedBubbles8Tex[TEX_LEN(u64, gEffUnusedBubbles8Tex_WIDTH, gEffUnusedBubbles8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubbles8Tex.ia8.inc.c"
};

Gfx gEffUnusedBubblesDL[14] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubblesDL.inc.c"
};

Vtx gEffUnusedBubblesVtx[] = {
#include "assets/objects/gameplay_keep/gEffUnusedBubblesVtx.inc.c"
};

u64 gLensOfTruthMaskTex[TEX_LEN(u64, gLensOfTruthMaskTex_WIDTH, gLensOfTruthMaskTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gLensOfTruthMaskTex.i8.inc.c"
};

u64 gEffHitMark1Tex[TEX_LEN(u64, gEffHitMark1Tex_WIDTH, gEffHitMark1Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark1Tex.i4.inc.c"
};

u64 gEffHitMark2Tex[TEX_LEN(u64, gEffHitMark2Tex_WIDTH, gEffHitMark2Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark2Tex.i4.inc.c"
};

u64 gEffHitMark3Tex[TEX_LEN(u64, gEffHitMark3Tex_WIDTH, gEffHitMark3Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark3Tex.i4.inc.c"
};

u64 gEffHitMark4Tex[TEX_LEN(u64, gEffHitMark4Tex_WIDTH, gEffHitMark4Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark4Tex.i4.inc.c"
};

u64 gEffHitMark5Tex[TEX_LEN(u64, gEffHitMark5Tex_WIDTH, gEffHitMark5Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark5Tex.i4.inc.c"
};

u64 gEffHitMark6Tex[TEX_LEN(u64, gEffHitMark6Tex_WIDTH, gEffHitMark6Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark6Tex.i4.inc.c"
};

u64 gEffHitMark7Tex[TEX_LEN(u64, gEffHitMark7Tex_WIDTH, gEffHitMark7Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark7Tex.i4.inc.c"
};

u64 gEffHitMark8Tex[TEX_LEN(u64, gEffHitMark8Tex_WIDTH, gEffHitMark8Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark8Tex.i4.inc.c"
};

u64 gEffHitMark9Tex[TEX_LEN(u64, gEffHitMark9Tex_WIDTH, gEffHitMark9Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark9Tex.i4.inc.c"
};

u64 gEffHitMark10Tex[TEX_LEN(u64, gEffHitMark10Tex_WIDTH, gEffHitMark10Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark10Tex.i4.inc.c"
};

u64 gEffHitMark11Tex[TEX_LEN(u64, gEffHitMark11Tex_WIDTH, gEffHitMark11Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark11Tex.i4.inc.c"
};

u64 gEffHitMark12Tex[TEX_LEN(u64, gEffHitMark12Tex_WIDTH, gEffHitMark12Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark12Tex.i4.inc.c"
};

u64 gEffHitMark13Tex[TEX_LEN(u64, gEffHitMark13Tex_WIDTH, gEffHitMark13Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark13Tex.i4.inc.c"
};

u64 gEffHitMark14Tex[TEX_LEN(u64, gEffHitMark14Tex_WIDTH, gEffHitMark14Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark14Tex.i4.inc.c"
};

u64 gEffHitMark15Tex[TEX_LEN(u64, gEffHitMark15Tex_WIDTH, gEffHitMark15Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark15Tex.i4.inc.c"
};

u64 gEffHitMark16Tex[TEX_LEN(u64, gEffHitMark16Tex_WIDTH, gEffHitMark16Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark16Tex.i4.inc.c"
};

u64 gEffHitMark17Tex[TEX_LEN(u64, gEffHitMark17Tex_WIDTH, gEffHitMark17Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark17Tex.i4.inc.c"
};

u64 gEffHitMark18Tex[TEX_LEN(u64, gEffHitMark18Tex_WIDTH, gEffHitMark18Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark18Tex.i4.inc.c"
};

u64 gEffHitMark19Tex[TEX_LEN(u64, gEffHitMark19Tex_WIDTH, gEffHitMark19Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark19Tex.i4.inc.c"
};

u64 gEffHitMark20Tex[TEX_LEN(u64, gEffHitMark20Tex_WIDTH, gEffHitMark20Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark20Tex.i4.inc.c"
};

u64 gEffHitMark21Tex[TEX_LEN(u64, gEffHitMark21Tex_WIDTH, gEffHitMark21Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark21Tex.i4.inc.c"
};

u64 gEffHitMark22Tex[TEX_LEN(u64, gEffHitMark22Tex_WIDTH, gEffHitMark22Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark22Tex.i4.inc.c"
};

u64 gEffHitMark23Tex[TEX_LEN(u64, gEffHitMark23Tex_WIDTH, gEffHitMark23Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark23Tex.i4.inc.c"
};

u64 gEffHitMark24Tex[TEX_LEN(u64, gEffHitMark24Tex_WIDTH, gEffHitMark24Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffHitMark24Tex.i4.inc.c"
};

Gfx gEffHitMarkDL[11] = {
#include "assets/objects/gameplay_keep/gEffHitMarkDL.inc.c"
};

Vtx gEffHitMarkVtx[] = {
#include "assets/objects/gameplay_keep/gEffHitMarkVtx.inc.c"
};

u8 gameplay_keep_zeros_021CA8[8] = { 0 };

u64 gEffUnknown6Tex[TEX_LEN(u64, gEffUnknown6Tex_WIDTH, gEffUnknown6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown6Tex.i8.inc.c"
};

u64 gEffFleckTex[TEX_LEN(u64, gEffFleckTex_WIDTH, gEffFleckTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffFleckTex.i4.inc.c"
};

u64 gEffUnknown8Tex[TEX_LEN(u64, gEffUnknown8Tex_WIDTH, gEffUnknown8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown8Tex.i8.inc.c"
};

u64 gEffMagmaBubble1Tex[TEX_LEN(u64, gEffMagmaBubble1Tex_WIDTH, gEffMagmaBubble1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble1Tex.ia8.inc.c"
};

u64 gEffMagmaBubble2Tex[TEX_LEN(u64, gEffMagmaBubble2Tex_WIDTH, gEffMagmaBubble2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble2Tex.ia8.inc.c"
};

u64 gEffMagmaBubble3Tex[TEX_LEN(u64, gEffMagmaBubble3Tex_WIDTH, gEffMagmaBubble3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble3Tex.ia8.inc.c"
};

u64 gEffMagmaBubble4Tex[TEX_LEN(u64, gEffMagmaBubble4Tex_WIDTH, gEffMagmaBubble4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble4Tex.ia8.inc.c"
};

u64 gEffMagmaBubble5Tex[TEX_LEN(u64, gEffMagmaBubble5Tex_WIDTH, gEffMagmaBubble5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble5Tex.ia8.inc.c"
};

u64 gEffMagmaBubble6Tex[TEX_LEN(u64, gEffMagmaBubble6Tex_WIDTH, gEffMagmaBubble6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble6Tex.ia8.inc.c"
};

u64 gEffMagmaBubble7Tex[TEX_LEN(u64, gEffMagmaBubble7Tex_WIDTH, gEffMagmaBubble7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble7Tex.ia8.inc.c"
};

u64 gEffMagmaBubble8Tex[TEX_LEN(u64, gEffMagmaBubble8Tex_WIDTH, gEffMagmaBubble8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubble8Tex.ia8.inc.c"
};

Gfx gEffMagmaBubbleDL[12] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubbleDL.inc.c"
};

Vtx gEffMagmaBubbleVtx[] = {
#include "assets/objects/gameplay_keep/gEffMagmaBubbleVtx.inc.c"
};

u64 gEffWaterRippleTex[TEX_LEN(u64, gEffWaterRippleTex_WIDTH, gEffWaterRippleTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterRippleTex.i8.inc.c"
};

Gfx gEffWaterRippleDL[12] = {
#include "assets/objects/gameplay_keep/gEffWaterRippleDL.inc.c"
};

Vtx gEffWaterRippleVtx[] = {
#include "assets/objects/gameplay_keep/gEffWaterRippleVtx.inc.c"
};

Gfx gEffSparkDL[12] = {
#include "assets/objects/gameplay_keep/gEffSparkDL.inc.c"
};

Vtx gEffSparkVtx[] = {
#include "assets/objects/gameplay_keep/gEffSparkVtx.inc.c"
};

u64 gEffWaterSplash1Tex[TEX_LEN(u64, gEffWaterSplash1Tex_WIDTH, gEffWaterSplash1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash1Tex.i8.inc.c"
};

u64 gEffWaterSplash2Tex[TEX_LEN(u64, gEffWaterSplash2Tex_WIDTH, gEffWaterSplash2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash2Tex.i8.inc.c"
};

u64 gEffWaterSplash3Tex[TEX_LEN(u64, gEffWaterSplash3Tex_WIDTH, gEffWaterSplash3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash3Tex.i8.inc.c"
};

u64 gEffWaterSplash4Tex[TEX_LEN(u64, gEffWaterSplash4Tex_WIDTH, gEffWaterSplash4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash4Tex.i8.inc.c"
};

u64 gEffWaterSplash5Tex[TEX_LEN(u64, gEffWaterSplash5Tex_WIDTH, gEffWaterSplash5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash5Tex.i8.inc.c"
};

u64 gEffWaterSplash6Tex[TEX_LEN(u64, gEffWaterSplash6Tex_WIDTH, gEffWaterSplash6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash6Tex.i8.inc.c"
};

u64 gEffWaterSplash7Tex[TEX_LEN(u64, gEffWaterSplash7Tex_WIDTH, gEffWaterSplash7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash7Tex.i8.inc.c"
};

u64 gEffWaterSplash8Tex[TEX_LEN(u64, gEffWaterSplash8Tex_WIDTH, gEffWaterSplash8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffWaterSplash8Tex.i8.inc.c"
};

Gfx gEffWaterSplashDL[12] = {
#include "assets/objects/gameplay_keep/gEffWaterSplashDL.inc.c"
};

Vtx gEffWaterSplashVtx[] = {
#include "assets/objects/gameplay_keep/gEffWaterSplashVtx.inc.c"
};

u64 gUnknownEffStone1Tex[TEX_LEN(u64, gUnknownEffStone1Tex_WIDTH, gUnknownEffStone1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone1Tex.ia8.inc.c"
};

u64 gUnknownEffStone2Tex[TEX_LEN(u64, gUnknownEffStone2Tex_WIDTH, gUnknownEffStone2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone2Tex.ia8.inc.c"
};

u64 gUnknownEffStone3Tex[TEX_LEN(u64, gUnknownEffStone3Tex_WIDTH, gUnknownEffStone3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone3Tex.ia8.inc.c"
};

u64 gUnknownEffStone4Tex[TEX_LEN(u64, gUnknownEffStone4Tex_WIDTH, gUnknownEffStone4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone4Tex.ia8.inc.c"
};

u64 gUnknownEffStone5Tex[TEX_LEN(u64, gUnknownEffStone5Tex_WIDTH, gUnknownEffStone5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone5Tex.ia8.inc.c"
};

u64 gUnknownEffStone6Tex[TEX_LEN(u64, gUnknownEffStone6Tex_WIDTH, gUnknownEffStone6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone6Tex.ia8.inc.c"
};

u64 gUnknownEffStone7Tex[TEX_LEN(u64, gUnknownEffStone7Tex_WIDTH, gUnknownEffStone7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone7Tex.ia8.inc.c"
};

u64 gUnknownEffStone8Tex[TEX_LEN(u64, gUnknownEffStone8Tex_WIDTH, gUnknownEffStone8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownEffStone8Tex.ia8.inc.c"
};

Gfx gUnknownEffStoneDL[12] = {
#include "assets/objects/gameplay_keep/gUnknownEffStoneDL.inc.c"
};

Vtx gUnknownEffStoneVtx[] = {
#include "assets/objects/gameplay_keep/gUnknownEffStoneVtx.inc.c"
};

u64 gEffLightning1Tex[TEX_LEN(u64, gEffLightning1Tex_WIDTH, gEffLightning1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning1Tex.i8.inc.c"
};

u64 gEffLightning2Tex[TEX_LEN(u64, gEffLightning2Tex_WIDTH, gEffLightning2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning2Tex.i8.inc.c"
};

u64 gEffLightning3Tex[TEX_LEN(u64, gEffLightning3Tex_WIDTH, gEffLightning3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning3Tex.i8.inc.c"
};

u64 gEffLightning4Tex[TEX_LEN(u64, gEffLightning4Tex_WIDTH, gEffLightning4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning4Tex.i8.inc.c"
};

u64 gEffLightning5Tex[TEX_LEN(u64, gEffLightning5Tex_WIDTH, gEffLightning5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning5Tex.i8.inc.c"
};

u64 gEffLightning6Tex[TEX_LEN(u64, gEffLightning6Tex_WIDTH, gEffLightning6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning6Tex.i8.inc.c"
};

u64 gEffLightning7Tex[TEX_LEN(u64, gEffLightning7Tex_WIDTH, gEffLightning7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning7Tex.i8.inc.c"
};

u64 gEffLightning8Tex[TEX_LEN(u64, gEffLightning8Tex_WIDTH, gEffLightning8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffLightning8Tex.i8.inc.c"
};

Gfx gEffLightningDL[13] = {
#include "assets/objects/gameplay_keep/gEffLightningDL.inc.c"
};

Vtx gEffLightningVtx[] = {
#include "assets/objects/gameplay_keep/gEffLightningVtx.inc.c"
};

u8 gameplay_keep_zeros_02D478[8] = { 0 };

u64 gEffEnemyDeathFlame1Tex[TEX_LEN(u64, gEffEnemyDeathFlame1Tex_WIDTH, gEffEnemyDeathFlame1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame1Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame2Tex[TEX_LEN(u64, gEffEnemyDeathFlame2Tex_WIDTH, gEffEnemyDeathFlame2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame2Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame3Tex[TEX_LEN(u64, gEffEnemyDeathFlame3Tex_WIDTH, gEffEnemyDeathFlame3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame3Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame4Tex[TEX_LEN(u64, gEffEnemyDeathFlame4Tex_WIDTH, gEffEnemyDeathFlame4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame4Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame5Tex[TEX_LEN(u64, gEffEnemyDeathFlame5Tex_WIDTH, gEffEnemyDeathFlame5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame5Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame6Tex[TEX_LEN(u64, gEffEnemyDeathFlame6Tex_WIDTH, gEffEnemyDeathFlame6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame6Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame7Tex[TEX_LEN(u64, gEffEnemyDeathFlame7Tex_WIDTH, gEffEnemyDeathFlame7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame7Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame8Tex[TEX_LEN(u64, gEffEnemyDeathFlame8Tex_WIDTH, gEffEnemyDeathFlame8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame8Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame9Tex[TEX_LEN(u64, gEffEnemyDeathFlame9Tex_WIDTH, gEffEnemyDeathFlame9Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame9Tex.i8.inc.c"
};

u64 gEffEnemyDeathFlame10Tex[TEX_LEN(u64, gEffEnemyDeathFlame10Tex_WIDTH, gEffEnemyDeathFlame10Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlame10Tex.i8.inc.c"
};

Gfx gEffEnemyDeathFlameDL[13] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlameDL.inc.c"
};

Vtx gEffEnemyDeathFlameVtx[] = {
#include "assets/objects/gameplay_keep/gEffEnemyDeathFlameVtx.inc.c"
};

u8 gameplay_keep_zeros_032528[8] = { 0 };

u64 gEffUnknown9Tex[TEX_LEN(u64, gEffUnknown9Tex_WIDTH, gEffUnknown9Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown9Tex.i8.inc.c"
};

u64 gEffUnknown10Tex[TEX_LEN(u64, gEffUnknown10Tex_WIDTH, gEffUnknown10Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown10Tex.i8.inc.c"
};

u64 gEffUnknown11Tex[TEX_LEN(u64, gEffUnknown11Tex_WIDTH, gEffUnknown11Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown11Tex.i8.inc.c"
};

u64 gEffUnknown12Tex[TEX_LEN(u64, gEffUnknown12Tex_WIDTH, gEffUnknown12Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown12Tex.i8.inc.c"
};

u64 gUnknownWoodBoardTex[TEX_LEN(u64, gUnknownWoodBoardTex_WIDTH, gUnknownWoodBoardTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownWoodBoardTex.i8.inc.c"
};

Vtx gEffIceFragmentVtx[] = {
#include "assets/objects/gameplay_keep/gEffIceFragmentVtx.inc.c"
};

Gfx gEffIceFragment1DL[31] = {
#include "assets/objects/gameplay_keep/gEffIceFragment1DL.inc.c"
};

Gfx gEffIceFragment2DL[30] = {
#include "assets/objects/gameplay_keep/gEffIceFragment2DL.inc.c"
};

u8 gameplay_keep_zeros_033DA8[8] = { 0 };

Vtx gEffIceFragment3Vtx[] = {
#include "assets/objects/gameplay_keep/gEffIceFragment3Vtx.inc.c"
};

Gfx gEffIceFragment3DL[46] = {
#include "assets/objects/gameplay_keep/gEffIceFragment3DL.inc.c"
};

s16 gBugCrawlFrameData[] = {
#include "assets/objects/gameplay_keep/gBugCrawlFrameData.inc.c"
};

JointIndex gBugCrawlJointIndices[] = {
#include "assets/objects/gameplay_keep/gBugCrawlJointIndices.inc.c"
};

AnimationHeader gBugCrawlAnim = {
#include "assets/objects/gameplay_keep/gBugCrawlAnim.inc.c"
};

u8 gameplay_keep_zeros_0346AC[4] = { 0 };

Gfx gBugLimb1DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb1DL.inc.c"
};

Gfx gBugLimb1WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb1WrapperDL.inc.c"
};

Gfx gBugLimb1WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb1WrapperWrapperDL.inc.c"
};

Vtx gBugLimb1Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb1Vtx.inc.c"
};

Gfx gBugLimb2DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb2DL.inc.c"
};

Gfx gBugLimb2WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb2WrapperDL.inc.c"
};

Gfx gBugLimb2WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb2WrapperWrapperDL.inc.c"
};

Vtx gBugLimb2Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb2Vtx.inc.c"
};

Gfx gBugLimb3DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb3DL.inc.c"
};

Gfx gBugLimb3WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb3WrapperDL.inc.c"
};

Gfx gBugLimb3WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb3WrapperWrapperDL.inc.c"
};

Vtx gBugLimb3Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb3Vtx.inc.c"
};

Gfx gBugLimb4DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb4DL.inc.c"
};

Gfx gBugLimb4WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb4WrapperDL.inc.c"
};

Gfx gBugLimb4WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb4WrapperWrapperDL.inc.c"
};

Vtx gBugLimb4Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb4Vtx.inc.c"
};

Gfx gBugLimb5DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb5DL.inc.c"
};

Gfx gBugLimb5WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb5WrapperDL.inc.c"
};

Gfx gBugLimb5WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb5WrapperWrapperDL.inc.c"
};

Vtx gBugLimb5Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb5Vtx.inc.c"
};

Gfx gBugLimb6DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb6DL.inc.c"
};

Gfx gBugLimb6WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb6WrapperDL.inc.c"
};

Gfx gBugLimb6WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb6WrapperWrapperDL.inc.c"
};

Vtx gBugLimb6Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb6Vtx.inc.c"
};

Gfx gBugLimb7DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb7DL.inc.c"
};

Gfx gBugLimb7WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb7WrapperDL.inc.c"
};

Gfx gBugLimb7WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb7WrapperWrapperDL.inc.c"
};

Vtx gBugLimb7Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb7Vtx.inc.c"
};

Gfx gBugLimb8DL[20] = {
#include "assets/objects/gameplay_keep/gBugLimb8DL.inc.c"
};

Gfx gBugLimb8WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb8WrapperDL.inc.c"
};

Gfx gBugLimb8WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb8WrapperWrapperDL.inc.c"
};

Vtx gBugLimb8Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb8Vtx.inc.c"
};

Gfx gBugLimb9DL[22] = {
#include "assets/objects/gameplay_keep/gBugLimb9DL.inc.c"
};

Gfx gBugLimb9WrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb9WrapperDL.inc.c"
};

Gfx gBugLimb9WrapperWrapperDL[2] = {
#include "assets/objects/gameplay_keep/gBugLimb9WrapperWrapperDL.inc.c"
};

Vtx gBugLimb9Vtx[] = {
#include "assets/objects/gameplay_keep/gBugLimb9Vtx.inc.c"
};

u64 gBugBodyTex[TEX_LEN(u64, gBugBodyTex_WIDTH, gBugBodyTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gBugBodyTex.rgba16.inc.c"
};

u64 gBugLegTex[TEX_LEN(u64, gBugLegTex_WIDTH, gBugLegTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gBugLegTex.rgba16.inc.c"
};

StandardLimb gameplay_keep_0358C0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358C0_Limb.inc.c"
};

StandardLimb gameplay_keep_0358CC_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358CC_Limb.inc.c"
};

StandardLimb gameplay_keep_0358D8_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358D8_Limb.inc.c"
};

StandardLimb gameplay_keep_0358E4_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358E4_Limb.inc.c"
};

StandardLimb gameplay_keep_0358F0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358F0_Limb.inc.c"
};

StandardLimb gameplay_keep_0358FC_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0358FC_Limb.inc.c"
};

StandardLimb gameplay_keep_035908_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035908_Limb.inc.c"
};

StandardLimb gameplay_keep_035914_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035914_Limb.inc.c"
};

StandardLimb gameplay_keep_035920_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035920_Limb.inc.c"
};

StandardLimb gameplay_keep_03592C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_03592C_Limb.inc.c"
};

StandardLimb gameplay_keep_035938_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035938_Limb.inc.c"
};

StandardLimb gameplay_keep_035944_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035944_Limb.inc.c"
};

StandardLimb gameplay_keep_035950_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035950_Limb.inc.c"
};

StandardLimb gameplay_keep_03595C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_03595C_Limb.inc.c"
};

StandardLimb gameplay_keep_035968_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035968_Limb.inc.c"
};

StandardLimb gameplay_keep_035974_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035974_Limb.inc.c"
};

StandardLimb gameplay_keep_035980_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035980_Limb.inc.c"
};

StandardLimb gameplay_keep_03598C_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_03598C_Limb.inc.c"
};

StandardLimb gameplay_keep_035998_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_035998_Limb.inc.c"
};

StandardLimb gameplay_keep_0359A4_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0359A4_Limb.inc.c"
};

StandardLimb gameplay_keep_0359B0_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0359B0_Limb.inc.c"
};

StandardLimb gameplay_keep_0359BC_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0359BC_Limb.inc.c"
};

StandardLimb gameplay_keep_0359C8_Limb = {
#include "assets/objects/gameplay_keep/gameplay_keep_0359C8_Limb.inc.c"
};

void* gBugLimbs[] = {
#include "assets/objects/gameplay_keep/gBugLimbs.inc.c"
};

SkeletonHeader gBugSkel = {
#include "assets/objects/gameplay_keep/gBugSkel.inc.c"
};

u8 gameplay_keep_zeros_035A38[8] = { 0 };

Vtx gCuttableShrubStalkVtx[] = {
#include "assets/objects/gameplay_keep/gCuttableShrubStalkVtx.inc.c"
};

Gfx gCuttableShrubStalkDL[18] = {
#include "assets/objects/gameplay_keep/gCuttableShrubStalkDL.inc.c"
};

Vtx gCuttableShrubTipVtx[] = {
#include "assets/objects/gameplay_keep/gCuttableShrubTipVtx.inc.c"
};

Gfx gCuttableShrubTipDL[18] = {
#include "assets/objects/gameplay_keep/gCuttableShrubTipDL.inc.c"
};

u64 gCuttableShrubLeafTFragmentTex[TEX_LEN(u64, gCuttableShrubLeafTFragmentTex_WIDTH,
                                           gCuttableShrubLeafTFragmentTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gCuttableShrubLeafTFragmentTex.rgba16.inc.c"
};

u64 gCuttableShrubTex[TEX_LEN(u64, gCuttableShrubTex_WIDTH, gCuttableShrubTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gCuttableShrubTex.rgba16.inc.c"
};

u64 gLensFlareCircleTex[TEX_LEN(u64, gLensFlareCircleTex_WIDTH, gLensFlareCircleTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gLensFlareCircleTex.i4.inc.c"
};

u64 gLensFlareRingTex[TEX_LEN(u64, gLensFlareRingTex_WIDTH, gLensFlareRingTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gLensFlareRingTex.i4.inc.c"
};

Gfx gLensFlareCircleDL[13] = {
#include "assets/objects/gameplay_keep/gLensFlareCircleDL.inc.c"
};

Gfx gLensFlareRingDL[13] = {
#include "assets/objects/gameplay_keep/gLensFlareRingDL.inc.c"
};

Vtx gLensFlareVtx[] = {
#include "assets/objects/gameplay_keep/gLensFlareVtx.inc.c"
};

Vtx gEffSparklesVtx[] = {
#include "assets/objects/gameplay_keep/gEffSparklesVtx.inc.c"
};

Gfx gEffSparklesDL[12] = {
#include "assets/objects/gameplay_keep/gEffSparklesDL.inc.c"
};

u64 gEffSparklesTex[TEX_LEN(u64, gEffSparklesTex_WIDTH, gEffSparklesTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffSparklesTex.i4.inc.c"
};

u64 gEffUnknown13Tex[TEX_LEN(u64, gEffUnknown13Tex_WIDTH, gEffUnknown13Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown13Tex.i8.inc.c"
};

u64 gEffUnknown14Tex[TEX_LEN(u64, gEffUnknown14Tex_WIDTH, gEffUnknown14Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffUnknown14Tex.i8.inc.c"
};

Vtx gHoverBootsCircleVtx[] = {
#include "assets/objects/gameplay_keep/gHoverBootsCircleVtx.inc.c"
};

Gfx gHoverBootsCircleDL[26] = {
#include "assets/objects/gameplay_keep/gHoverBootsCircleDL.inc.c"
};

u64 gMoonTex[TEX_LEN(u64, gMoonTex_WIDTH, gMoonTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gMoonTex.ia8.inc.c"
};

Gfx gMoonDL[14] = {
#include "assets/objects/gameplay_keep/gMoonDL.inc.c"
};

Vtx gMoonVtx[] = {
#include "assets/objects/gameplay_keep/gMoonVtx.inc.c"
};

u64 gUnknownCircle6Tex[TEX_LEN(u64, gUnknownCircle6Tex_WIDTH, gUnknownCircle6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnknownCircle6Tex.i8.inc.c"
};

Vtx gameplay_keep_Vtx_039850[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_039850.inc.c"
};

Gfx gGameplayKeepDL_39890[27] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_39890.inc.c"
};

u8 gameplay_keep_zeros_039968[8] = { 0 };

Vtx gameplay_keep_Vtx_039970[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_039970.inc.c"
};

Gfx gGameplayKeepDL_399B0[17] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_399B0.inc.c"
};

u8 gameplay_keep_zeros_039A38[8] = { 0 };

Vtx gameplay_keep_Vtx_039A40[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_039A40.inc.c"
};

Gfx gGameplayKeepDL_39A80[17] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_39A80.inc.c"
};

u8 gameplay_keep_zeros_039B08[8] = { 0 };

Vtx gameplay_keep_Vtx_039B10[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_039B10.inc.c"
};

Gfx gGameplayKeepDL_39B50[17] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_39B50.inc.c"
};

u8 gameplay_keep_zeros_039BD8[8] = { 0 };

BgCamInfo gLargerCubeBgCamList[] = {
#include "assets/objects/gameplay_keep/gLargerCubeBgCamList.inc.c"
};

SurfaceType gLargerCubeSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gLargerCubeSurfaceTypes.inc.c"
};

CollisionPoly gLargerCubePolyList[] = {
#include "assets/objects/gameplay_keep/gLargerCubePolyList.inc.c"
};

Vec3s gLargerCubeVtxList[] = {
#include "assets/objects/gameplay_keep/gLargerCubeVtxList.inc.c"
};

CollisionHeader gLargerCubeCol = {
#include "assets/objects/gameplay_keep/gLargerCubeCol.inc.c"
};

u8 gameplay_keep_zeros_039D0C[4] = { 0 };

Vtx gLiftableRockVtx[] = {
#include "assets/objects/gameplay_keep/gLiftableRockVtx.inc.c"
};

Gfx gLiftableRockDL[22] = {
#include "assets/objects/gameplay_keep/gLiftableRockDL.inc.c"
};

Vtx gUnusedRockRectangularPrism1Vtx[] = {
#include "assets/objects/gameplay_keep/gUnusedRockRectangularPrism1Vtx.inc.c"
};

Gfx gUnusedRockRectangularPrism1DL[22] = {
#include "assets/objects/gameplay_keep/gUnusedRockRectangularPrism1DL.inc.c"
};

BgCamInfo gWideTallBlockBgCamList[] = {
#include "assets/objects/gameplay_keep/gWideTallBlockBgCamList.inc.c"
};

SurfaceType gWideTallBlockSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gWideTallBlockSurfaceTypes.inc.c"
};

CollisionPoly gWideTallBlockPolyList[] = {
#include "assets/objects/gameplay_keep/gWideTallBlockPolyList.inc.c"
};

Vec3s gWideTallBlockVtxList[] = {
#include "assets/objects/gameplay_keep/gWideTallBlockVtxList.inc.c"
};

CollisionHeader gWideTallBlockCol = {
#include "assets/objects/gameplay_keep/gWideTallBlockCol.inc.c"
};

u8 gameplay_keep_zeros_03A2A4[12] = { 0 };

Vtx gFlatBlockVtx[] = {
#include "assets/objects/gameplay_keep/gFlatBlockVtx.inc.c"
};

Gfx gFlatBlockDL[23] = {
#include "assets/objects/gameplay_keep/gFlatBlockDL.inc.c"
};

u8 gameplay_keep_zeros_03A4E8[8] = { 0 };

BgCamInfo gTallBlockBgCamList[] = {
#include "assets/objects/gameplay_keep/gTallBlockBgCamList.inc.c"
};

SurfaceType gTallBlockSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gTallBlockSurfaceTypes.inc.c"
};

CollisionPoly gTallBlockPolyList[] = {
#include "assets/objects/gameplay_keep/gTallBlockPolyList.inc.c"
};

Vec3s gTallBlockVtxList[] = {
#include "assets/objects/gameplay_keep/gTallBlockVtxList.inc.c"
};

CollisionHeader gTallBlockCol = {
#include "assets/objects/gameplay_keep/gTallBlockCol.inc.c"
};

u8 gameplay_keep_zeros_03A61C[4] = { 0 };

Vtx gUnusedRockRectangularPrism3Vtx[] = {
#include "assets/objects/gameplay_keep/gUnusedRockRectangularPrism3Vtx.inc.c"
};

Gfx gUnusedRockRectangularPrism3DL[22] = {
#include "assets/objects/gameplay_keep/gUnusedRockRectangularPrism3DL.inc.c"
};

BgCamInfo gSmallerFlatBlockBgCamList[] = {
#include "assets/objects/gameplay_keep/gSmallerFlatBlockBgCamList.inc.c"
};

SurfaceType gSmallerFlatBlockSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gSmallerFlatBlockSurfaceTypes.inc.c"
};

CollisionPoly gSmallerFlatBlockPolyList[] = {
#include "assets/objects/gameplay_keep/gSmallerFlatBlockPolyList.inc.c"
};

Vec3s gSmallerFlatBlockVtxList[] = {
#include "assets/objects/gameplay_keep/gSmallerFlatBlockVtxList.inc.c"
};

CollisionHeader gSmallerFlatBlockCol = {
#include "assets/objects/gameplay_keep/gSmallerFlatBlockCol.inc.c"
};

u8 gameplay_keep_zeros_03A97C[4] = { 0 };

Vtx gFlatRotBlockVtx[] = {
#include "assets/objects/gameplay_keep/gFlatRotBlockVtx.inc.c"
};

Gfx gFlatRotBlockDL[22] = {
#include "assets/objects/gameplay_keep/gFlatRotBlockDL.inc.c"
};

BgCamInfo gLargerFlatBlockBgCamList[] = {
#include "assets/objects/gameplay_keep/gLargerFlatBlockBgCamList.inc.c"
};

SurfaceType gLargerFlatBlockSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gLargerFlatBlockSurfaceTypes.inc.c"
};

CollisionPoly gLargerFlatBlockPolyList[] = {
#include "assets/objects/gameplay_keep/gLargerFlatBlockPolyList.inc.c"
};

Vec3s gLargerFlatBlockVtxList[] = {
#include "assets/objects/gameplay_keep/gLargerFlatBlockVtxList.inc.c"
};

CollisionHeader gLargerFlatBlockCol = {
#include "assets/objects/gameplay_keep/gLargerFlatBlockCol.inc.c"
};

u8 gameplay_keep_zeros_03ACDC[4] = { 0 };

Vtx gSmallCubeVtx[] = {
#include "assets/objects/gameplay_keep/gSmallCubeVtx.inc.c"
};

Gfx gSmallCubeDL[23] = {
#include "assets/objects/gameplay_keep/gSmallCubeDL.inc.c"
};

u8 gameplay_keep_zeros_03AF18[8] = { 0 };

BgCamInfo gSmallerCubeBgCamList[] = {
#include "assets/objects/gameplay_keep/gSmallerCubeBgCamList.inc.c"
};

SurfaceType gSmallerCubeSurfaceTypes[] = {
#include "assets/objects/gameplay_keep/gSmallerCubeSurfaceTypes.inc.c"
};

CollisionPoly gSmallerCubePolyList[] = {
#include "assets/objects/gameplay_keep/gSmallerCubePolyList.inc.c"
};

Vec3s gSmallerCubeVtxList[] = {
#include "assets/objects/gameplay_keep/gSmallerCubeVtxList.inc.c"
};

CollisionHeader gSmallerCubeCol = {
#include "assets/objects/gameplay_keep/gSmallerCubeCol.inc.c"
};

u8 gameplay_keep_zeros_03B04C[4] = { 0 };

Vtx gTreeStumpVtx[] = {
#include "assets/objects/gameplay_keep/gTreeStumpVtx.inc.c"
};

Gfx gTreeStumpDL[34] = {
#include "assets/objects/gameplay_keep/gTreeStumpDL.inc.c"
};

Vtx gGrassBladesVtx[] = {
#include "assets/objects/gameplay_keep/gGrassBladesVtx.inc.c"
};

Gfx gGrassBladesDL[21] = {
#include "assets/objects/gameplay_keep/gGrassBladesDL.inc.c"
};

u8 gameplay_keep_zeros_03B458[8] = { 0 };

u64 gHeartShapeTex[TEX_LEN(u64, gHeartShapeTex_WIDTH, gHeartShapeTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gHeartShapeTex.i8.inc.c"
};

Vtx gHeartPieceInteriorVtx[] = {
#include "assets/objects/gameplay_keep/gHeartPieceInteriorVtx.inc.c"
};

Gfx gHeartPieceInteriorDL[53] = {
#include "assets/objects/gameplay_keep/gHeartPieceInteriorDL.inc.c"
};

u8 gameplay_keep_zeros_03BA08[8] = { 0 };

Vtx gHeartPieceExteriorVtx[] = {
#include "assets/objects/gameplay_keep/gHeartPieceExteriorVtx.inc.c"
};

Vtx gHeartContainerInteriorVtx[] = {
#include "assets/objects/gameplay_keep/gHeartContainerInteriorVtx.inc.c"
};

Gfx gHeartPieceExteriorDL[39] = {
#include "assets/objects/gameplay_keep/gHeartPieceExteriorDL.inc.c"
};

Gfx gHeartContainerInteriorDL[33] = {
#include "assets/objects/gameplay_keep/gHeartContainerInteriorDL.inc.c"
};

Vtx gameplay_keep_Vtx_03C610[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_03C610.inc.c"
};

Vtx gameplay_keep_Vtx_03CB10[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_03CB10.inc.c"
};

Gfx gGameplayKeepDL_3CFD0[39] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_3CFD0.inc.c"
};

Gfx gGameplayKeepDL_3D108[34] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_3D108.inc.c"
};

u8 gameplay_keep_zeros_03D218[8] = { 0 };

Vtx gameplay_keep_Vtx_03D220[] = {
#include "assets/objects/gameplay_keep/gameplay_keep_Vtx_03D220.inc.c"
};

Gfx gGameplayKeepDL_3D260[17] = {
#include "assets/objects/gameplay_keep/gGameplayKeepDL_3D260.inc.c"
};

u8 gameplay_keep_zeros_03D2E8[8] = { 0 };

Vtx gSignRectangularVtx[] = {
#include "assets/objects/gameplay_keep/gSignRectangularVtx.inc.c"
};

Gfx gSignRectangularDL[81] = {
#include "assets/objects/gameplay_keep/gSignRectangularDL.inc.c"
};

u8 gameplay_keep_zeros_03D7E8[8] = { 0 };

Vtx gSignDirectionalVtx[] = {
#include "assets/objects/gameplay_keep/gSignDirectionalVtx.inc.c"
};

Gfx gSignDirectionalDL[88] = {
#include "assets/objects/gameplay_keep/gSignDirectionalDL.inc.c"
};

u64 gDropArrows2Tex[TEX_LEN(u64, gDropArrows2Tex_WIDTH, gDropArrows2Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropArrows2Tex.rgba16.inc.c"
};

u64 gDropArrows1Tex[TEX_LEN(u64, gDropArrows1Tex_WIDTH, gDropArrows1Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropArrows1Tex.rgba16.inc.c"
};

u64 gDropArrows3Tex[TEX_LEN(u64, gDropArrows3Tex_WIDTH, gDropArrows3Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropArrows3Tex.rgba16.inc.c"
};

u64 gDropBombTex[TEX_LEN(u64, gDropBombTex_WIDTH, gDropBombTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropBombTex.rgba16.inc.c"
};

u64 gGameplayKeepTex_3FD80[TEX_LEN(u64, gGameplayKeepTex_3FD80_WIDTH, gGameplayKeepTex_3FD80_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_3FD80.rgba16.inc.c"
};

u64 gGameplayKeepTex_40580[TEX_LEN(u64, gGameplayKeepTex_40580_WIDTH, gGameplayKeepTex_40580_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_40580.rgba16.inc.c"
};

u64 gDropRecoveryHeartTex[TEX_LEN(u64, gDropRecoveryHeartTex_WIDTH, gDropRecoveryHeartTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropRecoveryHeartTex.rgba16.inc.c"
};

u64 gGameplayKeepTex_41580[TEX_LEN(u64, gGameplayKeepTex_41580_WIDTH, gGameplayKeepTex_41580_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_41580.rgba16.inc.c"
};

Gfx gItemDropDL[17] = {
#include "assets/objects/gameplay_keep/gItemDropDL.inc.c"
};

Vtx gItemDropVtx[] = {
#include "assets/objects/gameplay_keep/gItemDropVtx.inc.c"
};

u8 gameplay_keep_zeros_041E48[8] = { 0 };

u64 gDropKeySmallTex[TEX_LEN(u64, gDropKeySmallTex_WIDTH, gDropKeySmallTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropKeySmallTex.rgba16.inc.c"
};

u64 gDropMagicSmallTex[TEX_LEN(u64, gDropMagicSmallTex_WIDTH, gDropMagicSmallTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropMagicSmallTex.rgba16.inc.c"
};

u64 gDropDekuNutTex[TEX_LEN(u64, gDropDekuNutTex_WIDTH, gDropDekuNutTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropDekuNutTex.rgba16.inc.c"
};

u64 gDropDekuSeedsTex[TEX_LEN(u64, gDropDekuSeedsTex_WIDTH, gDropDekuSeedsTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropDekuSeedsTex.rgba16.inc.c"
};

u64 gDropDekuStickTex[TEX_LEN(u64, gDropDekuStickTex_WIDTH, gDropDekuStickTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropDekuStickTex.rgba16.inc.c"
};

u64 gDropMagicLargeTex[TEX_LEN(u64, gDropMagicLargeTex_WIDTH, gDropMagicLargeTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gDropMagicLargeTex.rgba16.inc.c"
};

u64 gRupeeGreenTex[TEX_LEN(u64, gRupeeGreenTex_WIDTH, gRupeeGreenTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeGreenTex.rgba16.inc.c"
};

u64 gRupeeBlueTex[TEX_LEN(u64, gRupeeBlueTex_WIDTH, gRupeeBlueTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeBlueTex.rgba16.inc.c"
};

u64 gRupeeRedTex[TEX_LEN(u64, gRupeeRedTex_WIDTH, gRupeeRedTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeRedTex.rgba16.inc.c"
};

u64 gRupeeOrangeTex[TEX_LEN(u64, gRupeeOrangeTex_WIDTH, gRupeeOrangeTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeOrangeTex.rgba16.inc.c"
};

u64 gRupeePinkTex[TEX_LEN(u64, gRupeePinkTex_WIDTH, gRupeePinkTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeePinkTex.rgba16.inc.c"
};

u64 gRupeeSilverTex[TEX_LEN(u64, gRupeeSilverTex_WIDTH, gRupeeSilverTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeSilverTex.rgba16.inc.c"
};

Vtx gRupeeVtx[] = {
#include "assets/objects/gameplay_keep/gRupeeVtx.inc.c"
};

Gfx gRupeeDL[26] = {
#include "assets/objects/gameplay_keep/gRupeeDL.inc.c"
};

u64 gGameplayKeepTex_45220[TEX_LEN(u64, gGameplayKeepTex_45220_WIDTH, gGameplayKeepTex_45220_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_45220.rgba16.inc.c"
};

u64 gGameplayKeepTex_45A20[TEX_LEN(u64, gGameplayKeepTex_45A20_WIDTH, gGameplayKeepTex_45A20_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_45A20.rgba16.inc.c"
};

u64 gGameplayKeepTex_46220[TEX_LEN(u64, gGameplayKeepTex_46220_WIDTH, gGameplayKeepTex_46220_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_46220.rgba16.inc.c"
};

u64 gRupeeLightRedTex[TEX_LEN(u64, gRupeeLightRedTex_WIDTH, gRupeeLightRedTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gRupeeLightRedTex.rgba16.inc.c"
};

u64 gGameplayKeepTex_46A40[TEX_LEN(u64, gGameplayKeepTex_46A40_WIDTH, gGameplayKeepTex_46A40_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_46A40.rgba16.inc.c"
};

u64 gGameplayKeepTex_46A60[TEX_LEN(u64, gGameplayKeepTex_46A60_WIDTH, gGameplayKeepTex_46A60_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_46A60.rgba16.inc.c"
};

u64 gGameplayKeepTex_47260[TEX_LEN(u64, gGameplayKeepTex_47260_WIDTH, gGameplayKeepTex_47260_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGameplayKeepTex_47260.rgba16.inc.c"
};

u64 gUnknownStone1Tex[TEX_LEN(u64, gUnknownStone1Tex_WIDTH, gUnknownStone1Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnknownStone1Tex.rgba16.inc.c"
};

u64 gUnknownStone2Tex[TEX_LEN(u64, gUnknownStone2Tex_WIDTH, gUnknownStone2Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnknownStone2Tex.rgba16.inc.c"
};

u64 gUnusedTreeStumpTopTex[TEX_LEN(u64, gUnusedTreeStumpTopTex_WIDTH, gUnusedTreeStumpTopTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnusedTreeStumpTopTex.rgba16.inc.c"
};

u64 gUnusedTreeStumpBarkTex[TEX_LEN(u64, gUnusedTreeStumpBarkTex_WIDTH, gUnusedTreeStumpBarkTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnusedTreeStumpBarkTex.rgba16.inc.c"
};

u64 gUnusedGrassBladesTex[TEX_LEN(u64, gUnusedGrassBladesTex_WIDTH, gUnusedGrassBladesTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnusedGrassBladesTex.rgba16.inc.c"
};

u64 gUnusedStoneHookshotTargetTex[TEX_LEN(u64, gUnusedStoneHookshotTargetTex_WIDTH,
                                          gUnusedStoneHookshotTargetTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnusedStoneHookshotTargetTex.rgba16.inc.c"
};

u64 gUnknownStone3Tex[TEX_LEN(u64, gUnknownStone3Tex_WIDTH, gUnknownStone3Tex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gUnknownStone3Tex.rgba16.inc.c"
};

u64 gSignRectangularSideTex[TEX_LEN(u64, gSignRectangularSideTex_WIDTH, gSignRectangularSideTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gSignRectangularSideTex.rgba16.inc.c"
};

u64 gSignRectangularFrontTex[TEX_LEN(u64, gSignRectangularFrontTex_WIDTH, gSignRectangularFrontTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gSignRectangularFrontTex.rgba16.inc.c"
};

u64 gSignPostWoodTex[TEX_LEN(u64, gSignPostWoodTex_WIDTH, gSignPostWoodTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gSignPostWoodTex.rgba16.inc.c"
};

u64 gSignLetteringTex[TEX_LEN(u64, gSignLetteringTex_WIDTH, gSignLetteringTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gSignLetteringTex.rgba16.inc.c"
};

Vtx gRaindropVtx[] = {
#include "assets/objects/gameplay_keep/gRaindropVtx.inc.c"
};

Gfx gRaindropDL[4] = {
#include "assets/objects/gameplay_keep/gRaindropDL.inc.c"
};

Gfx gFootShadowDL[12] = {
#include "assets/objects/gameplay_keep/gFootShadowDL.inc.c"
};

Vtx gFootShadowVtx[] = {
#include "assets/objects/gameplay_keep/gFootShadowVtx.inc.c"
};

u64 gFootShadowTex[TEX_LEN(u64, gFootShadowTex_WIDTH, gFootShadowTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gFootShadowTex.ia16.inc.c"
};

Gfx gCircleShadowDL[10] = {
#include "assets/objects/gameplay_keep/gCircleShadowDL.inc.c"
};

Vtx gCircleShadowVtx[] = {
#include "assets/objects/gameplay_keep/gCircleShadowVtx.inc.c"
};

u64 gCircleShadowTex[TEX_LEN(u64, gCircleShadowTex_WIDTH, gCircleShadowTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gCircleShadowTex.ia16.inc.c"
};

Vtx gHorseShadowVtx[] = {
#include "assets/objects/gameplay_keep/gHorseShadowVtx.inc.c"
};

Gfx gHorseShadowDL[10] = {
#include "assets/objects/gameplay_keep/gHorseShadowDL.inc.c"
};

u64 gHorseShadowTex[TEX_LEN(u64, gHorseShadowTex_WIDTH, gHorseShadowTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gHorseShadowTex.i8.inc.c"
};

Vtx gDungeonDoorVtx[] = {
#include "assets/objects/gameplay_keep/gDungeonDoorVtx.inc.c"
};

Gfx gDungeonDoorDL[21] = {
#include "assets/objects/gameplay_keep/gDungeonDoorDL.inc.c"
};

u8 gameplay_keep_zeros_04F5B8[8] = { 0 };

u64 gDoorMetalBarsTex[TEX_LEN(u64, gDoorMetalBarsTex_WIDTH, gDoorMetalBarsTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDoorMetalBarsTex.ia8.inc.c"
};

Vtx gDoorMetalBarsVtx[] = {
#include "assets/objects/gameplay_keep/gDoorMetalBarsVtx.inc.c"
};

Gfx gDoorMetalBarsDL[18] = {
#include "assets/objects/gameplay_keep/gDoorMetalBarsDL.inc.c"
};

u64 gGenericDungeonDoorTex[TEX_LEN(u64, gGenericDungeonDoorTex_WIDTH, gGenericDungeonDoorTex_HEIGHT, 16)] = {
#include "assets/objects/gameplay_keep/gGenericDungeonDoorTex.rgba16.inc.c"
};

u64 gSun1Tex[TEX_LEN(u64, gSun1Tex_WIDTH, gSun1Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSun1Tex.i4.inc.c"
};

u64 gSun2Tex[TEX_LEN(u64, gSun2Tex_WIDTH, gSun2Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSun2Tex.i4.inc.c"
};

u64 gSun3Tex[TEX_LEN(u64, gSun3Tex_WIDTH, gSun3Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSun3Tex.i4.inc.c"
};

u8 gameplay_keep_zeros_051E70[32] = { 0 };

u64 gSunEvening1Tex[TEX_LEN(u64, gSunEvening1Tex_WIDTH, gSunEvening1Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSunEvening1Tex.i4.inc.c"
};

u64 gSunEvening2Tex[TEX_LEN(u64, gSunEvening2Tex_WIDTH, gSunEvening2Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSunEvening2Tex.i4.inc.c"
};

u64 gSunEvening3Tex[TEX_LEN(u64, gSunEvening3Tex_WIDTH, gSunEvening3Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gSunEvening3Tex.i4.inc.c"
};

u8 gameplay_keep_zeros_052670[32] = { 0 };

Gfx gKokiriDustMoteMaterialDL[9] = {
#include "assets/objects/gameplay_keep/gKokiriDustMoteMaterialDL.inc.c"
};

Gfx gKokiriDustMoteModelDL[3] = {
#include "assets/objects/gameplay_keep/gKokiriDustMoteModelDL.inc.c"
};

Gfx gSunDL[49] = {
#include "assets/objects/gameplay_keep/gSunDL.inc.c"
};

Vtx gSunVtx[] = {
#include "assets/objects/gameplay_keep/gSunVtx.inc.c"
};

Vtx gKokiriDustMoteModelVtx[] = {
#include "assets/objects/gameplay_keep/gKokiriDustMoteModelVtx.inc.c"
};

u8 gameplay_keep_zeros_052978[8] = { 0 };

Gfx gLockOnReticleTriangleDL[3] = {
#include "assets/objects/gameplay_keep/gLockOnReticleTriangleDL.inc.c"
};

Vtx gLockOnReticleTriangleVtx[] = {
#include "assets/objects/gameplay_keep/gLockOnReticleTriangleVtx.inc.c"
};

u8 gameplay_keep_zeros_0529C8[8] = { 0 };

Vtx gEffFireVtx[] = {
#include "assets/objects/gameplay_keep/gEffFireVtx.inc.c"
};

Gfx gEffFire1DL[24] = {
#include "assets/objects/gameplay_keep/gEffFire1DL.inc.c"
};

Gfx gEffFire2DL[24] = {
#include "assets/objects/gameplay_keep/gEffFire2DL.inc.c"
};

u64 gDecorativeFlameMaskTex[TEX_LEN(u64, gDecorativeFlameMaskTex_WIDTH, gDecorativeFlameMaskTex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gDecorativeFlameMaskTex.i4.inc.c"
};

u64 gDecorativeFlameTex[TEX_LEN(u64, gDecorativeFlameTex_WIDTH, gDecorativeFlameTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDecorativeFlameTex.i8.inc.c"
};

Vtx gUnusedUnknownShape1Vtx[] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape1Vtx.inc.c"
};

Gfx gUnusedUnknownShape1DL[112] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape1DL.inc.c"
};

Gfx gUnusedUnknownShape1RefDL[2] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape1RefDL.inc.c"
};

Vtx gUnusedUnknownShape2Vtx[] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape2Vtx.inc.c"
};

Gfx gUnusedUnknownShape2DL[100] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape2DL.inc.c"
};

Gfx gUnusedUnknownShape2RefDL[2] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape2RefDL.inc.c"
};

Vtx gUnusedUnknownShape3Vtx[] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape3Vtx.inc.c"
};

Gfx gUnusedUnknownShape3DL[99] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape3DL.inc.c"
};

Gfx gUnusedUnknownShape3RefDL[2] = {
#include "assets/objects/gameplay_keep/gUnusedUnknownShape3RefDL.inc.c"
};

u8 gameplay_keep_zeros_056AD8[8] = { 0 };

u64 gUnusedUpsideDownZeldaTex[TEX_LEN(u64, gUnusedUpsideDownZeldaTex_WIDTH, gUnusedUpsideDownZeldaTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gUnusedUpsideDownZeldaTex.i8.inc.c"
};

u64 gDust1Tex[TEX_LEN(u64, gDust1Tex_WIDTH, gDust1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust1Tex.i8.inc.c"
};

u64 gDust2Tex[TEX_LEN(u64, gDust2Tex_WIDTH, gDust2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust2Tex.i8.inc.c"
};

u64 gDust3Tex[TEX_LEN(u64, gDust3Tex_WIDTH, gDust3Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust3Tex.i8.inc.c"
};

u64 gDust4Tex[TEX_LEN(u64, gDust4Tex_WIDTH, gDust4Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust4Tex.i8.inc.c"
};

u64 gDust5Tex[TEX_LEN(u64, gDust5Tex_WIDTH, gDust5Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust5Tex.i8.inc.c"
};

u64 gDust6Tex[TEX_LEN(u64, gDust6Tex_WIDTH, gDust6Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust6Tex.i8.inc.c"
};

u64 gDust7Tex[TEX_LEN(u64, gDust7Tex_WIDTH, gDust7Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust7Tex.i8.inc.c"
};

u64 gDust8Tex[TEX_LEN(u64, gDust8Tex_WIDTH, gDust8Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gDust8Tex.i8.inc.c"
};

u64 gCircleGlowLTex[TEX_LEN(u64, gCircleGlowLTex_WIDTH, gCircleGlowLTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gCircleGlowLTex.i8.inc.c"
};

u64 gCircleGlowRTex[TEX_LEN(u64, gCircleGlowRTex_WIDTH, gCircleGlowRTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gCircleGlowRTex.i8.inc.c"
};

u64 gCircleGlowSLTex[TEX_LEN(u64, gCircleGlowSLTex_WIDTH, gCircleGlowSLTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gCircleGlowSLTex.i8.inc.c"
};

u64 gCircleGlowSRTex[TEX_LEN(u64, gCircleGlowSRTex_WIDTH, gCircleGlowSRTex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gCircleGlowSRTex.i8.inc.c"
};

u64 gEffBubble1Tex[TEX_LEN(u64, gEffBubble1Tex_WIDTH, gEffBubble1Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffBubble1Tex.i8.inc.c"
};

u64 gEffBubble2Tex[TEX_LEN(u64, gEffBubble2Tex_WIDTH, gEffBubble2Tex_HEIGHT, 8)] = {
#include "assets/objects/gameplay_keep/gEffBubble2Tex.i8.inc.c"
};

u64 gEffSpark1Tex[TEX_LEN(u64, gEffSpark1Tex_WIDTH, gEffSpark1Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffSpark1Tex.i4.inc.c"
};

u64 gEffSpark2Tex[TEX_LEN(u64, gEffSpark2Tex_WIDTH, gEffSpark2Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffSpark2Tex.i4.inc.c"
};

u64 gEffSpark3Tex[TEX_LEN(u64, gEffSpark3Tex_WIDTH, gEffSpark3Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffSpark3Tex.i4.inc.c"
};

u64 gEffSpark4Tex[TEX_LEN(u64, gEffSpark4Tex_WIDTH, gEffSpark4Tex_HEIGHT, 4)] = {
#include "assets/objects/gameplay_keep/gEffSpark4Tex.i4.inc.c"
};

#if MM_BOTTLE_MODEL
#include "assets/objects/gameplay_keep/bottle.c"
#endif
