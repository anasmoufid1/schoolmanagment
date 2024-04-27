<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
    form {
        width: 60%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    label {
        display: inline-block;
        width: 25%;
        text-align: right;
        margin-bottom: 10px;
    }

    input[type="text"],
    input[type="date"],
    textarea {
        width: 70%;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    .form-row {
        margin-bottom: 20px;
        overflow: hidden;
    }
</style>


<form action="/ProjetJEE/projetServlet" method="post">
    <div class="form-row">
        <label for="nom">Nom du Projet:</label>
        <input type="text" id="nom" name="nom" value="${pp.getNom() }" >
    </div>

    <div class="form-row">
        <label for="description">Description:</label>
		<textarea id="description" name="description">${pp.getDescription()}</textarea>

    </div>

    <div class="form-row">
        <label for="dateDemarrage">Date de Début:</label>
        <input type="text" id="dateDemarrage" name="dateDemarrage" value="${pp.getDate_Demarrage()}">
        
        <label for="dateDemarrage">Date de reunion:</label>
        <input type="text" id="dateDemarrage" name="datereunion" value="${pp.getDate_Reunion()}">

        <label for="dateLivraison">Date de Livraison:</label>
        <input type="text" id="dateLivraison" name="dateLivraison" value="${pp.getDate_livraison() }">
    </div>
    <div class="form-row">
    <label for="nbJoursDeveloppement">Nbr_jours_dévelop :</label>
    <input type="number" id="nbJoursDeveloppement" name="nbJoursDeveloppement" value="${pp.getNbr_Jour_Developpement() }">
</div>
    

    <div class="form-row">
        <label for="chefProjet">choisir Chef de Projet:</label>        
        <select id="cheff" name="cheff">
		    		    		     <c:forEach var="chef" items="${CHEF}">
				                <option value="${chef.getId()}"
				                        ${chef.getId() == projet.getChef_projetID() ? 'selected' : ''}>
				                    ${chef.getNom()} ${chef.getPrenom()}
				                </option>
				            </c:forEach>
		    
		    
		</select>

        <label for="client">Choisir un client:</label>
		<select id="client" name="clientt">
		     <c:forEach var="client" items="${client}">
				                <option value="${client.getId()}"
				                        ${client.getId() == projet.getClientID() ? 'selected' : ''}>
				                    ${client.getNom()} ${client.getPrenom()}
				                </option>
				            </c:forEach>
				            
		</select>
    </div>


    <input type="submit" value="Ajouter Projet">
</form>
