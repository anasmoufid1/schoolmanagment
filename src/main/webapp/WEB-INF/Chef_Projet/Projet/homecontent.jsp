<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                <table class="table table-dark table-striped">
  									<thead>
									    <tr>
									      <th scope="col">id</th>
									      <th scope="col">Nom</th>
									      <th scope="col">Description</th>
									      <th scope="col">Date de Demarrage</th>
									      <th scope="col">Date de livraison</th>
									    </tr>
									  </thead>
									  <tbody>
							            <c:forEach items="${listeProjet}" var="projet">
							                <tr>
							                    <td>${projet.id}</td>
							                    <td>${projet.nom}</td>
							                    <td>${projet.description}</td>
							                    <td>${projet.dateDeDemarrage}</td>
							                    <td>${projet.dateDeLivraison}</td>
							                </tr>
							            </c:forEach>
							        </tbody>
								</table>
                            </h6>
                        </div>
                        </div>
            </main>
            <a href="#" class="theme-toggle">
                <i class="fa-regular fa-moon"></i>
                <i class="fa-regular fa-sun"></i>
            </a>
            <%--  <%@ include file="../footer.jsp"%>--%>
        </div>