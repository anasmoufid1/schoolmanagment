package Presentation.controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Metier.AuthentificationMetier;
import Presentation.Models.*;
import Data.*;
import Data.Projet.ProjetData;
import Data.Projet.ProjetDataInterface;

public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session;
    ProjetDataInterface prjd = new ProjetData();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("erreur","");
		request.getRequestDispatcher("/WEB-INF/Authentification.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int id = Auth_Conn.getID(username, password);
		if(id==0) {
			request.setAttribute("erreur","erreur");
			request.getRequestDispatcher("/WEB-INF/Authentification.jsp").forward(request, response);
		}else {
			session = request.getSession();
		    session.setAttribute("authID", id);
		    session.setAttribute("email", username);
		    session.setAttribute("nbrProjet", prjd.getNumberOfProjects());
		    session.setAttribute("nbrclient", prjd.getNumberOfClient());
		    session.setAttribute("nbrdev", prjd.getNumberOfDevloppeur());
		    session.setAttribute("numberOfChef", prjd.getNumberOfProjects());
		    personne personne = Auth_Conn.getPersonneAuth(id);
		    session.setAttribute("personneID", personne.getId());
		    session.setAttribute("personneNom", personne.getNom());
		    session.setAttribute("personnePrenom", personne.getPrenom());
		    session.setAttribute("personneAdress", personne.getAddress());
		    session.setAttribute("personneTel", personne.getTel());
			authentificationModel authMod = new authentificationModel(username,password);
			
			int role = AuthentificationMetier.VerifierExistance(authMod);
			switch (role) {
	        case 0:
	        	request.getRequestDispatcher("/WEB-INF/Authentification.jsp").forward(request, response);
	            break;
	        case 1:
	        	request.getRequestDispatcher("/WEB-INF/Directeur/home/homestatistic.jsp").forward(request, response);
	            break;
	        case 2:
	        	request.getRequestDispatcher("/WEB-INF/Chef_Projet/Projet/home.jsp").forward(request, response);
	            break;
	        case 3:
				request.setAttribute("erreur", "");
				request.setAttribute("succes", "");
	        	request.getRequestDispatcher("/WEB-INF/Developpeur/Profile/home.jsp").forward(request, response);
	            break;

			}

    }
		
	}

}
