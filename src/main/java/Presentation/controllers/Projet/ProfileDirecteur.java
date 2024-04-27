package Presentation.controllers.Projet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Data.ProfileData;

/**
 * Servlet implementation class ProfileDirecteur
 */
public class ProfileDirecteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HttpSession session ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileDirecteur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		request.getRequestDispatcher("/WEB-INF/Directeur/Profile/Profile.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String address = request.getParameter("address");
		int telephone = Integer.parseInt(request.getParameter("telephone"));
		int personneID = Integer.parseInt(request.getParameter("personneID")); 
		
		if(ProfileData.updatePersonInfo(nom, prenom, address, telephone,  personneID))
		{
			request.getRequestDispatcher("/WEB-INF/Directeur/Profile/Profile.jsp").forward(request, response);

		}else
		{
			request.getRequestDispatcher("/WEB-INF/blabla.jsp").forward(request, response);

		}
		
		
		
		
	}
}
