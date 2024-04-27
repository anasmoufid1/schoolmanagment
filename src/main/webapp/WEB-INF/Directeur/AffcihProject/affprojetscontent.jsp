<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%
ResultSet projects = (ResultSet) request.getAttribute("rs");
%>
<style>
        /* Style de la table */
        .project-table {
            width: 100%;
            border-collapse: collapse;
        }
        .project-table th, .project-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .project-table th {
            background-color: #f2f2f2;
        }
        .project-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .project-table tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
<div class="main">
            <nav class="navbar navbar-expand px-3 border-bottom">
                <button class="btn" id="sidebar-toggle" type="button">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <main class="content px-3 py-2">
                
                    <!-- Table Element -->
                    <div class="card border-0">
                        <div class="card-header">
                            
                            <h6 class="card-subtitle text-muted">
                                <section class="mainsection">
	<div class="mainsection-top">
		<i class="fas fa-user-cog"></i>
	</div>
				<section class="mainsection-course">
					<h1>My Projects</h1>
					<div class="course-box">
						<table class="project-table">
						    <thead>
						        <tr>
						            <th>ID</th>
						            <th>Nom</th>
						            <th>Description</th>
						            <th>Date de Démarrage</th>
						            <th>Date de Livraison</th>
						            <th>Date de Réunion</th>
						            <th>Nombre de Jours de Développement</th>
						            <th>Opération</th>
						        </tr>
						    </thead>
						    <tbody>
						        <%
						        int i = 1;
						        while (projects.next()) {
						        %>
						        <tr>
						            <td><%= projects.getInt("id") %></td>
						            <td><%= projects.getString("Nom") %></td>
						            <td><%= projects.getString("Description") %></td>
						            <td><%= projects.getString("Date_Demarrage") %></td>
						            <td><%= projects.getString("Date_livraison") %></td>
						            <td><%= projects.getString("Date_Reunion") %></td>
						            <td><%= projects.getInt("Nbr_Jour_Developpement") %></td>
						            <td>
						                <form action="/ProjetJEE/projetServlet" method="post">
						                  <!--	<i class="fa-solid fa-pen-to-square" style="color: #63d97b;"></i> -->
						                  	<input type="hidden" name="action" value="supprimer">
						                  	<input type="hidden" id="idProjet" name="idProjet" value="<%= projects.getInt("id") %>" class="form-control">
					                  		<input type="submit" value="sup" class="btn btn-danger">
				                  		</form>	
				                  		<form action="/ProjetJEE/projetServlet" method="post">
						                  <!--	<i class="fa-solid fa-pen-to-square" style="color: #63d97b;"></i> -->
						                  	<input type="hidden" name="action" value="modifier">
						                  	<input type="hidden" id="idProjet" name="idProjet" value="<%= projects.getInt("id") %>" class="form-control">
						                  	<input type="submit" value="mod" class="btn btn-success">
					                  	</form>
					                  	</td>
			                  			            
			                  	
			                  	
						        </tr>
						        <%
						        i++;
						        }
						        %>
						    </tbody>
						</table>
						<div class="modal" tabindex="-1" id="confirmationModal">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">Modal title</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <p>Modal body text goes here.</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Save changes</button>
						      </div>
						    </div>
						  </div>
						</div>
			
			
					</div>
				</section>
			</section>
                            </h6>
                        </div>
                        </div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon"></i>
                <i class="fa-regular fa-sun"></i>
            </a>
            <%@ include file="../footer.jsp"%>
        </div>