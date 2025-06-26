<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>
<%@ page import="sn.uasz.l2i.services.UserService" %>

<html>
<head>
    <title>Supprimer des Utilisateurs</title>
    <link rel="stylesheet" type="text/css" href="css/deletes.css">
</head>
<body>
<h1>Supprimer des Utilisateurs</h1>
<form action="<%= request.getContextPath() %>/deleteUser" method="post">
    <table>
        <thead>
        <tr>
            <th>Sélectionner</th>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null) {
                for (User user : users) {
        %>
        <tr>
            <td><input type="checkbox" name="userIds" value="<%= user.getId() %>"></td>
            <td><%= user.getId() %></td>
            <td><%= user.getNom() %></td>
            <td><%= user.getPrenom() %></td>
            <td><%= user.getEmail() %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <button type="submit">Supprimer</button>
</form>
<a href="<%= request.getContextPath() %>/gestionUsers.jsp" class="btn-retour">Retour</a>
</body>
</html>
