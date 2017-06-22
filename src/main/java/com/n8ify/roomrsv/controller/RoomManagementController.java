package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n8ify.roomrsv.dealer.RoomManagement;
import com.n8ify.roomrsv.model.Room;

@Controller
public class RoomManagementController {

	private static final Logger logger = LoggerFactory.getLogger(RoomManagementController.class);
	
	@Autowired
	@Qualifier("roomMng")
	private RoomManagement roomMng;
	
	@RequestMapping(value = "/adm/addroom")
	public String roomMngAddRoom(Model model, HttpServletRequest request,
			@ModelAttribute("addRoom")Room room){
		logger.info(room.toString());
		roomMng.addRoom(room);
		return "home";
	}
}
