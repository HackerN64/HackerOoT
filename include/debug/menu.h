#ifndef HACKEROOT_MENU_H
#define HACKEROOT_MENU_H

#define qs105(n) ((s16)((n) * 0x0020))

#define gdSPDefVtxN(x, y, z, s, t, nx, ny, nz, ca) \
	( \
		(Vtx) \
		{ \
			.n = \
			{ \
				.ob = {x, y, z}, \
				.tc = {qs105(s), qs105(t)}, \
				.n = {nx, ny, nz}, \
				.a = ca \
			} \
		} \
	)

#define gDisplayListData(pgdl, d) \
({ \
	Gfx **Gp_ = (void *)(pgdl); \
	struct \
	{ \
		__typeof__(d) v; \
	} *Gd_, *Gs_; \
	*Gp_ -= (sizeof(*Gd_) + sizeof(Gfx) - 1) / sizeof(Gfx); \
	Gd_ = (void *)*Gp_; \
	Gs_ = (void *)&(d); \
	*Gd_ = *Gs_; \
	&Gd_->v; \
})

typedef u8 (*MenuFunc)(void*);

typedef enum MenuSelection {
    MENU_MIN = -1,
    MENU_PROFILER,
    MENU_DUMMY1,
    MENU_DUMMY2,
    MENU_DUMMY3,
    MENU_DUMMY4,
    MENU_MAX
} MenuSelection;

typedef enum MenuSurfaceWallParams {
    SURFACE_WALL_NO_LEDGE_GRAB = 0x1,
    SURFACE_WALL_LADDER = 0x2,
    SURFACE_WALL_LADDER_TOP = 0x3,
    SURFACE_WALL_VINE = 0x4,
    SURFACE_WALL_CRAWL_A = 0x5,
    SURFACE_WALL_CRAWL_B = 0x6,
    SURFACE_WALL_PUSH = 0x7,
} MenuSurfaceWallParams;

typedef enum MenuSurfaceFloorParams {
    SURFACE_FLOOR_VOID_SMALL = 0x5,
    SURFACE_FLOOR_HANG_LEDGE = 0x6,
    SURFACE_FLOOR_STOP_AIR_MOMENTUM = 0x8,
    SURFACE_FLOOR_NO_LEDGE_JUMP = 0x9,
    SURFACE_FLOOR_DIVE = 0xB,
    SURFACE_FLOOR_VOID = 0xC,
} MenuSurfaceFloorParams;

typedef struct MenuPolygonTypes {
    // HIGH
    struct {
        u32 blockEpona   : 1;
        u32 lowerSurface : 1;
        u32 floorParams  : 4;
        u32 wallParams   : 5;
        u32 unk_001C0000 : 3;
        u32 behaviour    : 5;
        u32 exit         : 5;
        u32 camDataIndex : 8;
    };
    // LOW
    struct {
        u32 pad           : 4;
        u32 wallDamage    : 1;
        u32 conveyorDir   : 6;
        u32 conveyorSpeed : 3;
        u32 hookshot      : 1;
        u32 echo          : 6;
        u32 lightParams   : 5;
        u32 slope         : 2;
        u32 sfx           : 4;
    };
} MenuPolygonTypes;

typedef struct MenuElement {
    char* name;
    u8 bToggle;
    void* pStruct;
    MenuFunc updateFunc;
    MenuFunc drawFunc;
} MenuElement;

typedef struct Menu {
    u8 bShow;
    u8 bExecute;
    u8 bReturn;
    u8 nTimer;
    u8 bColViewEnabled;
    MenuSelection eSelection;
    struct PlayState* pPlay;
    Input* pInput;
} Menu;

void Menu_Init(Menu* this);
void Menu_Update(Menu* this);
void Menu_Draw(Menu* this);
void Menu_DrawCollisionView(Menu* this);

#endif
