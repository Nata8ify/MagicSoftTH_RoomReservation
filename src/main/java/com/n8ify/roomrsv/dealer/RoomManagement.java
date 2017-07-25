package com.n8ify.roomrsv.dealer;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import java.util.ListIterator;

import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.google.common.collect.Lists;
import com.n8ify.roomrsv.intf.RoomManagementInterface;
import com.n8ify.roomrsv.model.Room;

public class RoomManagement implements RoomManagementInterface {

	private static final Logger logger = LoggerFactory.getLogger(RoomManagement.class);
	
	private JdbcTemplate jdbc;

	public RoomManagement(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean addRoom(Room room) {
		String sqlAddRoom = "INSERT INTO `Room` (`roomName`, `roomCode`, `description`, `floor`, `building`, `isAvailable`) VALUES (?, ?, ?, ?, ?, ?);";
		return jdbc.update(sqlAddRoom, new Object[] { room.getRoomName(), room.getRoomCode().isEmpty()?null:room.getRoomCode(), room.getDescription(),
				room.getFloor(), room.getBuilding(), room.getIsAvailable() }) == 1;

	}

	@Override
	public boolean updateRoom(Room room) {
		String sqlUpdateRoom = "UPDATE `Room` SET `roomName`= ?,`roomCode`= ?,`description`= ?,`floor`= ?,`building`= ?,`isAvailable`= ? WHERE `roomId`= ?;";
		return jdbc.update(sqlUpdateRoom, new Object[] { room.getRoomName(), room.getRoomCode().isEmpty()?null:room.getRoomCode(), room.getDescription(),
				room.getFloor(), room.getBuilding(), room.getIsAvailable(), room.getRoomId() }) == 1;
	}

	@Override
	public boolean deleteRoom(int roomId) {
		String sqlDelete = "DELETE FROM `Room` WHERE `roomId` = ?";
		return jdbc.update(sqlDelete, roomId) == 1;
	}

	@Override
	public boolean deleteAll() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Room findByRoomId(int roomId) {
		String sqlFindbyId = "SELECT * FROM `Room` WHERE `roomId` = ?;";
		return jdbc.queryForObject(sqlFindbyId, new Object[]{roomId}, new RoomMapper());
	}

	@Override
	public Room findByCode(String roomCode) {
		String sqlFindbyCode = "SELECT * FROM `Room` WHERE `roomCode` = ?";
		return jdbc.queryForObject(sqlFindbyCode, new Object[]{roomCode}, new RoomMapper());
	}

	@Override
	public List<Room> findAll(boolean available) {
		String sqlFindAll  = available?"SELECT * FROM `Room` WHERE `isAvailable` = 1;":"SELECT * FROM `Room`;";
		return jdbc.query(sqlFindAll, new RoomMapper());
	}

	@Override
	public List<Room> findByBuilding(String building) {
		String sqlFindByBuilding  = "SELECT * FROM `Room` WHERE `building` like ?;";
		return jdbc.query(sqlFindByBuilding, new RoomMapper());
	}

	@Override
	public List<Room> findByBuildingandFloor(String building, int floor) {
		String sqlFindByBuildingandRoom  = "SELECT * FROM `Room` WHERE `building` like ? AND `floor` = ?;";
		return jdbc.query(sqlFindByBuildingandRoom, new RoomMapper());
	}
	
	@Override
	public List<Room> findByName(String roomName, boolean available) {
		String sqlFindByBuilding  = available?"SELECT * FROM `Room` WHERE `roomName` like ? AND `isAvailable` = 1;":"SELECT * FROM `Room` WHERE `roomName` like ?;";
		return jdbc.query(sqlFindByBuilding, new Object[]{"%".concat(roomName).concat("%")}, new RoomMapper());
	}
	
	@Override
	public List<Room> findAvailableRoomByDateTime(Date date, Time accessBegin, Time accessUntil) {
		// BAD Loop Ever Made. [Need Improve]
		List<Room> availableRooms = null;
		ListIterator<Room> itrAvailableRooms = findAll(true).listIterator();
		Room room;
		String sqlFindByDateTime = "SELECT `roomId` FROM `RoomUsage` WHERE `reservedDate` = ? AND ((`accessBegin` BETWEEN CAST( ? AS time) AND CAST( ? AS time) OR `accessUntil` BETWEEN CAST( ? AS time) AND CAST( ? AS time)) OR (`accessBegin` <= CAST( ? AS time) AND `accessUntil` >= CAST( ? AS time)));";
		List<Integer> unavailableRoomIds = jdbc.queryForList(sqlFindByDateTime, new Object[]{date, accessBegin , accessUntil, accessBegin, accessUntil, accessBegin, accessUntil}, Integer.class);
		logger.info("unav : "+unavailableRoomIds.toString());
		while(itrAvailableRooms.hasNext()){
			room = itrAvailableRooms.next();
			logger.info(room.toString());
			for(int roomId : unavailableRoomIds){
				if(room.getRoomId() == roomId){
					itrAvailableRooms.remove();
					logger.info("remove -> "+room.toString());
				}
			}
		}
		while(itrAvailableRooms.hasPrevious()){itrAvailableRooms.previous();}
		availableRooms = Lists.newArrayList(itrAvailableRooms);
		logger.info("af : "+availableRooms.size());
		return availableRooms;
	}
	
	private class RoomMapper implements RowMapper<Room>{

		@Override
		public Room mapRow(ResultSet rs, int i) throws SQLException {
			return new Room(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getBoolean(7));
		}} 

}
