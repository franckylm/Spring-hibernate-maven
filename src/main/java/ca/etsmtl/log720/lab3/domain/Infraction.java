package ca.etsmtl.log720.lab3.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="infraction")
public class Infraction implements Serializable{
	
	private static final long serialVersionUID = 1418281007031807097L;

	@Id
	@Column(name="id_infraction")
	@GeneratedValue
	private int id;
	
	@Column(name="niveau")
	private int level;
	
	@Column(name="description")
	private String description;
	
	public Infraction(){
		super();
	}
	
	public Infraction(int id, int level, String description){
		super();
		this.id = id;
		this.level = level;
		this.description = description;
	}
	
	public Infraction(int level, String description){
		super();
		this.level = level;
		this.description = description;
	}
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getLevel(){
		return this.level;
	}
	
	public void setLevel(int level){
		this.level = level;
	}
	
	public String getDescription(){
		return this.description;
	}
	
	public void setDescription(String desc){
		this.description = desc;
	}

}
