<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.Intervention" %>

<html>
<head>
    <title>Gérer les Interventions</title>
    <link rel="stylesheet" href="css/affiche.css" />
    <style>
        /* Style for the <h1> header */
        h1 {
            font-size: 2em;
            color: #ffffff;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
            font-family: 'Arial', sans-serif;
        }

        /* Style for the "Retour" button */
        a {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            text-align: center;
            background-color: rgb(52, 154, 137);
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-family: 'Arial', sans-serif;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgb(59, 138, 125);
        }

    </style>
</head>
<body>
<h1>Liste des Interventions</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Panne</th>
        <th>Technicien</th>
        <th>Date Intervention</th>
        <th>Facture</th>
        <th>Confirmer</th>
    </tr>
    <%
        List<Intervention> interventions = (List<Intervention>) request.getAttribute("interventions");
        if (interventions != null) {
            for (Intervention intervention : interventions) {

                if (intervention.getDateIntervention() != null) {
    %>
    <tr>
        <td><%= intervention.getId() %></td>
        <td><%= intervention.getPanne().getId() %></td>
        <td><%= intervention.getTechnicien().getId() %> - <%= intervention.getTechnicien().getPrenom() %> - <%= intervention.getTechnicien().getNom() %></td>
        <td><%= intervention.getDateIntervention() %></td>
        <td><%= intervention.getCout() %></td>
        <td class="confirmed">Confirmée</td>
    </tr>
    <%
                }
            }
        }
    %>
</table>
<a href="chefHome">Retour</a>
</body>
</html>
