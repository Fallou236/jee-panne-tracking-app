<%@ page import="sn.uasz.l2i.models.Intervention" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cloturer un signalement</title>
    <script>
        function handleSubmit(form) {
            form.submit();
            setTimeout(function() {
                window.location.href = 'validation.jsp';
            }, 500);
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(36, 121, 107)
            color: #fff;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #fff;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        thead th {
            background-color: rgb(62, 142, 128);
            color: #fff;
        }

        tbody tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .confirm-button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm-button:hover {
            background-color: #218838;
        }

        .confirmed-icon {
            color: #28a745;
            font-size: 20px;
        }

        form {
            display: inline;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            background-color: rgb(14, 74, 65);
            padding: 10px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: rgb(57, 168, 150);
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
    <h1>Cloturer un signalement</h1>
    <table border="1">
        <thead>
        <tr>
            <th>ID Panne</th>
            <th>Signalé Par</th>
            <th>Equipement</th>
            <th>Description</th>
            <th>Date Signalement</th>
            <th>Date Intervention</th>
            <th>Etat</th>
            <th>Cloturer</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Intervention> interventions = (List<Intervention>) request.getAttribute("interventions");
            if (interventions == null || interventions.isEmpty()) {
        %>
        <tr>
            <td colspan="8">Pas d'intervention pour vous.</td>
        </tr>
        <%
        } else {
            for (Intervention intervention : interventions) {
        %>
        <tr>
            <td><%= intervention.getPanne().getId() %></td>
            <td><%= intervention.getPanne().getUser().getId() %> - <%= intervention.getPanne().getUser().getPrenom() %> - <%= intervention.getPanne().getUser().getNom() %></td>
            <td><%= intervention.getPanne().getEquipement().getId() %> - <%= intervention.getPanne().getEquipement().getType() %> - <%= intervention.getPanne().getEquipement().getBatiment() %> - <%= intervention.getPanne().getEquipement().getSalle() %></td>
            <td><%= intervention.getPanne().getDescription() %></td>
            <td><%= intervention.getPanne().getDateSignalement() %></td>
            <td><%= intervention.getDateIntervention() %></td>
            <td><%= intervention.getPanne().getEtat() %></td>
            <td>
                <%
                    if (intervention.getPanne().getEtat().equals("Réparée")) {
                %>
                <span class="confirmed-icon">&#x2714;</span>
                <%
                } else {
                %>
                <form action="<%= request.getContextPath() %>/CloseSignalPanneServlet" method="post" onsubmit="handleSubmit(this); return false;">
                    <input type="hidden" name="interventionId" value="<%= intervention.getId() %>">
                    <button type="submit" name="confirmed" value="true" class="confirm-button">Cloturer</button>
                </form>
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
    <a href="ConfirmInterventionServlet" class="btn-retour">Retour</a>
</div>
</body>
</html>
