package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.controller.UtilsRESTController;
import com.n8ify.roomrsv.model.RoomInform;
import com.n8ify.roomrsv.model.Staff;

/** Only This Class  not have/implement Interface */
public class Utilities { 
	private static final Logger logger = LoggerFactory.getLogger(Utilities.class);
	private JdbcTemplate jdbc;
	
	
	
	public Utilities(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public Staff findStaffById(String staffId){
		String sqlFindStaffById = "SELECT * FROM `Staff` WHERE `staffId` = ?;";
		return jdbc.queryForObject(sqlFindStaffById, new Object[]{staffId}, new StaffMapper());
	}
	
	public List<Staff> findAllStaff(){
		String sqlFindStaffById = "SELECT * FROM `Staff`;";
		return jdbc.query(sqlFindStaffById, new StaffMapper());
	}
	
	class StaffMapper implements RowMapper<Staff> {

		@Override
		public Staff mapRow(ResultSet rs, int i) throws SQLException {
			Staff staff = new Staff();
			staff.setStaffId(rs.getString("staffId"));
			staff.setHonorific(rs.getString("honorific"));
			staff.setName(rs.getString("name"));
			staff.setNameLocale(rs.getString("nameLocale"));
			staff.setEmail(rs.getString("email"));
			staff.setTel(rs.getString("tel"));
			staff.setMobileTel(rs.getString("mobileTel"));
			staff.setDivision(rs.getString("division"));
			staff.setPosition(rs.getString("position"));
			staff.setProtraitPath(rs.getString("protraitPath"));
			staff.setStaffType(rs.getString("staffType"));
			staff.setHostManagerId(rs.getString("hostManagerId"));
			return staff;
		}

	}
	
	/* Inform Section */
	public void saveInform(RoomInform roomInform){
		String sqlInsertInform = "INSERT INTO `RoomInform`(`title`, `message`, `byStaffId`) VALUES (?, ?, ?);";
		logger.info(roomInform.toString());
		jdbc.update(sqlInsertInform, new Object[]{roomInform.getTitle(), roomInform.getMessage(), roomInform.getByStaffId().isEmpty()?null:roomInform.getByStaffId()});
	}
	
	public List<RoomInform> getTotalInforms(){
		String sqlFindTotalInform = "SELECT * FROM `RoomInform`;";
		return jdbc.query(sqlFindTotalInform, new RoomInfornMapper());
	}
	
	public boolean dismissInform(int informId){
		String sqlDismissInform = "DELETE FROM `RoomInform` WHERE `informId` = ?;";
		return jdbc.update(sqlDismissInform, new Object[]{informId}) == 1;
	}
	
	public boolean truncateInforms(){
		String sqlDismissInform = "DELETE FROM `RoomInform`;";
		return jdbc.update(sqlDismissInform) >= 0;
	}
	
	private class RoomInfornMapper implements RowMapper<RoomInform>{

		@Override
		public RoomInform mapRow(ResultSet rs, int i) throws SQLException {
			return new RoomInform(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getTimestamp(4), rs.getString(5));
		}
		
	}
	
	/* Setting REST Section */
	public boolean updateAdministratorRole(String staffId, String permissionType){
		String sqlGrantPermission = "UPDATE `StaffAccess` SET `rmreservRole`= ? WHERE `staffId` = ?;";
		return jdbc.update(sqlGrantPermission, new Object[]{permissionType, staffId}) == 1;
	}
	
}
