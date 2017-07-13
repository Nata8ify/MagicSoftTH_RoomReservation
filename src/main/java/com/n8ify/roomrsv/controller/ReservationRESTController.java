package com.n8ify.roomrsv.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.model.RoomFacilitiy;
import com.n8ify.roomrsv.model.RoomFacilitiyUsage;
import com.n8ify.roomrsv.model.RoomUsage;
import com.n8ify.roomrsv.model.Staff;

@RestController
public class ReservationRESTController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ReservationRESTController.class);
	
	@Autowired
	@Qualifier("reserveMng")
	private ReservationManagement rsvMng;
	
	@RequestMapping(value = {"/reservation/all", "/adm/reservation/all"}, method = RequestMethod.POST)
	public List<RoomUsage> getReservationByAll(@RequestParam(value = "isPassInclude", defaultValue = "true")boolean isPassInclude){
		return rsvMng.findAll(isPassInclude);
	}
	
	@RequestMapping(value = {"/reservation/getByDate", "/adm/reservation/getByDate"}, method = RequestMethod.GET)
	public List<RoomUsage> getReservationByDate(@RequestParam(value = "date", defaultValue = "today")Date date){
		logger.info(date.toString());
		return rsvMng.findByDate(date);
	}
	
	@RequestMapping(value = "/reservation/getRsvByRoomId", method = RequestMethod.POST)
	public List<RoomUsage> getReservationByRoomId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId);
	}
	
	@RequestMapping(value = "/reservation/getAllRsvOfUserId", method = RequestMethod.POST)
	public List<RoomUsage> getAllReservationOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
	
	@RequestMapping(value = "/reservation/getCurrentRsvOfUserId", method = RequestMethod.POST)
	public List<RoomUsage> getCurrentReservationOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
	
	@RequestMapping(value = "/reservation/getRsvByStaffId", method = RequestMethod.POST)
	public List<RoomUsage> getCurrentReservationOfUserId(@RequestParam(value = "staffId", required = true)String staffId,
			@RequestParam(value = "pass", required = true)boolean isPassInclude){
		return rsvMng.findAllByStaffId(staffId, isPassInclude);
	}
	
	@RequestMapping(value = {"/reservation/findFacilisUsage", "/adm/reservation/findFacilisUsage"}, method = RequestMethod.POST)
	public List<RoomFacilitiyUsage> getFacilityUsageByUsageId(@RequestParam(value = "usageId", required = true)int usageId){
		return rsvMng.getFaciliUsageMng().findByRoomUsageId(usageId);
	}
	
	@RequestMapping(value = {"/manageReservation/delete","/adm/manageReservation/delete"}, method = RequestMethod.POST)
	public boolean deleteReservationByUsageId(@RequestParam(value = "usageId", required = true)int usageId){
		return rsvMng.cancel(usageId);
	}

	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat df = new SimpleDateFormat("yyyy-Mm-dd");
		CustomDateEditor customDate = new CustomDateEditor(df, true){

			@Override
			public void setAsText(String arg0) throws IllegalArgumentException {
				if("today".equals(arg0)){
					setValue(new Date(System.currentTimeMillis()));
				} else{
					super.setAsText(arg0);
				}
			}
		};
		binder.registerCustomEditor(Date.class, customDate);
	}
}
