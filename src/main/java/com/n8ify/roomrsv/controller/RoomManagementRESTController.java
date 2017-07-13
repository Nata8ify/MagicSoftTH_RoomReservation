package com.n8ify.roomrsv.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.RoomManagement;
import com.n8ify.roomrsv.model.Room;

@RestController
public class RoomManagementRESTController {

	private static final Logger logger = LoggerFactory.getLogger(RoomManagementRESTController.class);
	
	@Autowired
	@Qualifier("roomMng")
	private RoomManagement roomMng;
	
	@RequestMapping(value = {"/adm/findRoom/findAllRooms"}, method = RequestMethod.POST)
	public List<Room> getAllRooms(@RequestParam(value = "available", required = true, defaultValue = "false")boolean available){
		return roomMng.findAll(available);
	}
	
	@RequestMapping(value = "/findRoom/byRoomsName", method = RequestMethod.POST)
	public List<Room> getRoomsByName(@RequestParam(value = "name", required = true, defaultValue = "")String roomName,
			@RequestParam(value = "available", required = true, defaultValue = "false")boolean available){
		return roomMng.findByName(roomName, available);
	}
	
}
