package com.n8ify.roomrsv.model;

public class RoomFacilitiyUsage {
	private int roomUsageId;
	private int roomFacilityId;
	private int accessedQuantity;

	
	
	public RoomFacilitiyUsage() {
		super();
	}

	public RoomFacilitiyUsage(int roomUsageId, int roomFacilityId, int accessedQuantity) {
		super();
		this.roomUsageId = roomUsageId;
		this.roomFacilityId = roomFacilityId;
		this.accessedQuantity = accessedQuantity;
	}

	public int getRoomUsageId() {
		return roomUsageId;
	}

	public void setRoomUsageId(int roomUsageId) {
		this.roomUsageId = roomUsageId;
	}

	public int getRoomFacilityId() {
		return roomFacilityId;
	}

	public void setRoomFacilityId(int roomFacilityId) {
		this.roomFacilityId = roomFacilityId;
	}

	public int getAccessedQuantity() {
		return accessedQuantity;
	}

	public void setAccessedQuantity(int accessedQuantity) {
		this.accessedQuantity = accessedQuantity;
	}

	@Override
	public String toString() {
		return "RoomFacilitiyUsage [roomUsageId=" + roomUsageId + ", roomFacilityId=" + roomFacilityId
				+ ", accessedQuantity=" + accessedQuantity + "]";
	}

}
