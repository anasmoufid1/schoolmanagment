package Metier.ProjetMetier;

import java.util.ArrayList;


import Data.Projet.ProjetData;
import Presentation.Models.ProjetModel;
import Presentation.Models.Service;
public class DevelopperProjectsManager implements DevelopperProjectsManagerInterface{
	private ProjetData db=new ProjetData();
	
	public ArrayList<ProjetModel> getDeveloperProjects(int authID) {
		return db.getDeveloperProjects(authID);
	}
	public ArrayList<Service> getdevprojectServices(int prID,int authID){
		return db.getDevProjectServices(prID,authID);
	}
	public void updatepercentage(int taskid,int percentage) {
		db.updatepercentage(taskid,percentage);
	}

	
}
