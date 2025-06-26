<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>

<html>
<head>
    <title>Liste des tecniciens</title>
    <style>
        body, h1, table, a {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color:  rgb(36, 121, 107);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #29682c;
            color: white;
        }

        tr:nth-child(even) {
            background-color:  rgb(36, 121, 107);
        }

        tr:hover {
            background-color:  rgb(36, 121, 107);
        }

        td {
            border-bottom: 1px solid #ddd;
            color: white;
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            padding: 10px 20px;
            background-color: rgb(51, 151, 134);
            border: 1px solid #ffffff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: rgb(78, 179, 162);
            color: white;
        }
        h1{
            color: white;
        }

        .btn-retour{
            color: white;
        }

    </style>
</head>
<body>
<h1>Liste des Techniciens</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Rôle</th>
    </tr>
    <%
        List<User> techniciensList = (List<User>) request.getAttribute("techniciensList");
        if (techniciensList != null) {
            for (User user : techniciensList) {
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
        }
    %>
</table>
<a class="btn-retour" href="gestionTechniciens.jsp">Retour</a>
</body>
</html>
