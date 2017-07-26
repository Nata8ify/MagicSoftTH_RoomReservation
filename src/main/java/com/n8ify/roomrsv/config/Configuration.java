package com.n8ify.roomrsv.config;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import com.n8ify.roomrsv.dealer.FacilityManagement;
import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.dealer.RoomManagement;
import com.n8ify.roomrsv.dealer.RoomrsvAccess;
import com.n8ify.roomrsv.dealer.Utilities;

@org.springframework.context.annotation.Configuration
@PropertySource("classpath:properties.properties")
public class Configuration {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(Configuration.class);
	
	@Autowired
	Environment env;

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("datasource.driver"));
		dataSource.setUrl(env.getProperty("datasource.url"));
		dataSource.setUsername(env.getProperty("datasource.username"));
		dataSource.setPassword(env.getProperty("datasource.password"));
		return dataSource;
	}
	
	@Bean(name = "roomrsvAccess")
	public RoomrsvAccess roomrsvAccess(){
		return new RoomrsvAccess(dataSource());
	}
	
	@Bean(name = "roomMng")
	public RoomManagement roomMng(){
		return new RoomManagement(dataSource());
	}
	
	@Bean(name = "faciliMng")
	public FacilityManagement facilityMng(){
		return new FacilityManagement(dataSource());
	}
	
	@Bean(name = "reserveMng")
	public ReservationManagement reservationMng(){
		return new ReservationManagement(dataSource());
		
	}
	
	@Bean(name = "utils")
	public Utilities utils(){
		return new Utilities(dataSource());
	}
	
}
