package com.n8ify.roomrsv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.model.RoomUsage;

@RestController
public class ReservationRESTController {

	@Autowired
	@Qualifier("reserveMng")
	private ReservationManagement rsvMng;
	
	@RequestMapping(value = "/findReservation/getAll")
	public List<RoomUsage> getRsvByAll(){
		return rsvMng.findAll();
	}
	
	@RequestMapping(value = "/findReservation/getRsvByRoomId")
	public List<RoomUsage> getRsvByRoomId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId);
	}
	
	@RequestMapping(value = "/findReservation/getAllRsvOfUserId")
	public List<RoomUsage> getAllRsvOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
	
	@RequestMapping(value = "/findReservation/getCurrentRsvOfUserId")
	public List<RoomUsage> getCurrentRsvOfUserId(@RequestParam(value = "roomId", required = true)int roomId){
		return rsvMng.findByRoomId(roomId); //X
	}
}
