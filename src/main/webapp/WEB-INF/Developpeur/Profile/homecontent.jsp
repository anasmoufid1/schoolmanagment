<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main">
<%String erreur=(String)request.getAttribute("erreur");
String succes=(String)request.getAttribute("succes");
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
                        	<h5 class="card-title">Profile/Informations Personnelles</h5>
							<h6 class="card-subtitle text-muted">Bonjour <%= session.getAttribute("personneNom") + " " + session.getAttribute("personnePrenom") %>,
                       							    Les informations personnelles ci-dessus vous concernent. Vous avez la possibilité de modifier votre mot de passe à partir de cette section.</h6>
                        </div>
						<div class="card-body">
						    <div class="row">
						        <!-- Partie gauche - Informations personnelles -->
						        <div class="col-md-6">
						            <h5 class="card-title">Vos Informations Personnelles</h5>
						
						            <div class="form-group">
						                <label for="nom">Nom :</label>
						                <input type="text" class="form-control" id="nom" value="<%= session.getAttribute("personneNom") %>" readonly>
						            </div>
						
						            <div class="form-group">
						                <label for="prenom">Prénom :</label>
						                <input type="text" class="form-control" id="prenom" value="<%= session.getAttribute("personnePrenom") %>" readonly>
						            </div>
						
						            <!-- Ajoutez d'autres champs d'information ici -->
						
						            <div class="form-group">
						                <label for="email">Adresse :</label>
						                <input type="text" class="form-control" id="email" value="<%= session.getAttribute("personneAdress") %>" readonly>
						            </div>
						        </div>
						
						        <!-- Partie droite - Formulaire de changement de mot de passe -->
						        <div class="col-md-6">
									    <h5 class="card-title">Changer le Mot de Passe</h5>
									    
										<%if(!succes.isEmpty()){ %>									
									    <div id="successMessage" class="alert alert-success">
									        Mot de passe modifié avec succès !
									    </div>
										<%} %>
										
										<%if(!erreur.isEmpty()){ %>									
									    <div id="errorMessage" class="alert alert-danger"">
											<%=erreur%>
									    </div>
									    <%} %>
										<form action="DevelopperProfile" method="POST">
										<input type="hidden" name="action" value="modifypass">
									    <input type="hidden" name="authID" value="<%=session.getAttribute("authID")%>">
									        <div class="form-group">
									            <label for="actualPassword">Mot de passe actuel :</label>
									                <input type="password" class="form-control" id="actualPassword" name="actualPassword" required>
									        </div>
									
									        <div class="form-group">
									            <label for="newPassword">Nouveau mot de passe :</label>
									                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
									        </div>
									
									        <div class="form-group">
									            <label for="confirmNewPassword">Confirmer le nouveau mot de passe :</label>
									                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
									        </div>
									
									        <div class="form-check">
									            <input type="checkbox" class="form-check-input" id="showPassword" onclick="togglePasswords()">
									            <label class="form-check-label" for="showPassword">Afficher Les Champs</label>
									        </div>
									
									        <button type="submit" class="btn btn-primary">Modifier</button>
									    </form>
									</div>
									<script>
									    function togglePasswords() {
									        var passwordInputs = document.querySelectorAll('input[type="password"]');
									        var checkbox = document.getElementById('showPassword');
									
									        passwordInputs.forEach(function (input) {
									            var currentValue = input.value;
									            if (checkbox.checked) {
									                input.type = 'text';
									            } else {
									                input.type = 'password';
									            }
									            input.value = currentValue;
									        });
									    }
									</script>

						    </div>
						</div>
                     </div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon"></i>
                <i class="fa-regular fa-sun"></i>
            </a>
            <%@ include file="../footer.jsp"%>
        </div>