package com.n8ify.roomrsv.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.roomrsv.excp.UnauthorizedAccessException;
import com.n8ify.roomrsv.model.Staff;
import com.n8ify.roomrsv.model.StaffAccess;
import com.n8ify.roomrsv.utils.Attrs;

@Aspect 
public class AccessControl {
	private static final Logger logger = LoggerFactory.getLogger(AccessControl.class);
	
	@Pointcut("execution(* com.n8ify.roomrsv.controller.*.*$(..)) && args (request,..)")
	public void adminAccessPoint(HttpServletRequest request){}
	
	@Before("adminAccessPoint(request)")
	public void isAdministratorAccessForPanel(HttpServletRequest request) throws UnauthorizedAccessException{
		
		if(request.getSession(false) != null){
			StaffAccess thisStaffAccess = (StaffAccess)(request.getSession(false).getAttribute("thisAccess"));
			if(thisStaffAccess.getRoomrsvRole().equals(Attrs.ROLE_ADMIN)){
				return;
			}
		}
			throw new UnauthorizedAccessException();
	}
	
	
	@AfterThrowing(pointcut = "adminAccessPoint(request)", throwing = "exp")
	public void aException(HttpServletRequest request, Exception exp){
		logger.info("ECEPTION : "+exp.toString());
	}
	
}
