package com.n8ify.roomrsv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.RoomManagement;
import com.n8ify.roomrsv.model.Room;

@RestController
public class RoomManagementRESTController {

	private static final Logger logger = LoggerFactory.getLogger(RoomManagementRESTController.class);
	
	@Autowired
	@Qualifier("roomMng")
	private RoomManagement roomMng;
	
	@RequestMapping(value = "/adm/findAll", method = RequestMethod.GET)
	public List<Room> roomMngAddRoom(){
		return roomMng.findAll();
	}
}
