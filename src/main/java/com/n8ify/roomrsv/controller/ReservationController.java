package com.n8ify.roomrsv.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserve(Model model, HttpServletRequest request, RoomUsage roomUsage, @RequestParam Map<String, String> params) {
		// rsvMng.reserve(roomUsage);
		if(roomUsage != null){
			int latestUsageId = rsvMng.reserve(roomUsage);
			for(Map.Entry<String, String> param : params.entrySet()){
				if(param.getKey().contains("facilis$")){
					if(!param.getValue().isEmpty()){
						logger.info(param.getValue() +":::"+param.getValue().equalsIgnoreCase("0"));
					rsvMng.getFaciliUsageMng().reserve(new RoomFacilitiyUsage(latestUsageId
							, Integer.valueOf(param.getKey().substring(param.getKey().indexOf("$")+1))
							, Integer.valueOf(param.getValue())));
					}
				}
			}
		}
		
		return Attrs.HOME;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, HttpServletRequest request,RoomUsage roomUsage, @RequestParam Map<String, String> params) {
		logger.info(roomUsage.toString());
		if(roomUsage != null){
			rsvMng.modify(roomUsage);
			rsvMng.getFaciliUsageMng().cancelByUsage(roomUsage.getUsageId());
			for(Map.Entry<String, String> param : params.entrySet()){
				if(param.getKey().contains("facilis$")){
					if(!param.getValue().isEmpty()){
					rsvMng.getFaciliUsageMng().reserve(new RoomFacilitiyUsage(roomUsage.getUsageId()
							, Integer.valueOf(param.getKey().substring(param.getKey().indexOf("$")+1))
							, Integer.valueOf(param.getValue())));
					}
				}
			}
		}
		
		return Attrs.HOME;
	}
}
