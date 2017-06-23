package com.n8ify.roomrsv.model;

public class StaffAccess {
	private String staffId;
	private String password;
	private String roomrsvRole;

	private static StaffAccess staffAccess;

	public static StaffAccess getAccessInstance() {
		if (StaffAccess.staffAccess == null)
			return null;
		return StaffAccess.staffAccess;
	}

	public static void setAccessInstance(StaffAccess staffAccess) {
		StaffAccess.staffAccess = staffAccess;
	}

	public StaffAccess(String staffId, String password, String roomrsvRole) {
		super();
		this.staffId = staffId;
		this.password = password;
		this.roomrsvRole = roomrsvRole;
	}

	public StaffAccess(String staffId, String password) {
		super();
		this.staffId = staffId;
		this.password = password;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoomrsvRole() {
		return roomrsvRole;
	}

	public void setRoomrsvRole(String roomrsvRole) {
		this.roomrsvRole = roomrsvRole;
	}

	@Override
	public String toString() {
		return "StaffAccess [staffId=" + staffId + ", password=" + password + ", roomrsvRole=" + roomrsvRole + "]";
	}

	
}
