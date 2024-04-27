package Data;


import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;



public class Connexion {
    // Instance unique de la connexion (singleton)
	
    private static Connection connection;

    // URL de connexion à la base de données MySQL
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jeeproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    
    static {
        try {
            // Charger le pilote JDBC MySQL (utilisation de la classe recommandée)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Établir la connexion à la base de données
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    
    public static Connection getConnection() {
        return connection;
    }
    
   

}

