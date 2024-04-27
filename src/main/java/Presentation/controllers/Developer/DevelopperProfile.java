package Presentation.controllers.Developer;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import com.mysql.cj.Session;

import Metier.developper.ProfileSettings;
import Metier.developper.ProfileSettingsInterface;
import Presentation.Models.Competance;


/**
 * Servlet implementation class DevelopperProfile
 */
public class DevelopperProfile extends HttpServlet {
	private ProfileSettingsInterface metier=new ProfileSettings();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DevelopperProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		String action=(String)request.getParameter("actions");
		if(action.equals("infos")) {
		request.setAttribute("erreur", "");
		request.setAttribute("succes", "");
		request.getRequestDispatcher("WEB-INF/Developpeur/Profile/home.jsp").forward(request, response);
		}else {
			ArrayList<Competance> comp=metier.getDevCompetances(Integer.parseInt(request.getParameter("authID")));
			request.setAttribute("competances", comp);
			request.setAttribute("techs", metier.getAllTech());
			request.getRequestDispatcher("WEB-INF/Developpeur/Competances/home.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =(String)request.getParameter("action");
		if(action.equals("modifypass")) {
			int authID = Integer.parseInt(request.getParameter("authID"));
			String confirm=(String) request.getParameter("confirmNewPassword");
			String newPass=(String) request.getParameter("newPassword");
			String existing=(String) request.getParameter("actualPassword");
			int res=metier.editPass(authID, newPass, existing,confirm);
			if(res==0) {
				request.setAttribute("erreur", "confirmation du mot de passe incorrecte!");
				request.setAttribute("succes", "");
				request.getRequestDispatcher("WEB-INF/Developpeur/Profile/home.jsp").forward(request, response);
			}else if(res==1) {
				request.setAttribute("erreur", "");
				request.setAttribute("succes", "votre mot de passe a été modifier avec succes!");
				request.getRequestDispatcher("WEB-INF/Developpeur/Profile/home.jsp").forward(request, response);
			}else {
				request.setAttribute("erreur", "Mot de passe actulle incorrecte!");
				request.setAttribute("succes", "");
				request.getRequestDispatcher("WEB-INF/Developpeur/Profile/home.jsp").forward(request, response);
			}
		}else if(action.equals("ajoutercomp")) {
			int authID = Integer.parseInt(request.getParameter("authID"));
			int techid=Integer.parseInt(request.getParameter("technologie"));
			String Experence=(String)request.getParameter("experience");
			String competance=(String)request.getParameter("description");
			metier.addCompetance(authID, Experence, competance, techid);
			String redirectURL = "/ProjetJEE/DevelopperProfile?actions=compet&authID=" + authID;
	        response.sendRedirect(redirectURL);
		}
	}

}
