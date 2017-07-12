package com.n8ify.roomrsv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.FacilityManagement;
import com.n8ify.roomrsv.model.RoomFacilitiy;

@RestController
public class FacilityManagementRESTController {

	@Autowired
	@Qualifier("faciliMng")
	private FacilityManagement faciliMng;
	
	@RequestMapping(value = {"/adm/facility/findAll", "/facility/findAll"}, method = RequestMethod.POST)
	public List<RoomFacilitiy> getAllFacilities(){
		return faciliMng.findAll();
	}
}
