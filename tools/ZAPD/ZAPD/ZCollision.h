#pragma once

#include "ZFile.h"
#include "ZResource.h"
#include "ZRoom/ZRoom.h"

class PolygonEntry
{
public:
	uint16_t type;
	uint16_t vtxA, vtxB, vtxC;
	uint16_t a, b, c, d;

	PolygonEntry(const std::vector<uint8_t>& rawData, uint32_t rawDataIndex);
};

class VertexEntry
{
public:
	int16_t x, y, z;

	VertexEntry(const std::vector<uint8_t>& rawData, uint32_t rawDataIndex);
};

class WaterBoxHeader
{
public:
	int16_t xMin;
	int16_t ySurface;
	int16_t zMin;
	int16_t xLength;
	int16_t zLength;
	int16_t pad;
	int32_t properties;

	WaterBoxHeader(const std::vector<uint8_t>& rawData, uint32_t rawDataIndex);
};

class CameraPositionData
{
public:
	int16_t x, y, z;

	CameraPositionData(const std::vector<uint8_t>& rawData, uint32_t rawDataIndex);
};

class CameraDataEntry
{
public:
	int16_t cameraSType;
	int16_t numData;
	int32_t cameraPosDataSeg;
};

class CameraDataList
{
public:
	std::vector<CameraDataEntry*> entries;
	std::vector<CameraPositionData*> cameraPositionData;

	CameraDataList(ZFile* parent, const std::string& prefix, const std::vector<uint8_t>& rawData,
	               uint32_t rawDataIndex, uint32_t polyTypeDefSegmentOffset,
	               uint32_t polygonTypesCnt);
};

class ZCollisionHeader : public ZResource
{
public:
	int16_t absMinX, absMinY, absMinZ;
	int16_t absMaxX, absMaxY, absMaxZ;
	uint16_t numVerts;
	segptr_t vtxAddress;
	uint16_t numPolygons;
	segptr_t polyAddress;
	segptr_t polyTypeDefAddress;
	segptr_t camDataAddress;

	int32_t numWaterBoxes;
	segptr_t waterBoxAddress;

	uint32_t vtxSegmentOffset, polySegmentOffset, polyTypeDefSegmentOffset, camDataSegmentOffset,
		waterBoxSegmentOffset;

	std::vector<VertexEntry> vertices;
	std::vector<PolygonEntry> polygons;
	std::vector<uint64_t> polygonTypes;
	std::vector<WaterBoxHeader*> waterBoxes;
	CameraDataList* camData;

	ZCollisionHeader(ZFile* nParent);
	~ZCollisionHeader();

	void ParseRawData() override;

	ZResourceType GetResourceType() const override;

	size_t GetRawDataSize() const override;
};
