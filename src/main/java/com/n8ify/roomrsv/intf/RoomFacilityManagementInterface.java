package com.n8ify.roomrsv.intf;

import java.util.List;

import com.n8ify.roomrsv.model.RoomFacilitiy;

public interface RoomFacilityManagementInterface {
	public boolean addFacility(RoomFacilitiy facilitiy);
	public boolean updateFacility(RoomFacilitiy facilitiy);
	public boolean updateFacilityQuatity(int facilitiyId, int quantity);
	public boolean deleteFacility(int facilitiyId);
	
	public List<RoomFacilitiy> findAll();
	public List<RoomFacilitiy> findByRoomUsage(int roomUsageId);
	public List<RoomFacilitiy> findAllforNonDevice();
	public List<RoomFacilitiy> findAllforDevice();
}
