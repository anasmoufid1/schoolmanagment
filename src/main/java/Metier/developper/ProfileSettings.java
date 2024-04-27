package Metier.developper;

import java.util.ArrayList;

import Data.Developer.Developper;
import Presentation.Models.Competance;
import Presentation.Models.Technologie;

public class ProfileSettings implements ProfileSettingsInterface{
	private Developper db =new Developper();
	public int editPass(int authID,String newPass,String existing,String existingconfirm) {
		if(!newPass.equals(existingconfirm)) {
			return 0;
		}else if(!db.checkPassword(authID, existing)) {
			return 2;
		}else {
			db.editPassword(authID, newPass);
			return 1;	
		}
	}
	public ArrayList<Competance> getDevCompetances(int authID){
		return db.getDevCompetances(authID);
	}
	
	public ArrayList<Technologie> getAllTech(){
		return db.getAllTech();
	}
	public void addCompetance(int devid,String exp,String desc,int techid) {
		Technologie teche= db.getTechnologie(techid);
		Competance comp=new Competance(devid,exp,desc,teche);
		ArrayList<Competance> devcomp=getDevCompetances(devid);
		db.addComp(devid, comp);
	}
	
}
