package com.n8ify.roomrsv.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.Utilities;
import com.n8ify.roomrsv.model.Staff;

@RestController
public class UtilsRESTController {
	private static final Logger logger = LoggerFactory.getLogger(UtilsRESTController.class);

	@Autowired
	@Qualifier("utils")
	private Utilities utils;
	
	/** \/find **/
	@RequestMapping(value = "/utils/find/staffbyid", method = RequestMethod.POST)
	public Staff findStaffById(@RequestParam(value = "staffId", required = true)String staffId){
		logger.info(staffId);
		return utils.findStaffById(staffId);
	}
}
