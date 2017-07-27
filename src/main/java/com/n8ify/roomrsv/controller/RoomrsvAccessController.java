package com.n8ify.roomrsv.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.roomrsv.dealer.FacilityManagement;
import com.n8ify.roomrsv.dealer.RoomrsvAccess;
import com.n8ify.roomrsv.excp.UnauthorizedAccessException;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.model.StaffAccess;
import com.n8ify.roomrsv.utils.Attrs;

@Controller
public class RoomrsvAccessController {

	@Autowired
	@Qualifier("roomrsvAccess")
	private RoomrsvAccess rsvAccess;

	@Autowired
	@Qualifier("faciliMng")
	private FacilityManagement facilityMng;
	
	private static final Logger logger = LoggerFactory.getLogger(RoomrsvAccessController.class);

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "password", required = true) String password) {
		Staff.setStaffInstance(rsvAccess.login(staffId, password));
		if (Staff.getStaffInstance() != null) {
			request.getSession(false).setMaxInactiveInterval(60 * 60 * 8);
			request.getSession(false).setAttribute("thisStaff", Staff.getStaffInstance());
			request.getSession(false).setAttribute("thisAccess", StaffAccess.getAccessInstance());
		} else {
			model.addAttribute("loginMsg", "Incorrect Staff ID or Password");
			return "home";
		}
		/*model.addAttribute("dump", Staff.getStaffInstance());*/
		return Attrs.HOME;
	}

	@RequestMapping(value = "/adm/login", method = RequestMethod.POST)
	public String adminLogin(Model model, HttpServletRequest request,
			@RequestParam(value = "staffId", required = true) String staffId,
			@RequestParam(value = "password", required = true) String password) throws UnauthorizedAccessException {
		
		//Session Purge
		
		if (!rsvAccess.isRoomReservationAdmin(staffId)) {
			model.addAttribute("loginMsg", "Invalid Administrator's Staff ID");
			return Attrs.ADMIN_SIGNIN;
		}
		Staff.setStaffInstance(rsvAccess.login(staffId, password));
		if (Staff.getStaffInstance() != null && StaffAccess.getAccessInstance() != null) {
			if(StaffAccess.getAccessInstance().getRoomrsvRole() != null){
			request.getSession(false).setMaxInactiveInterval(60 * 60 * 8);
			request.getSession(false).setAttribute("thisStaff", Staff.getStaffInstance());
			request.getSession(false).setAttribute("thisAccess", StaffAccess.getAccessInstance());
			return "redirect:/"+Attrs.ADMIN_HOME;
			} else {
				throw new UnauthorizedAccessException();
			}
		} else {
			model.addAttribute("loginMsg", "Incorrect Administrator's Staff ID or Password");
		}
		model.addAttribute("dump", Staff.getStaffInstance());
		return Attrs.ADMIN_SIGNIN;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("thisStaff")!=null){session.invalidate();}
		return Attrs.HOME;
	}
	
	@RequestMapping("/adm/logout")
	public String adminLogout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("thisStaff")!=null){session.invalidate();}
		return Attrs.ADMIN_SIGNIN;
	}

}
