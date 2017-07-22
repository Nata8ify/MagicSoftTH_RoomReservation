package com.n8ify.roomrsv.controller;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.n8ify.roomrsv.config.Configuration;
import com.n8ify.roomrsv.excp.UnauthorizedAccessException;

@ControllerAdvice
public class ApplicationAdviceController {
	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(ApplicationAdviceController.class);
	
	@ExceptionHandler({UnauthorizedAccessException.class, NullPointerException.class})
	public ModelAndView caugthException(UnauthorizedAccessException uaexp, NullPointerException nexp){
		return new ModelAndView("result/error_unauthorize");
	}
}
