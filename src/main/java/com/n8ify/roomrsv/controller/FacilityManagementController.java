package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.n8ify.roomrsv.dealer.FacilityManagement;
import com.n8ify.roomrsv.model.RoomFacilitiy;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class FacilityManagementController {

	private static final Logger logger = LoggerFactory.getLogger(FacilityManagementController.class);

	@Autowired
	@Qualifier("faciliMng")
	private FacilityManagement faciliMng;
	
	@RequestMapping(value = "/adm/addfacili")
	public String roomMngAddFacility(Model model, HttpServletRequest request, RoomFacilitiy roomFacilitiy) {
		if(faciliMng.addFacility(roomFacilitiy)){
			model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.facilimng.toString());
			return Attrs.ADMIN_HOME;
		}
		return "";
	}
	
	@RequestMapping(value = "/adm/updatefacili")
	public String roomMngUpdateFacility(Model model, HttpServletRequest request, RoomFacilitiy roomFacilitiy) {
		logger.info(roomFacilitiy.toString());
		if(faciliMng.updateFacility(roomFacilitiy)){
			model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.facilimng.toString());
			return Attrs.ADMIN_HOME;
		}
		return "";
	}
	
	@RequestMapping(value = "/adm/updatefaciliQuan")
	public String roomMngUpdateQuantityFacility(Model model, HttpServletRequest request,
			@RequestParam(value="facilitiyId")int facilitiyId,
			@RequestParam(value="quantity")int quantity) {
		if(faciliMng.updateFacilityQuantity(facilitiyId, quantity)){
			model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.facilimng.toString());
			return Attrs.ADMIN_HOME;
		}
		return "";
	}
	
	@RequestMapping(value = "/adm/deletefacili")
	public String roomMngDeleteFacility(Model model, HttpServletRequest request, 
			@RequestParam(value="facilityId")int facilitiyId) {
		if(faciliMng.deleteFacility(facilitiyId)){
			model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.facilimng.toString());
			return Attrs.ADMIN_HOME;
		}
		return "";
	}
	
	private void setIncludeFacilityMng(Model model){
		model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.facilimng.toString());
	}
}
