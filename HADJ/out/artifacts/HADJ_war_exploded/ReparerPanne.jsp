<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sn.uasz.l2i.models.Intervention" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Réparer une Panne</title>
    <style>
        body {
            margin: 0;
            background: rgb(36, 121, 107);
            font-family: Arial, sans-serif;
            font-weight: 100;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            margin-top: 0;
            color: #5f2c82;
            text-align: center;
        }

        .error-message {
            color: #ff0000;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
        }

        select, input {
            width: 100%;
            padding: 8px;
            margin: 5px 0 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            display: inline-block;
            padding: 10px 20px;
            background-color: rgb(27, 89, 78);
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: rgb(53, 152, 136);
        }

        .back-button {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #73dcca;
            text-decoration: none;
            padding: 10px;
            background-color: #f0f0f0;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Intervention pour réparer </h2>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <p class="error-message"><%= request.getAttribute("errorMessage") %></p>
    <a href="<%= request.getContextPath() %>/ConfirmInterventionServlet">Cliquez ici pour confirmer</a>
    <% } %>
    <form action="<%= request.getContextPath() %>/ReparerPanne" method="post">
        <label for="interventionId">Sélectionnez une intervention:</label>
        <select id="interventionId" name="interventionId" required>
            <%
                List<Intervention> interventions = (List<sn.uasz.l2i.models.Intervention>) request.getAttribute("interventions");
                for (sn.uasz.l2i.models.Intervention intervention : interventions) {
            %>
            <option value="<%= intervention.getId() %>"><%= intervention.getId() %> - <%= intervention.getPanne().getEquipement().getId() %>  <%= intervention.getPanne().getEquipement().getType() %> <%= intervention.getPanne().getEquipement().getBatiment() %> <%= intervention.getPanne().getEquipement().getSalle() %> - <%= intervention.getDetailsIntervention() %> </option>
            <%
                }
            %>
        </select>
        <label for="cout">Facture(Coût):</label>
        <input type="number" id="cout" name="cout" step="0.01" required>
        <br>
        <button type="submit">Enregistrer</button>
    </form>

    <a href="<%= request.getContextPath() %>/ConfirmInterventionServlet" class="back-button" >Retour</a>
</div>
</body>
</html>
