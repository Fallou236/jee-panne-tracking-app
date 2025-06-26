<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>
<%@ page import="sn.uasz.l2i.services.UserService" %>

<html>
<head>
    <title>Supprimer des Techniciens</title>
    <link rel="stylesheet" type="text/css" href="css/deletes.css">
</head>
<body>
<h1>Supprimer des Techniciens</h1>
<form action="<%= request.getContextPath() %>/deleteTechnicien" method="post">
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
            List<User> techniciens = (List<User>) request.getAttribute("techniciens");
            if (techniciens != null) {
                for (User technicien : techniciens) {
        %>
        <tr>
            <td><input type="checkbox" name="techniciensIds" value="<%= technicien.getId() %>"></td>
            <td><%= technicien.getId() %></td>
            <td><%= technicien.getNom() %></td>
            <td><%= technicien.getPrenom() %></td>
            <td><%= technicien.getEmail() %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <button type="submit">Supprimer</button>
</form>
<a href="<%= request.getContextPath() %>/gestionTechniciens.jsp">Retour</a>
</body>
</html>
