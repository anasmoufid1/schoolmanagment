package Metier.ProjetMetier;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Presentation.Models.*;
import Data.Projet.*;

public class ProjetMetiers implements ProjetMetiersInterface{
	
	public static ResultSet getProjectsMetiers()
	{
		ResultSet getproj = null;
		getproj = ProjetData.getProjectsData();
		
		return getproj;
		
	}
	public static List<personne> getPersonsFromClientIDs()
	{
		List<personne> personnes = new ArrayList<>();
		personnes = ProjetData.getPersonsFromClientIDs();
		
		return personnes;
	}
	 public  int getNumberOfProjectsMetier()
	 {
		 ProjetData prjd = new ProjetData();
		 
		 int nbr = prjd.getNumberOfProjects();
		 return nbr;
	 }
	
	 public static boolean deleteProjetMetiers(int id)
	 {
		 boolean deleted = ProjetData.deleteProjetData(id);
		 return deleted;
	 }
	 
	 
	 public static ProjetModel getProjetFromIdMetier(int id)
	 {
		 ProjetModel rs = ProjetData.getProjetFromId(id);
		 return rs;
	 }
	 
	 
	 
	 
	 
	 
}
