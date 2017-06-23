package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.roomrsv.dealer.RoomManagement;
import com.n8ify.roomrsv.excp.PrimaryIdNotFoundException;
import com.n8ify.roomrsv.model.Room;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class RoomManagementController {

	private static final Logger logger = LoggerFactory.getLogger(RoomManagementController.class);

	private final String ADM_HOME = "adm/admhome";

	@Autowired
	@Qualifier("roomMng")
	private RoomManagement roomMng;

	@RequestMapping(value = "/adm/addroom", method = RequestMethod.POST)
	public String roomMngAddRoom(Model model, HttpServletRequest request, Room room) {
		logger.info(room.toString());
		if (roomMng.addRoom(room)) {
			model.addAttribute(Attrs.getOptionAttr.include.toString(),
					Attrs.getAdminDestinationAttr.roommng.toString());
			return ADM_HOME;
		}
		return "";
	}

	@RequestMapping(value = "/adm/updateroom", method = RequestMethod.POST)
	public String roomMngUpdateRoom(Model model, HttpServletRequest request, Room room) {
		logger.info(room.toString() + "");
		if (roomMng.updateRoom(room)) {
			model.addAttribute(Attrs.getOptionAttr.include.toString(),
					Attrs.getAdminDestinationAttr.roommng.toString());
			return ADM_HOME;
		}
		return "";
	}

	@RequestMapping(value = "/adm/deleteroom", method = RequestMethod.POST)
	public String roomMngDeleteRoom(Model model, HttpServletRequest request,
			@RequestParam(value = "roomId", required = true) int roomId) throws PrimaryIdNotFoundException {
		if (roomMng.deleteRoom(roomId)) {
			model.addAttribute(Attrs.getOptionAttr.include.toString(),
					Attrs.getAdminDestinationAttr.roommng.toString());
			return ADM_HOME;
		}
		throw new PrimaryIdNotFoundException();
	}
}
