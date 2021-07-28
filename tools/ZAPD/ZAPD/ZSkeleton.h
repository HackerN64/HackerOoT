#pragma once

#include <cstdint>
#include <string>
#include <vector>

#include "ZDisplayList.h"
#include "ZFile.h"
#include "ZLimb.h"

enum class ZSkeletonType
{
	Normal,
	Flex,
	Curve,
};

class ZLimbTable : public ZResource
{
public:
	ZLimbTable(ZFile* nParent);

	void ExtractFromXML(tinyxml2::XMLElement* reader, uint32_t nRawDataIndex) override;
	void ExtractFromBinary(uint32_t nRawDataIndex, ZLimbType nLimbType, size_t nCount);

	void ParseXML(tinyxml2::XMLElement* reader) override;
	void ParseRawData() override;
	void DeclareReferences(const std::string& prefix) override;
	std::string GetBodySourceCode() const override;

	std::string GetSourceOutputCode(const std::string& prefix) override;

	std::string GetSourceTypeName() const override;
	ZResourceType GetResourceType() const override;

	size_t GetRawDataSize() const override;

protected:
	ZLimbType limbType = ZLimbType::Standard;
	size_t count = 0;

	std::vector<segptr_t> limbsAddresses;
};

class ZSkeleton : public ZResource
{
public:
	ZSkeletonType type = ZSkeletonType::Normal;
	ZLimbType limbType = ZLimbType::Standard;
	segptr_t limbsArrayAddress;
	uint8_t limbCount = 0;
	uint8_t dListCount = 0;  // FLEX SKELETON ONLY

	ZSkeleton(ZFile* nParent);

	void ExtractFromXML(tinyxml2::XMLElement* reader, uint32_t nRawDataIndex) override;

	void ParseXML(tinyxml2::XMLElement* reader) override;
	void ParseRawData() override;
	void DeclareReferences(const std::string& prefix) override;
	std::string GetBodySourceCode() const override;

	std::string GetSourceOutputCode(const std::string& prefix) override;
	void GenerateHLIntermediette(HLFileIntermediette& hlFile) override;

	size_t GetRawDataSize() const override;

	std::string GetSourceTypeName() const override;
	ZResourceType GetResourceType() const override;

	segptr_t GetAddress();
	uint8_t GetLimbCount();

protected:
	ZLimbTable limbsTable;
};
