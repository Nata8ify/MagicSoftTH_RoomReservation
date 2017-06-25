package com.n8ify.roomrsv.dealer;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.intf.RoomReservationInterface;
import com.n8ify.roomrsv.model.Room;
import com.n8ify.roomrsv.model.RoomUsage;
import com.n8ify.roomrsv.model.extra.RoomUsageFullCalendarFmt;

public class ReservationManagement implements RoomReservationInterface {

	private JdbcTemplate jdbc;

	private FacilityUsageManagement faciliUsageMng;

	public ReservationManagement(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
		this.faciliUsageMng = new FacilityUsageManagement(dataSource);
	}

	@Override
	public boolean reserve(RoomUsage roomUsage) {
		String sqlReserve = "INSERT INTO `RoomUsage`( `roomId`, `byStaffId`, `purpose`, `note`, `reservedDate`, `accessBegin`, `accessUntil`) VALUES (?, ?, ?, ?, ? ,? ,?);";
		return jdbc.update(sqlReserve,
				new Object[] { roomUsage.getRoomId(), roomUsage.getByStaffId(), roomUsage.getNote(),
						roomUsage.getReservedDate(), roomUsage.getAccessBegin(), roomUsage.getAccessUntil() }) == 1;
	}

	@Override
	public boolean modify(RoomUsage roomUsage) {
		String sqlModify = "UPDATE `RoomUsage` SET `roomId`= ?,`byStaffId`= ?,`purpose`= ?,`note`= ?,`reservedDate`= ?,`accessBegin`= ?,`accessUntil`= ? WHERE `usageId`= ?";
		return jdbc.update(sqlModify,
				new Object[] { roomUsage.getRoomId(), roomUsage.getByStaffId(), roomUsage.getNote(),
						roomUsage.getReservedDate(), roomUsage.getAccessBegin(), roomUsage.getAccessUntil(),
						roomUsage.getUsageId() }) == 1;
	}

	@Override
	public boolean cancel(int roomUsageId) {
		String sqlCancel = "DELETE FROM `RoomUsage` WHERE `usageId` = ?;";
		return jdbc.update(sqlCancel, new Object[] { roomUsageId }) == 1;
	}

	@Override
	public List<RoomUsage> findAll() {
		String sqlFindAll = "SELECT * FROM `RoomUsage`;";
		return jdbc.query(sqlFindAll, new RoomUsageMapper());
	}

	@Override
	public List<RoomUsage> findByDate(Date reservedDate) {
		String sqlFindByDate = "SELECT * FROM `RoomUsage` WHERE  `reservedDate` = ?;";
		return jdbc.query(sqlFindByDate, new Object[] { reservedDate }, new RoomUsageMapper());
	}

	@Override
	public List<RoomUsage> findByRoomName(String roomName) {
		String sqlFindByRoomName = "SELECT * FROM `RoomUsage` rs JOIN `Room` r ON rs.`roomId` = r.`roomId` WHERE `roomName` LIKE ?;";
		return jdbc.query(sqlFindByRoomName, new Object[] { "%".concat(roomName).concat("%") }, new RoomUsageMapper());
	}

	@Override
	public List<Room> findAvailableByDateTime(Date date, Time accessBegin, Time accessUntil) {
		String sqlFindByRoomName = "SELECT r.* FROM `RoomUsage` ru JOIN `Room` r ON r.`roomId` = ru.`roomId` WHERE ru.`reservedDate` = '2017-06-21';";
		return null;
	}

	@Override
	public List<RoomUsage> findByRoomCode(String roomCode) {
		String sqlFindByRoomCode = "SELECT * FROM `RoomUsage` rs JOIN `Room` r ON rs.`roomId` = r.`roomId` WHERE `roomCode` = ?;";
		return jdbc.query(sqlFindByRoomCode, new Object[] { roomCode }, new RoomUsageMapper());
	}

	@Override
	public RoomUsage findByUsageId(int roomUsageId) {
		String sqlFindByUsageId = "SELECT * FROM `RoomUsage` rs JOIN `Room` r ON rs.`roomId` = r.`roomId` WHERE `usageId` = ?;";
		return jdbc.queryForObject(sqlFindByUsageId, new Object[] { roomUsageId }, new RoomUsageMapper());
	}

	@Override
	public List<RoomUsage> findByRoomId(int roomId) {
		String sqlFindByRoomId = "SELECT * FROM `RoomUsage` WHERE `roomId` = ?;";
		return jdbc.query(sqlFindByRoomId, new Object[] { roomId }, new RoomUsageMapper());
	}

	private class RoomUsageMapper implements RowMapper<RoomUsage> {

		@Override
		public RoomUsage mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomUsage(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getDate(6), rs.getTime(7), rs.getTime(8));
		}
	}

	private class RoomUsageFullCalendarMapper implements RowMapper<RoomUsageFullCalendarFmt> {

		@Override
		public RoomUsageFullCalendarFmt mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomUsageFullCalendarFmt(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getDate(6), rs.getTime(7), rs.getTime(8));
		}
	}
	
}
