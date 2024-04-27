package Data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Presentation.Models.personne;


public class Auth_Conn {
	 public static Connection conn = Connexion.getConnection();
	 
	 
	 public static boolean verifierExistance(String email, String password) {
	        String query = "SELECT COUNT(*) AS count FROM Authentification WHERE Email = ? AND Password = ?";
	        boolean exists = false;

	        try (
	             PreparedStatement stmt = conn.prepareStatement(query)) {
	            stmt.setString(1, email);
	            stmt.setString(2, password);

	            try (ResultSet rs = stmt.executeQuery()) {
	                if (rs.next()) {
	                    int count = rs.getInt("count");
	                    exists = count > 0;
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return exists;
	    }
	 public static int getRole(String email, String password) {
		    int role = 0;
		    String query = "SELECT Role FROM Authentification WHERE Email = ? AND Password = ?";
		    
		    // Établir la connexion à votre base de données
		    // Remplacez "your_database_connection_url_here", "username" et "password" par vos informations de connexion
		    try (
		         PreparedStatement stmt = conn.prepareStatement(query)) {
		        
		        stmt.setString(1, email);
		        stmt.setString(2, password);
		        
		        try (ResultSet rs = stmt.executeQuery()) {
		            if (rs.next()) {
		                role = rs.getInt("Role");
		            }
		        }
		    } catch (SQLException e) {
		        // Gérer les exceptions appropriées ici
		        e.printStackTrace();
		    }
		    
		    return role;
		}
	 
	 public static int getID(String email, String password) {
		    int id = 0;
		    String query = "SELECT id FROM Authentification WHERE Email = ? AND Password = ?";
		    
		    // Établir la connexion à votre base de données
		    // Remplacez "your_database_connection_url_here", "username" et "password" par vos informations de connexion
		    try (
		         PreparedStatement stmt = conn.prepareStatement(query)) {
		        
		        stmt.setString(1, email);
		        stmt.setString(2, password);
		        
		        try (ResultSet rs = stmt.executeQuery()) {
		            if (rs.next()) {
		                id = rs.getInt("id");
		            }
		        }
		    } catch (SQLException e) {
		        // Gérer les exceptions appropriées ici
		        e.printStackTrace();
		    }
		    
		    return id;

}
	 public static personne getPersonneAuth(int id) {
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    personne personne = null;

		    try {
		        conn = Connexion.getConnection();
		        String sql = "SELECT p.* FROM personne p " +
	                     "WHERE id IN ( " +
	                     "    SELECT PersonneID FROM directeur_info WHERE AuthentificationID = ? " +
	                     " ) OR id IN ( " +
	                     "    SELECT PersonneID FROM developpeur WHERE AuthentificationID = ? " +
	                     " )";

		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, id);
		        pstmt.setInt(2, id);// Associer le paramètre avant d'exécuter la requête
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            personne = new personne();
		            personne.setId(rs.getInt("id"));
		            personne.setAddress(rs.getString("Adress"));
		            personne.setNom(rs.getString("Nom"));
		            personne.setPrenom(rs.getString("Prenom"));
		            personne.setTel(rs.getInt("Tel"));
		            // ... Remplir d'autres attributs si nécessaire
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        // Assurez-vous de fermer les ressources
		        // ... (rs, pstmt, conn)
		    }

		    return personne;
		}
 
}
