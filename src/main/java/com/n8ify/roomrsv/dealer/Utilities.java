package com.n8ify.roomrsv.dealer;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.n8ify.roomrsv.model.Staff;

/** Only This Class  not have/implement Interface */
public class Utilities { 
	
	private JdbcTemplate jdbc;
	
	
	
	public Utilities(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public Staff findStaffById(String staffId){
		String sqlFindStaffById = "SELECT * FROM `Staff` WHERE `staffId` = ?;";
		return jdbc.queryForObject(sqlFindStaffById, new Object[]{staffId}, new StaffMapper());
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
}
