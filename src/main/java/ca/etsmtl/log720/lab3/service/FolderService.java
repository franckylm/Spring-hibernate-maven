package ca.etsmtl.log720.lab3.service;

import java.util.List;

import ca.etsmtl.log720.lab3.domain.Folder;
import ca.etsmtl.log720.lab3.domain.Infraction;

public interface FolderService {
	public Folder getFolderById(int id);
	public Folder getFolderByDriverLicence(String dl);
	public List<Folder> getAllFolders();
	public void addFolder(String fn, String ln, String dl, String cp);
	public void addInfractionToFolder(Infraction inf, Folder dos);
	public void addInfractionToFolder(int inf, int dos);
	public List<Infraction> getInfractionList(int idFolder);
}
