package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.intf.RoomsrvAccessInterface;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.model.StaffAccess;

public class RoomrsvAccess implements RoomsrvAccessInterface {

	private JdbcTemplate jdbc;
	
	public RoomrsvAccess(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public Staff login(String staffId, String password) {
		String sqlQueryStaff = "SELECT * FROM `Staff` s WHERE UPPER(sa.staffId) = ?;";
		String sqlQueryAccess = "SELECT `rmreservRole` FROM `StaffAccess` WHERE `staffId` = ?;";
		try {
			StaffAccess.setAccessInstance(jdbc.queryForObject(sqlQueryAccess, new Object[]{staffId}, new StaffAccessMapper()));
			if(Staff.getStaffInstance() == null) {return null;}
			Staff.setStaffInstance(jdbc.queryForObject(sqlQueryStaff, new Object[] { staffId}, new StaffMapper()));
			return Staff.getStaffInstance();
		} catch (EmptyResultDataAccessException erex) {
			return null; // <-- Please Change Handle Thing.
		}
	}

	@Override
	public Staff login(String staffId, String password, String staffType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isRoomReservationAdmin(String staffId) {
		String sqlStaffRole = "SELECT `rmreservRole` FROM `StaffAccess` WHERE `staffId` = ?";
		String role = jdbc.queryForObject(sqlStaffRole, new Object[]{staffId}, String.class);
		if(role == null) return false;
		if(role.equals(Staff.TYPE_ADMINISTRATOR)){
			return true;
		}
		return false;
	}

	@Override
	public boolean setToStffpsRole(String staffId, String stffpsRole) {
		// TODO Auto-generated method stub
		return false;
	}

	private String tempStaffRole;
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

	class StaffAccessMapper implements RowMapper<StaffAccess> {

		@Override
		public StaffAccess mapRow(ResultSet rs, int arg1) throws SQLException {
			return new StaffAccess(rs.getString("staffId"), rs.getString("password"), rs.getString("stffpsRole"));
		}
	}
	
}
