package Data;

import java.sql.*;

public class ProfileData {
	
	public static Connection conn = Connexion.getConnection();
	
	public static boolean updatePersonInfo(String nom, String prenom, String address, int telephone, int personneID) {
	    String query = "UPDATE personne SET Nom = ?, Prenom = ?, Adress = ?, Tel = ? WHERE id = ?";

	    try {
	        PreparedStatement pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, nom);
	        pstmt.setString(2, prenom);
	        pstmt.setString(3, address);
	        pstmt.setInt(4, telephone);
	        pstmt.setInt(5, personneID); // Ajoutez l'email si nécessaire pour identifier l'utilisateur

	        int rowsUpdated = pstmt.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}

}
