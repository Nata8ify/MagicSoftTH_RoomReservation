package com.n8ify.roomrsv.intf;

import java.util.List;

import com.n8ify.roomrsv.model.RoomFacilitiyUsage;

public interface RoomFacilityUsageInterface {
	public boolean reserve(RoomFacilitiyUsage facilitiyUsage);
	
	public boolean update(RoomFacilitiyUsage facilitiyUsage);
	public boolean cancel(int roomFacilityId);
	
	public List<RoomFacilitiyUsage> findAllFacilityUsage();
	public List<RoomFacilitiyUsage> findByRoomUsageId(int roomUsageId);
}
