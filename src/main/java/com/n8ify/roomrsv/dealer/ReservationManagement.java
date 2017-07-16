package com.n8ify.roomrsv.dealer;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.n8ify.roomrsv.intf.RoomReservationInterface;
import com.n8ify.roomrsv.model.RoomUsage;

public class ReservationManagement implements RoomReservationInterface {

	private static final Logger logger = LoggerFactory.getLogger(ReservationManagement.class);
	
	private JdbcTemplate jdbc;

	private FacilityUsageManagement faciliUsageMng;

	public ReservationManagement(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
		this.faciliUsageMng = new FacilityUsageManagement(dataSource);
	}

	public FacilityUsageManagement getFaciliUsageMng() {
		return faciliUsageMng;
	}

	@Override
	public int reserve(final RoomUsage roomUsage) {
		final String sqlReserve = "INSERT INTO `RoomUsage`( `roomId`, `byStaffId`, `purpose`, `note`, `reservedDate`, `accessBegin`, `accessUntil`) VALUES (?, ?, ?, ?, ? ,? ,?);";
		KeyHolder latestId = new GeneratedKeyHolder();
		jdbc.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstm = conn.prepareStatement(sqlReserve, new String[]{"id"});
				pstm.setInt(1, roomUsage.getRoomId());
				pstm.setString(2, roomUsage.getByStaffId());
				pstm.setString(3, roomUsage.getPurpose());
				pstm.setString(4, roomUsage.getNote());
				pstm.setDate(5, roomUsage.getReservedDate());
				pstm.setTime(6, roomUsage.getAccessBegin());
				pstm.setTime(7, roomUsage.getAccessUntil());
				
				
				return pstm;
			}
		}, latestId);
		return latestId.getKey().intValue();
	}

	@Override
	public boolean modify(RoomUsage roomUsage) {
		String sqlModify = "UPDATE `RoomUsage` SET `roomId`= ?,`byStaffId`= ?,`purpose`= ?,`note`= ?,`reservedDate`= ?,`accessBegin`= ?,`accessUntil`= ? WHERE `usageId`= ?";
		return jdbc.update(sqlModify,
				new Object[] { roomUsage.getRoomId(), roomUsage.getByStaffId(), roomUsage.getPurpose(),
						roomUsage.getNote(), roomUsage.getReservedDate(), roomUsage.getAccessBegin(),
						roomUsage.getAccessUntil(), roomUsage.getUsageId() }) == 1;
	}

	@Override
	public boolean cancel(int roomUsageId) {
		String sqlCancel = "DELETE FROM `RoomUsage` WHERE `usageId` = ?;";
		return jdbc.update(sqlCancel, new Object[] { roomUsageId }) == 1;
	}

	@Override
	public List<RoomUsage> findAll(boolean isPassInclude) {
		String sqlFindAll = isPassInclude?"SELECT * FROM `RoomUsage`;":"SELECT * FROM `RoomUsage` WHERE reservedDate >= CURDATE();";
		return jdbc.query(sqlFindAll, new RoomUsageMapper());
	}

	@Override
	public List<RoomUsage> findByDate(Date reservedDate) {
		String sqlFindByDate = "SELECT * FROM `RoomUsage` WHERE  `reservedDate` = ?;";
		return jdbc.query(sqlFindByDate, new Object[] { reservedDate }, new RoomUsageMapper());
	}

	@Override
	public List<RoomUsage> findOverlapByDateTime(int roomId, Date reservedDate, Time accessBegin, Time accessUntil) {
		String sqlFindOverlapByDateTime = "SELECT * FROM `RoomUsage` WHERE `reservedDate` = ? AND (`accessBegin` BETWEEN ? AND ? OR `accessUntil` BETWEEN ? AND ? ) AND roomId = ? ;";
		return jdbc.query(sqlFindOverlapByDateTime, new Object[]{reservedDate, accessBegin , accessUntil, accessBegin, accessUntil, roomId}, new RoomUsageMapper());
	}
	
	@Override
	public List<RoomUsage> findByRoomName(String roomName) {
		String sqlFindByRoomName = "SELECT * FROM `RoomUsage` rs JOIN `Room` r ON rs.`roomId` = r.`roomId` WHERE `roomName` LIKE ?;";
		return jdbc.query(sqlFindByRoomName, new Object[] { "%".concat(roomName).concat("%") }, new RoomUsageMapper());
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



	@Override
	public List<RoomUsage> findAllByStaffId(String staffId, boolean isPassInclude) {
		String sqlFindAllByUserId;
		if (isPassInclude) {
			sqlFindAllByUserId = "SELECT * FROM `RoomUsage` WHERE `byStaffId` = ?;";
		} else {
			sqlFindAllByUserId = "SELECT * FROM `RoomUsage` WHERE `byStaffId` = ? AND `reservedDate` >= CURDATE();";
		}
		return jdbc.query(sqlFindAllByUserId, new Object[] { staffId }, new RoomUsageMapper());
	}

	
	private class RoomUsageMapper implements RowMapper<RoomUsage> {

		@Override
		public RoomUsage mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomUsage(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getDate(6), rs.getTime(7), rs.getTime(8));
		}
	}

}
