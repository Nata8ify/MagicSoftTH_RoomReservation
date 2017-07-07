package com.n8ify.roomrsv.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.n8ify.roomrsv.config.Configuration;
import com.n8ify.roomrsv.dealer.ReservationManagement;
import com.n8ify.roomrsv.model.RoomFacilitiyUsage;
import com.n8ify.roomrsv.model.RoomUsage;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class ReservationController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationManagement rsvMng;

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(Model model, HttpServletRequest request,RoomUsage roomUsage, Map<Integer, Integer> mapFacilities) {
		// rsvMng.reserve(roomUsage);
		logger.info(roomUsage.toString());
		if(roomUsage != null){
			rsvMng.reserve(roomUsage);
		}
/*		if(mapFacilities != null)
		for (Map.Entry<Integer, Integer> faciliEntry : mapFacilities.entrySet()) {
			logger.info(new RoomFacilitiyUsage(roomUsage.getUsageId(), faciliEntry.getKey(), faciliEntry.getValue())
					.toString());
			// rsvMng.getFaciliUsageMng().reserve(new
			// RoomFacilitiyUsage(roomUsage.getUsageId(), faciliEntry.getKey() ,
			// faciliEntry.getValue()));}

		}*/
		return Attrs.HOME;
	}
}
