package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.intf.RoomFacilityManagementInterface;
import com.n8ify.roomrsv.model.RoomFacilitiy;

public class FacilityManagement implements RoomFacilityManagementInterface{

	private JdbcTemplate jdbc;
	
	
	
	public FacilityManagement(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public boolean addFacility(RoomFacilitiy facilitiy) {
		String sqlInsertFacili = "INSERT INTO `RoomFacilitiy`( `facility`, `description`, `isDevice`, `quantity`) VALUES (?, ?, ?, ?);";
		return jdbc.update(sqlInsertFacili, new Object[]{facilitiy.getFacility(), facilitiy.getDescription(), facilitiy.getIsDevice(), facilitiy.getQuantity()})
				== 1;
	}

	@Override
	public boolean updateFacility(RoomFacilitiy facilitiy) {
		String sqlUpdateFacili = "UPDATE `RoomFacilitiy` SET `facility`= ?,`description`=  ?,`isDevice`= ?,`quantity`= ? WHERE `roomFacilityId` = ?;";
		return jdbc.update(sqlUpdateFacili, new Object[]{facilitiy.getFacility(), facilitiy.getDescription(), facilitiy.getIsDevice(), facilitiy.getQuantity(), facilitiy.getRoomFacilityId()})
				== 1;
	}

	@Override
	public boolean updateFacilityQuantity(int facilitiyId, int quantity) {
		String sqlUpdateQFacili = "UPDATE `RoomFacilitiy` SET `quantity`= ? WHERE `roomFacilityId` = ?;";
		return jdbc.update(sqlUpdateQFacili, new Object[]{quantity, facilitiyId})
				== 1;
	}

	@Override
	public boolean deleteFacility(int facilitiyId) {
		String  sqlDeleteFacili= "DELETE FROM `RoomFacilitiy` WHERE `roomFacilityId` = ?;";
		return jdbc.update(sqlDeleteFacili, new Object[]{facilitiyId})
				== 1;
	}

	@Override
	public List<RoomFacilitiy> findAll() {
		String sqlfindAll = "SELECT * FROM `RoomFacilitiy`;";
		return jdbc.query(sqlfindAll, new FacilityMapper());
	}

	@Override
	public RoomFacilitiy findById(int id) {
		String sqlFindById = "SELECT * FROM `RoomFacilitiy` WHERE `roomFacilityId` = ?;";
		return jdbc.queryForObject(sqlFindById, RoomFacilitiy.class);
	}
	
	@Override
	public List<RoomFacilitiy> findAllforNonDevice() {
		String  sqlfindAllNonDevice= "SELECT * FROM `RoomFacilitiy` WHERE `isDevice` == 0;";
		return jdbc.query(sqlfindAllNonDevice, new FacilityMapper());
	}

	@Override
	public List<RoomFacilitiy> findAllforDevice() {
		String sqlfindAllDevice  = "SELECT * FROM `RoomFacilitiy` WHERE `isDevice` == 1;";
		return jdbc.query(sqlfindAllDevice, new FacilityMapper());
	}
	
	private class FacilityMapper implements RowMapper<RoomFacilitiy>{
		@Override
		public RoomFacilitiy mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomFacilitiy(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getInt(5));
		}}


}
