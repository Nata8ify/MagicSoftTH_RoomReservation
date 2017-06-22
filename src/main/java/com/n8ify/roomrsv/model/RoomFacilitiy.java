package com.n8ify.roomrsv.model;

public class RoomFacilitiy {
	private int roomFacilityIdPrimary;
	private String facility;
	private String description;
	private boolean isDevice;
	private int quantity;

	public int getRoomFacilityIdPrimary() {
		return roomFacilityIdPrimary;
	}

	public void setRoomFacilityIdPrimary(int roomFacilityIdPrimary) {
		this.roomFacilityIdPrimary = roomFacilityIdPrimary;
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

	public boolean isDevice() {
		return isDevice;
	}

	public void setDevice(boolean isDevice) {
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
		return "RoomFacilitiy [roomFacilityIdPrimary=" + roomFacilityIdPrimary + ", facility=" + facility
				+ ", description=" + description + ", isDevice=" + isDevice + ", quantity=" + quantity + "]";
	}

}
