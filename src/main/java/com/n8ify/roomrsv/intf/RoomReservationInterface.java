package com.n8ify.roomrsv.intf;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.n8ify.roomrsv.model.RoomUsage;

public interface RoomReservationInterface {
	public int reserve(RoomUsage roomUsage);

	public boolean modify(RoomUsage roomUsage);

	public boolean cancel(int roomUsageId);
	public boolean emptyOldUsage();
	public void emptyTotalUsage();

	public List<RoomUsage> findAll(boolean isPassInclude);
	public List<RoomUsage> findAllPassed();
	public List<RoomUsage> findAllByStaffId(String staffIs, boolean isPassInclude);
	public List<RoomUsage> findByRoomId(int roomId);
	public List<RoomUsage> findByDate(Date reservedDate);
	public List<RoomUsage> findOverlapByDateTime(int roomId, Date reservedDate, Time start, Time end);
	public List<RoomUsage> findByRoomName(String roomName);
	public List<RoomUsage> findByRoomCode(String roomCode);
	public RoomUsage findByUsageId(int roomUsageId);
	
}
