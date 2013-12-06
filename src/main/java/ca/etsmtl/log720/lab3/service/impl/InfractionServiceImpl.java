package ca.etsmtl.log720.lab3.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.repository.InfractionDAO;
import ca.etsmtl.log720.lab3.service.InfractionService;

import org.springframework.stereotype.Service;

@Service("infractionService")
public class InfractionServiceImpl implements InfractionService{
	
	@Resource(name="infractionDAO")
	private InfractionDAO infractionDAO;
	
	protected static Logger logger = Logger.getLogger("service");
	
	public Infraction getInfractionById(int id) {
		return infractionDAO.getInfractionById(id);
	}

	public List<Infraction> getAllInfractions() {
		logger.debug("Retrieving all the infractions");
		return  infractionDAO.getAllInfractions();
	}

	public void addInfraction(int level, String description) {
		logger.debug("Adding an new infraction");
		infractionDAO.addInfraction(level, description);
		
	}

	public void addInfraction(Infraction infraction) {
		logger.debug("Adding a new infraction");
		infractionDAO.addInfraction(infraction);
		
	}
	
	
}
