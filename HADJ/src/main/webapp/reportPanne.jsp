<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.Equipement" %>
<%@ page import="sn.uasz.l2i.models.User" %>
<html>
<head>
    <title>Signaler une Panne</title>
    <link rel="stylesheet" type="text/css" href="css/Panne.css">
    <script>
        function handleSubmit(form) {
            form.submit();
            setTimeout(function() {
                window.location.href = 'validSignalPanne.jsp';
            }, 500);
        }
    </script>
</head>
<body>
<h1>Signaler une Panne</h1>
<form action="<%= request.getContextPath() %>/ReportPanneServlet" method="post">
    <input type="hidden" name="userId" value="<%= ((User) request.getSession().getAttribute("user")).getId() %>" />

    <label for="equipementId">Équipement:</label>
    <select name="equipementId" id="equipementId" required>
        <%
            List<Equipement> equipements = (List<Equipement>) request.getAttribute("equipements");
            if (equipements != null) {
                for (Equipement equipement : equipements) {
        %>
        <option value="<%= equipement.getId() %>">
            <%= equipement.getId() %> - <%= equipement.getType() %> - <%= equipement.getMarque() %> - <%= equipement.getBatiment() %> - <%= equipement.getSalle() %>
        </option>
        <%
                }
            }
        %>
    </select><br>

    <label for="description">Description:</label>
    <textarea name="description" id="description" required></textarea><br>

    <label for="dateSignalement">Date de Signalement:</label>
    <input type="date" name="dateSignalement" id="dateSignalement" required><br>


    <label for="etat">État:</label>
    <select name="etat" id="etat" required>
        <option value="Signalée">Signalée</option>
        <option value="En Cours">En Cours</option>
        <option value="Réparée">Réparée</option>
    </select><br>

    <button type="submit">Signaler la Panne</button>
</form>
<a class="back-button" href="<%= request.getContextPath() %>/UserHome">Retour</a>
</body>
</html>
