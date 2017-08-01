package com.n8ify.roomrsv.model;

public class RoomFacilitiy {
	private int roomFacilityId;
	private String facility;
	private String description;
	private boolean isDevice;
	private int quantity;

	public RoomFacilitiy() {
	}

	public RoomFacilitiy(int roomFacilityId, String facility, String description, boolean isDevice, int quantity) {
		super();
		this.roomFacilityId = roomFacilityId;
		this.facility = facility;
		this.description = description;
		this.isDevice = isDevice;
		this.quantity = quantity;
	}

	public int getRoomFacilityId() {
		return roomFacilityId;
	}

	public void setRoomFacilityId(int roomFacilityId) {
		this.roomFacilityId = roomFacilityId;
	}

	public String getFacility() {
		return facility;
	}

	public void setFacility(String facility) {
		this.facility = facility;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean getIsDevice() {
		return isDevice;
	}

	public void setIsDevice(boolean isDevice) {
		this.isDevice = isDevice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "RoomFacilitiy [roomFacilityId=" + roomFacilityId + ", facility=" + facility + ", description="
				+ description + ", isDevice=" + isDevice + ", quantity=" + quantity + "]";
	}

}
