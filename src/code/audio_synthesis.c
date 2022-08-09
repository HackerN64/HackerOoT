#include "ultra64.h"
#include "global.h"

// DMEM Addresses for the RSP
#define DMEM_TEMP 0x3C0
#define DMEM_UNCOMPRESSED_NOTE 0x580
#define DMEM_NOTE_PAN_TEMP 0x5C0
#define DMEM_SCRATCH2 0x760              // = DMEM_TEMP + DMEM_2CH_SIZE + a bit more
#define DMEM_COMPRESSED_ADPCM_DATA 0x940 // = DMEM_LEFT_CH
#define DMEM_LEFT_CH 0x940
#define DMEM_RIGHT_CH 0xAE0
#define DMEM_WET_TEMP 0x3E0
#define DMEM_WET_SCRATCH 0x720 // = DMEM_WET_TEMP + DMEM_2CH_SIZE
#define DMEM_WET_LEFT_CH 0xC80
#define DMEM_WET_RIGHT_CH 0xE20 // = DMEM_WET_LEFT_CH + DMEM_1CH_SIZE

Acmd* AudioSynth_LoadRingBufferPart(Acmd* cmd, u16 dmem, u16 startPos, s32 size, SynthesisReverb* reverb);
Acmd* AudioSynth_SaveBufferOffset(Acmd* cmd, u16 dmem, u16 offset, s32 size, s16* buf);
Acmd* AudioSynth_SaveRingBufferPart(Acmd* cmd, u16 dmem, u16 startPos, s32 size, SynthesisReverb* reverb);
Acmd* AudioSynth_DoOneAudioUpdate(s16* aiBuf, s32 aiBufLen, Acmd* cmd, s32 updateIndex);
Acmd* AudioSynth_ProcessNote(s32 noteIndex, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s16* aiBuf,
                             s32 aiBufLen, Acmd* cmd, s32 updateIndex);
Acmd* AudioSynth_LoadWaveSamples(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s32 numSamplesToLoad);
Acmd* AudioSynth_NoteApplyHeadsetPanEffects(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s32 bufLen,
                                            s32 flags, s32 side);
Acmd* AudioSynth_ProcessEnvelope(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s32 aiBufLen,
                                 u16 inBuf, s32 headsetPanSettings, s32 flags);
Acmd* AudioSynth_FinalResample(Acmd* cmd, NoteSynthesisState* synthState, s32 size, u16 pitch, u16 inpDmem,
                               s32 resampleFlags);

u32 D_801304A0 = _SHIFTL(A_ENVMIXER, 24, 8);
u32 D_801304A4 = MK_CMD(DMEM_NOTE_PAN_TEMP >> 4, DMEM_RIGHT_CH >> 4, DMEM_WET_LEFT_CH >> 4, DMEM_WET_RIGHT_CH >> 4);
u32 D_801304A8 = MK_CMD(DMEM_LEFT_CH >> 4, DMEM_NOTE_PAN_TEMP >> 4, DMEM_WET_LEFT_CH >> 4, DMEM_WET_RIGHT_CH >> 4);
u32 D_801304AC = MK_CMD(DMEM_LEFT_CH >> 4, DMEM_RIGHT_CH >> 4, DMEM_WET_LEFT_CH >> 4, DMEM_WET_RIGHT_CH >> 4);

u16 D_801304B0[] = {
    0x7FFF, 0xD001, 0x3FFF, 0xF001, 0x5FFF, 0x9001, 0x7FFF, 0x8001,
};

u8 sNumSamplesPerWavePeriod[] = {
    WAVE_SAMPLE_COUNT,     // 1st harmonic
    WAVE_SAMPLE_COUNT / 2, // 2nd harmonic
    WAVE_SAMPLE_COUNT / 4, // 4th harmonic
    WAVE_SAMPLE_COUNT / 8, // 8th harmonic
};

void AudioSynth_InitNextRingBuf(s32 chunkLen, s32 updateIndex, s32 reverbIndex) {
    ReverbRingBufferItem* bufItem;
    s32 pad[3];
    SynthesisReverb* reverb = &gAudioContext.synthesisReverbs[reverbIndex];
    s32 temp_a0_2;
    s32 temp_a0_4;
    s32 numSamples;
    s32 extraSamples;
    s32 i;
    s32 j;

    if (reverb->downsampleRate >= 2) {
        if (reverb->framesToIgnore == 0) {
            bufItem = &reverb->items[reverb->curFrame][updateIndex];
            Audio_InvalDCache(bufItem->toDownsampleLeft, DMEM_2CH_SIZE);

            for (j = 0, i = 0; i < bufItem->lengthA / (s32)SAMPLE_SIZE; j += reverb->downsampleRate, i++) {
                reverb->leftRingBuf[bufItem->startPos + i] = bufItem->toDownsampleLeft[j];
                reverb->rightRingBuf[bufItem->startPos + i] = bufItem->toDownsampleRight[j];
            }

            for (i = 0; i < bufItem->lengthB / (s32)SAMPLE_SIZE; j += reverb->downsampleRate, i++) {
                reverb->leftRingBuf[i] = bufItem->toDownsampleLeft[j];
                reverb->rightRingBuf[i] = bufItem->toDownsampleRight[j];
            }
        }
    }

    bufItem = &reverb->items[reverb->curFrame][updateIndex];
    numSamples = chunkLen / reverb->downsampleRate;
    extraSamples = (numSamples + reverb->nextRingBufPos) - reverb->bufSizePerChan;
    temp_a0_2 = reverb->nextRingBufPos;
    if (extraSamples < 0) {
        bufItem->lengthA = numSamples * SAMPLE_SIZE;
        bufItem->lengthB = 0;
        bufItem->startPos = reverb->nextRingBufPos;
        reverb->nextRingBufPos += numSamples;
    } else {
        // End of the buffer is reached. Loop back around
        bufItem->lengthA = (numSamples - extraSamples) * SAMPLE_SIZE;
        bufItem->lengthB = extraSamples * SAMPLE_SIZE;
        bufItem->startPos = reverb->nextRingBufPos;
        reverb->nextRingBufPos = extraSamples;
    }

    bufItem->numSamplesAfterDownsampling = numSamples;
    bufItem->chunkLen = chunkLen;

    if (reverb->unk_14 != 0) {
        temp_a0_4 = reverb->unk_14 + temp_a0_2;
        if (temp_a0_4 >= reverb->bufSizePerChan) {
            temp_a0_4 -= reverb->bufSizePerChan;
        }
        bufItem = &reverb->items2[reverb->curFrame][updateIndex];
        numSamples = chunkLen / reverb->downsampleRate;
        extraSamples = (temp_a0_4 + numSamples) - reverb->bufSizePerChan;
        if (extraSamples < 0) {
            bufItem->lengthA = numSamples * SAMPLE_SIZE;
            bufItem->lengthB = 0;
            bufItem->startPos = temp_a0_4;
        } else {
            // End of the buffer is reached. Loop back around
            bufItem->lengthA = (numSamples - extraSamples) * SAMPLE_SIZE;
            bufItem->lengthB = extraSamples * SAMPLE_SIZE;
            bufItem->startPos = temp_a0_4;
        }
        bufItem->numSamplesAfterDownsampling = numSamples;
        bufItem->chunkLen = chunkLen;
    }
}

void func_800DB03C(s32 updateIndex) {
    NoteSubEu* subEu;
    NoteSubEu* subEu2;
    s32 baseIndex;
    s32 i;

    baseIndex = gAudioContext.numNotes * updateIndex;
    for (i = 0; i < gAudioContext.numNotes; i++) {
        subEu = &gAudioContext.notes[i].noteSubEu;
        subEu2 = &gAudioContext.noteSubsEu[baseIndex + i];
        if (subEu->bitField0.enabled) {
            subEu->bitField0.needsInit = false;
        } else {
            subEu2->bitField0.enabled = false;
        }

        subEu->harmonicIndexCurAndPrev = 0;
    }
}

Acmd* AudioSynth_Update(Acmd* cmdStart, s32* cmdCnt, s16* aiStart, s32 aiBufLen) {
    s32 chunkLen;
    s16* aiBufP;
    Acmd* cmdP;
    s32 i;
    s32 j;
    SynthesisReverb* reverb;

    cmdP = cmdStart;
    for (i = gAudioContext.audioBufferParameters.updatesPerFrame; i > 0; i--) {
        AudioSeq_ProcessSequences(i - 1);
        func_800DB03C(gAudioContext.audioBufferParameters.updatesPerFrame - i);
    }

    aiBufP = aiStart;
    gAudioContext.curLoadedBook = NULL;

    for (i = gAudioContext.audioBufferParameters.updatesPerFrame; i > 0; i--) {
        if (i == 1) {
            chunkLen = aiBufLen;
        } else if ((aiBufLen / i) >= gAudioContext.audioBufferParameters.samplesPerUpdateMax) {
            chunkLen = gAudioContext.audioBufferParameters.samplesPerUpdateMax;
        } else if (gAudioContext.audioBufferParameters.samplesPerUpdateMin >= (aiBufLen / i)) {
            chunkLen = gAudioContext.audioBufferParameters.samplesPerUpdateMin;
        } else {
            chunkLen = gAudioContext.audioBufferParameters.samplesPerUpdate;
        }

        for (j = 0; j < gAudioContext.numSynthesisReverbs; j++) {
            if (gAudioContext.synthesisReverbs[j].useReverb) {
                AudioSynth_InitNextRingBuf(chunkLen, gAudioContext.audioBufferParameters.updatesPerFrame - i, j);
            }
        }

        cmdP = AudioSynth_DoOneAudioUpdate(aiBufP, chunkLen, cmdP,
                                           gAudioContext.audioBufferParameters.updatesPerFrame - i);
        aiBufLen -= chunkLen;
        aiBufP += 2 * chunkLen;
    }

    for (j = 0; j < gAudioContext.numSynthesisReverbs; j++) {
        if (gAudioContext.synthesisReverbs[j].framesToIgnore != 0) {
            gAudioContext.synthesisReverbs[j].framesToIgnore--;
        }
        gAudioContext.synthesisReverbs[j].curFrame ^= 1;
    }

    *cmdCnt = cmdP - cmdStart;
    return cmdP;
}

void func_800DB2C0(s32 updateIndex, s32 noteIndex) {
    NoteSubEu* noteSubEu;
    s32 i;

    for (i = updateIndex + 1; i < gAudioContext.audioBufferParameters.updatesPerFrame; i++) {
        noteSubEu = &gAudioContext.noteSubsEu[(gAudioContext.numNotes * i) + noteIndex];
        if (!noteSubEu->bitField0.needsInit) {
            noteSubEu->bitField0.enabled = false;
        } else {
            break;
        }
    }
}

Acmd* AudioSynth_LoadRingBuffer1AtTemp(Acmd* cmd, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items[reverb->curFrame][updateIndex];

    cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP, bufItem->startPos, bufItem->lengthA, reverb);
    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP + bufItem->lengthA, 0, bufItem->lengthB, reverb);
    }
    return cmd;
}

Acmd* AudioSynth_SaveRingBuffer1AtTemp(Acmd* cmd, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items[reverb->curFrame][updateIndex];

    cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_TEMP, bufItem->startPos, bufItem->lengthA, reverb);
    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_TEMP + bufItem->lengthA, 0, bufItem->lengthB, reverb);
    }
    return cmd;
}

/**
 * Leak some audio from the left reverb channel into the right reverb channel and vice versa (pan)
 */
Acmd* AudioSynth_LeakReverb(Acmd* cmd, SynthesisReverb* reverb) {
    aDMEMMove(cmd++, DMEM_WET_LEFT_CH, DMEM_WET_SCRATCH, DMEM_1CH_SIZE);
    aMix(cmd++, DMEM_1CH_SIZE >> 4, reverb->leakRtl, DMEM_WET_RIGHT_CH, DMEM_WET_LEFT_CH);
    aMix(cmd++, DMEM_1CH_SIZE >> 4, reverb->leakLtr, DMEM_WET_SCRATCH, DMEM_WET_RIGHT_CH);
    return cmd;
}

Acmd* func_800DB4E4(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* item = &reverb->items[reverb->curFrame][updateIndex];
    s16 offsetA;
    s16 offsetB;

    offsetA = (item->startPos & 7) * SAMPLE_SIZE;
    offsetB = ALIGN16(offsetA + item->lengthA);
    cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP, item->startPos - (offsetA / (s32)SAMPLE_SIZE),
                                        DMEM_1CH_SIZE, reverb);
    if (item->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP + offsetB, 0, DMEM_1CH_SIZE - offsetB, reverb);
    }
    aSetBuffer(cmd++, 0, DMEM_WET_TEMP + offsetA, DMEM_WET_LEFT_CH, aiBufLen * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, reverb->unk_0E, reverb->unk_30);
    aSetBuffer(cmd++, 0, DMEM_WET_TEMP + DMEM_1CH_SIZE + offsetA, DMEM_WET_RIGHT_CH, aiBufLen * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, reverb->unk_0E, reverb->unk_34);
    return cmd;
}

Acmd* func_800DB680(Acmd* cmd, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items[reverb->curFrame][updateIndex];

    aSetBuffer(cmd++, 0, DMEM_WET_LEFT_CH, DMEM_WET_SCRATCH, bufItem->unk_18 * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, bufItem->unk_16, reverb->unk_38);

    cmd = AudioSynth_SaveBufferOffset(cmd, DMEM_WET_SCRATCH, bufItem->startPos, bufItem->lengthA, reverb->leftRingBuf);
    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_SaveBufferOffset(cmd, DMEM_WET_SCRATCH + bufItem->lengthA, 0, bufItem->lengthB,
                                          reverb->leftRingBuf);
    }
    aSetBuffer(cmd++, 0, DMEM_WET_RIGHT_CH, DMEM_WET_SCRATCH, bufItem->unk_18 * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, bufItem->unk_16, reverb->unk_3C);
    cmd = AudioSynth_SaveBufferOffset(cmd, DMEM_WET_SCRATCH, bufItem->startPos, bufItem->lengthA, reverb->rightRingBuf);

    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_SaveBufferOffset(cmd, DMEM_WET_SCRATCH + bufItem->lengthA, 0, bufItem->lengthB,
                                          reverb->rightRingBuf);
    }

    return cmd;
}

Acmd* func_800DB828(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* item = &reverb->items[reverb->curFrame][updateIndex];
    s16 offsetA;
    s16 offsetB;

    item->unk_14 = (item->unk_18 << 0xF) / aiBufLen;
    offsetA = (item->startPos & 7) * SAMPLE_SIZE;
    item->unk_16 = (aiBufLen << 0xF) / item->unk_18;
    offsetB = ALIGN16(offsetA + item->lengthA);
    cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP, item->startPos - (offsetA / (s32)SAMPLE_SIZE),
                                        DMEM_1CH_SIZE, reverb);
    if (item->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_TEMP + offsetB, 0, DMEM_1CH_SIZE - offsetB, reverb);
    }
    aSetBuffer(cmd++, 0, DMEM_WET_TEMP + offsetA, DMEM_WET_LEFT_CH, aiBufLen * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, item->unk_14, reverb->unk_30);
    aSetBuffer(cmd++, 0, DMEM_WET_TEMP + DMEM_1CH_SIZE + offsetA, DMEM_WET_RIGHT_CH, aiBufLen * SAMPLE_SIZE);
    aResample(cmd++, reverb->resampleFlags, item->unk_14, reverb->unk_34);
    return cmd;
}

/**
 * Apply a filter (convolution) to each reverb channel.
 */
Acmd* AudioSynth_FilterReverb(Acmd* cmd, s32 size, SynthesisReverb* reverb) {
    if (reverb->filterLeft != NULL) {
        aFilter(cmd++, 2, size, reverb->filterLeft);
        aFilter(cmd++, reverb->resampleFlags, DMEM_WET_LEFT_CH, reverb->filterLeftState);
    }

    if (reverb->filterRight != NULL) {
        aFilter(cmd++, 2, size, reverb->filterRight);
        aFilter(cmd++, reverb->resampleFlags, DMEM_WET_RIGHT_CH, reverb->filterRightState);
    }
    return cmd;
}

Acmd* AudioSynth_MaybeMixRingBuffer1(Acmd* cmd, SynthesisReverb* reverb, s32 updateIndex) {
    SynthesisReverb* temp_a3;

    temp_a3 = &gAudioContext.synthesisReverbs[reverb->unk_05];
    if (temp_a3->downsampleRate == 1) {
        cmd = AudioSynth_LoadRingBuffer1AtTemp(cmd, temp_a3, updateIndex);
        aMix(cmd++, DMEM_2CH_SIZE >> 4, reverb->unk_08, DMEM_WET_LEFT_CH, DMEM_WET_TEMP);
        cmd = AudioSynth_SaveRingBuffer1AtTemp(cmd, temp_a3, updateIndex);
    }
    return cmd;
}

void func_800DBB94(void) {
}

void AudioSynth_ClearBuffer(Acmd* cmd, s32 dmem, s32 size) {
    aClearBuffer(cmd, dmem, size);
}

void func_800DBBBC(void) {
}

void func_800DBBC4(void) {
}

void func_800DBBCC(void) {
}

void AudioSynth_Mix(Acmd* cmd, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    aMix(cmd, arg1, arg2, arg3, arg4);
}

void func_800DBC08(void) {
}

void func_800DBC10(void) {
}

void func_800DBC18(void) {
}

void AudioSynth_SetBuffer(Acmd* cmd, s32 flags, s32 dmemIn, s32 dmemOut, u32 size) {
    aSetBuffer(cmd, flags, dmemIn, dmemOut, size);
}

void func_800DBC54(void) {
}

void func_800DBC5C(void) {
}

// possible fake match?
void AudioSynth_DMemMove(Acmd* cmd, s32 dmemIn, s32 dmemOut, u32 size) {
    cmd->words.w0 = _SHIFTL(A_DMEMMOVE, 24, 8) | _SHIFTL(dmemIn, 0, 24);
    cmd->words.w1 = _SHIFTL(dmemOut, 16, 16) | _SHIFTL(size, 0, 16);
}

void func_800DBC90(void) {
}

void func_800DBC98(void) {
}

void func_800DBCA0(void) {
}

void func_800DBCA8(void) {
}

void AudioSynth_InterL(Acmd* cmd, s32 dmemIn, s32 dmemOut, s32 numSamples) {
    cmd->words.w0 = _SHIFTL(A_INTERL, 24, 8) | _SHIFTL(numSamples, 0, 16);
    cmd->words.w1 = _SHIFTL(dmemIn, 16, 16) | _SHIFTL(dmemOut, 0, 16);
}

void AudioSynth_EnvSetup1(Acmd* cmd, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    aEnvSetup1(cmd, arg1, arg2, arg3, arg4);
}

void func_800DBD08(void) {
}

void AudioSynth_LoadBuffer(Acmd* cmd, s32 dmemDest, s32 size, void* addrSrc) {
    aLoadBuffer(cmd, addrSrc, dmemDest, size);
}

void AudioSynth_SaveBuffer(Acmd* cmd, s32 dmemSrc, s32 size, void* addrDest) {
    aSaveBuffer(cmd, dmemSrc, addrDest, size);
}

void AudioSynth_EnvSetup2(Acmd* cmd, s32 volLeft, s32 volRight) {
    cmd->words.w0 = _SHIFTL(A_ENVSETUP2, 24, 8);
    cmd->words.w1 = _SHIFTL(volLeft, 16, 16) | _SHIFTL(volRight, 0, 16);
}

void func_800DBD7C(void) {
}

void func_800DBD84(void) {
}

void func_800DBD8C(void) {
}

void AudioSynth_S8Dec(Acmd* cmd, s32 flags, s16* state) {
    aS8Dec(cmd, flags, state);
}

void AudioSynth_HiLoGain(Acmd* cmd, s32 gain, s32 dmemIn, s32 dmemOut, s32 size) {
    cmd->words.w0 = _SHIFTL(A_HILOGAIN, 24, 8) | _SHIFTL(gain, 16, 8) | _SHIFTL(size, 0, 16);
    cmd->words.w1 = _SHIFTL(dmemIn, 16, 16) | _SHIFTL(dmemOut, 0, 16);
}

void AudioSynth_UnkCmd19(Acmd* cmd, s32 arg1, s32 arg2, s32 size, s32 arg4) {
    cmd->words.w0 = _SHIFTL(A_UNK19, 24, 8) | _SHIFTL(arg4, 16, 8) | _SHIFTL(size, 0, 16);
    cmd->words.w1 = _SHIFTL(arg1, 16, 16) | _SHIFTL(arg2, 0, 16);
}

void func_800DBE18(void) {
}

void func_800DBE20(void) {
}

void func_800DBE28(void) {
}

void func_800DBE30(void) {
}

void AudioSynth_UnkCmd3(Acmd* cmd, s32 arg1, s32 arg2, s32 size) {
    cmd->words.w0 = _SHIFTL(A_UNK3, 24, 8) | _SHIFTL(size, 0, 16);
    cmd->words.w1 = _SHIFTL(arg1, 16, 16) | _SHIFTL(arg2, 0, 16);
}

void func_800DBE5C(void) {
}

void func_800DBE64(void) {
}

void func_800DBE6C(void) {
}

void AudioSynth_LoadFilterBuffer(Acmd* cmd, s32 flags, s32 buf, void* addr) {
    aFilter(cmd, flags, buf, addr);
}

void AudioSynth_LoadFilterSize(Acmd* cmd, s32 size, void* addr) {
    aFilter(cmd, 2, size, addr);
}

Acmd* AudioSynth_LoadRingBuffer1(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* ringBufferItem = &reverb->items[reverb->curFrame][updateIndex];

    cmd =
        AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_LEFT_CH, ringBufferItem->startPos, ringBufferItem->lengthA, reverb);
    if (ringBufferItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_LEFT_CH + ringBufferItem->lengthA, 0, ringBufferItem->lengthB,
                                            reverb);
    }

    return cmd;
}

Acmd* AudioSynth_LoadRingBuffer2(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items2[reverb->curFrame][updateIndex];

    cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_LEFT_CH, bufItem->startPos, bufItem->lengthA, reverb);
    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_LoadRingBufferPart(cmd, DMEM_WET_LEFT_CH + bufItem->lengthA, 0, bufItem->lengthB, reverb);
    }
    return cmd;
}

Acmd* AudioSynth_LoadRingBufferPart(Acmd* cmd, u16 dmem, u16 startPos, s32 size, SynthesisReverb* reverb) {
    aLoadBuffer(cmd++, &reverb->leftRingBuf[startPos], dmem, size);
    aLoadBuffer(cmd++, &reverb->rightRingBuf[startPos], dmem + DMEM_1CH_SIZE, size);
    return cmd;
}

Acmd* AudioSynth_SaveRingBufferPart(Acmd* cmd, u16 dmem, u16 startPos, s32 size, SynthesisReverb* reverb) {
    aSaveBuffer(cmd++, dmem, &reverb->leftRingBuf[startPos], size);
    aSaveBuffer(cmd++, dmem + DMEM_1CH_SIZE, &reverb->rightRingBuf[startPos], size);
    return cmd;
}

Acmd* AudioSynth_SaveBufferOffset(Acmd* cmd, u16 dmem, u16 offset, s32 size, s16* buf) {
    aSaveBuffer(cmd++, dmem, &buf[offset], size);
    return cmd;
}

Acmd* AudioSynth_MaybeLoadRingBuffer2(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    if (reverb->downsampleRate == 1) {
        cmd = AudioSynth_LoadRingBuffer2(cmd, aiBufLen, reverb, updateIndex);
    }

    return cmd;
}

Acmd* AudioSynth_LoadReverbSamples(Acmd* cmd, s32 aiBufLen, SynthesisReverb* reverb, s16 updateIndex) {
    // Sets DMEM_WET_{LEFT,RIGHT}_CH, clobbers DMEM_TEMP
    if (reverb->downsampleRate == 1) {
        if (reverb->unk_18 != 0) {
            cmd = func_800DB828(cmd, aiBufLen, reverb, updateIndex);
        } else {
            cmd = AudioSynth_LoadRingBuffer1(cmd, aiBufLen, reverb, updateIndex);
        }
    } else {
        cmd = func_800DB4E4(cmd, aiBufLen, reverb, updateIndex);
    }
    return cmd;
}

Acmd* AudioSynth_SaveReverbSamples(Acmd* cmd, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items[reverb->curFrame][updateIndex];

    if (reverb->downsampleRate == 1) {
        if (reverb->unk_18 != 0) {
            cmd = func_800DB680(cmd, reverb, updateIndex);
        } else {
            // Put the oldest samples in the ring buffer into the wet channels
            cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_LEFT_CH, bufItem->startPos, bufItem->lengthA, reverb);
            if (bufItem->lengthB != 0) {
                // Ring buffer wrapped
                cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_LEFT_CH + bufItem->lengthA, 0, bufItem->lengthB,
                                                    reverb);
            }
        }
    } else {
        // Downsampling is done later by CPU when RSP is done, therefore we need to have
        // double buffering. Left and right buffers are adjacent in memory.
        AudioSynth_SaveBuffer(cmd++, DMEM_WET_LEFT_CH, DMEM_2CH_SIZE,
                              reverb->items[reverb->curFrame][updateIndex].toDownsampleLeft);
    }

    reverb->resampleFlags = 0;
    return cmd;
}

Acmd* AudioSynth_SaveRingBuffer2(Acmd* cmd, SynthesisReverb* reverb, s16 updateIndex) {
    ReverbRingBufferItem* bufItem = &reverb->items2[reverb->curFrame][updateIndex];

    cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_LEFT_CH, bufItem->startPos, bufItem->lengthA, reverb);
    if (bufItem->lengthB != 0) {
        // Ring buffer wrapped
        cmd = AudioSynth_SaveRingBufferPart(cmd, DMEM_WET_LEFT_CH + bufItem->lengthA, 0, bufItem->lengthB, reverb);
    }
    return cmd;
}

Acmd* AudioSynth_DoOneAudioUpdate(s16* aiBuf, s32 aiBufLen, Acmd* cmd, s32 updateIndex) {
    u8 noteIndices[0x5C];
    s16 count;
    s16 reverbIndex;
    SynthesisReverb* reverb;
    s32 useReverb;
    s32 t;
    s32 i;
    NoteSubEu* noteSubEu;
    NoteSubEu* noteSubEu2;
    s32 unk14;

    t = gAudioContext.numNotes * updateIndex;
    count = 0;
    if (gAudioContext.numSynthesisReverbs == 0) {
        for (i = 0; i < gAudioContext.numNotes; i++) {
            if (gAudioContext.noteSubsEu[t + i].bitField0.enabled) {
                noteIndices[count++] = i;
            }
        }
    } else {
        for (reverbIndex = 0; reverbIndex < gAudioContext.numSynthesisReverbs; reverbIndex++) {
            for (i = 0; i < gAudioContext.numNotes; i++) {
                noteSubEu = &gAudioContext.noteSubsEu[t + i];
                if (noteSubEu->bitField0.enabled && noteSubEu->bitField1.reverbIndex == reverbIndex) {
                    noteIndices[count++] = i;
                }
            }
        }

        for (i = 0; i < gAudioContext.numNotes; i++) {
            noteSubEu = &gAudioContext.noteSubsEu[t + i];
            if (noteSubEu->bitField0.enabled && noteSubEu->bitField1.reverbIndex >= gAudioContext.numSynthesisReverbs) {
                noteIndices[count++] = i;
            }
        }
    }

    aClearBuffer(cmd++, DMEM_LEFT_CH, DMEM_2CH_SIZE);

    i = 0;
    for (reverbIndex = 0; reverbIndex < gAudioContext.numSynthesisReverbs; reverbIndex++) {
        reverb = &gAudioContext.synthesisReverbs[reverbIndex];
        useReverb = reverb->useReverb;
        if (useReverb) {

            // Loads reverb samples from RDRAM (ringBuffer) into DMEM (DMEM_WET_LEFT_CH)
            cmd = AudioSynth_LoadReverbSamples(cmd, aiBufLen, reverb, updateIndex);

            // Mixes reverb sample into the main dry channel
            // reverb->volume is always set to 0x7FFF (audio spec), and DMEM_LEFT_CH is cleared before the loop.
            // So for the first iteration, this is essentially a DMEMmove from DMEM_WET_LEFT_CH to DMEM_LEFT_CH
            aMix(cmd++, DMEM_2CH_SIZE >> 4, reverb->volume, DMEM_WET_LEFT_CH, DMEM_LEFT_CH);

            unk14 = reverb->unk_14;
            if (unk14) {
                aDMEMMove(cmd++, DMEM_WET_LEFT_CH, DMEM_WET_TEMP, DMEM_2CH_SIZE);
            }

            // Decays reverb over time. The (+ 0x8000) here is -100%
            aMix(cmd++, DMEM_2CH_SIZE >> 4, reverb->decayRatio + 0x8000, DMEM_WET_LEFT_CH, DMEM_WET_LEFT_CH);

            // Leak reverb between the left and right channels
            if (reverb->leakRtl != 0 || reverb->leakLtr != 0) {
                cmd = AudioSynth_LeakReverb(cmd, reverb);
            }

            if (unk14) {
                // Saves the wet channel sample from DMEM (DMEM_WET_LEFT_CH) into RDRAM (ringBuffer) for future use
                cmd = AudioSynth_SaveReverbSamples(cmd, reverb, updateIndex);
                if (reverb->unk_05 != -1) {
                    cmd = AudioSynth_MaybeMixRingBuffer1(cmd, reverb, updateIndex);
                }
                cmd = AudioSynth_MaybeLoadRingBuffer2(cmd, aiBufLen, reverb, updateIndex);
                aMix(cmd++, DMEM_2CH_SIZE >> 4, reverb->unk_16, DMEM_WET_TEMP, DMEM_WET_LEFT_CH);
            }
        }

        while (i < count) {
            noteSubEu2 = &gAudioContext.noteSubsEu[noteIndices[i] + t];
            if (noteSubEu2->bitField1.reverbIndex == reverbIndex) {
                cmd = AudioSynth_ProcessNote(noteIndices[i], noteSubEu2,
                                             &gAudioContext.notes[noteIndices[i]].synthesisState, aiBuf, aiBufLen, cmd,
                                             updateIndex);
            } else {
                break;
            }
            i++;
        }

        if (useReverb) {
            if (reverb->filterLeft != NULL || reverb->filterRight != NULL) {
                cmd = AudioSynth_FilterReverb(cmd, aiBufLen * SAMPLE_SIZE, reverb);
            }

            // Saves the wet channel sample from DMEM (DMEM_WET_LEFT_CH) into RDRAM (ringBuffer) for future use
            if (unk14) {
                cmd = AudioSynth_SaveRingBuffer2(cmd, reverb, updateIndex);
            } else {
                cmd = AudioSynth_SaveReverbSamples(cmd, reverb, updateIndex);
                if (reverb->unk_05 != -1) {
                    cmd = AudioSynth_MaybeMixRingBuffer1(cmd, reverb, updateIndex);
                }
            }
        }
    }

    while (i < count) {
        cmd = AudioSynth_ProcessNote(noteIndices[i], &gAudioContext.noteSubsEu[t + noteIndices[i]],
                                     &gAudioContext.notes[noteIndices[i]].synthesisState, aiBuf, aiBufLen, cmd,
                                     updateIndex);
        i++;
    }

    aInterleave(cmd++, DMEM_TEMP, DMEM_LEFT_CH, DMEM_RIGHT_CH, 2 * aiBufLen);
    aSaveBuffer(cmd++, DMEM_TEMP, aiBuf, 2 * (aiBufLen * (s32)SAMPLE_SIZE));

    return cmd;
}

Acmd* AudioSynth_ProcessNote(s32 noteIndex, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s16* aiBuf,
                             s32 aiBufLen, Acmd* cmd, s32 updateIndex) {
    s32 pad1[3];
    Sample* sample;
    AdpcmLoop* loopInfo;
    s32 nSamplesUntilLoopEnd;
    s32 nSamplesInThisIteration;
    s32 noteFinished;
    s32 restart;
    s32 flags;
    u16 resamplingRateFixedPoint;
    s32 nSamplesInFirstFrame;
    s32 nTrailingSamplesToIgnore;
    s32 gain;
    s32 frameIndex;
    s32 skipBytes;
    s32 temp_v1_6;
    void* buf;
    s32 nSamplesToDecode;
    u32 sampleAddr;
    u32 samplesLenFixedPoint;
    s32 samplesLenAdjusted; // seems to be used as both bytes and numSamples?
    s32 nSamplesProcessed;
    s32 loopEndPos;
    s32 nSamplesToProcess;
    s32 phi_s4;
    s32 nFirstFrameSamplesToIgnore;
    s32 pad2[7];
    s32 frameSize;
    s32 nFramesToDecode;
    s32 skipInitialSamples;
    s32 sampleDataStart;
    u8* sampleData;
    s32 nParts;
    s32 curPart;
    s32 sampleDataStartPad;
    s32 side;
    s32 resampledTempLen;
    u16 sampleDmemBeforeResampling;
    s32 sampleDataOffset;
    s32 thing;
    s32 s5;
    Note* note;
    u32 numSamplesToLoad;
    u16 unk7;
    u16 unkE;
    s16* filter;
    s32 bookOffset;
    s32 finished;
    s32 aligned;
    s16 addr;
    u16 unused;

    bookOffset = noteSubEu->bitField1.bookOffset;
    finished = noteSubEu->bitField0.finished;
    note = &gAudioContext.notes[noteIndex];
    flags = A_CONTINUE;

    if (noteSubEu->bitField0.needsInit == true) {
        flags = A_INIT;
        synthState->restart = 0;
        synthState->samplePosInt = note->startSamplePos;
        synthState->samplePosFrac = 0;
        synthState->curVolLeft = 0;
        synthState->curVolRight = 0;
        synthState->prevHeadsetPanRight = 0;
        synthState->prevHeadsetPanLeft = 0;
        synthState->reverbVol = noteSubEu->reverbVol;
        synthState->numParts = 0;
        synthState->unk_1A = 1;
        note->noteSubEu.bitField0.finished = false;
        finished = false;
    }

    resamplingRateFixedPoint = noteSubEu->resamplingRateFixedPoint;
    nParts = noteSubEu->bitField1.hasTwoParts + 1;
    samplesLenFixedPoint = (resamplingRateFixedPoint * aiBufLen * 2) + synthState->samplePosFrac;
    numSamplesToLoad = samplesLenFixedPoint >> 16;
    synthState->samplePosFrac = samplesLenFixedPoint & 0xFFFF;

    // Partially-optimized out no-op ifs required for matching. SM64 decomp
    // makes it clear that this is how it should look.
    if (synthState->numParts == 1 && nParts == 2) {
    } else if (synthState->numParts == 2 && nParts == 1) {
    } else {
    }

    synthState->numParts = nParts;

    if (noteSubEu->bitField1.isSyntheticWave) {
        cmd = AudioSynth_LoadWaveSamples(cmd, noteSubEu, synthState, numSamplesToLoad);
        sampleDmemBeforeResampling = DMEM_UNCOMPRESSED_NOTE + (synthState->samplePosInt * (s32)SAMPLE_SIZE);
        synthState->samplePosInt += numSamplesToLoad;
    } else {
        sample = noteSubEu->tunedSample->sample;
        loopInfo = sample->loop;
        loopEndPos = loopInfo->end;
        sampleAddr = (u32)sample->sampleAddr;
        resampledTempLen = 0;

        for (curPart = 0; curPart < nParts; curPart++) {
            nSamplesProcessed = 0;
            s5 = 0;

            if (nParts == 1) {
                samplesLenAdjusted = numSamplesToLoad;
            } else if (numSamplesToLoad & 1) {
                samplesLenAdjusted = (numSamplesToLoad & ~1) + (curPart * 2);
            } else {
                samplesLenAdjusted = numSamplesToLoad;
            }

            if (sample->codec == CODEC_ADPCM || sample->codec == CODEC_SMALL_ADPCM) {
                if (gAudioContext.curLoadedBook != sample->book->book) {
                    u32 nEntries;

                    switch (bookOffset) {
                        case 1:
                            gAudioContext.curLoadedBook = &D_8012FBA8[1];
                            break;
                        case 2:
                        case 3:
                        default:
                            gAudioContext.curLoadedBook = sample->book->book;
                            break;
                    }
                    if (1) {}
                    if (1) {}
                    if (1) {}
                    nEntries = SAMPLES_PER_FRAME * sample->book->order * sample->book->numPredictors;
                    aLoadADPCM(cmd++, nEntries, gAudioContext.curLoadedBook);
                }
            }

            while (nSamplesProcessed != samplesLenAdjusted) {
                noteFinished = false;
                restart = false;
                phi_s4 = 0;

                nFirstFrameSamplesToIgnore = synthState->samplePosInt & 0xF;
                nSamplesUntilLoopEnd = loopEndPos - synthState->samplePosInt;
                nSamplesToProcess = samplesLenAdjusted - nSamplesProcessed;

                if (nFirstFrameSamplesToIgnore == 0 && !synthState->restart) {
                    nFirstFrameSamplesToIgnore = SAMPLES_PER_FRAME;
                }
                nSamplesInFirstFrame = SAMPLES_PER_FRAME - nFirstFrameSamplesToIgnore;

                if (nSamplesToProcess < nSamplesUntilLoopEnd) {
                    nFramesToDecode =
                        (s32)(nSamplesToProcess - nSamplesInFirstFrame + SAMPLES_PER_FRAME - 1) / SAMPLES_PER_FRAME;
                    nSamplesToDecode = nFramesToDecode * SAMPLES_PER_FRAME;
                    nTrailingSamplesToIgnore = nSamplesInFirstFrame + nSamplesToDecode - nSamplesToProcess;
                } else {
                    nSamplesToDecode = nSamplesUntilLoopEnd - nSamplesInFirstFrame;
                    nTrailingSamplesToIgnore = 0;
                    if (nSamplesToDecode <= 0) {
                        nSamplesToDecode = 0;
                        nSamplesInFirstFrame = nSamplesUntilLoopEnd;
                    }
                    nFramesToDecode = (nSamplesToDecode + SAMPLES_PER_FRAME - 1) / SAMPLES_PER_FRAME;
                    if (loopInfo->count != 0) {
                        // Loop around and restart
                        restart = true;
                    } else {
                        noteFinished = true;
                    }
                }

                switch (sample->codec) {
                    case CODEC_ADPCM:
                        // 16 2-byte samples (32 bytes) compressed into 4-bit samples (8 bytes) + 1 header byte
                        frameSize = 9;
                        skipInitialSamples = SAMPLES_PER_FRAME;
                        sampleDataStart = 0;
                        break;

                    case CODEC_SMALL_ADPCM:
                        // 16 2-byte samples (32 bytes) compressed into 2-bit samples (4 bytes) + 1 header byte
                        frameSize = 5;
                        skipInitialSamples = SAMPLES_PER_FRAME;
                        sampleDataStart = 0;
                        break;

                    case CODEC_S8:
                        // 16 2-byte samples (32 bytes) compressed into 8-bit samples (16 bytes)
                        frameSize = 16;
                        skipInitialSamples = SAMPLES_PER_FRAME;
                        sampleDataStart = 0;
                        break;

                    case CODEC_S16_INMEMORY:
                        AudioSynth_ClearBuffer(cmd++, DMEM_UNCOMPRESSED_NOTE,
                                               (samplesLenAdjusted + SAMPLES_PER_FRAME) * SAMPLE_SIZE);
                        flags = A_CONTINUE;
                        skipBytes = 0;
                        nSamplesProcessed = samplesLenAdjusted;
                        s5 = samplesLenAdjusted;
                        goto skip;

                    case CODEC_S16:
                        AudioSynth_ClearBuffer(cmd++, DMEM_UNCOMPRESSED_NOTE,
                                               (samplesLenAdjusted + SAMPLES_PER_FRAME) * SAMPLE_SIZE);
                        flags = A_CONTINUE;
                        skipBytes = 0;
                        nSamplesProcessed = samplesLenAdjusted;
                        s5 = samplesLenAdjusted;
                        goto skip;

                    case CODEC_REVERB:
                        break;
                }

                if (nFramesToDecode != 0) {
                    frameIndex = (synthState->samplePosInt + skipInitialSamples - nFirstFrameSamplesToIgnore) /
                                 SAMPLES_PER_FRAME;
                    sampleDataOffset = frameIndex * frameSize;
                    if (sample->medium == MEDIUM_RAM) {
                        sampleData = (u8*)(sampleDataStart + sampleDataOffset + sampleAddr);
                    } else if (sample->medium == MEDIUM_UNK) {
                        return cmd;
                    } else {
                        sampleData = AudioLoad_DmaSampleData(sampleDataStart + sampleDataOffset + sampleAddr,
                                                             ALIGN16((nFramesToDecode * frameSize) + SAMPLES_PER_FRAME),
                                                             flags, &synthState->sampleDmaIndex, sample->medium);
                    }

                    if (sampleData == NULL) {
                        return cmd;
                    }

                    sampleDataStartPad = (u32)sampleData & 0xF;
                    aligned = ALIGN16((nFramesToDecode * frameSize) + SAMPLES_PER_FRAME);
                    addr = DMEM_COMPRESSED_ADPCM_DATA - aligned;
                    aLoadBuffer(cmd++, sampleData - sampleDataStartPad, addr, aligned);
                } else {
                    nSamplesToDecode = 0;
                    sampleDataStartPad = 0;
                }

                if (synthState->restart) {
                    aSetLoop(cmd++, sample->loop->predictorState);
                    flags = A_LOOP;
                    synthState->restart = false;
                }

                nSamplesInThisIteration = nSamplesToDecode + nSamplesInFirstFrame - nTrailingSamplesToIgnore;
                if (nSamplesProcessed == 0) {
                    if (1) {}
                    skipBytes = nFirstFrameSamplesToIgnore * SAMPLE_SIZE;
                } else {
                    phi_s4 = ALIGN16(s5 + 8 * SAMPLE_SIZE);
                }

                switch (sample->codec) {
                    case CODEC_ADPCM:
                        aligned = ALIGN16((nFramesToDecode * frameSize) + SAMPLES_PER_FRAME);
                        addr = DMEM_COMPRESSED_ADPCM_DATA - aligned;
                        aSetBuffer(cmd++, 0, addr + sampleDataStartPad, DMEM_UNCOMPRESSED_NOTE + phi_s4,
                                   nSamplesToDecode * SAMPLE_SIZE);
                        aADPCMdec(cmd++, flags, synthState->synthesisBuffers->adpcmdecState);
                        break;

                    case CODEC_SMALL_ADPCM:
                        aligned = ALIGN16((nFramesToDecode * frameSize) + SAMPLES_PER_FRAME);
                        addr = DMEM_COMPRESSED_ADPCM_DATA - aligned;
                        aSetBuffer(cmd++, 0, addr + sampleDataStartPad, DMEM_UNCOMPRESSED_NOTE + phi_s4,
                                   nSamplesToDecode * SAMPLE_SIZE);
                        aADPCMdec(cmd++, flags | 4, synthState->synthesisBuffers->adpcmdecState);
                        break;

                    case CODEC_S8:
                        aligned = ALIGN16((nFramesToDecode * frameSize) + SAMPLES_PER_FRAME);
                        addr = DMEM_COMPRESSED_ADPCM_DATA - aligned;
                        AudioSynth_SetBuffer(cmd++, 0, addr + sampleDataStartPad, DMEM_UNCOMPRESSED_NOTE + phi_s4,
                                             nSamplesToDecode * SAMPLE_SIZE);
                        AudioSynth_S8Dec(cmd++, flags, synthState->synthesisBuffers->adpcmdecState);
                        break;
                }

                if (nSamplesProcessed != 0) {
                    aDMEMMove(cmd++, DMEM_UNCOMPRESSED_NOTE + phi_s4 + (nFirstFrameSamplesToIgnore * SAMPLE_SIZE),
                              DMEM_UNCOMPRESSED_NOTE + s5, nSamplesInThisIteration * SAMPLE_SIZE);
                }

                nSamplesProcessed += nSamplesInThisIteration;

                switch (flags) {
                    case A_INIT:
                        skipBytes = SAMPLES_PER_FRAME * SAMPLE_SIZE;
                        s5 = (nSamplesToDecode + SAMPLES_PER_FRAME) * SAMPLE_SIZE;
                        break;

                    case A_LOOP:
                        s5 = nSamplesInThisIteration * SAMPLE_SIZE + s5;
                        break;

                    default:
                        if (s5 != 0) {
                            s5 = nSamplesInThisIteration * SAMPLE_SIZE + s5;
                        } else {
                            s5 = (nFirstFrameSamplesToIgnore + nSamplesInThisIteration) * SAMPLE_SIZE;
                        }
                        break;
                }

                flags = A_CONTINUE;

            skip:
                if (noteFinished) {
                    AudioSynth_ClearBuffer(cmd++, DMEM_UNCOMPRESSED_NOTE + s5,
                                           (samplesLenAdjusted - nSamplesProcessed) * SAMPLE_SIZE);
                    finished = true;
                    note->noteSubEu.bitField0.finished = true;
                    func_800DB2C0(updateIndex, noteIndex);
                    break;
                } else {
                    if (restart) {
                        synthState->restart = true;
                        synthState->samplePosInt = loopInfo->start;
                    } else {
                        synthState->samplePosInt += nSamplesToProcess;
                    }
                }
            }

            switch (nParts) {
                case 1:
                    sampleDmemBeforeResampling = DMEM_UNCOMPRESSED_NOTE + skipBytes;
                    break;

                case 2:
                    switch (curPart) {
                        case 0:
                            AudioSynth_InterL(cmd++, DMEM_UNCOMPRESSED_NOTE + skipBytes,
                                              DMEM_TEMP + (SAMPLES_PER_FRAME * SAMPLE_SIZE),
                                              ALIGN8(samplesLenAdjusted / 2));
                            resampledTempLen = samplesLenAdjusted;
                            sampleDmemBeforeResampling = DMEM_TEMP + (SAMPLES_PER_FRAME * SAMPLE_SIZE);
                            if (finished) {
                                AudioSynth_ClearBuffer(cmd++, sampleDmemBeforeResampling + resampledTempLen,
                                                       samplesLenAdjusted + SAMPLES_PER_FRAME);
                            }
                            break;

                        case 1:
                            AudioSynth_InterL(cmd++, DMEM_UNCOMPRESSED_NOTE + skipBytes,
                                              DMEM_TEMP + (SAMPLES_PER_FRAME * SAMPLE_SIZE) + resampledTempLen,
                                              ALIGN8(samplesLenAdjusted / 2));
                            break;
                    }
            }
            if (finished) {
                break;
            }
        }
    }

    flags = A_CONTINUE;
    if (noteSubEu->bitField0.needsInit == true) {
        noteSubEu->bitField0.needsInit = false;
        flags = A_INIT;
    }

    cmd = AudioSynth_FinalResample(cmd, synthState, aiBufLen * (s32)SAMPLE_SIZE, resamplingRateFixedPoint,
                                   sampleDmemBeforeResampling, flags);
    if (bookOffset == 3) {
        AudioSynth_UnkCmd19(cmd++, DMEM_TEMP, DMEM_TEMP, aiBufLen * SAMPLE_SIZE, 0);
    }

    if (bookOffset == 2) {
        AudioSynth_UnkCmd3(cmd++, DMEM_TEMP, DMEM_TEMP, aiBufLen * SAMPLE_SIZE);
    }

    gain = noteSubEu->gain;
    if (gain != 0) {
        // A gain of 0x10 (a UQ4.4 number) is equivalent to 1.0 and represents no volume change
        if (gain < 0x10) {
            gain = 0x10;
        }
        AudioSynth_HiLoGain(cmd++, gain, DMEM_TEMP, 0, (aiBufLen + SAMPLES_PER_FRAME) * SAMPLE_SIZE);
    }

    filter = noteSubEu->filter;
    if (filter != 0) {
        AudioSynth_LoadFilterSize(cmd++, aiBufLen * SAMPLE_SIZE, filter);
        AudioSynth_LoadFilterBuffer(cmd++, flags, DMEM_TEMP, synthState->synthesisBuffers->mixEnvelopeState);
    }

    unk7 = noteSubEu->unk_07;
    unkE = noteSubEu->unk_0E;
    buf = &synthState->synthesisBuffers->panSamplesBuffer[0x18];
    if (unk7 != 0 && noteSubEu->unk_0E != 0) {
        AudioSynth_DMemMove(cmd++, DMEM_TEMP, DMEM_SCRATCH2, aiBufLen * SAMPLE_SIZE);
        thing = DMEM_SCRATCH2 - unk7;
        if (synthState->unk_1A != 0) {
            AudioSynth_ClearBuffer(cmd++, thing, unk7);
            synthState->unk_1A = 0;
        } else {
            AudioSynth_LoadBuffer(cmd++, thing, unk7, buf);
        }
        AudioSynth_SaveBuffer(cmd++, DMEM_TEMP + (aiBufLen * SAMPLE_SIZE) - unk7, unk7, buf);
        AudioSynth_Mix(cmd++, (aiBufLen * (s32)SAMPLE_SIZE) >> 4, unkE, DMEM_SCRATCH2, thing);
        AudioSynth_DMemMove(cmd++, thing, DMEM_TEMP, aiBufLen * SAMPLE_SIZE);
    } else {
        synthState->unk_1A = 1;
    }

    if (noteSubEu->headsetPanRight != 0 || synthState->prevHeadsetPanRight != 0) {
        side = 1;
    } else if (noteSubEu->headsetPanLeft != 0 || synthState->prevHeadsetPanLeft != 0) {
        side = 2;
    } else {
        side = 0;
    }
    cmd = AudioSynth_ProcessEnvelope(cmd, noteSubEu, synthState, aiBufLen, DMEM_TEMP, side, flags);
    if (noteSubEu->bitField1.usesHeadsetPanEffects2) {
        if (!(flags & A_INIT)) {
            flags = A_CONTINUE;
        }
        cmd =
            AudioSynth_NoteApplyHeadsetPanEffects(cmd, noteSubEu, synthState, aiBufLen * (s32)SAMPLE_SIZE, flags, side);
    }
    return cmd;
}

Acmd* AudioSynth_FinalResample(Acmd* cmd, NoteSynthesisState* synthState, s32 size, u16 pitch, u16 inpDmem,
                               s32 resampleFlags) {
    if (pitch == 0) {
        AudioSynth_ClearBuffer(cmd++, DMEM_TEMP, size);
    } else {
        aSetBuffer(cmd++, 0, inpDmem, DMEM_TEMP, size);
        aResample(cmd++, resampleFlags, pitch, synthState->synthesisBuffers->finalResampleState);
    }
    return cmd;
}

Acmd* AudioSynth_ProcessEnvelope(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s32 aiBufLen,
                                 u16 inBuf, s32 headsetPanSettings, s32 flags) {
    u32 phi_a1;
    u16 curVolLeft;
    u16 targetVolLeft;
    s32 phi_t1;
    s16 reverbVol;
    u16 curVolRight;
    s16 rampLeft;
    s16 rampRight;
    s16 rampReverb;
    s16 sourceReverbVol;
    u16 targetVolRight;
    s32 pad;

    curVolLeft = synthState->curVolLeft;
    targetVolLeft = noteSubEu->targetVolLeft;
    targetVolLeft <<= 4;
    reverbVol = noteSubEu->reverbVol;
    curVolRight = synthState->curVolRight;
    targetVolRight = noteSubEu->targetVolRight;
    targetVolRight <<= 4;

    if (targetVolLeft != curVolLeft) {
        rampLeft = (targetVolLeft - curVolLeft) / (aiBufLen >> 3);
    } else {
        rampLeft = 0;
    }
    if (targetVolRight != curVolRight) {
        rampRight = (targetVolRight - curVolRight) / (aiBufLen >> 3);
    } else {
        rampRight = 0;
    }

    sourceReverbVol = synthState->reverbVol;
    phi_t1 = sourceReverbVol & 0x7F;

    if (sourceReverbVol != reverbVol) {
        rampReverb = (((reverbVol & 0x7F) - phi_t1) << 9) / (aiBufLen >> 3);
        synthState->reverbVol = reverbVol;
    } else {
        rampReverb = 0;
    }

    synthState->curVolLeft = curVolLeft + (rampLeft * (aiBufLen >> 3));
    synthState->curVolRight = curVolRight + (rampRight * (aiBufLen >> 3));

    if (noteSubEu->bitField1.usesHeadsetPanEffects2) {
        AudioSynth_ClearBuffer(cmd++, DMEM_NOTE_PAN_TEMP, DMEM_1CH_SIZE);
        AudioSynth_EnvSetup1(cmd++, phi_t1 * 2, rampReverb, rampLeft, rampRight);
        AudioSynth_EnvSetup2(cmd++, curVolLeft, curVolRight);
        switch (headsetPanSettings) {
            case 1:
                phi_a1 = D_801304A4;
                break;
            case 2:
                phi_a1 = D_801304A8;
                break;
            default:
                phi_a1 = D_801304AC;
                break;
        }
    } else {
        aEnvSetup1(cmd++, phi_t1 * 2, rampReverb, rampLeft, rampRight);
        aEnvSetup2(cmd++, curVolLeft, curVolRight);
        phi_a1 = D_801304AC;
    }

    aEnvMixer(cmd++, inBuf, aiBufLen, (sourceReverbVol & 0x80) >> 7, noteSubEu->bitField0.stereoHeadsetEffects,
              noteSubEu->bitField0.usesHeadsetPanEffects, noteSubEu->bitField0.stereoStrongRight,
              noteSubEu->bitField0.stereoStrongLeft, phi_a1, D_801304A0);
    return cmd;
}

Acmd* AudioSynth_LoadWaveSamples(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState,
                                 s32 numSamplesToLoad) {
    s32 numSamplesAvail;
    s32 harmonicIndexCurAndPrev = noteSubEu->harmonicIndexCurAndPrev;
    s32 samplePosInt = synthState->samplePosInt;
    s32 numDuplicates;

    if (noteSubEu->bitField1.bookOffset != 0) {
        // Move the noise wave (that reads compiled assembly as samples) from ram to dmem
        AudioSynth_LoadBuffer(cmd++, DMEM_UNCOMPRESSED_NOTE, ALIGN16(numSamplesToLoad * SAMPLE_SIZE), gWaveSamples[8]);
        // Offset the address for the samples read by gWaveSamples[8] to the next set of samples
        gWaveSamples[8] += numSamplesToLoad * SAMPLE_SIZE;
        return cmd;
    } else {
        // Move the synthetic wave from ram to dmem
        aLoadBuffer(cmd++, noteSubEu->waveSampleAddr, DMEM_UNCOMPRESSED_NOTE, WAVE_SAMPLE_COUNT * SAMPLE_SIZE);

        // If the harmonic changes, map the offset in the wave from one harmonic to another for continuity
        if (harmonicIndexCurAndPrev != 0) {
            samplePosInt = samplePosInt * sNumSamplesPerWavePeriod[harmonicIndexCurAndPrev >> 2] /
                           sNumSamplesPerWavePeriod[harmonicIndexCurAndPrev & 3];
        }

        // Offset in the WAVE_SAMPLE_COUNT samples of gWaveSamples to start processing the wave for continuity
        samplePosInt = (u32)samplePosInt % WAVE_SAMPLE_COUNT;
        // Number of samples in the initial WAVE_SAMPLE_COUNT samples available to be used to process
        numSamplesAvail = WAVE_SAMPLE_COUNT - samplePosInt;

        // Require duplicates if there are more samples to load than available
        if (numSamplesToLoad > numSamplesAvail) {
            // Duplicate (copy) the WAVE_SAMPLE_COUNT samples as many times as needed to reach numSamplesToLoad.
            // (numSamplesToLoad - numSamplesAvail) is the number of samples missing.
            // Divide by WAVE_SAMPLE_COUNT, rounding up, to get the amount of duplicates
            numDuplicates = ((numSamplesToLoad - numSamplesAvail + WAVE_SAMPLE_COUNT - 1) / WAVE_SAMPLE_COUNT);
            if (numDuplicates != 0) {
                aDuplicate(cmd++, numDuplicates, DMEM_UNCOMPRESSED_NOTE,
                           DMEM_UNCOMPRESSED_NOTE + (WAVE_SAMPLE_COUNT * SAMPLE_SIZE));
            }
        }
        synthState->samplePosInt = samplePosInt;
    }
    return cmd;
}

Acmd* AudioSynth_NoteApplyHeadsetPanEffects(Acmd* cmd, NoteSubEu* noteSubEu, NoteSynthesisState* synthState, s32 bufLen,
                                            s32 flags, s32 side) {
    u16 dest;
    u16 pitch;
    u8 prevPanShift;
    u8 panShift;

    switch (side) {
        case 1:
            dest = DMEM_LEFT_CH;
            panShift = noteSubEu->headsetPanRight;
            prevPanShift = synthState->prevHeadsetPanRight;
            synthState->prevHeadsetPanLeft = 0;
            synthState->prevHeadsetPanRight = panShift;
            break;
        case 2:
            dest = DMEM_RIGHT_CH;
            panShift = noteSubEu->headsetPanLeft;
            prevPanShift = synthState->prevHeadsetPanLeft;
            synthState->prevHeadsetPanLeft = panShift;
            synthState->prevHeadsetPanRight = 0;
            break;
        default:
            return cmd;
    }

    if (flags != A_INIT) {
        // Slightly adjust the sample rate in order to fit a change in pan shift
        if (panShift != prevPanShift) {
            pitch = (((bufLen << 0xF) / 2) - 1) / ((bufLen + panShift - prevPanShift - 2) / 2);
            aSetBuffer(cmd++, 0, DMEM_NOTE_PAN_TEMP, DMEM_TEMP, bufLen + panShift - prevPanShift);
            aResampleZoh(cmd++, pitch, 0);
        } else {
            aDMEMMove(cmd++, DMEM_NOTE_PAN_TEMP, DMEM_TEMP, bufLen);
        }

        if (prevPanShift != 0) {
            aLoadBuffer(cmd++, &synthState->synthesisBuffers->panResampleState[0x8], DMEM_NOTE_PAN_TEMP,
                        ALIGN16(prevPanShift));
            aDMEMMove(cmd++, DMEM_TEMP, DMEM_NOTE_PAN_TEMP + prevPanShift, bufLen + panShift - prevPanShift);
        } else {
            aDMEMMove(cmd++, DMEM_TEMP, DMEM_NOTE_PAN_TEMP, bufLen + panShift);
        }
    } else {
        // Just shift right
        aDMEMMove(cmd++, DMEM_NOTE_PAN_TEMP, DMEM_TEMP, bufLen);
        aClearBuffer(cmd++, DMEM_NOTE_PAN_TEMP, panShift);
        aDMEMMove(cmd++, DMEM_TEMP, DMEM_NOTE_PAN_TEMP + panShift, bufLen);
    }

    if (panShift) {
        // Save excessive samples for next iteration
        aSaveBuffer(cmd++, DMEM_NOTE_PAN_TEMP + bufLen, &synthState->synthesisBuffers->panResampleState[0x8],
                    ALIGN16(panShift));
    }
    aAddMixer(cmd++, ALIGN64(bufLen), DMEM_NOTE_PAN_TEMP, dest, 0x7FFF);
    return cmd;
}
