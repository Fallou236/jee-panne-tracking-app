<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>

<html>
<head>
    <title>Gérer les Utilisateurs</title>
    <link rel="stylesheet" href="css/affiche.css" />
</head>
<body>
<div class="container">
    <h1>Liste des Utilisateurs</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Rôle</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<User> userList = (List<User>) request.getAttribute("userList");
            if (userList != null && !userList.isEmpty()) {
                for (User user : userList) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getNom() %></td>
            <td><%= user.getPrenom() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getRole() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" style="text-align: center;">Aucun utilisateur trouvé</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <a href="gestionUsers.jsp" class="btn-retour">Retour</a>
</div>
</body>
</html>
