<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.Panne" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmer Réparation</title>
    <link rel="stylesheet" type="text/css" href="css/confirmReparation.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(36, 121, 107);
            color: #fff;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        thead {
            background-color: rgb(44, 136, 121);
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            text-align: left;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .confirmed-icon {
            color: green;
            font-size: 20px;
        }

        .error-message {
            color: red;
        }

        .confirm-button {
            padding: 10px;
            background-color: #55608f;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm-button:hover {
            background-color: #394264;
        }

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
<div class="container">
    <h1>Confirmer Réparation</h1>
    <table>
        <thead>
        <tr>
            <th>Panne</th>
            <th>Signalée par</th>
            <th>Équipement</th>
            <th>Description</th>
            <th>Date Signalement</th>
            <th>Date Intervention</th>
            <th>État</th>
            <th>Confirmation</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Panne> pannes = (List<Panne>) request.getAttribute("pannes");
            if (pannes == null || pannes.isEmpty()) {
        %>
        <tr>
            <td colspan="8">Vous n'avez signalé aucune panne pour le moment!</td>
        </tr>
        <%
        } else {
            for (Panne panne : pannes) {
        %>
        <tr>
            <td><%= panne.getId() %></td>
            <td><%= panne.getUser().getId() %> - <%= panne.getUser().getPrenom() %> - <%= panne.getUser().getNom() %></td>
            <td><%= panne.getEquipement().getId() %> - <%= panne.getEquipement().getType() %> - <%= panne.getEquipement().getBatiment() %> - <%= panne.getEquipement().getSalle() %></td>
            <td><%= panne.getDescription() %></td>
            <td><%= panne.getDateSignalement() %></td>
            <td><%= panne.getDateIntervention() %></td>
            <td><%= panne.getEtat() %></td>
            <td>
                <%
                    if ("Réparée".equals(panne.getEtat())) {
                        if (Boolean.TRUE.equals(panne.isRepared())) {
                %>
                <span class="confirmed-icon">&#x2714;</span>
                <%
                } else {
                %>
                <form action="<%= request.getContextPath() %>/ConfirmReparationByUserServlet" method="post">
                    <input type="hidden" name="panneId" value="<%= panne.getId() %>">
                    <button type="submit" name="repared" value="true" class="confirm-button">Confirmer</button>
                </form>
                <%
                    }
                } else {
                %>
                <span class="error-message">Cette panne n'est pas encore réparée, vous ne pouvez pas confirmer la réparation.</span>
                <%
                    }
                %>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>

    </table>
    <a href="UserHome" class="btn-retour">Retour</a>
</div>
</body>
</html>
