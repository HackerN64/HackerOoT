/**
 * @file vimodepal60lan1.c
 *
 * PAL60 LAN1 Video Mode
 *
 * L = Low Resolution
 * A = Anti-Aliased
 * N = Deinterlaced
 * 1 = 16-bit Framebuffer
 */
#include "global.h"
#include "ultra64/viint.h"

// clang-format off

/*
 * Based on FPAL LAN1 but with (approximately) NTSC VSYNC and NTSC VSTART.
 * This mode may behave poorly on emulators (e.g. an emulator may refresh at only 50Hz);
 * in that case just use an NTSC mode instead, such an emulator surely doesn't care about the differences.
 */
OSViMode gCustomViModePal60Lan1 = {
    VI_CUSTOM_PAL60_LAN1, // type
    {
        // comRegs
        VI_CTRL_TYPE_16 | VI_CTRL_GAMMA_DITHER_ON | VI_CTRL_GAMMA_ON | VI_CTRL_DIVOT_ON | VI_CTRL_ANTIALIAS_MODE_1 |
            VI_CTRL_PIXEL_ADV_3, // ctrl
        WIDTH(320),               // width
        BURST(58, 30, 4, 69),     // burst
        // Ideally VSYNC would be 525 but this produces marginally-too-slow retraces. 519 is the closest value that
        // produces an ~16.6ms retrace (specifically about 16.70ms). We expect 519 to be OK compatibility-wise, it's
        // within 1.5% of the nominal value.
        VSYNC(519),               // vSync
        // We could also have modified HSYNC to correct the retrace timings, however in general HSYNC is more sensitive
        // than VSYNC so we choose to leave HSYNC at the nominal value.
        HSYNC(3177, 23),          // hSync
        LEAP(3183, 3181),         // leap
        HSTART(128, 768),         // hStart
        SCALE(2, 0),              // xScale
        VCURRENT(0),              // vCurrent
    },
    { // fldRegs
      {
          // [0]
          ORIGIN(640),         // origin
          SCALE(1, 0),         // yScale
          START(37, 511),      // vStart
          BURST(107, 2, 9, 0), // vBurst
          VINTR(2),            // vIntr
      },
      {
          // [1]
          ORIGIN(640),         // origin
          SCALE(1, 0),         // yScale
          START(37, 511),      // vStart
          BURST(107, 2, 9, 0), // vBurst
          VINTR(2),            // vIntr
      } },
};

// clang-format on
