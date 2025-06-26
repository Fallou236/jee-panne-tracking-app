<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erreur - Signalement de Panne</title>
    <link rel="stylesheet" type="text/css" href="css/Confirm.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: rgb(36, 121, 107);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .error-icon {
            font-size: 50px;
            margin-bottom: 20px;
        }

        .error-message {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .btn-return {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff416c;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-return:hover {
            background-color: #ff4b2b;
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-icon">⚠️</div>
    <div class="error-message">L'équipement est en réparation.</div>
    <a href="<%= request.getContextPath() %>/UserHome" class="btn-return">Retour</a>
</div>
</body>
</html>