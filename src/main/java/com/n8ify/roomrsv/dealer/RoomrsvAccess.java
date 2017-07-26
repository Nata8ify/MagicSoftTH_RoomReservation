package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.intf.RoomsrvAccessInterface;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.model.StaffAccess;
import com.n8ify.roomrsv.utils.Generator;

public class RoomrsvAccess implements RoomsrvAccessInterface {

	private JdbcTemplate jdbc;
	private static final Logger logger = LoggerFactory.getLogger(RoomrsvAccess.class);
	public RoomrsvAccess(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public Staff login(String staffId, String password) {
		try {
			String sqlQueryStaff = "SELECT * FROM `Staff` WHERE staffId = ?;";
			String sqlQueryAccess = "SELECT `staffId`, `password`, `rmreservRole` FROM `StaffAccess` WHERE `staffId` = ? AND `password` = ?;";
			StaffAccess.setAccessInstance(jdbc.queryForObject(sqlQueryAccess, new Object[] { staffId,  Generator.getInstance().genMd5(password) }, new StaffAccessMapper()));
			if(StaffAccess.getAccessInstance() != null){
				return jdbc.queryForObject(sqlQueryStaff, new Object[] { staffId }, new StaffMapper());
			} 
			return null;
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
		try {
			String sqlStaffRole = "SELECT `rmreservRole` FROM `StaffAccess` WHERE `staffId` = ?";
			String role = jdbc.queryForObject(sqlStaffRole, new Object[] { staffId }, String.class);
			if (role.equals(Staff.TYPE_ADMINISTRATOR)) {
				return true;
			}
		} catch (EmptyResultDataAccessException erex) {
			// <-- Please Change Handle Thing.
		}
		return false;
	}

	@Override
	public boolean setToStffpsRole(String staffId, String stffpsRole) {
		// TODO Auto-generated method stub
		return false;
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

	class StaffAccessMapper implements RowMapper<StaffAccess> {

		@Override
		public StaffAccess mapRow(ResultSet rs, int arg1) throws SQLException {
			return new StaffAccess(rs.getString("staffId"), rs.getString("password"), rs.getString("rmreservRole"));
		}
	}

}
