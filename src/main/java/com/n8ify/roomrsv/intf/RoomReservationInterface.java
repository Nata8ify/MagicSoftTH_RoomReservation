package com.n8ify.roomrsv.intf;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.n8ify.roomrsv.model.Room;
import com.n8ify.roomrsv.model.RoomUsage;

public interface RoomReservationInterface {
	public boolean reserve(RoomUsage roomUsage);

	public boolean modify(RoomUsage roomUsage);

	public boolean cancel(int roomUsageId);

	public List<RoomUsage> findAll();
	public List<RoomUsage> findByRoomId(int roomId);
	public List<RoomUsage> findByDate(Date reservedDate);
	public List<RoomUsage> findByRoomName(String roomName);
	public List<Room> findAvailableByDateTime(Date date, Time accessBegin, Time accessUntil);
	public List<RoomUsage> findByRoomCode(String roomCode);
	public RoomUsage findByUsageId(int roomUsageId);
	
}
