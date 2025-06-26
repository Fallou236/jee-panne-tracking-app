<%--
  Created by IntelliJ IDEA.
  User: Fallou
  Date: 29/07/2024
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>Ajouter un Technichien</title>
    <link rel="stylesheet" type="text/css" href="css/adds.css">
    <style>
        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            padding: 10px 20px;
            background-color: rgb(51, 151, 134);
            border: 1px solid #ffffff;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
            width: 55px;
        }

        a:hover {
            background-color: rgb(78, 179, 162);
            color: white;
        }
        .btn-retour{
            color: white;
        }
        h1{
            color: white;
        }

    </style>
</head>
<body>
<h1>Ajouter un Nouvel Technicien</h1>
<form action="<%= request.getContextPath() %>/addTech" method="post">
    <div>
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>
    </div>
    <div>
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required>
    </div>
    <div>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div>
        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div>
        <label for="role">Rôle:</label>
        <select id="role" name="role" required>
            <option value="Technician">Technician</option>
        </select>
    </div>
    <button type="submit">Ajouter</button>
</form>
<a class="btn-retour" href="<%= request.getContextPath() %>/gestionTechniciens.jsp">Retour</a>
</body>
</html>
