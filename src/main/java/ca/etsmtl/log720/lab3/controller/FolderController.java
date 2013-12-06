package ca.etsmtl.log720.lab3.controller;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import ca.etsmtl.log720.lab3.domain.Folder;
import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.service.FolderService;
import ca.etsmtl.log720.lab3.service.InfractionService;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/folder")
public class FolderController {	
	
	protected static Logger logger = Logger.getLogger("controller");
	
	@Resource(name="folderService")
	private FolderService folderService;
	
	@Resource(name="infractionService")
	private InfractionService infractionService;
		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getInfraction(Model model) {
    	logger.debug("Received request to show all folders");
    	List<Folder> folders = folderService.getAllFolders();
    	reset(model);
    	model.addAttribute("folders", folders);
    	return "list-of-folders";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showCreationForm(Model model, HttpServletRequest request) {
    	logger.debug("Received request to show the form to add folder");
    	reset(model);
    	if (request.isUserInRole("administrateur")){
    		model.addAttribute("authOK",true);
    	}else{
    		model.addAttribute("authOK",false);
    	}
    	return "add-folder-form";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addFolder(@RequestParam("firstName") String firstName, 
    						@RequestParam("lastName")  String lastName,
    						@RequestParam("driverLicence")  String driverLicence,
    						@RequestParam("carPlate")  String carPlate,
    						Model model) {
    	logger.debug("Received request to add a new folder");
    	List<Folder> folders;
    	if(isDriverLicenceUnique(driverLicence)){
    		folderService.addFolder(firstName, lastName, driverLicence, carPlate);
    		model.addAttribute("successAdd", true);
    	}else{
    		model.addAttribute("errUnicity", true);
    	}
    	folders = folderService.getAllFolders();	
    	model.addAttribute("folders", folders);
    	return "list-of-folders";
	}
	
	@RequestMapping(value = "/{id}/details", method = RequestMethod.GET)
    public String showFolderDetails(@PathVariable Integer id, Model model, HttpServletRequest request) {
    	logger.debug("Received request to show the content of a folder");
    	List<Infraction> infractions = infractionService.getAllInfractions();
    	Folder folder = folderService.getFolderById(id);
    	if (request.isUserInRole("policier")){
    		model.addAttribute("newInfractionFolder", true);
    	}else{
    		model.addAttribute("newInfractionFolder", false);
    	}
    	setModelFolderDetail(model, folder, infractions);
    	return "folder-details";
	}
	
	
	@RequestMapping(value = "/{idFolder}/addinfractions", method = RequestMethod.POST)
    public String insertInfraction(@PathVariable Integer idFolder, Model model, HttpServletRequest request) {
    	logger.debug("Received request to insert an infraction into a folder");
    	Hashtable<String, String[]> tmp = new Hashtable<String, String[]>(request.getParameterMap());
		Enumeration<String> enumKey = tmp.keys();
		while(enumKey.hasMoreElements()) {
			String keyString = enumKey.nextElement();
			int keyInt = Integer.parseInt(keyString);
			folderService.addInfractionToFolder(keyInt, idFolder);
		}
		List<Infraction> infractions = infractionService.getAllInfractions();
    	Folder folder = folderService.getFolderById(idFolder);
    	setModelFolderDetail(model, folder, infractions);
    	model.addAttribute("successAddInf", true);
    	return "folder-details";
	}
	
	public void setModelFolderDetail(Model model, Folder folder, List<Infraction> infractions){
		model.addAttribute("folder", folder);
    	model.addAttribute("infractions", infractions);
    	model.addAttribute("infractionList", folder.getInfractions());
	}
	
	public void reset(Model model){
    	model.addAttribute("successAdd", false);
    	model.addAttribute("errUnicity", false);
    	model.addAttribute("successAddInf", false);
	}
	
	public boolean isDriverLicenceUnique(String dl){
		 boolean btr = false;
		 Folder dos = folderService.getFolderByDriverLicence(dl);
		 if(dos == null)
			 btr = true;
		 return btr;
	 }
	
	

	
}
