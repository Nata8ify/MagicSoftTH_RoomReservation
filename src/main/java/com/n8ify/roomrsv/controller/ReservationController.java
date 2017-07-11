package com.n8ify.roomrsv.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.model.RoomFacilitiyUsage;
import com.n8ify.roomrsv.model.RoomUsage;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class ReservationController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationManagement rsvMng;

	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String reserve(Model model, HttpServletRequest request,RoomUsage roomUsage) {
		// rsvMng.reserve(roomUsage);
		logger.info(roomUsage.toString());
		if(roomUsage != null){
			rsvMng.reserve(roomUsage);
		}
		
		return Attrs.HOME;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, HttpServletRequest request,RoomUsage roomUsage, Map<Integer, Integer> mapFacilities) {
		logger.info(roomUsage.toString());
		if(roomUsage != null){
			rsvMng.modify(roomUsage);
		}
		
		return Attrs.HOME;
	}
}
