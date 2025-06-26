<%--
  Created by IntelliJ IDEA.
  User: Fallou
  Date: 30/07/2024
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Erreur</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/error.css">
</head>
<body>
<div class="error-container">
    <h1>Erreur</h1>
    <p>Une erreur s'est produite. Veuillez réessayer plus tard.</p>
    <a href="<%= request.getContextPath() %>/userHome.jsp">Retour à la page d'accueil</a>
</div>
</body>
</html>

