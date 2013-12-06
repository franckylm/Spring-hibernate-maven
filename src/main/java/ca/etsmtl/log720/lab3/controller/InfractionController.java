package ca.etsmtl.log720.lab3.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.service.InfractionService;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/infraction")
public class InfractionController {
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Resource(name="infractionService")
	private InfractionService infractionService;
	
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getInfraction(Model model) {
    	logger.debug("Received request to show all infractions");
    	List<Infraction> infractions = infractionService.getAllInfractions();	
    	reset(model);
    	model.addAttribute("infractions", infractions);
    	return "list-of-infractions";
	}
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showCreationForm(Model model, HttpServletRequest request) {
    	logger.debug("Received request to show add infraction page");
    	reset(model);
    	if (request.isUserInRole("administrateur")){
    		model.addAttribute("authOK",true);
    	}else{
    		model.addAttribute("authOK",false);
    	}
    	return "add-infraction-form";
	}
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addInfraction(@RequestParam("description") String description, @RequestParam("level")  String level, Model model) {
    	logger.debug("Received request to create a new infraction");
    	List<Infraction> infractions;
    	infractionService.addInfraction(new Infraction(Integer.parseInt(level), description));
    	infractions = infractionService.getAllInfractions();	
    	model.addAttribute("infractions", infractions);
    	model.addAttribute("successAdd", true);
    	return "list-of-infractions";
	}
    
    public void reset(Model model){
    	model.addAttribute("successAdd", false);
	}
    
    public String getUserInRoleType(HttpServletRequest request){
    	String userType = "";
    	if (request.isUserInRole("administrateur")){
    		userType = "administrateur";
		}else if(request.isUserInRole("policier")){
			userType = "policier";
		}
    	return userType;
    }
	
}
