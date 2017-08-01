package com.n8ify.roomrsv.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.roomrsv.excp.UnauthorizedAccessException;

@ControllerAdvice
public class ApplicationAdviceController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ApplicationAdviceController.class);
	
	@ExceptionHandler(value={UnauthorizedAccessException.class})
	public ModelAndView caughtAccessException(UnauthorizedAccessException uaexp){
		return new ModelAndView("result/error_unauthorize");
	}
	
	@ExceptionHandler(value={DuplicateKeyException.class})
	public ModelAndView caughtDuplicateKeyException(DuplicateKeyException uaexp){
		return new ModelAndView("result/error_roomduplicated");
	}
	
	@ExceptionHandler(value={SQLException.class})
	public ModelAndView caughtSQLException(SQLException sqlexp){
		return new ModelAndView("result/error_dataaccess");
	}
	
	@ExceptionHandler(value={com.mysql.jdbc.exceptions.jdbc4.CommunicationsException.class})
	public ModelAndView caughtCommunicationsException(com.mysql.jdbc.exceptions.jdbc4.CommunicationsException ccexp){
		return new ModelAndView("result/error_dataaccess");
	}
	
	@ExceptionHandler(value={NullPointerException.class})
	public ModelAndView caughtNullPointerException(NullPointerException npexp){
		return new ModelAndView("result/error_dataaccess");
	}
	
	/*@ExceptionHandler(value={Exception.class})
	public ModelAndView caughtUnknownException(Exception uaexp){
		logger.info(uaexp.getMessage());
		return new ModelAndView("result/error");
	}*/
}
