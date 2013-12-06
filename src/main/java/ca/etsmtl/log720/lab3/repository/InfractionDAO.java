package ca.etsmtl.log720.lab3.repository;

import java.util.List;

import ca.etsmtl.log720.lab3.domain.Infraction;

public interface InfractionDAO {
	public Infraction getInfractionById(int id);
	public List<Infraction> getAllInfractions();
	public void addInfraction(int level, String description);
	public void addInfraction(Infraction infraction);
}
