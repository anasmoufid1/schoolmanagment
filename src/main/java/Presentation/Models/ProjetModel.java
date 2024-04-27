package Presentation.Models;

import java.util.ArrayList;

public class ProjetModel {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String Date_Demarrage;
	private String Date_livraison;
	private String Date_Reunion;
	private String Description;
	private int Nbr_Jour_Developpement;
	private String Nom;
	private int Chef_projetID ;
	private int ClientID;
	private int MethodologieID;
	private ArrayList<Service> services=new ArrayList<Service>();
	public String getDate_Demarrage() {
		return Date_Demarrage;
	}
	public void setDate_Demarrage(String date_Demarrage) {
		Date_Demarrage = date_Demarrage;
	}
	public String getDate_livraison() {
		return Date_livraison;
	}
	public void setDate_livraison(String date_livraison) {
		Date_livraison = date_livraison;
	}
	public String getDate_Reunion() {
		return Date_Reunion;
	}
	public void setDate_Reunion(String date_Reunion) {
		Date_Reunion = date_Reunion;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getNbr_Jour_Developpement() {
		return Nbr_Jour_Developpement;
	}
	public void setNbr_Jour_Developpement(int nbr_Jour_Developpement) {
		Nbr_Jour_Developpement = nbr_Jour_Developpement;
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public int getChef_projetID() {
		return Chef_projetID;
	}
	public void setChef_projetID(int chef_projetID) {
		Chef_projetID = chef_projetID;
	}
	public int getClientID() {
		return ClientID;
	}
	public void setClientID(int clientID) {
		ClientID = clientID;
	}
	public int getMethodologieID() {
		return MethodologieID;
	}
	public void setMethodologieID(int methodologieID) {
		MethodologieID = methodologieID;
	}
	public ProjetModel() {
		super();
	}
	public ArrayList<Service> getServices() {
		return services;
	}
	public void setServices(ArrayList<Service> services) {
		this.services = services;
	}
	
	public ProjetModel(int id,String date_Demarrage, String date_livraison, String date_Reunion, String description,
			int nbr_Jour_Developpement, String nom, int chef_projetID, int clientID, int methodologieID,ArrayList<Service> serv) {
		super();
		Date_Demarrage = date_Demarrage;
		Date_livraison = date_livraison;
		Date_Reunion = date_Reunion;
		Description = description;
		Nbr_Jour_Developpement = nbr_Jour_Developpement;
		Nom = nom;
		Chef_projetID = chef_projetID;
		ClientID = clientID;
		MethodologieID = methodologieID;
		this.id=id;
		this.services=serv;
	}

	
	
	
	
}
