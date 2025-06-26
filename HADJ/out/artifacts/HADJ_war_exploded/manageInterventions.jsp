<%@ page import="sn.uasz.l2i.models.Panne" %>
<%@ page import="java.util.List" %>
<%@ page import="sn.uasz.l2i.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Manage Interventions</title>
  <link rel="stylesheet" type="text/css" href="css/manageIntervention.css">
</head>
<body>
<h1>Liste des pannes</h1>
<%
  String error = (String) request.getAttribute("error");
  if (error != null) {
%>
<p style="color: red;"><%= error %></p>
<%
  }
%>
<table border="1">
  <tr>
    <th>ID Panne</th>
    <th>Signalé Par</th>
    <th>Equipement</th>
    <th>Description</th>
    <th>Date Signalement</th>
    <th>Date Intervention</th>
    <th>Etat</th>
    <th>Confirmation</th>
  </tr>
  <%
    List<Panne> pannes = (List<Panne>) request.getAttribute("pannes");
    if (pannes != null) {
      for (Panne panne : pannes) {
  %>
  <tr>
    <td><%= panne.getId() %></td>
    <td><%= panne.getUser().getId() %> - <%= panne.getUser().getPrenom() %> - <%= panne.getUser().getNom() %></td>
    <td><%= panne.getEquipement().getId() %> - <%= panne.getEquipement().getBatiment() %> - <%= panne.getEquipement().getSalle() %></td>
    <td><%= panne.getDescription() %></td>
    <td><%= panne.getDateSignalement() %></td>
    <td><%= panne.getDateIntervention() %></td>
    <td><%= panne.getEtat()%></td>
    <td style="color: <%= panne.isRepared() ? "green" : "red" %>;">
      <%= panne.isRepared() ? "Confirmé" : "Non confirmé" %>
    </td>
  </tr>
  <%
      }
    }
  %>
</table>
<h1>Gestions des Interventions</h1>
<form action="<%= request.getContextPath() %>/ManageInterventionServlet" method="post">
  <label for="panneId">Selectionner une Panne:</label>
  <select id="panneId" name="panneId">
    <%
      List<Panne> panneList = (List<Panne>) request.getAttribute("pannes");
      if (panneList != null) {
        for (Panne panne : panneList) {
    %>
    <option value="<%= panne.getId() %>">
      <%= panne.getId() %> -
      <%= panne.getDescription() %> -
      <%= panne.getEquipement().getType() %> -
      <%= panne.getEquipement().getModele() %> -
      <%= panne.getEquipement().getBatiment() %> -
      <%= panne.getEquipement().getSalle() %>
    </option>
    <%
        }
      }
    %>
  </select>

  <label for="technicienId">Selectionner un Technicien:</label>
  <select id="technicienId" name="technicienId">
    <%
      List<User> techniciens = (List<User>) request.getAttribute("techniciens");
      if (techniciens != null) {
        for (User technicien : techniciens) {
    %>
    <option value="<%= technicien.getId() %>">
      <%= technicien.getId() %> -
      <%= technicien.getNom() %> - <%= technicien.getPrenom() %>
    </option>
    <%
        }
      }
    %>
  </select>

  <label for="details">Details:</label>
  <textarea id="details" name="details" required></textarea>

  <button type="submit">Envoyer</button>
</form>
<a href="chefHome" class="btn-retour">Retour</a>
</body>
</html>
