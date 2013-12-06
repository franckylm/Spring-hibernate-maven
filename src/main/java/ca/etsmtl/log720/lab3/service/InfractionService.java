package ca.etsmtl.log720.lab3.service;

import java.util.List;

import ca.etsmtl.log720.lab3.domain.Infraction;

public interface InfractionService {
	public Infraction getInfractionById(int id);
	public List<Infraction> getAllInfractions();
	public void addInfraction(int level, String description);
	public void addInfraction(Infraction infraction);
}
