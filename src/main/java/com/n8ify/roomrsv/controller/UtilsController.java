package com.n8ify.roomrsv.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.n8ify.roomrsv.dealer.Utilities;
import com.n8ify.roomrsv.model.RoomInform;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class UtilsController {
	private static final Logger logger = LoggerFactory.getLogger(UtilsController.class);

	@Autowired
	@Qualifier("utils")
	private Utilities utils;
	
	/* Inform Reservation's Problem or ANY Problem  */
	@RequestMapping(value = {"/utils/inform"}, method = RequestMethod.POST)
	public String inform(RoomInform roomInform){
		utils.saveInform(roomInform);
		return Attrs.HOME;
	}
}
