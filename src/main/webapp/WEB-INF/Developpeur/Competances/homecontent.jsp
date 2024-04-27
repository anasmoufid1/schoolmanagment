<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="Presentation.Models.*" %>
<div class="main">

<%String erreur=(String)request.getAttribute("erreur");
String succes=(String)request.getAttribute("succes");
ArrayList<Competance> copet=(ArrayList<Competance>)request.getAttribute("competances");
Collections.reverse(copet);
ArrayList<Technologie> techs=(ArrayList<Technologie>)request.getAttribute("techs");
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
                        	<h5 class="card-title">Profile/Compétances</h5>
							<h6 class="card-subtitle text-muted">Bonjour <%= session.getAttribute("personneNom") + " " + session.getAttribute("personnePrenom") %>,
							    Vous pouvez ajouter de nouvelles compétences à votre profil ou de compléter vos expériences professionnelles associées à ces compétences existantes.</h6>
                        </div>
						<div class="card-body">						
						    <!-- Liste des compétences -->
						    
						    
						    
							<ul class="list-group">
							<%int i=0;
						    for(Competance comp:copet){ i++;%>
						        <li class="list-group-item">
						            <div class="d-flex justify-content-between align-items-center">
						                <span><%=comp.getTech().getNom()+" : "+comp.getDescription() %></span>
						                <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addExperienceModal<%=i%>">
						                    Ajouter de l'Expérience
						                </button>
						            </div>
						            <!-- Liste des expériences pour Compétence 1 -->
						            <ul class="list-group mt-2">
						                <li class="list-group-item"><%=comp.getExperience() %></li>
						            </ul>
						        </li>
						        <%} %>
						        <!-- Ajoutez d'autres compétences ici -->
   							</ul>
   							
   									<%i=0;
						    for(Competance comp:copet){ i++;%>
   													    <!-- Modèle de modal pour ajouter une expérience -->
						    <div class="modal fade" id="addExperienceModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="addExperienceModalLabel" aria-hidden="true">
						        <div class="modal-dialog" role="document">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <h5 class="modal-title" id="addExperienceModalLabel">Ajouter de l'Expérience</h5>
						                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                        <span aria-hidden="true">&times;</span>
						                    </button>
						                </div>
						                <div class="modal-body">
						                    <form>
						                        <div class="form-group">
						                            <label for="experienceSkill">Téchnologie:</label>
						                            <input type="text" class="form-control" id="experienceSkill" value="<%=comp.getTech().getNom()%>" disabled>
						                        </div>
						                        <div class="form-group">
						                            <label for="experienceDescription">Expérience</label>
						                            <textarea class="form-control" id="experienceDescription" rows="3" required><%=comp.getExperience() %></textarea>
						                        </div>
						                        <button type="submit" class="btn btn-primary">Ajouter</button>
						                    </form>
						                </div>
						            </div>
						        </div>
						    </div>
						    <%} %>
   							
   							<div class="modal fade" id="addSkillModal" tabindex="-1" role="dialog" aria-labelledby="addSkillModalLabel" aria-hidden="true">
						        <div class="modal-dialog" role="document">
						            <div class="modal-content">
						                <div class="modal-header">
						                    <h5 class="modal-title" id="addSkillModalLabel">Ajouter Compétence</h5>
						                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                        <span aria-hidden="true">&times;</span>
						                    </button>
						                </div>
						                <div class="modal-body">
						                    <form action="DevelopperProfile" method="post">
						                    <input type="hidden" name="action" value="ajoutercomp">
						                    <input type="hidden" name="authID" value="<%=session.getAttribute("authID")%>">
						                        <div class="form-group">
											        <label for="selectCategory">Téchnologie:</label>
											        	<select class="form-control" name="technologie" required>
												            <option value="" disabled selected>Choisir...</option>
												            <%for(Technologie tech:techs){ %>
												            <option value="<%=tech.getId()%>"><%=tech.getNom() %></option>
												            <%} %>
												        </select>
						                            <label for="newSkill">Compétance:</label>
						                            <textarea class="form-control" name="description" placeholder="Decrire ce que vous metriser exactement" required></textarea>
						                          	<label for="newSkill">Expériences:</label>
						                            <textarea class="form-control" name="experience" placeholder="Decire les expérience dont vous avez utilisé cette technologie" required></textarea>
						                        </div>
						                        <button type="submit" class="btn btn-success">Ajouter</button>
						                    </form>
						                </div>
						            </div>
						        </div>
						    </div>

							<button type="button" class="btn btn-success mt-3" data-toggle="modal" data-target="#addSkillModal">
						        Ajouter Compétence
						    </button>

						</div>
					</div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon"></i>
                <i class="fa-regular fa-sun"></i>
            </a>
            <%@ include file="../footer.jsp"%>
        </div>