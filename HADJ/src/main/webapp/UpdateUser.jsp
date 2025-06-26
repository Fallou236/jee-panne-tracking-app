<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>
<%@ page import="sn.uasz.l2i.services.UserService" %>
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="jakarta.persistence.EntityManagerFactory" %>
<%@ page import="sn.uasz.l2i.persistence.PersistenceUtil" %>

<%
    EntityManagerFactory emf = PersistenceUtil.getEMF();
    EntityManager em = emf.createEntityManager();
    UserService userService = new UserService(em);
    List<User> userList = userService.findAllUtilisateurs();
    em.close(); // Ferme l'EntityManager
%>

<html>
<head>
    <title>Modifier des Utilisateurs</title>
    <link rel="stylesheet" type="text/css" href="css/update.css">
</head>
<body>
<h1>Modifier des Utilisateurs</h1>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<% if (request.getAttribute("success") != null) { %>
<p style="color:green;"><%= request.getAttribute("success") %></p>
<% } %>

<form method="post" action="<%= request.getContextPath() %>/UpdateUserServlet">
    <label for="userSelect">Sélectionner un utilisateur à modifier:</label>
    <select id="userSelect" name="userId" required>
        <% for (User user : userList) { %>
        <option value="<%= user.getId() %>"><%= user.getId() %> - <%= user.getNom() %> <%= user.getPrenom() %></option>
        <% } %>
    </select>
    <br><br>
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
        <label for="password">Mot de passe (laisser vide pour ne pas changer):</label>
        <input type="password" id="password" name="password">
    </div>
    <div>
        <label for="role">Rôle:</label>
        <select id="role" name="role" required>
            <option value="Utilisateur">Utilisateur</option>
            <!-- Ajouter d'autres rôles ici si nécessaire -->
        </select>
    </div>
    <button type="submit">Mettre à jour</button>
</form>
<a href="<%= request.getContextPath() %>/gestionUsers.jsp" class="btn-retour" >Retour</a>
</body>
</html>
