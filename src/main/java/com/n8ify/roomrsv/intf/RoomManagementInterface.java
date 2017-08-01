package com.n8ify.roomrsv.intf;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.n8ify.roomrsv.model.Room;

public interface RoomManagementInterface {
	public boolean addRoom(Room room);
	public boolean updateRoom(Room room);
	public boolean deleteRoom(int roomId);
	public boolean deleteAll();
	
	public Room findByRoomId(int roomId);
	public Room findByCode(String roomCode);
	public List<Room> findAll(boolean available);
	public List<Room> findByBuilding(String building);
	public List<Room> findByBuildingandFloor(String building, int floor);
	public List<Room> findByName(String roomName, boolean available);
	public List<Room> findAvailableRoomByDateTime(Date date, Time accessBegin, Time accessUntil);
}
