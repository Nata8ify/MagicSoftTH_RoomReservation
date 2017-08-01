package com.n8ify.roomrsv.model;

public class Room {
	private int roomId;
	private String roomName;
	private String roomCode;
	private String description;
	private int floor;
	private String building;
	private boolean isAvailable;

	public Room() {
	}

	public Room(String roomName, String roomCode, String description, int floor, String building, boolean isAvailable) {
		this.roomName = roomName;
		this.roomCode = roomCode;
		this.description = description;
		this.floor = floor;
		this.building = building;
		this.isAvailable = isAvailable;
	}

	public Room(int roomId, String roomName, String roomCode, String description, int floor, String building,
			boolean isAvailable) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.roomCode = roomCode;
		this.description = description;
		this.floor = floor;
		this.building = building;
		this.isAvailable = isAvailable;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
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



	public boolean getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", roomCode=" + roomCode + ", description="
				+ description + ", floor=" + floor + ", building=" + building + ", isAvailable=" + isAvailable + "]";
	}

}
