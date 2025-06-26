<%@ page import="sn.uasz.l2i.models.Panne" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.Equipement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suivi Equipements</title>
    <link rel="stylesheet" type="text/css" href="css/manageIntervention.css">
    <style>
        .btn-retour {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: rgb(78, 191, 173);
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-retour:hover {
            background-color: rgb(121, 213, 197);
        }
    </style>
</head>
<body>
<h1>Liste des equipements</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Type</th>
        <th>Marque</th>
        <th>Modele</th>
        <th>Batiment</th>
        <th>Salle</th>
        <th>Etat</th>
    </tr>
    <%
        List<Equipement> equipements = (List<Equipement>) request.getAttribute("equipements");
        if (equipements != null) {
            for (Equipement equipement : equipements) {
    %>
    <tr>
        <td><%= equipement.getId() %></td>
        <td><%= equipement.getType() %></td>
        <td><%= equipement.getMarque() %></td>
        <td><%= equipement.getModele() %></td>
        <td><%= equipement.getBatiment() %></td>
        <td><%= equipement.getSalle() %></td>
        <td><%= equipement.getEtat()%></td>
    </tr>
    <%
            }
        }
    %>
</table>
<a href="chefHome" class="btn-retour">Retour</a>
</body>
</html>
