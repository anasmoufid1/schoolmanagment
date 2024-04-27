package Metier;

import Data.Auth_Conn;
import Presentation.Models.*;

public class AuthentificationMetier{
	static 

	public int VerifierExistance(authentificationModel authM)
	{
		int role = 0;
		if(Auth_Conn.verifierExistance(authM.getUsername(), authM.getPassword()))
		{
			role = Auth_Conn.getRole(authM.getUsername(), authM.getPassword());
		}
		return role;
		
	}
}
