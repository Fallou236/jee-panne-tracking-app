<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sn.uasz.l2i.models.Panne" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/chefHome.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
            integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />

    <style>
        /* Ajoutez ces styles à votre fichier CSS existant */

        /* Styles pour le message de bienvenue */
        .bienvenue {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 1s ease-out, transform 1s ease-out;
            color: white;
            font-size: 18px; /* Taille normale */
            text-align: center; /* Centrer le texte */
            margin: 20px 0; /* Espacement autour du message */
        }

        .bienvenue.visible {
            opacity: 1;
            transform: translateY(0);
        }


    </style>
</head>
<body>
<div class="Navigation">
    <a href="" class="Items">
        <i class="fa-brands fa-microsoft"></i>
        <span>APPEQUIPMENT UASZ</span>
    </a>
    <a href="UserHome" class="Items">
        <i class="fa-solid fa-tachometer-alt"></i>
        <span>Tableau de Bord</span>
    </a>
    <a href="<%= request.getContextPath() %>/ReportPanneServlet" class="Items">
        <i class="fa-solid fa-users-cog"></i>
        <span>Signaler une panne</span>
    </a>
    <a href="<%= request.getContextPath() %>/ConfirmReparationByUserServlet" class="Items">
        <i class="fa-solid fa-tools"></i>
        <span>Confirmer une reparation</span>
    </a>

    <a href="<%= request.getContextPath() %>/logout" class="Items">
        <i class="fa-solid fa-sign-out-alt"></i>
        <span>Se déconnecter</span>
    </a>
</div>

<div class="Main">
    <div class="Topbar">
        <div class="Gadget">
            <i class="fa-solid fa-bars Toggle"></i>
            <div class="Profil">
                <span><%= request.getAttribute("prenom")%> <%= request.getAttribute("nom")%></span>
                <div class="Profil__img">
                    <img src="images/toffallou.jpeg" alt="user" />
                </div>
            </div>
        </div>
    </div>

    <div class="Content">
        <div class="Content">
            <p class="bienvenue">
                Bonjour <%= request.getAttribute("prenom")%> <%= request.getAttribute("nom")%>, Bienvenue dans notre application de suivi de pannes des équipements informatiques de l'UASZ.
                Si vous voyez un équipement en panne, veuillez le signaler au chef afin qu'il puisse faire intervenir un technicien pour la réparation.
            </p>
        </div>

    </div>
</div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const bienvenueMessage = document.querySelector('.bienvenue');
        setTimeout(() => {
            bienvenueMessage.classList.add('visible');
        }, 1000); // Délai d'une seconde avant de déclencher l'animation
    });
</script>

<script src="js/Script.js"></script>
</body>
</html>
