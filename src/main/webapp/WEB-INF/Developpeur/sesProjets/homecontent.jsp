<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*"%>
<%@ page import="Presentation.Models.*" %>
<div class="main">

<%
ArrayList<ProjetModel> projects = (ArrayList<ProjetModel>) request.getAttribute("projectsList");
%>
            <nav class="navbar navbar-expand px-3 border-bottom">
                <button class="btn" id="sidebar-toggle" type="button">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <main class="content px-3 py-2">
                
                    <!-- Table Element -->
                    <div class="card border-0">
                        <div class="card-header">
                        	<h5 class="card-title">Mes Projets</h5>
							<h6 class="card-subtitle text-muted">
								Bonjour <%= session.getAttribute("personneNom") + " " + session.getAttribute("personnePrenom") %>,
                       			Dans la section suivante, tu trouveras la présentation détaillée des projets auxquels tu es affecté</h6>
                        </div>
						<div class="card-body">
							<%
							if(projects.isEmpty()){%>
								<div id="successMessage" class="alert alert-primary">
									Vous n'êtes affecté à aucun projet !
								</div>
							<%}else{%>
						<table class="table">
                                <thead>
                                    <tr>
			                			<th scope="col" width="50">#</th>
										<th scope="col">Nom</th>
										<th scope="col">Description</th>
										<th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
									<%
										int i = 1;
										for(ProjetModel projet: projects){
											
										%>
											<tr>
												<th scope="row"><%=i%></th>
												<td><%=projet.getNom()%></td>
												<td><%=projet.getDescription()%></td>
												<td class="action-icons"><a href="#"
													data-tooltip="Plus de Détails" data-bs-toggle="modal"
													data-bs-target="#moredetails<%=projet.getId()%>"><i
														class="fas fa-info-circle"></i> </a> <a href="#"
													data-tooltip="Avancement" data-bs-toggle="modal"
													data-bs-target="#exampleModal<%=projet.getId()%>"><i class="fas fa-chart-bar"></i></a>
													<a href="#" data-tooltip="Visualiser ses Tâches"
													data-bs-toggle="modal" data-bs-target="#tasks<%=projet.getId()%>"><i
														class="fas fa-tasks"></i></a></td>
											</tr>
										<%
										i++;
										}
										}
										%>
                                </tbody>
                            </table>						    
						</div>
							<!-- modal more information -->
				<%
				for(ProjetModel projet: projects){
				%> 
				<div class="modal fade" id="moredetails<%=projet.getId()%>"
					tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Plus de détails</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
							    <div class="row">
							        <div class="col-md-12">
							            <h5>Projet: <%= projet.getNom() %></h5>
							            <p><%= projet.getDescription() %></p>
							        </div>
							    </div>
							    <div class="row">
							        <div class="col-md-6">
							            <strong>Date de démarrage:</strong>
							            <p><%= projet.getDate_Demarrage() %></p>
							        </div>
							        <div class="col-md-6">
							            <strong>Date de livraison:</strong>
							            <p><%= projet.getDate_livraison() %></p>
							        </div>
							    </div>
							    <div class="row">
							        <div class="col-md-12">
							            <strong>Nombre de jours de développement:</strong>
							            <p><%= projet.getNbr_Jour_Developpement() %></p>
							        </div>
							    </div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fermer</button>
								<!-- Ajoutez d'autres boutons au besoin -->
							</div>
						</div>
					</div>
				</div>
			 	<%
				}
				%> 
				
				
					<!-- tasks Modal -->
				<%
				for(ProjetModel projet: projects){
				%> 
				<div class="modal fade" id="tasks<%=projet.getId()%>"
					tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Vos Taches:</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
							<div id="accordion" class="mt-4">
							<%for(Service serv: projet.getServices()){ %>
							        <div class="card">
							            <div class="card-header" id="headingOne<%=serv.getId()%>">
							                <h5 class="mb-0">
							                    <button class="btn btn-link text-decoration-none" data-toggle="collapse" data-target="#collapseOne<%=serv.getId()%>" aria-expanded="true" aria-controls="collapseOne">
							                        <%=serv.getDescription()%>
							                    </button>
							                </h5>
							            </div>
							            <div id="collapseOne<%=serv.getId()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
							                <div class="card-body">
							                	<form action="DevelopperProjects" method="post" class="text-center">
												    <input type="hidden" name="action" value="addpercentage">
													<input type="hidden" name="authID" value="<%=request.getAttribute("authID")%>">
												    <ul class="list-group mt-2">
												        <% for (Tache tch : serv.getTasks()) { %>
												            <li class="list-group-item d-flex justify-content-between align-items-center">
												                <%= tch.getDescription() %>		
												                <input type="hidden" name="taskID[]" value="<%= tch.getId() %>">
												                <input type="number" class="form-control" name="tachePourcentage[]" value="<%= tch.getPourcentage() %>" placeholder="Pourcentage">
												            </li>
												        <% } %>
												    </ul>
												    <button type="submit" class="btn btn-primary mt-3 mx-auto">Enregistrer</button>
												</form>
							                </div>
							            </div>
							        </div>
							   <%} %>
							</div>		
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fermer
								</button>
							</div>
						</div>
					</div>
				</div>
			 	<%
				}
				%>
				
				<!-- avancement Modal -->
				<%
				for(ProjetModel projet: projects){
					%> 
				<div class="modal fade" id="exampleModal<%=projet.getId() %>"
					tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Avancement Du Projet : <%=projet.getNom()%></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<ul class="list-group">
								<%for(Service serv: projet.getServices()){ %>	
							        <li class="list-group-item">
							            <div class="d-flex justify-content-between align-items-center">
							                <span><%=serv.getDescription()%></span>
							            </div>
							            <!-- Liste des expériences pour Compétence 1 -->
							            <ul class="list-group mt-2">
							            <%for(Tache tch: serv.getTasks()){ %>
							                <li class="list-group-item">
							         			<%=tch.getDescription() %>:
											  <div class="progress">
												<div class="progress-bar" role="progressbar" style="width: <%=tch.getPourcentage()%>%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"><%=tch.getPourcentage()%>%</div>
												</div>
											</li>
											<%} %>
							            </ul>
							        </li>
							        <%} %>
							        <!-- Ajoutez d'autres compétences ici -->
	   							</ul>								 
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Fermer</button>
								<!-- Ajoutez d'autres boutons au besoin -->
							</div>
						</div>
					</div>
				</div>
			 	<%
				}
				%> 
			                </div>
			            </main>
			            <a href="#" class="theme-toggle">
			                <i class="fa-regular fa-moon"></i>
			                <i class="fa-regular fa-sun"></i>
			            </a>
			            <%@ include file="../footer.jsp"%>
			        </div>