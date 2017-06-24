package com.n8ify.roomrsv.model;

import java.sql.Date;
import java.sql.Time;

public class RoomUsage {
	private int usageId;
	private int roomId;
	private String byStaffId;
	private String purpose;
	private String note;
	private Date reservedDate;
	private Time accessBegin;
	private Time accessUntil;

	
	
	public RoomUsage() {
	}

	public RoomUsage(int usageId, int roomId, String byStaffId, String purpose, String note, Date reservedDate,
			Time accessBegin, Time accessUntil) {
		this.usageId = usageId;
		this.roomId = roomId;
		this.byStaffId = byStaffId;
		this.purpose = purpose;
		this.note = note;
		this.reservedDate = reservedDate;
		this.accessBegin = accessBegin;
		this.accessUntil = accessUntil;
	}

	public int getUsageId() {
		return usageId;
	}

	public void setUsageId(int usageId) {
		this.usageId = usageId;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getByStaffId() {
		return byStaffId;
	}

	public void setByStaffId(String byStaffId) {
		this.byStaffId = byStaffId;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getReservedDate() {
		return reservedDate;
	}

	public void setReservedDate(Date reservedDate) {
		this.reservedDate = reservedDate;
	}

	public Time getAccessBegin() {
		return accessBegin;
	}

	public void setAccessBegin(Time accessBegin) {
		this.accessBegin = accessBegin;
	}

	public Time getAccessUntil() {
		return accessUntil;
	}

	public void setAccessUntil(Time accessUntil) {
		this.accessUntil = accessUntil;
	}

	@Override
	public String toString() {
		return "RoomUsage [usageId=" + usageId + ", roomId=" + roomId + ", byStaffId=" + byStaffId + ", purpose="
				+ purpose + ", note=" + note + ", reservedDate=" + reservedDate + ", accessBegin=" + accessBegin
				+ ", accessUntil=" + accessUntil + "]";
	}

}
