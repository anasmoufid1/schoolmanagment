<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	session = request.getSession();
	
	// Récupérer le nom d'utilisateur depuis la session
 	String nommm = (String) session.getAttribute("personneNom");
 	String prenommm = (String) session.getAttribute("personnePrenom");
 	
%>
        <aside id="sidebar" class="js-sidebar">
            <!-- Content For Sidebar -->
            <div class="h-100">
                <div class="sidebar-logo">
                    <a href="#"><%= nommm %> <%= prenommm %></a>
                </div>
                <ul class="sidebar-nav">
                    <li class="sidebar-header">
                        Admin Elements
                    </li>
                    <li class="sidebar-item">
                        <a href="/ProjetJEE/HomeStatistic" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            Dashboard
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#pages" data-bs-toggle="collapse"
                            aria-expanded="false"><i class="fa-solid fa-file-lines pe-2"></i>
                            Projets
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="/ProjetJEE/projetServlet?action=afficher" class="sidebar-link">Afficher Projets</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="/ProjetJEE/projetServlet?action=ajouter" class="sidebar-link">Ajouter Projet</a>
                            </li>
                        </ul>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-target="#auth" data-bs-toggle="collapse"
                            aria-expanded="false"><i class="fa-regular fa-user pe-2"></i>
                            Profile
                        </a>
                        <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="/ProjetJEE/ProfileDirecteur" class="sidebar-link">Paramétres du profile</a>
                            </li>
                            
                        </ul>
                        
                    </li>
                    <li class="sidebar-header">
                       <a href="/ProjetJEE/LogoutServlet"
									class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
									class="fas fa-power-off me-2"></i>Logout
								</a>
                    </li>
                    			
                    
                    
            </div>
        </aside>
        
        <script>
        window.onload = function () {
            window.history.forward();
        };
    </script>
    <script>
    function toggleDropdown(event) {
        event.preventDefault();
        const dropdown = document.getElementById('projectsDropdown');
        if (dropdown.style.display === 'none') {
            dropdown.style.display = 'block';
        } else {
            dropdown.style.display = 'none';
        }
    }
</script>