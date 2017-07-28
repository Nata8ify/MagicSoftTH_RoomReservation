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

import com.n8ify.roomrsv.dealer.Utilities;
import com.n8ify.roomrsv.model.RoomInform;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.model.extra.ServiceContract;
import com.n8ify.roomrsv.utils.Attrs;

@RestController
public class UtilsRESTController {
	private static final Logger logger = LoggerFactory.getLogger(UtilsRESTController.class);

	@Autowired
	@Qualifier("utils")
	private Utilities utils;
	
	/** \/find **/
	@RequestMapping(value = {"/utils/find/staff", "/adm/utils/find/staff"}, method = RequestMethod.POST)
	public Staff findStaffById(@RequestParam(value = "staffId", required = true)String staffId){
		logger.info(staffId);
		return utils.findStaffById(staffId);
	}
	
	@RequestMapping(value = {"/utils/find/allStaffs", "/adm/utils/find/allStaffs"}, method = RequestMethod.POST)
	public List<Staff> findAllStaff(){
		return utils.findAllStaff();
	}
	
	/* Inform REST Section */
	@RequestMapping(value = {"/adm/utils/find/informs"}, method = RequestMethod.POST)
	public List<RoomInform> findAllInforms(){
		return utils.getTotalInforms();
	}
	
	@RequestMapping(value = {"/adm/utils/delete/inform"}, method = RequestMethod.POST)
	public boolean deleteInform(@RequestParam(value = "informId", required = true)int informId){
		return utils.dismissInform(informId);
	}
	
	@RequestMapping(value = {"/adm/utils/delete/all"}, method = RequestMethod.POST)
	public boolean deleteAll(){
		return utils.truncateInforms();
	}
	
	/* Setting REST Section */	
	
	@RequestMapping(value = {"/adm/utils/setting/role"}, method = RequestMethod.POST)
	public boolean assignSystemRole(@RequestParam(value = "staffId", required = true)String staffId, @RequestParam(value = "option", required = true)String option){
		if(option.equals("g")){return utils.updateAdministratorRole(staffId, Attrs.ROLE_ADMIN);}
		if(option.equals("r")){return utils.updateAdministratorRole(staffId, Attrs.ROLE_NO);}
		return false;
	}
	
	/* Service Contract Section */
	@Autowired
	@Qualifier("servContract")
	private ServiceContract contract;
	@RequestMapping(value = {"/adm/utils/setting/contract/update"}, method = RequestMethod.POST)
	public ServiceContract setServiceContract$(ServiceContract serviceContract){
		contract.setLocation(serviceContract.getLocation());
		contract.setOfficerTel(serviceContract.getOfficerTel());
		contract.setEmail(serviceContract.getEmail());
		return contract;
	}
}
