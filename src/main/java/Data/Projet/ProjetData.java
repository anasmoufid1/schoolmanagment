package Data.Projet;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Data.Connexion;
import Presentation.Models.*;

public class ProjetData implements ProjetDataInterface{
	
	 public static Connection conn = Connexion.getConnection();
	    
	    public static ResultSet getProjectsData() {
	        ResultSet rs = null;
	        String query = "SELECT * FROM projet";
	        
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            rs = pstmt.executeQuery();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return rs;
	    }
	    
	    public static ResultSet getAllClient() {
	        ResultSet rs = null;
	        String query = "SELECT PersonneID FROM client";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            rs = pstmt.executeQuery();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return rs;
	    }
	    
	    public static personne getPersonneByID(int personneID) {
	        personne personne = null;
	        String query = "SELECT * FROM personne WHERE id = ?";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, personneID);
	            ResultSet rs = pstmt.executeQuery();

	            if (rs.next()) {
	            	int id = rs.getInt("id");
	                String address = rs.getString("Adress");
	                String nom = rs.getString("Nom");
	                String prenom = rs.getString("Prenom");
	                Integer tel = rs.getInt("Tel");

	                // Crée une instance de Personne
	                personne = new personne();
	                personne.setId(id);
	                personne.setAddress(address);
	                personne.setNom(nom);
	                personne.setPrenom(prenom);
	                personne.setTel(tel);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return personne;
	    }

	    public static List<personne> getPersonsFromClientIDs() {
	        List<personne> personnes = new ArrayList<>();

	        ResultSet clientResultSet = getAllClient();

	        try {
	            while (clientResultSet != null && clientResultSet.next()) {
	                int personneID = clientResultSet.getInt("PersonneID");
	                personne personne = getPersonneByID(personneID);
	                if (personne != null) {
	                    personnes.add(personne); // Ajoute la personne à la liste
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return personnes;
	    }

	    public static ResultSet getAllMethodologie() {
	        ResultSet rs = null;
	        String query = "SELECT MethodologieID FROM projet";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            rs = pstmt.executeQuery();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return rs;
	    }


	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    public static ResultSet getAllChef() {
	        ResultSet rs = null;
	        String query = "SELECT DeveloppeurID FROM chef_projet";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            rs = pstmt.executeQuery();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return rs;
	    }

	    public static personne getPersonneByDeveloppeurID(int developpeurID) {
	        personne personne = null;
	        String query = "SELECT personne.* " +
	                       "FROM personne " +
	                       "JOIN developpeur ON personne.id = developpeur.PersonneID " +
	                       "JOIN chef_projet ON developpeur.id = chef_projet.DeveloppeurID " +
	                       "WHERE chef_projet.DeveloppeurID = ?";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, developpeurID);
	            ResultSet rs = pstmt.executeQuery();

	            if (rs.next()) {
	            	int id = rs.getInt("id");
	                String address = rs.getString("Adress");
	                String nom = rs.getString("Nom");
	                String prenom = rs.getString("Prenom");
	                Integer tel = rs.getInt("Tel");

	                personne = new personne();
	                personne.setId(id);
	                personne.setAddress(address);
	                personne.setNom(nom);
	                personne.setPrenom(prenom);
	                personne.setTel(tel);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return personne;
	    }

	    public static List<personne> getPersonnesFromChefs() {
	        List<personne> personnes = new ArrayList<>();

	        ResultSet chefResultSet = getAllChef();

	        try {
	            while (chefResultSet != null && chefResultSet.next()) {
	                int developpeurID = chefResultSet.getInt("DeveloppeurID");
	                personne personne = getPersonneByDeveloppeurID(developpeurID);
	                if (personne != null) {
	                    personnes.add(personne);
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return personnes;
	    }

	    
	    
	    public static boolean insertProjet(String nomProjet, String description, String dateDemarrage, String dateLivraison, String dateReunion, int idChefProjet, int idClient, int nbJoursDeveloppement) {
	        String query = "INSERT INTO projet (Nom, Description, Date_demarrage,Date_livraison,Date_reunion, Nbr_jour_developpement, Chef_projetID, ClientID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	        try {
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, nomProjet);
	            pstmt.setString(2, description);
	            pstmt.setString(3, dateDemarrage);
	            pstmt.setString(4, dateLivraison);
	            pstmt.setString(5, dateReunion);
	            pstmt.setInt(6, nbJoursDeveloppement);
	            pstmt.setInt(7, idChefProjet);
	            pstmt.setInt(8, idClient);

	            int rowsInserted = pstmt.executeUpdate();
	            return rowsInserted > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return false;
	    }

	    public   int getNumberOfProjects() {
	        int numberOfProjects = 0;
	        try {
	            String query = "SELECT COUNT(*) AS total FROM projet";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                numberOfProjects = rs.getInt("total");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return numberOfProjects;
	    }
	    
	    public   int getNumberOfClient() {
	        int numberOfclients = 0;
	        try {
	            String query = "SELECT COUNT(*) AS total FROM client";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                numberOfclients = rs.getInt("total");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return numberOfclients;
	   
}
	    public   int getNumberOfDevloppeur() {
	        int numberOfdev = 0;
	        try {
	            String query = "SELECT COUNT(*) AS total FROM developpeur";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                numberOfdev = rs.getInt("total");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return numberOfdev;
	   
}
	    
	    
	    public   int getNumberOfChef() {
	        int numberOfChef = 0;
	        try {
	            String query = "SELECT COUNT(*) AS total FROM chef_projet";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	            	numberOfChef = rs.getInt("total");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return numberOfChef;
	   
}
	    
	    public static boolean deleteProjetData(int id) {
	        PreparedStatement statement = null;
	        boolean deleted = false;

	        try {
	            String query = "DELETE FROM projet WHERE id = ?";
	            statement = conn.prepareStatement(query);
	            statement.setInt(1, id);

	            int rowsDeleted = statement.executeUpdate();

	            if (rowsDeleted > 0) {
	                deleted = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); 
	        } finally {
	            if (statement != null) {
	                try {
	                    statement.close();
	                } catch (SQLException e) {
	                    e.printStackTrace(); 
	                }
	            }
	        }

	        return deleted;
	    }
	    
	    public static ProjetModel getProjetFromId(int id) {
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;
	        ProjetModel projet = null; // Objet Projet à retourner

	        try {

	            String query = "SELECT * FROM projet WHERE id = ?";
	            statement = conn.prepareStatement(query);
	            statement.setInt(1, id);

	            // Exécution de la requête de sélection
	            resultSet = statement.executeQuery();

	            // Si un enregistrement est trouvé, créez un objet Projet
	            if (resultSet.next()) {
	                projet = new ProjetModel();
	                
	                projet.setId(resultSet.getInt("id"));
	                projet.setNom(resultSet.getString("Nom"));
	                projet.setChef_projetID(Integer.parseInt(resultSet.getString("Chef_projetID")));
	                projet.setDescription(resultSet.getString("Description"));
	                projet.setNom(resultSet.getString("Nom"));
	                projet.setDate_Demarrage(resultSet.getString("Date_demarrage"));
	                projet.setDate_livraison(resultSet.getString("Date_livraison"));
	                projet.setDate_Reunion(resultSet.getString("Date_reunion"));
	                projet.setNbr_Jour_Developpement(Integer.parseInt(resultSet.getString("Nbr_jour_developpement")));
	                projet.setMethodologieID(Integer.parseInt(resultSet.getString("MethodologieID")));
	                
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Gérer l'exception selon vos besoins
	        } finally {
	            // Fermeture de la connexion et des ressources
	            // ...
	        }

	        return projet;
	    
	    }
	    
	    public static List<ProjetModel> GetProjectChef(int id) {
	        List<ProjetModel> listP = new ArrayList<>();

	        try {
	          
	            String query = "SELECT * FROM projet WHERE Chef_projetID = ?";
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setInt(1, id);

	            ResultSet resultSet = statement.executeQuery();

	            while (resultSet.next()) {
	                ProjetModel projet = new ProjetModel();
	                projet.setId(resultSet.getInt("id"));
	                projet.setNom(resultSet.getString("nom"));
	                projet.setDescription(resultSet.getString("Description"));
	                projet.setDate_Demarrage(resultSet.getString("Date_demarrage"));
	                projet.setDate_livraison(resultSet.getString("Date_livraison"));
	                projet.setDate_Reunion(resultSet.getString("Date_reunion"));
	                projet.setNbr_Jour_Developpement(resultSet.getInt("Nbr_jour_developpement"));
	                projet.setClientID(resultSet.getInt("ClientID"));
	                

	                listP.add(projet); // Ajouter le projet à la liste
	            }

	            // Fermeture des ressources
	            resultSet.close();
	            statement.close();
	            conn.close();

	        } catch (SQLException e) {
	            e.printStackTrace(); // Gérer l'exception selon vos besoins
	        }

	        return listP;
	    }
	    
	    
	    public ArrayList<ProjetModel> getDeveloperProjects(int authID) {
	        Statement st = null;
	        ResultSet resultSet = null;
	        ArrayList<ProjetModel> projectsList = new ArrayList<ProjetModel>();

	        try {
	            st = conn.createStatement();
	            String query = "select DISTINCT pr.* from projet pr, developpeur d, membre_equipe me, membre_service ms, service s " +
	                           "where pr.id = s.ProjetID and s.id = ms.ServiceID and ms.Membre_equipeID = me.id " +
	                           "and me.DeveloppeurID = d.id and d.AuthentificationID = " + authID;

	            resultSet = st.executeQuery(query);

	            while (resultSet.next()) {
	            	ProjetModel prj = new ProjetModel(resultSet.getInt("id"),resultSet.getString("Date_demarrage"),resultSet.getString("Date_livraison"),resultSet.getString("Date_reunion"),resultSet.getString("Description"),resultSet.getInt("Nbr_jour_developpement"),
	            			resultSet.getString("Nom"),resultSet.getInt("Chef_projetID"),resultSet.getInt("ClientID"),resultSet.getInt("MethodologieID"),getDevProjectServices(resultSet.getInt("id"),authID));
	                projectsList.add(prj);
	            }
	            

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (resultSet != null) resultSet.close();
	                if (st != null) st.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return projectsList;
	    }
	    
		
	    public ArrayList<Service> getDevProjectServices(int projetID, int authID) {
	        ArrayList<Service> services = new ArrayList<>();
	        int devid = 0; // Initialize devid

	        // Retrieve devid
	        String devidQuery = "SELECT id FROM developpeur WHERE AuthentificationID=" + authID;
	        try (Statement stm = conn.createStatement()) {
	            ResultSet rs = stm.executeQuery(devidQuery);
	            while (rs.next()) {
	                devid = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        // Query to retrieve services
	        String mainQuery = "SELECT s.* " +
	                "FROM developpeur d, membre_equipe me, membre_service ms, service s " +
	                "WHERE s.id = ms.ServiceID " +
	                "AND ms.Membre_equipeID = me.id " +
	                "AND me.DeveloppeurID = d.id " +
	                "AND d.AuthentificationID = ? " +
	                "AND s.ProjetID = ?";

	        try (PreparedStatement mainStmt = conn.prepareStatement(mainQuery)) {
	            mainStmt.setInt(1, authID);
	            mainStmt.setInt(2, projetID);

	            try (ResultSet mainRs = mainStmt.executeQuery()) {
	                while (mainRs.next()) {
	                    int idServ = mainRs.getInt("id");
	                    ArrayList<Tache> serviceTasks = new ArrayList<>();

	                    // Query to retrieve tasks for the current service
	                    String innerQuery = "SELECT * FROM tache WHERE ServiceID=?";
	                    try (PreparedStatement innerStmt = conn.prepareStatement(innerQuery)) {
	                        innerStmt.setInt(1, idServ);

	                        try (ResultSet innerRs = innerStmt.executeQuery()) {
	                            while (innerRs.next()) {
	                                serviceTasks.add(new Tache(innerRs.getInt(1), innerRs.getInt(3), innerRs.getString(2)));
	                            }
	                        }
	                    }

	                    // Add the current service to the list
	                    services.add(new Service(idServ, mainRs.getString(2), mainRs.getInt(3), serviceTasks));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return services;
	    }
	    
	    public void updatepercentage(int taskid, int percentage) {
	        String query = "UPDATE tache SET Pourcentage = " + percentage + " WHERE id = " + taskid;
	        try (Statement stm = conn.createStatement()) {
	            stm.executeUpdate(query);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }




}
