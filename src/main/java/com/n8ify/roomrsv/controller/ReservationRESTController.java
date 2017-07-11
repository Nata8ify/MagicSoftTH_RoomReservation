package com.n8ify.roomrsv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.model.RoomUsage;

@RestController
public class ReservationRESTController {

	
	@Autowired
	@Qualifier("reserveMng")
	private ReservationManagement rsvMng;
	
	@RequestMapping(value = "/reservation/getAll", method = RequestMethod.POST)
	public List<RoomUsage> getRsvByAll(){
		return rsvMng.findAll();
	}
	
	@RequestMapping(value = "/reservation/getRsvByRoomId", method = RequestMethod.POST)
	public List<RoomUsage> getRsvByRoomId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId);
	}
	
	@RequestMapping(value = "/reservation/getAllRsvOfUserId", method = RequestMethod.POST)
	public List<RoomUsage> getAllRsvOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
	
	@RequestMapping(value = "/reservation/getCurrentRsvOfUserId", method = RequestMethod.POST)
	public List<RoomUsage> getCurrentRsvOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
	
	@RequestMapping(value = "/reservation/getRsvByStaffId", method = RequestMethod.POST)
	public List<RoomUsage> getCurrentRsvOfUserId(@RequestParam(value = "staffId", required = true)String staffId,
			@RequestParam(value = "pass", required = true)boolean isPassInclude){
		return rsvMng.findAllByStaffId(staffId, isPassInclude);
	}
	
	@RequestMapping(value = "/manageReservation/delete", method = RequestMethod.POST)
	public boolean deleteRsvByUsageId(@RequestParam(value = "usageId", required = true)int usageId){
		return rsvMng.cancel(usageId);
	}
}
