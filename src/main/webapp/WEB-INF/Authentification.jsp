<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Se connecter</title>
    <link rel="stylesheet" href="css/auth.css">
  </head>
  <body>
  <%String erreur=null;
  %>
    <div class="center">
      <h1>Se Connecter</h1>
    <form action="AuthentificationServlet" method="POST">
        <div class="txt_field">
          <input type="text" id="username" name="username"  required>
          <span></span>
          <label>E-mail</label>
        </div>
        <div class="txt_field">
          <input type="password" id="password" name="password" required>
          <span></span>
          <label>Mot De Passe</label>
        </div>
		<%erreur=(String) request.getAttribute("erreur");
		if(!erreur.isEmpty())
		{
		%>
		<div class="erreur_auth">
			email ou mot de passe incorrectes
		</div>
		<%} %>
      
        <input type="submit" value="Login">
        <div class="signup_link">
        </div>
      </form>
    </div>
  </body>
</html>