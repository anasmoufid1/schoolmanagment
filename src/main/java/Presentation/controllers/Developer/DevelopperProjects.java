package Presentation.controllers.Developer;

import jakarta.servlet.ServletException;


import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import Metier.ProjetMetier.DevelopperProjectsManager;
import Metier.ProjetMetier.DevelopperProjectsManagerInterface;
import Presentation.Models.ProjetModel;
import Presentation.Models.Service;

/**
 * Servlet implementation class DevelopperProjects
 */
public class DevelopperProjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private DevelopperProjectsManagerInterface managerpr =new DevelopperProjectsManager();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DevelopperProjects() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int authID=Integer.parseInt(request.getParameter("authID"));
		ArrayList<ProjetModel> projectsList = new ArrayList<ProjetModel>();
		ArrayList<Service> Services = new ArrayList<Service>();
		projectsList=managerpr.getDeveloperProjects(authID);
		request.setAttribute("projectsList", projectsList);
		request.setAttribute("authID", authID);
		request.getRequestDispatcher("WEB-INF/Developpeur/sesProjets/home.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String)request.getParameter("action");
		if(action.equals("addpercentage")) {
			int authID = Integer.parseInt(request.getParameter("authID"));
			String[] taskIDs = request.getParameterValues("taskID[]");
	        String[] tachePourcentages = request.getParameterValues("tachePourcentage[]");
	        if (taskIDs != null && tachePourcentages != null && taskIDs.length == tachePourcentages.length) {
	            for (int i = 0; i < taskIDs.length; i++) {
	                int taskID = Integer.parseInt(taskIDs[i]);
	                int tachePourcentage = Integer.parseInt(tachePourcentages[i]);
	                managerpr.updatepercentage(taskID,tachePourcentage);
	            }
	        }
	        response.sendRedirect(request.getContextPath() + "/DevelopperProjects?authID="+authID);
		}
	}

}
