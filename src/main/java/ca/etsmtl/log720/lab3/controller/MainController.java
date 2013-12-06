package ca.etsmtl.log720.lab3.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@SuppressWarnings("unused")
@Controller
@RequestMapping("/")
public class MainController {

	protected static Logger logger = Logger.getLogger("controller");
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
    public String homePage(Model model) {
    	logger.debug("Received request to show the home page");
    	return "home";
	}
	
	@RequestMapping(value = "/home/disconnected", method = RequestMethod.GET)
    public String homePage(Model model, HttpServletRequest request) {
    	logger.debug("Received request to show the home page");
    	request.getSession().invalidate();
    	return "home";
	}
	
	@RequestMapping(value = "/home/connected", method = RequestMethod.GET)
    public String showSigninForm() {
    	logger.debug("Received request to show the signin page");
    	return "success-auth";
	}
    
}
