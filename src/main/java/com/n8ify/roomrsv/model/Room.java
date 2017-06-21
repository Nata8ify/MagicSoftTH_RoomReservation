package com.n8ify.roomrsv.model;

public class Room {
	private short roomId;
	private String roomName;
	private String roomCode;
	private String description;
	private int floor;
	private String building;
	private boolean isAvailable;

	public short getRoomId() {
		return roomId;
	}

	public void setRoomId(short roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public boolean isAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
			this.isAvailable = isAvailable;
		
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", roomCode=" + roomCode + ", description="
				+ description + ", floor=" + floor + ", building=" + building + ", isAvailable=" + isAvailable + "]";
	}

}
