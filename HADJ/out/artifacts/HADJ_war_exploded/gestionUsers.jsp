<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/chefHome.css" />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <style>
        p{
            color: white;
        }
    </style>
</head>
<body>
<div class="Navigation">
    <a href="" class="Items">
        <i class="fa-brands fa-microsoft"></i>
        <span>APPEQUIPEMENT UASz</span>
    </a>
    <a href="chefHome" class="Items">
        <i class="fa-solid fa-dashboard"></i>
        <span>Tableau de Bord</span>
    </a>
    <a href="<%= request.getContextPath() %>/gestionUsers.jsp" class="Items">
        <i class="fa-solid fa-users-cog"></i>
        <span>Gestion utilisateurs</span>
    </a>
    <a href="<%= request.getContextPath() %>/gestionTechniciens.jsp" class="Items">
        <i class="fa-solid fa-tools"></i>
        <span>Gestion techniciens</span>
    </a>
    <a href="" class="Items">
        <i class="fa-solid fa-cogs"></i>
        <span>Suivi equipement</span>
    </a>
    <a href="<%= request.getContextPath() %>/TerminedInterventionServlet" class="Items">
        <i class="fa-solid fa-check-circle"></i>
        <span>Interventions terminées</span>
    </a>
    <a href="<%= request.getContextPath() %>/logout" class="Items">
        <i class="fa-solid fa-right-from-bracket"></i>
        <span>Se déconnecter</span>
    </a>
</div>

<div class="Main">
    <div class="Topbar">
        <div class="Gadget">
            <i class="fa-solid fa-bars Toggle"></i>
            <div class="Profil">
                <span>Fallou DIOUCK</span>
                <div class="Profil__img">
                    <img src="images/toffallou.jpeg" alt="user" />
                </div>
            </div>
        </div>
    </div>

    <div class="Content">
        <div class="General">
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-users"></i>
                </div>
                <div class="Info">
                    <a href="<%= request.getContextPath() %>/users"><p>Afficher les Utilisateurs</p></a>
                </div>
            </div>
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-user-plus"></i>
                </div>
                <div class="Info">
                    <a href="<%= request.getContextPath() %>/addUser.jsp"><p>Ajouter des Utilisateurs</p></a>
                </div>
            </div>
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-user-edit"></i>
                </div>
                <div class="Info">
                    <a href="<%= request.getContextPath() %>/UpdateUser.jsp"><p>Modifier des Utilisateurs</p></a>
                </div>
            </div>
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-user-times"></i>
                </div>
                <div class="Info">
                    <a href="<%= request.getContextPath() %>/deleteUser.jsp"><p>Supprimer des Utilisateurs</p></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/Script.js"></script>
</body>
</html>
