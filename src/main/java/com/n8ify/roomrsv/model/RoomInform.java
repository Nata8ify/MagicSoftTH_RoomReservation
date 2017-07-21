package com.n8ify.roomrsv.model;

import java.sql.Timestamp;

public class RoomInform {
	private int informId;
	private String title;
	private String message;
	private Timestamp timeStamp;
	private String byStaffId; // 6 Characters's MST Staff ID.
	
	
	
	public RoomInform() {
		super();
	}
	public RoomInform(String title, String message, String byStaffId) {
		super();
		this.title = title;
		this.message = message;
		this.byStaffId = byStaffId;
	}
	public RoomInform(int informId, String title, String message, Timestamp timeStamp, String byStaffId) {
		super();
		this.informId = informId;
		this.title = title;
		this.message = message;
		this.timeStamp = timeStamp;
		this.byStaffId = byStaffId;
	}
	
	
	
	public Timestamp getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(Timestamp timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getByStaffId() {
		return byStaffId;
	}
	public void setByStaffId(String byStaffId) {
		this.byStaffId = byStaffId;
	}
	public int getInformId() {
		return informId;
	}
	public void setInformId(int informId) {
		this.informId = informId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "RoomInform [informId=" + informId + ", title=" + title + ", message=" + message + ", timeStamp="
				+ timeStamp + ", byStaffId=" + byStaffId + "]";
	}
	
	
	
	
}
