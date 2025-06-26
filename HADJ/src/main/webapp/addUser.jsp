<%--
  Created by IntelliJ IDEA.
  User: Fallou
  Date: 29/07/2024
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter un Utilisateur</title>
    <link rel="stylesheet" type="text/css" href="css/adds.css">
</head>
<body>
<h1>Ajouter un Nouvel Utilisateur</h1>
<form action="<%= request.getContextPath() %>/addUser" method="post">
    <div>
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
    </div>
    <div>
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required>
    </div>
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div>
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div>
        <label for="role">Rôle:</label>
        <select id="role" name="role" required>
            <option value="Utilisateur">Utilisateur</option>
        </select>
    </div>
    <button type="submit">Ajouter</button>
</form>
<a href="<%= request.getContextPath() %>/gestionUsers.jsp" class="btn-retour">Retour</a>
</body>
</html>
