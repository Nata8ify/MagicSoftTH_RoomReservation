package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.intf.RoomFacilityUsageInterface;
import com.n8ify.roomrsv.model.RoomFacilitiyUsage;

public class FacilityUsageManagement implements RoomFacilityUsageInterface {

	private  JdbcTemplate jdbc;
	
	public FacilityUsageManagement(DataSource  datasource) {
		this.jdbc = new JdbcTemplate(datasource);
	}

	@Override
	public boolean reserve(RoomFacilitiyUsage facilitiyUsage) {
		String sqlrReserve = "INSERT INTO `RoomFacilitiyUsage`(`roomUsageId`, `roomFacilityId`, `accessedQuantity`) VALUES (?, ?, ?);";
		return jdbc.update(sqlrReserve, new Object[]{facilitiyUsage.getRoomUsageId(), facilitiyUsage.getRoomFacilityId(), facilitiyUsage.getAccessedQuantity()}) == 1 ;
	}

	@Override
	public boolean update(RoomFacilitiyUsage facilitiyUsage) {
		String sqlUpdate = "UPDATE `RoomFacilitiyUsage` SET `roomFacilityId`= ?,`accessedQuantity`= ? WHERE `roomUsageId`= ?;";
		return jdbc.update(sqlUpdate, new Object[]{facilitiyUsage.getRoomFacilityId(), facilitiyUsage.getAccessedQuantity(), facilitiyUsage.getRoomUsageId()}) == 1 ;
	}

	@Override
	public boolean cancel(int roomFacilityId) {
		String sqlCancel = "DELETE FROM `RoomFacilitiyUsage` WHERE `roomUsageId` = ?;";
		return jdbc.update(sqlCancel, new Object[]{roomFacilityId}) == 1 ;
	}

	@Override
	public List<RoomFacilitiyUsage> findAllFacilityUsage() {
		String sqlFindAllFacilityUsage = "SELECT * FROM `RoomFacilitiyUsage`;";
		return jdbc.query(sqlFindAllFacilityUsage, new FacilityUsageMapper());
	}

	@Override
	public List<RoomFacilitiyUsage> findByRoomUsageId(int roomUsageId) {
		String sqlFindByRoomUsageId = "SELECT * FROM `RoomFacilitiyUsage` WHERE  `roomUsageId` = ?;";
		return jdbc.query(sqlFindByRoomUsageId, new Object[]{roomUsageId}, new FacilityUsageMapper());
	}

	private class FacilityUsageMapper implements RowMapper<RoomFacilitiyUsage> {

		@Override
		public RoomFacilitiyUsage mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomFacilitiyUsage(rs.getInt(1), rs.getInt(2), rs.getInt(3));
		}

	}

}
