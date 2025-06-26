<%@ page import="sn.uasz.l2i.models.Intervention" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm Interventions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #ddd;
        }

        .confirm-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .confirm-button:hover {
            background-color: #45a049;
        }

        .confirmed-icon {
            color: #4CAF50;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Confirmer Interventions</h1>
    <table>
        <thead>
        <tr>
            <th>Panne</th>
            <th>Equipement</th>
            <th>Date</th>
            <th>Details Intervention</th>
            <th>Confirmation</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Intervention> interventions = (List<Intervention>) request.getAttribute("interventions");
            if (interventions == null || interventions.isEmpty()) {
        %>
        <tr>
            <td colspan="5">Pas d'intervention pour vous.</td>
        </tr>
        <%
        } else {
            for (Intervention intervention : interventions) {
        %>
        <tr>
            <td><%= intervention.getPanne().getId() %> - <%= intervention.getPanne().getDescription() %></td>
            <td><%= intervention.getPanne().getEquipement().getId() %> - <%= intervention.getPanne().getEquipement().getType() %> - <%= intervention.getPanne().getEquipement().getBatiment() %> - <%= intervention.getPanne().getEquipement().getSalle() %></td>
            <td><%= intervention.getDateIntervention() %></td>
            <td><%= intervention.getDetailsIntervention() %></td>
            <td>

                <%
                    if (intervention.isConfirmed()) {
                %>
                <span class="confirmed-icon">&#x2714;</span>
                <%
                } else {
                %>
                <form action="<%= request.getContextPath() %>/ConfirmInterventionServlet" method="post">
                    <input type="hidden" name="interventionId" value="<%= intervention.getId() %>">
                    <button type="submit" name="confirmed" value="true" class="confirm-button">Confirm</button>
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
</div>
</body>
</html>
