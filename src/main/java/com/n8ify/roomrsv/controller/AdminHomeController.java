package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class AdminHomeController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(AdminHomeController.class);

	private final String ADM_REL_PATH = "/adm/";

	@RequestMapping("/adm/home")
	public String toAdminSignIn(Model model, HttpServletRequest request) {
		return Attrs.ADMIN_SIGNIN;
	}

	@RequestMapping("/adm/admhome")
	public String toAdminHome(Model model, HttpServletRequest request) {
		model.addAttribute(Attrs.getOptionAttr.include.toString(), Attrs.getAdminDestinationAttr.dashboard.toString());
		return Attrs.ADMIN_HOME;
	}

	@RequestMapping(value = "/adm/{admTo}")
	public String toAdminPagePart(Model model, @PathVariable(value = "admTo") Attrs.getAdminDestinationAttr to) {
		model.addAttribute(Attrs.getOptionAttr.include.toString(), to.toString());
		switch (to) {
		case dashboard:
			break;
		case report:
			break;
		case roommng:
			break;
		case facilimng:
			break;
		case setting:
			break;	
		default:
			break;
		}
		return Attrs.ADMIN_HOME;
	}

}
