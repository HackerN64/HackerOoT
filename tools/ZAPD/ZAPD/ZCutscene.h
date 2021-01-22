#pragma once

#include <vector>
#include <string>
#include <stdint.h>
#include "ZResource.h"
#include "tinyxml2.h"

enum class CutsceneCommands
{
	Cmd00 = 0x0000,
	SetCameraPos = 0x0001,
	SetCameraFocus = 0x0002,
	SpecialAction = 0x0003,
	SetLighting = 0x0004,
	SetCameraPosLink = 0x0005,
	SetCameraFocusLink = 0x0006,
	Cmd07 = 0x0007,
	Cmd08 = 0x0008,
	Cmd09 = 0x0009,
	Unknown = 0x001A,
	Textbox = 0x0013,
	SetActorAction0 = 0x000A,
	SetActorAction1 = 0x000F,
	SetActorAction2 = 0x000E,
	SetActorAction3 = 0x0019,
	SetActorAction4 = 0x001D,
	SetActorAction5 = 0x001E,
	SetActorAction6 = 0x002C,
	SetActorAction7 = 0x001F,
	SetActorAction8 = 0x0031,
	SetActorAction9 = 0x003E,
	SetActorAction10 = 0x008F,
	SetSceneTransFX = 0x002D,
	Nop = 0x000B,
	PlayBGM = 0x0056,
	StopBGM = 0x0057,
	FadeBGM = 0x007C,
	SetTime = 0x008C,
	Terminator = 0x03E8,
	End = 0xFFFF,
	Error = 0xFEAF,
};

class CutsceneCameraPoint
{
public:
	int8_t continueFlag;
	int8_t cameraRoll;
	int16_t nextPointFrame;
	uint32_t viewAngle;
	int16_t posX, posY, posZ;
	int16_t unused;

	CutsceneCameraPoint(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommand
{
public:
	uint32_t commandID;
	uint32_t commandIndex;

	CutsceneCommand(const std::vector<uint8_t>& rawData, int rawDataIndex);
	virtual std::string GetCName(const std::string& prefix);
	virtual std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	virtual size_t GetCommandSize();
};

class CutsceneCommandSetCameraPos : public CutsceneCommand
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unused;

	std::vector<CutsceneCameraPoint*> entries;

	CutsceneCommandSetCameraPos(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class SpecialActionEntry
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unused0;
	uint32_t unused1;
	uint32_t unused2;
	uint32_t unused3;
	uint32_t unused4;
	uint32_t unused5;
	uint32_t unused6;
	uint32_t unused7;
	uint32_t unused8;
	uint32_t unused9;
	uint32_t unused10;

	SpecialActionEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandSpecialAction : public CutsceneCommand
{
public:
	std::vector<SpecialActionEntry*> entries;

	CutsceneCommandSpecialAction(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class MusicFadeEntry
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unknown0;
	uint32_t unknown1;
	uint32_t unknown2;
	uint32_t unknown3;
	uint32_t unknown4;
	uint32_t unknown5;
	uint32_t unknown6;
	uint32_t unknown7;
	uint32_t unknown8;
	uint32_t unknown9;
	uint32_t unknown10;

	MusicFadeEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandFadeBGM : public CutsceneCommand
{
public:
	std::vector<MusicFadeEntry*> entries;

	CutsceneCommandFadeBGM( const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class MusicChangeEntry
{
public:
	uint16_t sequence;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unknown0;
	uint32_t unknown1;
	uint32_t unknown2;
	uint32_t unknown3;
	uint32_t unknown4;
	uint32_t unknown5;
	uint32_t unknown6;
	uint32_t unknown7;

	MusicChangeEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandPlayBGM : public CutsceneCommand
{
public:
	std::vector<MusicChangeEntry*> entries;

	CutsceneCommandPlayBGM(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class CutsceneCommandStopBGM : public CutsceneCommand
{
public:
	std::vector<MusicChangeEntry*> entries;

	CutsceneCommandStopBGM(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class EnvLightingEntry
{
public:
	uint16_t setting;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unused0;
	uint32_t unused1;
	uint32_t unused2;
	uint32_t unused3;
	uint32_t unused4;
	uint32_t unused5;
	uint32_t unused6;
	uint32_t unused7;

	EnvLightingEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandEnvLighting : public CutsceneCommand
{
public:
	std::vector<EnvLightingEntry*> entries;

	CutsceneCommandEnvLighting(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class CutsceneCommandSceneTransFX : public CutsceneCommand
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;

	CutsceneCommandSceneTransFX(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class Unknown9Entry
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unk2;
	uint16_t unk3;
	uint16_t unk4;
	uint8_t unused0;
	uint8_t unused1;

	Unknown9Entry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandUnknown9 : public CutsceneCommand
{
public:
	std::vector<Unknown9Entry*> entries;

	CutsceneCommandUnknown9(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class UnkEntry
{
public:
	uint32_t unused0;
	uint32_t unused1;
	uint32_t unused2;
	uint32_t unused3;
	uint32_t unused4;
	uint32_t unused5;
	uint32_t unused6;
	uint32_t unused7;
	uint32_t unused8;
	uint32_t unused9;
	uint32_t unused10;
	uint32_t unused11;

	UnkEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandUnknown : public CutsceneCommand
{
public:
	std::vector<UnkEntry*> entries;

	CutsceneCommandUnknown(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class DayTimeEntry
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint8_t hour;
	uint8_t minute;
	uint8_t unused;

	DayTimeEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandDayTime : public CutsceneCommand
{
public:
	std::vector<DayTimeEntry*> entries;

	CutsceneCommandDayTime(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class TextboxEntry
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t type;
	uint16_t textID1;
	uint16_t textID2;

	TextboxEntry(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandTextbox : public CutsceneCommand
{
public:
	std::vector<TextboxEntry*> entries;

	CutsceneCommandTextbox(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class ActorAction
{
public:
	uint16_t action;
	uint16_t startFrame;
	uint16_t endFrame;
	int16_t rotX, rotY, rotZ;
	int32_t startPosX, startPosY, startPosZ;
	int32_t endPosX, endPosY, endPosZ;
	int32_t normalX, normalY, normalZ;

	ActorAction(const std::vector<uint8_t>& rawData, int rawDataIndex);
};

class CutsceneCommandActorAction : public CutsceneCommand
{
public:
	std::vector<ActorAction*> entries;

	CutsceneCommandActorAction(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class CutsceneCommandTerminator : public CutsceneCommand
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;
	uint16_t unknown;

	CutsceneCommandTerminator(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class CutsceneCommandEnd : public CutsceneCommand
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;

	CutsceneCommandEnd(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	std::string GenerateSourceCode(const std::string& roomName, int baseAddress);
	size_t GetCommandSize();
};

class CutsceneCommandNop : public CutsceneCommand
{
public:
	uint16_t base;
	uint16_t startFrame;
	uint16_t endFrame;

	CutsceneCommandNop(const std::vector<uint8_t>& rawData, int rawDataIndex);
	std::string GetCName(const std::string& prefix);
	size_t GetCommandSize();
};

class ZCutscene : public ZResource
{
public:
	uint32_t segmentOffset;

	ZCutscene(std::vector<uint8_t> nRawData, int rawDataIndex, int rawDataSize);
	~ZCutscene();

	std::string GetSourceOutputCode(const std::string& prefix) override;
	int GetRawDataSize() override;
	CutsceneCommands GetCommandFromID(int id);

	ZResourceType GetResourceType() override;

	static ZCutscene* ExtractFromXML(tinyxml2::XMLElement* reader, const std::vector<uint8_t>& nRawData, const int rawDataIndex, const std::string& nRelPath);
protected:
	int numCommands;
	int endFrame;
	std::vector<CutsceneCommand*> commands;

	void ParseRawData();
};
