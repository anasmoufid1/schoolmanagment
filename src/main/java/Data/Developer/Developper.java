package Data.Developer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Data.Connexion;
import Presentation.Models.Competance;
import Presentation.Models.Service;
import Presentation.Models.Tache;
import Presentation.Models.Technologie;

public class Developper implements DevelopperInterface{
	public static Connection conn = Connexion.getConnection();
	public boolean checkPassword(int authID, String existingInput) {
	    String query = "SELECT Password FROM authentification WHERE id = ?";
	    String existing = "";

	    try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
	        preparedStatement.setInt(1, authID);
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            existing = rs.getString("Password");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return existingInput.equals(existing);
	}

	public void editPassword(int authID, String newPass) {
	    String query = "UPDATE authentification SET Password = ? WHERE id = ?";
	    
	    try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
	        preparedStatement.setString(1, newPass);
	        preparedStatement.setInt(2, authID);
	        
	        preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	public ArrayList<Competance> getDevCompetances(int authID){
		ArrayList<Competance> comp=new ArrayList<Competance>(); 
		String query = "SELECT c.* FROM competance c WHERE c.DeveloppeurID="+getDevID(authID);
	    try (Statement stm = conn.createStatement()) {
	        ResultSet rs = stm.executeQuery(query);
	        while (rs.next()) {
	        	comp.add(new Competance(rs.getInt("id"), rs.getString("Experience"), rs.getString("Description"), getTechnologie(rs.getInt("TechnologieID"))));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		
		return comp;
	}
	public Technologie getTechnologie(int id) {
		Technologie tech=new Technologie(0,null);
		String query = "SELECT * FROM technologie WHERE id = "+id;

	    try (Statement stm = conn.createStatement()) {
	        ResultSet rs = stm.executeQuery(query);
	        while (rs.next()) {
	        	tech.setId(rs.getInt(1));
	            tech.setNom(rs.getString(2));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return tech;
	}
	public int getDevID(int authID) {
		int id=0;
		String query = "SELECT id FROM developpeur WHERE AuthentificationID = "+authID;

	    try (Statement stm = conn.createStatement()) {
	        ResultSet rs = stm.executeQuery(query);
	        while (rs.next()) {
	        	id=rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
		return id;
	}
	
	public ArrayList<Technologie> getAllTech() {
		ArrayList<Technologie> techs=new ArrayList<Technologie>();
		String query = "SELECT * FROM technologie";

	    try (Statement stm = conn.createStatement()) {
	        ResultSet rs = stm.executeQuery(query);
	        while (rs.next()) {
	        	techs.add(new Technologie(rs.getInt(1),rs.getString(2)));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return techs;
	}
	
	
	public void addComp(int authid,Competance comp) {
		int devid=getDevID(authid);
		String query="insert into competance (Description,Experience,DeveloppeurID,TechnologieID) values(?,?,?,?)";
		try (PreparedStatement pstm=conn.prepareStatement(query)){
			pstm.setString(1, comp.getExperience());
			pstm.setString(2, comp.getDescription());
			pstm.setInt(3, devid);
			pstm.setInt(4, comp.getTech().getId());
			pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


}
