package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.roomrsv.model.Room;

@Controller
public class AdminHomeController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(AdminHomeController.class);

	private final String ADM_REL_PATH = "/adm/";
	private final String ADM_HOME = "/adm/admhome";

	private enum enumAttr {
		to, include, formObj
	};

	private enum enumTo {
		dashboard, report, roommng, facilimng
	};

	@RequestMapping("/adm/admhome")
	public String admhome(Model model, HttpServletRequest request) {
		model.addAttribute(enumAttr.include.toString(), enumTo.dashboard.toString());
		return ADM_HOME;
	}

	@RequestMapping(value = "/adm/{admTo}")
	public String toAdminPagePart(Model model, @PathVariable(value = "admTo") enumTo to) {
		model.addAttribute(enumAttr.include.toString(), to.toString());
		switch (to) {
		case dashboard:

			break;
		case report:

			break;
		case roommng:
			model.addAttribute(enumAttr.formObj.toString(), new Room());
			break;
		case facilimng:

			break;
		default:
			break;
		}
		return ADM_HOME;
	}

}
