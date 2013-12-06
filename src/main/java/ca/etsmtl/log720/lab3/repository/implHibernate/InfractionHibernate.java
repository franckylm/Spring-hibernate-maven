package ca.etsmtl.log720.lab3.repository.implHibernate;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ca.etsmtl.log720.lab3.domain.Infraction;
import ca.etsmtl.log720.lab3.repository.InfractionDAO;

@Repository("infractionDAO")
public class InfractionHibernate implements InfractionDAO{
	
	protected static Logger logger = Logger.getLogger("dao");
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	
	@Transactional
	public Infraction getInfractionById(int id) {
		Infraction inf = null;
		Session session = sessionFactory.getCurrentSession();
		inf = (Infraction) session.get(Infraction.class, id);
		return inf;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Infraction> getAllInfractions() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM  Infraction");
		return query.list();
	}
	
	@Transactional
	public void addInfraction(int level, String description) {
		Infraction inf = new Infraction(level, description);
		Session session = sessionFactory.getCurrentSession();
		session.save(inf);
	}
	
	@Transactional
	public void addInfraction(Infraction infraction) {
		Session session = sessionFactory.getCurrentSession();
		session.save(infraction);
	}

}
