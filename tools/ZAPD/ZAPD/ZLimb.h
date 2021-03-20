#pragma once

#include <cstdint>
#include <string>
#include <vector>
#include "ZDisplayList.h"
#include "ZFile.h"

enum class ZLimbType
{
	Standard,
	LOD,
	Skin,
	Curve,
};

// TODO: check if more types exists
enum class ZLimbSkinType
{
	SkinType_0,           // Segment = 0
	SkinType_4 = 4,       // Segment = segmented address // Struct_800A5E28
	SkinType_5 = 5,       // Segment = 0
	SkinType_DList = 11,  // Segment = DList address
};

class Struct_800A57C0
{
protected:
	uint16_t unk_0;
	int16_t unk_2;
	int16_t unk_4;
	int8_t unk_6;
	int8_t unk_7;
	int8_t unk_8;
	uint8_t unk_9;

public:
	Struct_800A57C0(const std::vector<uint8_t>& rawData, uint32_t fileOffset);
	Struct_800A57C0(const std::vector<uint8_t>& rawData, uint32_t fileOffset, size_t index);

	[[nodiscard]] std::string GetSourceOutputCode() const;

	static size_t GetRawDataSize();
	static std::string GetSourceTypeName();
};

class Struct_800A598C_2
{
protected:
	uint8_t unk_0;
	int16_t x;
	int16_t y;
	int16_t z;
	uint8_t unk_8;

public:
	Struct_800A598C_2(const std::vector<uint8_t>& rawData, uint32_t fileOffset);
	Struct_800A598C_2(const std::vector<uint8_t>& rawData, uint32_t fileOffset, size_t index);

	[[nodiscard]] std::string GetSourceOutputCode() const;

	static size_t GetRawDataSize();
	static std::string GetSourceTypeName();
};

class Struct_800A598C
{
protected:
	ZFile* parent;

	uint16_t unk_0;  // Length of unk_8
	uint16_t unk_2;  // Length of unk_C
	uint16_t unk_4;  // 0 or 1 // Used as an index for unk_C
	segptr_t unk_8;  // Struct_800A57C0*
	segptr_t unk_C;  // Struct_800A598C_2*

	std::vector<Struct_800A57C0> unk_8_arr;
	std::vector<Struct_800A598C_2> unk_C_arr;

public:
	Struct_800A598C(ZFile* parent, const std::vector<uint8_t>& rawData, uint32_t fileOffset);
	Struct_800A598C(ZFile* parent, const std::vector<uint8_t>& rawData, uint32_t fileOffset,
	                size_t index);

	void PreGenSourceFiles(const std::string& prefix);
	[[nodiscard]] std::string GetSourceOutputCode(const std::string& prefix) const;

	static size_t GetRawDataSize();
	static std::string GetSourceTypeName();
};

class Struct_800A5E28
{
protected:
	ZFile* parent;
	std::vector<uint8_t> rawData;

	uint16_t unk_0;  // Vtx count
	uint16_t unk_2;  // Length of unk_4
	segptr_t unk_4;  // Struct_800A598C*
	segptr_t unk_8;  // Gfx*

	std::vector<Struct_800A598C> unk_4_arr;
	ZDisplayList* unk_8_dlist = nullptr;

public:
	Struct_800A5E28() = default;
	Struct_800A5E28(ZFile* parent, const std::vector<uint8_t>& rawData, uint32_t fileOffset);
	Struct_800A5E28(ZFile* parent, const std::vector<uint8_t>& rawData, uint32_t fileOffset,
	                size_t index);
	~Struct_800A5E28();

	void PreGenSourceFiles(const std::string& prefix);
	[[nodiscard]] std::string GetSourceOutputCode(const std::string& prefix) const;

	static size_t GetRawDataSize();
	static std::string GetSourceTypeName();
};

class ZLimb : public ZResource
{
protected:
	segptr_t segAddress;
	ZLimbType type = ZLimbType::Standard;

	int16_t transX, transY, transZ;
	uint8_t childIndex, siblingIndex;
	segptr_t dListPtr = 0;

	std::vector<ZDisplayList> dLists;

	segptr_t dList2Ptr = 0;  // LOD and Curve only

	ZLimbSkinType skinSegmentType = ZLimbSkinType::SkinType_0;  // Skin only
	segptr_t skinSegment = 0;                                   // Skin only
	Struct_800A5E28 segmentStruct;                              // Skin only

	std::string GetLimbDListSourceOutputCode(const std::string& prefix,
	                                         const std::string& limbPrefix, segptr_t dListPtr);

	std::string GetSourceOutputCodeSkin(const std::string& prefix);
	std::string GetSourceOutputCodeSkin_Type_4(const std::string& prefix);

public:
	ZLimb(tinyxml2::XMLElement* reader, const std::vector<uint8_t>& nRawData, int nRawDataIndex,
	      ZFile* nParent);
	ZLimb(ZLimbType limbType, const std::string& prefix, const std::vector<uint8_t>& nRawData,
	      int nRawDataIndex, ZFile* nParent);

	void ParseXML(tinyxml2::XMLElement* reader) override;
	void ParseRawData() override;
	static ZLimb* FromXML(tinyxml2::XMLElement* reader, std::vector<uint8_t> nRawData,
	                      int rawDataIndex, std::string nRelPath, ZFile* parent);
	int GetRawDataSize() override;
	std::string GetSourceOutputCode(const std::string& prefix) override;
	std::string GetSourceTypeName() override;
	ZResourceType GetResourceType() override;

	ZLimbType GetLimbType();
	static const char* GetSourceTypeName(ZLimbType limbType);

	uint32_t GetFileAddress();
};
