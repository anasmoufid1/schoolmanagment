package Presentation.controllers.Projet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Data.Auth_Conn;
import Data.Projet.ProjetData;
import Presentation.Models.*;
import Metier.ProjetMetier.*;
/**
 * Servlet implementation class projetServlet
 */
public class projetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ResultSet rs= null;
    ProjetModel projj = new ProjetModel();
    HttpSession session;
    

    /**
     * @see HttpServlet#HttpServlet()
     */
    public projetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String action = request.getParameter("action");

        
        String action1 = request.getParameter("action");
	     if("lister".equals(action1))
	     {
		    	List<ProjetModel> listP = new ArrayList<ProjetModel>();

		    	listP = ProjetData.GetProjectChef((Integer) request.getSession().getAttribute("authID"));
		    	request.setAttribute("listeProjet" , ProjetData.GetProjectChef((Integer) request.getSession().getAttribute("authID")));
		    	request.getRequestDispatcher("/WEB-INF/Chef_Projet/Projet/home.jsp").forward(request, response);
	     }
        
        if ("afficher".equals(action1)) {
			rs =ProjetMetiers.getProjectsMetiers();
		
		request.setAttribute("rs", rs);
		request.getRequestDispatcher("/WEB-INF/Directeur/AffcihProject/affprojects.jsp").forward(request, response);
		}else if ("ajouter".equals(action1)) {
			List<personne> personnes = ProjetMetiers.getPersonsFromClientIDs();
			
			List<personne> personnesCHEF = ProjetData.getPersonnesFromChefs();
			//List<String> methodologieNoms = ProjetData.getMethodologiesByID();
			request.setAttribute("client", personnes);
			request.setAttribute("CHEF", personnesCHEF);			
            request.getRequestDispatcher("/WEB-INF/Directeur/AddProject/addProject.jsp").forward(request, response);
        }
		else {
			List<personne> personnes = ProjetMetiers.getPersonsFromClientIDs();
			List<personne> personnesCHEF = ProjetData.getPersonnesFromChefs();
			request.setAttribute("CHEF", personnesCHEF);			
			request.setAttribute("client", personnes);
			rs =ProjetMetiers.getProjectsMetiers();
			request.getRequestDispatcher("/WEB-INF/Directeur/AddProject/addProject.jsp").forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nomProjet = request.getParameter("nom");
		String description = request.getParameter("description");
		String dateDemarrage = request.getParameter("dateDemarrage");
		String dateReunion = request.getParameter("datereunion");
		String dateLivraison = request.getParameter("dateLivraison");
//		int idChefProjet = Integer.parseInt(request.getParameter("cheff")); //ERREUR
//		int idClient = Integer.parseInt(request.getParameter("clientt"));
//		int nbr_jours = Integer.parseInt(request.getParameter("nbJoursDeveloppement"));
	    	
		String actionn = request.getParameter("action");
		if (actionn != null && actionn.equals("supprimer")) 
	     {
	    	  int idDelete = Integer.parseInt(request.getParameter("idProjet"));
		     if(ProjetMetiers.deleteProjetMetiers(idDelete))
		     {
		    	 rs =ProjetMetiers.getProjectsMetiers();
			 		
			 		request.setAttribute("rs", rs);
		    	 request.getRequestDispatcher("/WEB-INF/Directeur/AffcihProject/affprojects.jsp").forward(request, response);
		     }else {
		    	 request.getRequestDispatcher("/WEB-INF/blabla.jsp").forward(request, response);

		     }
	     }   
	     if(ProjetData.insertProjet(nomProjet, description, dateDemarrage, dateReunion ,dateLivraison , 1, 2, 123))
	     {
//	    	 response.sendRedirect("/ProjetJEE/projetServlet?action=afficher");
	    	 rs =ProjetMetiers.getProjectsMetiers();
	 		
	 		request.setAttribute("rs", rs);
	    	 request.getRequestDispatcher("/WEB-INF/Directeur/AffcihProject/affprojects.jsp").forward(request, response);
	     }
	     
	     
		String actionn1 = request.getParameter("action");
	     if (actionn1.equals("modifier")) {
	    	 List<personne> personnes = ProjetMetiers.getPersonsFromClientIDs();
				
				List<personne> personnesCHEF = ProjetData.getPersonnesFromChefs();
				//List<String> methodologieNoms = ProjetData.getMethodologiesByID();
				request.setAttribute("client", personnes);
				request.setAttribute("CHEF", personnesCHEF);
	    	  int idUpdate = Integer.parseInt(request.getParameter("idProjet"));
	    	  ProjetModel pp = ProjetMetiers.getProjetFromIdMetier(idUpdate);
	    	  request.setAttribute("pp", pp);
	    	  request.getRequestDispatcher("/WEB-INF/Directeur/UpdateProjet/affprojects.jsp").forward(request, response);
			}
	     
	     if (actionn1.equals("modifier")) {
	    	 String nomProjet1 = request.getParameter("nom");
	 		String description1	= request.getParameter("description");
	 		String dateDemarrage1 = request.getParameter("dateDemarrage");
	 		String dateReunion1 = request.getParameter("datereunion");
	 		String dateLivraison1 = request.getParameter("dateLivraison");
	 		int idChefProjet1 = Integer.parseInt(request.getParameter("cheff")); 
	 		int idClient1 = Integer.parseInt(request.getParameter("clientt"));
	 		int nbr_jours1 = Integer.parseInt(request.getParameter("nbJoursDeveloppement"));
	     }
	     
	     String action = request.getParameter("action");
	     if("lister".equals(action))
	     {
		    	List<ProjetModel> listP = new ArrayList<ProjetModel>();

		    	listP = ProjetData.GetProjectChef((Integer) request.getSession().getAttribute("authID"));
		    	request.setAttribute("listeProjet" , ProjetData.GetProjectChef((Integer) request.getSession().getAttribute("authID")));
		    	  request.getRequestDispatcher("/WEB-INF/Chef_Projet/Projet/home.jsp").forward(request, response);
	     }
	    
	}

}
