package ca.etsmtl.log720.lab3.repository.implHibernate;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ca.etsmtl.log720.lab3.domain.Folder;
import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.repository.FolderDAO;

@Repository("folderDAO")
public class FolderHibernate implements FolderDAO{
	
	protected static Logger logger = Logger.getLogger("dao");
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Transactional
	public Folder getFolderById(int id) {
		Folder fold = null;
		Session session = sessionFactory.getCurrentSession();
		fold = (Folder) session.get(Folder.class, id);
		return fold;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public Folder getFolderByDriverLicence(String dl) {
		Folder fold = null;
		List<Folder> tmpList = new ArrayList<Folder>();
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Folder where nopermis = '"+dl+"'");
		tmpList = q.list();
		if(!tmpList.isEmpty() && tmpList != null)
			fold = tmpList.get(0);
		return fold;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Folder> getAllFolders() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from  Folder");
		return query.list();
	}
	
	@Transactional
	public void addFolder(String fn, String ln, String dl, String cp) {
		Folder dos = new Folder(fn,ln,dl,cp);
		Session session = sessionFactory.getCurrentSession();
		session.save(dos);
	}
	
	@Transactional
	public void addInfractionToFolder(Infraction inf, Folder dos) {
		Session session = sessionFactory.getCurrentSession();
		dos.addInfraction(inf);
		session.save(dos);
	}
	
	@Transactional
	public void addInfractionToFolder(int inf, int dos) {
		Session session = sessionFactory.getCurrentSession();
		Folder folder = this.getFolderById(dos);
		Infraction infraction = (Infraction) session.get(Infraction.class, inf);
		folder.addInfraction(infraction);
		session.save(folder);
	}
	
	@Transactional
	public List<Infraction> getInfractionList(int idFolder) {
		Session session = sessionFactory.getCurrentSession();
		Folder dos = (Folder) session.get(Folder.class, idFolder);
		return dos.getInfractions();
	}

}
