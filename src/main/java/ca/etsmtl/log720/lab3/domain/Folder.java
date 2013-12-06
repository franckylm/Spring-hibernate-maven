package ca.etsmtl.log720.lab3.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="dossier")
public class Folder implements Serializable{
	
	private static final long serialVersionUID = -8660287626813850107L;
	
	@Id
	@Column(name="id_dossier")
	@GeneratedValue
	private int id;
	
	@Column(name="prenom")
	private String firstName;
	
	@Column(name="nom")
	private String lastName;
	
	@Column(name="nopermis")
	private String driverLicenceNumber;
	
	@Column(name="noplaque")
	private String carPlateNumber;
	
	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "dossier_infraction", joinColumns = { @JoinColumn(name = "id_dossier") }, inverseJoinColumns = { @JoinColumn(name = "id_infraction") })
	private List<Infraction> infractions;
	
	public Folder(){
		super();
	}
	
	public Folder(String firstName, String lastName, String licence, String carPlate){
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.driverLicenceNumber = licence;
		this.carPlateNumber = carPlate;
		this.infractions = null;
	}
	
	public Folder(int id, String firstName, String lastName, String licence, String carPlate){
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.driverLicenceNumber = licence;
		this.carPlateNumber = carPlate;
		this.infractions = null;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDriverLicenceNumber() {
		return driverLicenceNumber;
	}

	public void setDriverLicenceNumber(String driverLicenceNumber) {
		this.driverLicenceNumber = driverLicenceNumber;
	}

	public String getCarPlateNumber() {
		return carPlateNumber;
	}

	public void setCarPlateNumber(String carPlateNumber) {
		this.carPlateNumber = carPlateNumber;
	}
	
	public List<Infraction> getInfractions() {
		return infractions;
	}

	public void setInfractions(List<Infraction> infractions) {
		this.infractions = infractions;
	}
	
	public void addInfraction(Infraction inf){
		this.infractions.add(inf);
	}

}
