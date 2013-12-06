package ca.etsmtl.log720.lab3.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ca.etsmtl.log720.lab3.domain.Folder;
import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.repository.FolderDAO;
import ca.etsmtl.log720.lab3.service.FolderService;

@Service("folderService")
public class FolderServiceImpl implements FolderService{
	
	protected static Logger logger = Logger.getLogger("service");
	
	@Resource(name="folderDAO")
	private FolderDAO folderDAO;
	
	public Folder getFolderById(int id) {
		return folderDAO.getFolderById(id);
	}

	public Folder getFolderByDriverLicence(String dl) {
		return folderDAO.getFolderByDriverLicence(dl);
	}

	public List<Folder> getAllFolders() {
		return folderDAO.getAllFolders();
	}

	public void addFolder(String fn, String ln, String dl, String cp) {
		folderDAO.addFolder(fn, ln, dl, cp);
	}

	public void addInfractionToFolder(Infraction inf, Folder dos) {
		folderDAO.addInfractionToFolder(inf, dos);
	}

	public void addInfractionToFolder(int inf, int dos) {
		folderDAO.addInfractionToFolder(inf, dos);
	}

	public List<Infraction> getInfractionList(int idFolder) {
		return folderDAO.getInfractionList(idFolder);
	}

}
