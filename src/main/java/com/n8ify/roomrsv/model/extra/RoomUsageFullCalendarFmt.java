package com.n8ify.roomrsv.model.extra;

import java.sql.Date;
import java.sql.Time;

public class RoomUsageFullCalendarFmt {
	private int usageId;
	private int roomId;
	private String byStaffId;
	private String purpose;
	private String note;
	private Date reservedDate;
	private Time start;
	private Time end;
	

	public RoomUsageFullCalendarFmt(int usageId, int roomId, String byStaffId, String purpose, String note,
			Date reservedDate, Time start, Time end) {
		super();
		this.usageId = usageId;
		this.roomId = roomId;
		this.byStaffId = byStaffId;
		this.purpose = purpose;
		this.note = note;
		this.reservedDate = reservedDate;
		this.start = start;
		this.end = end;
	}
	
	
	
	public Date getReservedDate() {
		return reservedDate;
	}



	public void setReservedDate(Date reservedDate) {
		this.reservedDate = reservedDate;
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
	public Time getStart() {
		return start;
	}
	public void setStart(Time start) {
		this.start = start;
	}
	public Time getEnd() {
		return end;
	}
	public void setEnd(Time end) {
		this.end = end;
	}
	
	private void parseToISO8601(Date date, Time time){
		
	}
	
}
