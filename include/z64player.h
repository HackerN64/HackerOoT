#ifndef Z64PLAYER_H
#define Z64PLAYER_H

#include "z64actor.h"
#include "alignment.h"

struct Player;

typedef enum {
    /* 0 */ PLAYER_SWORD_NONE,
    /* 1 */ PLAYER_SWORD_KOKIRI,
    /* 2 */ PLAYER_SWORD_MASTER,
    /* 3 */ PLAYER_SWORD_BIGGORON,
    /* 4 */ PLAYER_SWORD_MAX
} PlayerSword;

typedef enum {
    /* 0x00 */ PLAYER_SHIELD_NONE,
    /* 0x01 */ PLAYER_SHIELD_DEKU,
    /* 0x02 */ PLAYER_SHIELD_HYLIAN,
    /* 0x03 */ PLAYER_SHIELD_MIRROR,
    /* 0x04 */ PLAYER_SHIELD_MAX
} PlayerShield;

typedef enum {
    /* 0x00 */ PLAYER_TUNIC_KOKIRI,
    /* 0x01 */ PLAYER_TUNIC_GORON,
    /* 0x02 */ PLAYER_TUNIC_ZORA,
    /* 0x03 */ PLAYER_TUNIC_MAX
} PlayerTunic;

typedef enum {
    /* 0x00 */ PLAYER_BOOTS_KOKIRI,
    /* 0x01 */ PLAYER_BOOTS_IRON,
    /* 0x02 */ PLAYER_BOOTS_HOVER,
    /* Values below are only relevant when setting regs in Player_SetBootData */
    /* 0x03 */ PLAYER_BOOTS_INDOOR,
    /* 0x04 */ PLAYER_BOOTS_IRON_UNDERWATER,
    /* 0x05 */ PLAYER_BOOTS_KOKIRI_CHILD,
    /* 0x06 */ PLAYER_BOOTS_MAX
} PlayerBoots;

typedef enum {
    /* 0x00 */ PLAYER_STR_NONE,
    /* 0x01 */ PLAYER_STR_BRACELET,
    /* 0x02 */ PLAYER_STR_SILVER_G,
    /* 0x03 */ PLAYER_STR_GOLD_G,
    /* 0x04 */ PLAYER_STR_MAX
} PlayerStrength;

typedef enum {
    /* 0x00 */ PLAYER_MASK_NONE,
    /* 0x01 */ PLAYER_MASK_KEATON,
    /* 0x02 */ PLAYER_MASK_SKULL,
    /* 0x03 */ PLAYER_MASK_SPOOKY,
    /* 0x04 */ PLAYER_MASK_BUNNY,
    /* 0x05 */ PLAYER_MASK_GORON,
    /* 0x06 */ PLAYER_MASK_ZORA,
    /* 0x07 */ PLAYER_MASK_GERUDO,
    /* 0x08 */ PLAYER_MASK_TRUTH,
    /* 0x09 */ PLAYER_MASK_MAX
} PlayerMask;

typedef enum {
    /* 0x0 */ PLAYER_ENV_HAZARD_NONE,
    /* 0x1 */ PLAYER_ENV_HAZARD_HOTROOM,
    /* 0x2 */ PLAYER_ENV_HAZARD_UNDERWATER_FLOOR,
    /* 0x3 */ PLAYER_ENV_HAZARD_SWIMMING,
    /* 0x4 */ PLAYER_ENV_HAZARD_UNDERWATER_FREE
} PlayerEnvHazard;

typedef enum {
    /* 0x00 */ PLAYER_IA_NONE,
    /* 0x01 */ PLAYER_IA_LAST_USED,
    /* 0x02 */ PLAYER_IA_FISHING_POLE,
    /* 0x03 */ PLAYER_IA_SWORD_MASTER,
    /* 0x04 */ PLAYER_IA_SWORD_KOKIRI,
    /* 0x05 */ PLAYER_IA_SWORD_BIGGORON,
    /* 0x06 */ PLAYER_IA_DEKU_STICK,
    /* 0x07 */ PLAYER_IA_HAMMER,
    /* 0x08 */ PLAYER_IA_BOW,
    /* 0x09 */ PLAYER_IA_BOW_FIRE,
    /* 0x0A */ PLAYER_IA_BOW_ICE,
    /* 0x0B */ PLAYER_IA_BOW_LIGHT,
    /* 0x0C */ PLAYER_IA_BOW_0C,
    /* 0x0D */ PLAYER_IA_BOW_0D,
    /* 0x0E */ PLAYER_IA_BOW_0E,
    /* 0x0F */ PLAYER_IA_SLINGSHOT,
    /* 0x10 */ PLAYER_IA_HOOKSHOT,
    /* 0x11 */ PLAYER_IA_LONGSHOT,
    /* 0x12 */ PLAYER_IA_BOMB,
    /* 0x13 */ PLAYER_IA_BOMBCHU,
    /* 0x14 */ PLAYER_IA_BOOMERANG,
    /* 0x15 */ PLAYER_IA_MAGIC_SPELL_15,
    /* 0x16 */ PLAYER_IA_MAGIC_SPELL_16,
    /* 0x17 */ PLAYER_IA_MAGIC_SPELL_17,
    /* 0x18 */ PLAYER_IA_FARORES_WIND,
    /* 0x19 */ PLAYER_IA_NAYRUS_LOVE,
    /* 0x1A */ PLAYER_IA_DINS_FIRE,
    /* 0x1B */ PLAYER_IA_DEKU_NUT,
    /* 0x1C */ PLAYER_IA_OCARINA_FAIRY,
    /* 0x1D */ PLAYER_IA_OCARINA_OF_TIME,
    /* 0x1E */ PLAYER_IA_BOTTLE,
    /* 0x1F */ PLAYER_IA_BOTTLE_FISH,
    /* 0x20 */ PLAYER_IA_BOTTLE_FIRE,
    /* 0x21 */ PLAYER_IA_BOTTLE_BUG,
    /* 0x22 */ PLAYER_IA_BOTTLE_POE,
    /* 0x23 */ PLAYER_IA_BOTTLE_BIG_POE,
    /* 0x24 */ PLAYER_IA_BOTTLE_RUTOS_LETTER,
    /* 0x25 */ PLAYER_IA_BOTTLE_POTION_RED,
    /* 0x26 */ PLAYER_IA_BOTTLE_POTION_BLUE,
    /* 0x27 */ PLAYER_IA_BOTTLE_POTION_GREEN,
    /* 0x28 */ PLAYER_IA_BOTTLE_MILK_FULL,
    /* 0x29 */ PLAYER_IA_BOTTLE_MILK_HALF,
    /* 0x2A */ PLAYER_IA_BOTTLE_FAIRY,
    /* 0x2B */ PLAYER_IA_ZELDAS_LETTER,
    /* 0x2C */ PLAYER_IA_WEIRD_EGG,
    /* 0x2D */ PLAYER_IA_CHICKEN,
    /* 0x2E */ PLAYER_IA_MAGIC_BEAN,
    /* 0x2F */ PLAYER_IA_POCKET_EGG,
    /* 0x30 */ PLAYER_IA_POCKET_CUCCO,
    /* 0x31 */ PLAYER_IA_COJIRO,
    /* 0x32 */ PLAYER_IA_ODD_MUSHROOM,
    /* 0x33 */ PLAYER_IA_ODD_POTION,
    /* 0x34 */ PLAYER_IA_POACHERS_SAW,
    /* 0x35 */ PLAYER_IA_BROKEN_GORONS_SWORD,
    /* 0x36 */ PLAYER_IA_PRESCRIPTION,
    /* 0x37 */ PLAYER_IA_FROG,
    /* 0x38 */ PLAYER_IA_EYEDROPS,
    /* 0x39 */ PLAYER_IA_CLAIM_CHECK,
    /* 0x3A */ PLAYER_IA_MASK_KEATON,
    /* 0x3B */ PLAYER_IA_MASK_SKULL,
    /* 0x3C */ PLAYER_IA_MASK_SPOOKY,
    /* 0x3D */ PLAYER_IA_MASK_BUNNY_HOOD,
    /* 0x3E */ PLAYER_IA_MASK_GORON,
    /* 0x3F */ PLAYER_IA_MASK_ZORA,
    /* 0x40 */ PLAYER_IA_MASK_GERUDO,
    /* 0x41 */ PLAYER_IA_MASK_TRUTH,
    /* 0x42 */ PLAYER_IA_LENS_OF_TRUTH,
    /* 0x43 */ PLAYER_IA_MAX
} PlayerItemAction;

typedef enum {
    /* 0x00 */ PLAYER_LIMB_NONE,
    /* 0x01 */ PLAYER_LIMB_ROOT,
    /* 0x02 */ PLAYER_LIMB_WAIST,
    /* 0x03 */ PLAYER_LIMB_LOWER,
    /* 0x04 */ PLAYER_LIMB_R_THIGH,
    /* 0x05 */ PLAYER_LIMB_R_SHIN,
    /* 0x06 */ PLAYER_LIMB_R_FOOT,
    /* 0x07 */ PLAYER_LIMB_L_THIGH,
    /* 0x08 */ PLAYER_LIMB_L_SHIN,
    /* 0x09 */ PLAYER_LIMB_L_FOOT,
    /* 0x0A */ PLAYER_LIMB_UPPER,
    /* 0x0B */ PLAYER_LIMB_HEAD,
    /* 0x0C */ PLAYER_LIMB_HAT,
    /* 0x0D */ PLAYER_LIMB_COLLAR,
    /* 0x0E */ PLAYER_LIMB_L_SHOULDER,
    /* 0x0F */ PLAYER_LIMB_L_FOREARM,
    /* 0x10 */ PLAYER_LIMB_L_HAND,
    /* 0x11 */ PLAYER_LIMB_R_SHOULDER,
    /* 0x12 */ PLAYER_LIMB_R_FOREARM,
    /* 0x13 */ PLAYER_LIMB_R_HAND,
    /* 0x14 */ PLAYER_LIMB_SHEATH,
    /* 0x15 */ PLAYER_LIMB_TORSO,
    /* 0x16 */ PLAYER_LIMB_MAX
} PlayerLimb;

typedef enum {
    /* 0x00 */ PLAYER_BODYPART_WAIST,      // PLAYER_LIMB_WAIST
    /* 0x01 */ PLAYER_BODYPART_R_THIGH,    // PLAYER_LIMB_R_THIGH
    /* 0x02 */ PLAYER_BODYPART_R_SHIN,     // PLAYER_LIMB_R_SHIN
    /* 0x03 */ PLAYER_BODYPART_R_FOOT,     // PLAYER_LIMB_R_FOOT
    /* 0x04 */ PLAYER_BODYPART_L_THIGH,    // PLAYER_LIMB_L_THIGH
    /* 0x05 */ PLAYER_BODYPART_L_SHIN,     // PLAYER_LIMB_L_SHIN
    /* 0x06 */ PLAYER_BODYPART_L_FOOT,     // PLAYER_LIMB_L_FOOT
    /* 0x07 */ PLAYER_BODYPART_HEAD,       // PLAYER_LIMB_HEAD
    /* 0x08 */ PLAYER_BODYPART_HAT,        // PLAYER_LIMB_HAT
    /* 0x09 */ PLAYER_BODYPART_COLLAR,     // PLAYER_LIMB_COLLAR
    /* 0x0A */ PLAYER_BODYPART_L_SHOULDER, // PLAYER_LIMB_L_SHOULDER
    /* 0x0B */ PLAYER_BODYPART_L_FOREARM,  // PLAYER_LIMB_L_FOREARM
    /* 0x0C */ PLAYER_BODYPART_L_HAND,     // PLAYER_LIMB_L_HAND
    /* 0x0D */ PLAYER_BODYPART_R_SHOULDER, // PLAYER_LIMB_R_SHOULDER
    /* 0x0E */ PLAYER_BODYPART_R_FOREARM,  // PLAYER_LIMB_R_FOREARM
    /* 0x0F */ PLAYER_BODYPART_R_HAND,     // PLAYER_LIMB_R_HAND
    /* 0x10 */ PLAYER_BODYPART_SHEATH,     // PLAYER_LIMB_SHEATH
    /* 0x11 */ PLAYER_BODYPART_TORSO,      // PLAYER_LIMB_TORSO
    /* 0x12 */ PLAYER_BODYPART_MAX
} PlayerBodyPart;

typedef enum {
    /*  0 */ PLAYER_MWA_FORWARD_SLASH_1H,
    /*  1 */ PLAYER_MWA_FORWARD_SLASH_2H,
    /*  2 */ PLAYER_MWA_FORWARD_COMBO_1H,
    /*  3 */ PLAYER_MWA_FORWARD_COMBO_2H,
    /*  4 */ PLAYER_MWA_RIGHT_SLASH_1H,
    /*  5 */ PLAYER_MWA_RIGHT_SLASH_2H,
    /*  6 */ PLAYER_MWA_RIGHT_COMBO_1H,
    /*  7 */ PLAYER_MWA_RIGHT_COMBO_2H,
    /*  8 */ PLAYER_MWA_LEFT_SLASH_1H,
    /*  9 */ PLAYER_MWA_LEFT_SLASH_2H,
    /* 10 */ PLAYER_MWA_LEFT_COMBO_1H,
    /* 11 */ PLAYER_MWA_LEFT_COMBO_2H,
    /* 12 */ PLAYER_MWA_STAB_1H,
    /* 13 */ PLAYER_MWA_STAB_2H,
    /* 14 */ PLAYER_MWA_STAB_COMBO_1H,
    /* 15 */ PLAYER_MWA_STAB_COMBO_2H,
    /* 16 */ PLAYER_MWA_FLIPSLASH_START,
    /* 17 */ PLAYER_MWA_JUMPSLASH_START,
    /* 18 */ PLAYER_MWA_FLIPSLASH_FINISH,
    /* 19 */ PLAYER_MWA_JUMPSLASH_FINISH,
    /* 20 */ PLAYER_MWA_BACKSLASH_RIGHT,
    /* 21 */ PLAYER_MWA_BACKSLASH_LEFT,
    /* 22 */ PLAYER_MWA_HAMMER_FORWARD,
    /* 23 */ PLAYER_MWA_HAMMER_SIDE,
    /* 24 */ PLAYER_MWA_SPIN_ATTACK_1H,
    /* 25 */ PLAYER_MWA_SPIN_ATTACK_2H,
    /* 26 */ PLAYER_MWA_BIG_SPIN_1H,
    /* 27 */ PLAYER_MWA_BIG_SPIN_2H,
    /* 28 */ PLAYER_MWA_MAX
} PlayerMeleeWeaponAnimation;

typedef enum {
    /* -1 */ PLAYER_DOORTYPE_AJAR = -1,
    /*  0 */ PLAYER_DOORTYPE_NONE,
    /*  1 */ PLAYER_DOORTYPE_HANDLE,
    /*  2 */ PLAYER_DOORTYPE_SLIDING,
    /*  3 */ PLAYER_DOORTYPE_FAKE
} PlayerDoorType;

typedef enum {
    /* 0x00 */ PLAYER_MODELGROUP_0, // unused (except with the `func_80091880` bug)
    /* 0x01 */ PLAYER_MODELGROUP_CHILD_HYLIAN_SHIELD, // kokiri/master sword, shield not in hand
    /* 0x02 */ PLAYER_MODELGROUP_SWORD, // kokiri/master sword and possibly shield
    /* 0x03 */ PLAYER_MODELGROUP_DEFAULT, // non-specific models, for items that don't have particular link models
    /* 0x04 */ PLAYER_MODELGROUP_4, // unused, same as PLAYER_MODELGROUP_DEFAULT
    /* 0x05 */ PLAYER_MODELGROUP_BGS, // biggoron sword
    /* 0x06 */ PLAYER_MODELGROUP_BOW_SLINGSHOT, // bow/slingshot
    /* 0x07 */ PLAYER_MODELGROUP_EXPLOSIVES, // bombs, bombchus, same as PLAYER_MODELGROUP_DEFAULT
    /* 0x08 */ PLAYER_MODELGROUP_BOOMERANG,
    /* 0x09 */ PLAYER_MODELGROUP_HOOKSHOT,
    /* 0x0A */ PLAYER_MODELGROUP_10, // stick/fishing pole (which are drawn separately)
    /* 0x0B */ PLAYER_MODELGROUP_HAMMER,
    /* 0x0C */ PLAYER_MODELGROUP_OCARINA, // ocarina
    /* 0x0D */ PLAYER_MODELGROUP_OOT, // ocarina of time
    /* 0x0E */ PLAYER_MODELGROUP_BOTTLE, // bottles (drawn separately)
    /* 0x0F */ PLAYER_MODELGROUP_15, // "last used"
    /* 0x10 */ PLAYER_MODELGROUP_MAX
} PlayerModelGroup;

typedef enum {
    /* 0x00 */ PLAYER_MODELGROUPENTRY_ANIM,
    /* 0x01 */ PLAYER_MODELGROUPENTRY_LEFT_HAND,
    /* 0x02 */ PLAYER_MODELGROUPENTRY_RIGHT_HAND,
    /* 0x03 */ PLAYER_MODELGROUPENTRY_SHEATH,
    /* 0x04 */ PLAYER_MODELGROUPENTRY_WAIST,
    /* 0x05 */ PLAYER_MODELGROUPENTRY_MAX
} PlayerModelGroupEntry;

typedef enum {
    // left hand
    /* 0x00 */ PLAYER_MODELTYPE_LH_OPEN, // empty open hand
    /* 0x01 */ PLAYER_MODELTYPE_LH_CLOSED, // empty closed hand
    /* 0x02 */ PLAYER_MODELTYPE_LH_SWORD, // holding kokiri/master sword
    /* 0x03 */ PLAYER_MODELTYPE_LH_SWORD_2, // unused, same as PLAYER_MODELTYPE_LH_SWORD
    /* 0x04 */ PLAYER_MODELTYPE_LH_BGS, // holding bgs/broken giant knife (child: master sword)
    /* 0x05 */ PLAYER_MODELTYPE_LH_HAMMER, // holding hammer (child: empty hand)
    /* 0x06 */ PLAYER_MODELTYPE_LH_BOOMERANG, // holding boomerang (adult: empty hand)
    /* 0x07 */ PLAYER_MODELTYPE_LH_BOTTLE, // holding bottle (bottle drawn separately)
    // right hand
    /* 0x08 */ PLAYER_MODELTYPE_RH_OPEN, // empty open hand
    /* 0x09 */ PLAYER_MODELTYPE_RH_CLOSED, // empty closed hand
    /* 0x0A */ PLAYER_MODELTYPE_RH_SHIELD, // holding a shield (including no shield)
    /* 0x0B */ PLAYER_MODELTYPE_RH_BOW_SLINGSHOT, // holding bow/slingshot
    /* 0x0C */ PLAYER_MODELTYPE_RH_BOW_SLINGSHOT_2, // unused, same as PLAYER_MODELTYPE_RH_BOW_SLINGSHOT
    /* 0x0D */ PLAYER_MODELTYPE_RH_OCARINA, // holding ocarina (child: fairy ocarina, adult: OoT)
    /* 0x0E */ PLAYER_MODELTYPE_RH_OOT, // holding OoT
    /* 0x0F */ PLAYER_MODELTYPE_RH_HOOKSHOT, // holding hookshot (child: empty hand)
    // sheath
    /* 0x10 */ PLAYER_MODELTYPE_SHEATH_16, // sheathed kokiri/master sword?
    /* 0x11 */ PLAYER_MODELTYPE_SHEATH_17, // empty sheath?
    /* 0x12 */ PLAYER_MODELTYPE_SHEATH_18, // sword sheathed and shield on back?
    /* 0x13 */ PLAYER_MODELTYPE_SHEATH_19, // empty sheath and shield on back?
    // waist
    /* 0x14 */ PLAYER_MODELTYPE_WAIST,
    /* 0x15 */ PLAYER_MODELTYPE_MAX,
    /* 0xFF */ PLAYER_MODELTYPE_RH_FF = 0xFF // disable shield collider, cutscene-specific
} PlayerModelType;

typedef enum {
    /* 0x00 */ PLAYER_ANIMTYPE_0,
    /* 0x01 */ PLAYER_ANIMTYPE_1,
    /* 0x02 */ PLAYER_ANIMTYPE_2,
    /* 0x03 */ PLAYER_ANIMTYPE_3,
    /* 0x04 */ PLAYER_ANIMTYPE_4,
    /* 0x05 */ PLAYER_ANIMTYPE_5,
    /* 0x06 */ PLAYER_ANIMTYPE_MAX
} PlayerAnimType;

/**
 * Temporary names, derived from original animation names in `D_80853914`
 */
typedef enum {
    /* 0x00 */ PLAYER_ANIMGROUP_wait,
    /* 0x01 */ PLAYER_ANIMGROUP_walk,
    /* 0x02 */ PLAYER_ANIMGROUP_run,
    /* 0x03 */ PLAYER_ANIMGROUP_damage_run,
    /* 0x04 */ PLAYER_ANIMGROUP_heavy_run,
    /* 0x05 */ PLAYER_ANIMGROUP_waitL,
    /* 0x06 */ PLAYER_ANIMGROUP_waitR,
    /* 0x07 */ PLAYER_ANIMGROUP_wait2waitR,
    /* 0x08 */ PLAYER_ANIMGROUP_normal2fighter,
    /* 0x09 */ PLAYER_ANIMGROUP_doorA_free,
    /* 0x0A */ PLAYER_ANIMGROUP_doorA,
    /* 0x0B */ PLAYER_ANIMGROUP_doorB_free,
    /* 0x0C */ PLAYER_ANIMGROUP_doorB,
    /* 0x0D */ PLAYER_ANIMGROUP_carryB,
    /* 0x0E */ PLAYER_ANIMGROUP_landing,
    /* 0x0F */ PLAYER_ANIMGROUP_short_landing,
    /* 0x10 */ PLAYER_ANIMGROUP_landing_roll,
    /* 0x11 */ PLAYER_ANIMGROUP_hip_down,
    /* 0x12 */ PLAYER_ANIMGROUP_walk_endL,
    /* 0x13 */ PLAYER_ANIMGROUP_walk_endR,
    /* 0x14 */ PLAYER_ANIMGROUP_defense,
    /* 0x15 */ PLAYER_ANIMGROUP_defense_wait,
    /* 0x16 */ PLAYER_ANIMGROUP_defense_end,
    /* 0x17 */ PLAYER_ANIMGROUP_side_walk,
    /* 0x18 */ PLAYER_ANIMGROUP_side_walkL,
    /* 0x19 */ PLAYER_ANIMGROUP_side_walkR,
    /* 0x1A */ PLAYER_ANIMGROUP_45_turn,
    /* 0x1B */ PLAYER_ANIMGROUP_waitL2wait,
    /* 0x1C */ PLAYER_ANIMGROUP_waitR2wait,
    /* 0x1D */ PLAYER_ANIMGROUP_throw,
    /* 0x1E */ PLAYER_ANIMGROUP_put,
    /* 0x1F */ PLAYER_ANIMGROUP_back_walk,
    /* 0x20 */ PLAYER_ANIMGROUP_check,
    /* 0x21 */ PLAYER_ANIMGROUP_check_wait,
    /* 0x22 */ PLAYER_ANIMGROUP_check_end,
    /* 0x23 */ PLAYER_ANIMGROUP_pull_start,
    /* 0x24 */ PLAYER_ANIMGROUP_pulling,
    /* 0x25 */ PLAYER_ANIMGROUP_pull_end,
    /* 0x26 */ PLAYER_ANIMGROUP_fall_up,
    /* 0x27 */ PLAYER_ANIMGROUP_jump_climb_hold,
    /* 0x28 */ PLAYER_ANIMGROUP_jump_climb_wait,
    /* 0x29 */ PLAYER_ANIMGROUP_jump_climb_up,
    /* 0x2A */ PLAYER_ANIMGROUP_down_slope_slip_end,
    /* 0x2B */ PLAYER_ANIMGROUP_up_slope_slip_end,
    /* 0x2C */ PLAYER_ANIMGROUP_nwait,
    /* 0x2D */ PLAYER_ANIMGROUP_MAX
} PlayerAnimGroup;

#define LIMB_BUF_COUNT(limbCount) ((ALIGN16((limbCount) * sizeof(Vec3s)) + sizeof(Vec3s) - 1) / sizeof(Vec3s))
#define PLAYER_LIMB_BUF_COUNT LIMB_BUF_COUNT(PLAYER_LIMB_MAX)

typedef enum {
    /* 0x00 */ PLAYER_CSACTION_NONE,
    /* 0x01 */ PLAYER_CSACTION_1,
    /* 0x02 */ PLAYER_CSACTION_2,
    /* 0x03 */ PLAYER_CSACTION_3,
    /* 0x04 */ PLAYER_CSACTION_4,
    /* 0x05 */ PLAYER_CSACTION_5,
    /* 0x06 */ PLAYER_CSACTION_6,
    /* 0x07 */ PLAYER_CSACTION_7,
    /* 0x08 */ PLAYER_CSACTION_8,
    /* 0x09 */ PLAYER_CSACTION_9,
    /* 0x0A */ PLAYER_CSACTION_10,
    /* 0x0B */ PLAYER_CSACTION_11,
    /* 0x0C */ PLAYER_CSACTION_12,
    /* 0x0D */ PLAYER_CSACTION_13,
    /* 0x0E */ PLAYER_CSACTION_14,
    /* 0x0F */ PLAYER_CSACTION_15,
    /* 0x10 */ PLAYER_CSACTION_16,
    /* 0x11 */ PLAYER_CSACTION_17,
    /* 0x12 */ PLAYER_CSACTION_18,
    /* 0x13 */ PLAYER_CSACTION_19,
    /* 0x14 */ PLAYER_CSACTION_20,
    /* 0x15 */ PLAYER_CSACTION_21,
    /* 0x16 */ PLAYER_CSACTION_22,
    /* 0x17 */ PLAYER_CSACTION_23,
    /* 0x18 */ PLAYER_CSACTION_24,
    /* 0x19 */ PLAYER_CSACTION_25,
    /* 0x1A */ PLAYER_CSACTION_26,
    /* 0x1B */ PLAYER_CSACTION_27,
    /* 0x1C */ PLAYER_CSACTION_28,
    /* 0x1D */ PLAYER_CSACTION_29,
    /* 0x1E */ PLAYER_CSACTION_30,
    /* 0x1F */ PLAYER_CSACTION_31,
    /* 0x20 */ PLAYER_CSACTION_32,
    /* 0x21 */ PLAYER_CSACTION_33,
    /* 0x22 */ PLAYER_CSACTION_34,
    /* 0x23 */ PLAYER_CSACTION_35,
    /* 0x24 */ PLAYER_CSACTION_36,
    /* 0x25 */ PLAYER_CSACTION_37,
    /* 0x26 */ PLAYER_CSACTION_38,
    /* 0x27 */ PLAYER_CSACTION_39,
    /* 0x28 */ PLAYER_CSACTION_40,
    /* 0x29 */ PLAYER_CSACTION_41,
    /* 0x2A */ PLAYER_CSACTION_42,
    /* 0x2B */ PLAYER_CSACTION_43,
    /* 0x2C */ PLAYER_CSACTION_44,
    /* 0x2D */ PLAYER_CSACTION_45,
    /* 0x2E */ PLAYER_CSACTION_46,
    /* 0x2F */ PLAYER_CSACTION_47,
    /* 0x30 */ PLAYER_CSACTION_48,
    /* 0x31 */ PLAYER_CSACTION_49,
    /* 0x32 */ PLAYER_CSACTION_50,
    /* 0x33 */ PLAYER_CSACTION_51,
    /* 0x34 */ PLAYER_CSACTION_52,
    /* 0x35 */ PLAYER_CSACTION_53,
    /* 0x36 */ PLAYER_CSACTION_54,
    /* 0x37 */ PLAYER_CSACTION_55,
    /* 0x38 */ PLAYER_CSACTION_56,
    /* 0x39 */ PLAYER_CSACTION_57,
    /* 0x3A */ PLAYER_CSACTION_58,
    /* 0x3B */ PLAYER_CSACTION_59,
    /* 0x3C */ PLAYER_CSACTION_60,
    /* 0x3D */ PLAYER_CSACTION_61,
    /* 0x3E */ PLAYER_CSACTION_62,
    /* 0x3F */ PLAYER_CSACTION_63,
    /* 0x40 */ PLAYER_CSACTION_64,
    /* 0x41 */ PLAYER_CSACTION_65,
    /* 0x42 */ PLAYER_CSACTION_66,
    /* 0x43 */ PLAYER_CSACTION_67,
    /* 0x44 */ PLAYER_CSACTION_68,
    /* 0x45 */ PLAYER_CSACTION_69,
    /* 0x46 */ PLAYER_CSACTION_70,
    /* 0x47 */ PLAYER_CSACTION_71,
    /* 0x48 */ PLAYER_CSACTION_72,
    /* 0x49 */ PLAYER_CSACTION_73,
    /* 0x4A */ PLAYER_CSACTION_74,
    /* 0x4B */ PLAYER_CSACTION_75,
    /* 0x4C */ PLAYER_CSACTION_76,
    /* 0x4D */ PLAYER_CSACTION_77,
    /* 0x4E */ PLAYER_CSACTION_78,
    /* 0x4F */ PLAYER_CSACTION_79,
    /* 0x50 */ PLAYER_CSACTION_80,
    /* 0x51 */ PLAYER_CSACTION_81,
    /* 0x52 */ PLAYER_CSACTION_82,
    /* 0x53 */ PLAYER_CSACTION_83,
    /* 0x54 */ PLAYER_CSACTION_84,
    /* 0x55 */ PLAYER_CSACTION_85,
    /* 0x56 */ PLAYER_CSACTION_86,
    /* 0x57 */ PLAYER_CSACTION_87,
    /* 0x58 */ PLAYER_CSACTION_88,
    /* 0x59 */ PLAYER_CSACTION_89,
    /* 0x5A */ PLAYER_CSACTION_90,
    /* 0x5B */ PLAYER_CSACTION_91,
    /* 0x5C */ PLAYER_CSACTION_92,
    /* 0x5D */ PLAYER_CSACTION_93,
    /* 0x5E */ PLAYER_CSACTION_94,
    /* 0x5F */ PLAYER_CSACTION_95,
    /* 0x60 */ PLAYER_CSACTION_96,
    /* 0x61 */ PLAYER_CSACTION_97,
    /* 0x62 */ PLAYER_CSACTION_98,
    /* 0x63 */ PLAYER_CSACTION_99,
    /* 0x64 */ PLAYER_CSACTION_100,
    /* 0x65 */ PLAYER_CSACTION_101,
    /* 0x66 */ PLAYER_CSACTION_102,
    /* 0x67 */ PLAYER_CSACTION_MAX
} PlayerCsAction;

typedef enum {
    /* 0 */ PLAYER_LEDGE_CLIMB_NONE,
    /* 1 */ PLAYER_LEDGE_CLIMB_1,
    /* 2 */ PLAYER_LEDGE_CLIMB_2,
    /* 3 */ PLAYER_LEDGE_CLIMB_3,
    /* 4 */ PLAYER_LEDGE_CLIMB_4
} PlayerLedgeClimbType;

typedef struct {
    /* 0x00 */ f32 ceilingCheckHeight;
    /* 0x04 */ f32 unk_04;
    /* 0x08 */ f32 unk_08;
    /* 0x0C */ f32 unk_0C;
    /* 0x10 */ f32 unk_10;
    /* 0x14 */ f32 unk_14;
    /* 0x18 */ f32 unk_18;
    /* 0x1C */ f32 unk_1C;
    /* 0x20 */ f32 unk_20;
    /* 0x24 */ f32 unk_24;
    /* 0x28 */ f32 unk_28;
    /* 0x2C */ f32 unk_2C;
    /* 0x30 */ f32 unk_30;
    /* 0x34 */ f32 unk_34;
    /* 0x38 */ f32 wallCheckRadius;
    /* 0x3C */ f32 unk_3C;
    /* 0x40 */ f32 unk_40;
    /* 0x44 */ Vec3s unk_44;
    /* 0x4A */ Vec3s unk_4A[4];
    /* 0x62 */ Vec3s unk_62[4];
    /* 0x7A */ Vec3s unk_7A[2];
    /* 0x86 */ Vec3s unk_86[2];
    /* 0x92 */ u16 unk_92;
    /* 0x94 */ u16 unk_94;
    /* 0x98 */ LinkAnimationHeader* unk_98;
    /* 0x9C */ LinkAnimationHeader* unk_9C;
    /* 0xA0 */ LinkAnimationHeader* unk_A0;
    /* 0xA4 */ LinkAnimationHeader* unk_A4;
    /* 0xA8 */ LinkAnimationHeader* unk_A8;
    /* 0xAC */ LinkAnimationHeader* unk_AC[4];
    /* 0xBC */ LinkAnimationHeader* unk_BC[2];
    /* 0xC4 */ LinkAnimationHeader* unk_C4[2];
    /* 0xCC */ LinkAnimationHeader* unk_CC[2];
} PlayerAgeProperties; // size = 0xD4

typedef struct {
    /* 0x00 */ s32 active;
    /* 0x04 */ Vec3f tip;
    /* 0x10 */ Vec3f base;
} WeaponInfo; // size = 0x1C

#define LEDGE_DIST_MAX 399.96002f

#define PLAYER_STATE1_0 (1 << 0)
#define PLAYER_STATE1_SWINGING_BOTTLE (1 << 1)
#define PLAYER_STATE1_2 (1 << 2)
#define PLAYER_STATE1_3 (1 << 3)
#define PLAYER_STATE1_4 (1 << 4)
#define PLAYER_STATE1_5 (1 << 5)
#define PLAYER_STATE1_6 (1 << 6)
#define PLAYER_STATE1_7 (1 << 7)
#define PLAYER_STATE1_START_CHANGING_HELD_ITEM (1 << 8)
#define PLAYER_STATE1_9 (1 << 9)
#define PLAYER_STATE1_10 (1 << 10)
#define PLAYER_STATE1_11 (1 << 11)
#define PLAYER_STATE1_12 (1 << 12)
#define PLAYER_STATE1_13 (1 << 13)
#define PLAYER_STATE1_14 (1 << 14)
#define PLAYER_STATE1_15 (1 << 15)
#define PLAYER_STATE1_16 (1 << 16)
#define PLAYER_STATE1_17 (1 << 17)
#define PLAYER_STATE1_18 (1 << 18)
#define PLAYER_STATE1_19 (1 << 19)
#define PLAYER_STATE1_20 (1 << 20)
#define PLAYER_STATE1_21 (1 << 21)
#define PLAYER_STATE1_22 (1 << 22)
#define PLAYER_STATE1_23 (1 << 23)
#define PLAYER_STATE1_24 (1 << 24)
#define PLAYER_STATE1_25 (1 << 25)
#define PLAYER_STATE1_26 (1 << 26)
#define PLAYER_STATE1_27 (1 << 27)
#define PLAYER_STATE1_28 (1 << 28)
#define PLAYER_STATE1_29 (1 << 29)
#define PLAYER_STATE1_30 (1 << 30)
#define PLAYER_STATE1_31 (1 << 31)

#define PLAYER_STATE2_0 (1 << 0)
#define PLAYER_STATE2_1 (1 << 1)
#define PLAYER_STATE2_2 (1 << 2)
#define PLAYER_STATE2_3 (1 << 3)
#define PLAYER_STATE2_4 (1 << 4)
#define PLAYER_STATE2_5 (1 << 5)
#define PLAYER_STATE2_6 (1 << 6)
#define PLAYER_STATE2_7 (1 << 7)
#define PLAYER_STATE2_8 (1 << 8)
#define PLAYER_STATE2_FORCE_SAND_FLOOR_SOUND (1 << 9)
#define PLAYER_STATE2_10 (1 << 10)
#define PLAYER_STATE2_11 (1 << 11)
#define PLAYER_STATE2_12 (1 << 12)
#define PLAYER_STATE2_13 (1 << 13)
#define PLAYER_STATE2_14 (1 << 14)
#define PLAYER_STATE2_15 (1 << 15)
#define PLAYER_STATE2_DO_ACTION_ENTER (1 << 16) // Turns on the "Enter On A" DoAction
#define PLAYER_STATE2_17 (1 << 17)
#define PLAYER_STATE2_CRAWLING (1 << 18) // Crawling through a crawlspace
#define PLAYER_STATE2_19 (1 << 19)
#define PLAYER_STATE2_20 (1 << 20)
#define PLAYER_STATE2_21 (1 << 21)
#define PLAYER_STATE2_22 (1 << 22)
#define PLAYER_STATE2_23 (1 << 23)
#define PLAYER_STATE2_24 (1 << 24)
#define PLAYER_STATE2_25 (1 << 25)
#define PLAYER_STATE2_26 (1 << 26)
#define PLAYER_STATE2_27 (1 << 27)
#define PLAYER_STATE2_28 (1 << 28)
#define PLAYER_STATE2_29 (1 << 29)
#define PLAYER_STATE2_30 (1 << 30)
#define PLAYER_STATE2_31 (1 << 31)

#define PLAYER_STATE3_0 (1 << 0)
#define PLAYER_STATE3_1 (1 << 1)
#define PLAYER_STATE3_2 (1 << 2)
#define PLAYER_STATE3_3 (1 << 3)
#define PLAYER_STATE3_4 (1 << 4)
#define PLAYER_STATE3_5 (1 << 5)
#define PLAYER_STATE3_RESTORE_NAYRUS_LOVE (1 << 6) // Set by ocarina effects actors when destroyed to signal Nayru's Love may be restored (see `ACTOROVL_ALLOC_ABSOLUTE`)
#define PLAYER_STATE3_7 (1 << 7)

#define PLAYER_ALLOC_GI_MIN 0x2880 // title card maximum file size

typedef void (*PlayerActionFunc)(struct Player*, struct PlayState*);
typedef s32 (*ItemActionFunc)(struct Player*, struct PlayState*);
typedef void (*PlayerFuncA74)(struct PlayState*, struct Player*);

typedef struct Player {
    /* 0x0000 */ Actor actor;
    /* 0x014C */ s8 currentTunic; // current tunic from `PlayerTunic`
    /* 0x014D */ s8 currentSwordItemId;
    /* 0x014E */ s8 currentShield; // current shield from `PlayerShield`
    /* 0x014F */ s8 currentBoots; // current boots from `PlayerBoots`
    /* 0x0150 */ s8 heldItemButton; // Button index for the item currently used
    /* 0x0151 */ s8 heldItemAction; // Item action for the item currently used
    /* 0x0152 */ u8 heldItemId; // Item id for the item currently used
    /* 0x0153 */ s8 prevBoots; // previous boots from `PlayerBoots`
    /* 0x0154 */ s8 itemAction; // the difference between this and heldItemAction is unclear
    /* 0x0155 */ char unk_155[0x003];
    /* 0x0158 */ u8 modelGroup;
    /* 0x0159 */ u8 nextModelGroup;
    /* 0x015A */ s8 itemChangeType;
    /* 0x015B */ u8 modelAnimType;
    /* 0x015C */ u8 leftHandType;
    /* 0x015D */ u8 rightHandType;
    /* 0x015E */ u8 sheathType;
    /* 0x015F */ u8 currentMask; // current mask equipped from `PlayerMask`
    /* 0x0160 */ Gfx** rightHandDLists;
    /* 0x0164 */ Gfx** leftHandDLists;
    /* 0x0168 */ Gfx** sheathDLists;
    /* 0x016C */ Gfx** waistDLists;
    /* 0x0170 */ u8 giObjectLoading;
    /* 0x0174 */ DmaRequest giObjectDmaRequest;
    /* 0x0194 */ OSMesgQueue giObjectLoadQueue;
    /* 0x01AC */ OSMesg giObjectLoadMsg;
    /* 0x01B0 */ void* giObjectSegment; // also used for title card textures
    /* 0x01B4 */ SkelAnime skelAnime;
    /* 0x01F8 */ Vec3s jointTable[PLAYER_LIMB_BUF_COUNT];
    /* 0x0288 */ Vec3s morphTable[PLAYER_LIMB_BUF_COUNT];
    /* 0x0318 */ Vec3s blendTable[PLAYER_LIMB_BUF_COUNT];
    /* 0x03A8 */ s16 unk_3A8[2];
    /* 0x03AC */ Actor* heldActor;
    /* 0x03B0 */ Vec3f leftHandPos;
    /* 0x03BC */ Vec3s unk_3BC;
    /* 0x03C4 */ Actor* unk_3C4;
    /* 0x03C8 */ Vec3f unk_3C8;
    /* 0x03D4 */ char unk_3D4[0x058];
    /* 0x042C */ s8 doorType;
    /* 0x042D */ s8 doorDirection;
    /* 0x042E */ s16 doorTimer;
    /* 0x0430 */ Actor* doorActor;
    /* 0x0434 */ s8 getItemId;
    /* 0x0436 */ u16 getItemDirection;
    /* 0x0438 */ Actor* interactRangeActor;
    /* 0x043C */ s8 mountSide;
    /* 0x043D */ char unk_43D[0x003];
    /* 0x0440 */ Actor* rideActor;
    /* 0x0444 */ u8 csAction;
    /* 0x0445 */ u8 prevCsAction;
    /* 0x0446 */ u8 cueId;
    /* 0x0447 */ u8 unk_447;
    /* 0x0448 */ Actor* unk_448;
    /* 0x044C */ char unk_44C[0x004];
    /* 0x0450 */ Vec3f unk_450;
    /* 0x045C */ Vec3f unk_45C;
    /* 0x0468 */ char unk_468[0x002];
    /* 0x046A */ s16 doorBgCamIndex;
    /* 0x046C */ s16 subCamId;
    /* 0x046E */ char unk_46E[0x02A];
    /* 0x0498 */ ColliderCylinder cylinder;
    /* 0x04E4 */ ColliderQuad meleeWeaponQuads[2];
    /* 0x05E4 */ ColliderQuad shieldQuad;
    /* 0x0664 */ Actor* unk_664;
    /* 0x0668 */ char unk_668[0x004];
    /* 0x066C */ s32 unk_66C;
    /* 0x0670 */ s32 meleeWeaponEffectIndex;
    /* 0x0674 */ PlayerActionFunc actionFunc;
    /* 0x0678 */ PlayerAgeProperties* ageProperties;
    /* 0x067C */ u32 stateFlags1;
    /* 0x0680 */ u32 stateFlags2;
    /* 0x0684 */ Actor* unk_684;
    /* 0x0688 */ Actor* boomerangActor;
    /* 0x068C */ Actor* naviActor;
    /* 0x0690 */ s16 naviTextId;
    /* 0x0692 */ u8 stateFlags3;
    /* 0x0693 */ s8 exchangeItemId;
    /* 0x0694 */ Actor* targetActor;
    /* 0x0698 */ f32 targetActorDistance;
    /* 0x069C */ char unk_69C[0x004];
    /* 0x06A0 */ f32 unk_6A0;
    /* 0x06A4 */ f32 closestSecretDistSq;
    /* 0x06A8 */ Actor* unk_6A8;
    /* 0x06AC */ s8 unk_6AC;
    /* 0x06AD */ u8 unk_6AD;
    /* 0x06AE */ u16 unk_6AE;
    /* 0x06B0 */ s16 unk_6B0;
    /* 0x06B2 */ char unk_6B4[0x004];
    /* 0x06B6 */ s16 unk_6B6;
    /* 0x06B8 */ s16 unk_6B8;
    /* 0x06BA */ s16 unk_6BA;
    /* 0x06BC */ s16 unk_6BC;
    /* 0x06BE */ s16 unk_6BE;
    /* 0x06C0 */ s16 unk_6C0;
    /* 0x06C2 */ s16 unk_6C2;
    /* 0x06C4 */ f32 unk_6C4;
    /* 0x06C8 */ SkelAnime skelAnimeUpper;
    /* 0x070C */ Vec3s jointTableUpper[PLAYER_LIMB_BUF_COUNT];
    /* 0x079C */ Vec3s morphTableUpper[PLAYER_LIMB_BUF_COUNT];
    /* 0x082C */ ItemActionFunc itemActionFunc;
    /* 0x0830 */ f32 skelAnimeUpperBlendWeight;
    /* 0x0834 */ s16 unk_834;
    /* 0x0836 */ s8 unk_836;
    /* 0x0837 */ u8 unk_837;
    /* 0x0838 */ f32 speedXZ; // Controls horizontal speed, used for `actor.speed`. Current or target value depending on context.
    /* 0x083C */ s16 yaw; // General yaw value, used both for world and shape rotation. Current or target value depending on context.
    /* 0x083E */ s16 zTargetYaw; // yaw relating to Z targeting/"parallel" mode
    /* 0x0840 */ u16 underwaterTimer;
    /* 0x0842 */ s8 meleeWeaponAnimation;
    /* 0x0843 */ s8 meleeWeaponState;
    /* 0x0844 */ s8 unk_844;
    /* 0x0845 */ u8 unk_845;
    /* 0x0846 */ u8 unk_846;
    /* 0x0847 */ s8 unk_847[4];
    /* 0x084B */ s8 unk_84B[4];
    /* 0x084F */ s8 actionVar1; // context dependent variable that has different meanings depending on what action is currently running
    /* 0x0850 */ s16 actionVar2; // context dependent variable that has different meanings depending on what action is currently running
    /* 0x0854 */ f32 unk_854;
    /* 0x0858 */ f32 unk_858;
    /* 0x085C */ f32 unk_85C; // stick length among other things
    /* 0x0860 */ s16 unk_860; // stick flame timer among other things
    /* 0x0862 */ s8 unk_862; // get item draw ID + 1
    /* 0x0864 */ f32 unk_864;
    /* 0x0868 */ f32 unk_868;
    /* 0x086C */ f32 unk_86C;
    /* 0x0870 */ f32 unk_870;
    /* 0x0874 */ f32 unk_874;
    /* 0x0878 */ f32 unk_878;
    /* 0x087C */ s16 unk_87C;
    /* 0x087E */ s16 unk_87E;
    /* 0x0880 */ f32 unk_880;
    /* 0x0884 */ f32 yDistToLedge; // y distance to ground above an interact wall. LEDGE_DIST_MAX if no ground is found
    /* 0x0888 */ f32 distToInteractWall; // xyz distance to the interact wall
    /* 0x088C */ u8 ledgeClimbType;
    /* 0x088D */ u8 ledgeClimbDelayTimer;
    /* 0x088E */ u8 unk_88E;
    /* 0x088F */ u8 unk_88F;
    /* 0x0890 */ u8 unk_890;
    /* 0x0891 */ u8 shockTimer;
    /* 0x0892 */ u8 unk_892;
    /* 0x0893 */ u8 hoverBootsTimer;
    /* 0x0894 */ s16 fallStartHeight; // last truncated Y position before falling
    /* 0x0896 */ s16 fallDistance; // truncated Y distance the player has fallen so far (positive is down)
    /* 0x0898 */ s16 floorPitch; // angle of the floor slope in the direction of current world yaw (positive for ascending slope)
    /* 0x089A */ s16 floorPitchAlt; // the calculation for this value is bugged and doesn't represent anything meaningful
    /* 0x089C */ s16 unk_89C;
    /* 0x089E */ u16 floorSfxOffset;
    /* 0x08A0 */ u8 unk_8A0;
    /* 0x08A1 */ u8 unk_8A1;
    /* 0x08A2 */ s16 unk_8A2;
    /* 0x08A4 */ f32 unk_8A4;
    /* 0x08A8 */ f32 unk_8A8;
    /* 0x08AC */ f32 pushedSpeed; // Pushing player, examples include water currents, floor conveyors, climbing sloped surfaces
    /* 0x08B0 */ s16 pushedYaw; // Yaw direction of player being pushed
    /* 0x08B4 */ WeaponInfo meleeWeaponInfo[3];
    /* 0x0908 */ Vec3f bodyPartsPos[PLAYER_BODYPART_MAX];
    /* 0x09E0 */ MtxF mf_9E0;
    /* 0x0A20 */ MtxF shieldMf;
    /* 0x0A60 */ u8 isBurning;
    /* 0x0A61 */ u8 flameTimers[PLAYER_BODYPART_MAX]; // one flame per body part
    /* 0x0A73 */ u8 unk_A73;
    /* 0x0A74 */ PlayerFuncA74 func_A74;
    /* 0x0A78 */ s8 invincibilityTimer; // prevents damage when nonzero (positive = visible, counts towards zero each frame)
    /* 0x0A79 */ u8 floorTypeTimer; // counts up every frame the current floor type is the same as the last frame
    /* 0x0A7A */ u8 floorProperty;
    /* 0x0A7B */ u8 prevFloorType;
    /* 0x0A7C */ f32 prevControlStickMagnitude;
    /* 0x0A80 */ s16 prevControlStickAngle;
    /* 0x0A82 */ u16 prevFloorSfxOffset;
    /* 0x0A84 */ s16 unk_A84;
    /* 0x0A86 */ s8 unk_A86;
    /* 0x0A87 */ u8 unk_A87;
    /* 0x0A88 */ Vec3f unk_A88; // previous body part 0 position
} Player; // size = 0xA94

#endif
