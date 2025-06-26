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
        /* ======================Button==================== */

        .Other .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 20px 0;
            background: var(--color-2);
            color: var(--color-3);
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            border: none;
            border-radius: 5px;
            box-shadow: var(--shadow);
            cursor: pointer;
            transition: background 0.3s, color 0.3s;
        }

        .Other .btn:hover {
            background: var(--color-1);
            color: var(--color-3);
        }

        .Other .btn a {
            color: var(--color-3);
            text-decoration: none;
            display: block;
        }

        .Other .btn a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<div class="Navigation">
    <a href="" class="Items">
        <i class="fa-brands fa-microsoft"></i>
        <span>APPEQUIPMENT UASZ</span>
    </a>
    <a href="chefHome" class="Items">
        <i class="fa-solid fa-tachometer-alt"></i>
        <span>Tableau de Bord</span>
    </a>
    <a href="<%= request.getContextPath() %>/gestionUsers.jsp" class="Items">
        <i class="fa-solid fa-users-cog"></i>
        <span>Gestion utilisateurs</span>
    </a>
    <a href="<%= request.getContextPath() %>/gestionTechniciens.jsp" class="Items">
        <i class="fa-solid fa-tools"></i>
        <span>Gestion technicien</span>
    </a>
    <a href="<%= request.getContextPath() %>/GetEtatEquipmentServlet" class="Items">
        <i class="fa-solid fa-cogs"></i>
        <span>Suivi équipements</span>
    </a>
    <a href="<%= request.getContextPath() %>/TerminedInterventionServlet" class="Items">
        <i class="fa-solid fa-check-circle"></i>
        <span>Interventions terminées</span>
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
        <div class="General">
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-exclamation-triangle"></i>
                </div>
                <div class="Info">
                    <p>Nombre de panne: <%= request.getAttribute("totalPannes") %></p>
                </div>
            </div>

            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-wrench"></i>
                </div>
                <div class="Info">
                    <p>Pannes reparées: <%= request.getAttribute("pannesReparees") %></p>
                </div>
            </div>
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-tools"></i>
                </div>
                <div class="Info">
                    <p>Panne en reparation: <%= request.getAttribute("pannesEnReparation") %></p>
                </div>
            </div>
            <div class="Box">
                <div class="Icon">
                    <i class="fa-solid fa-bullhorn"></i>
                </div>
                <div class="Info">
                    <p>Panne signalées: <%= request.getAttribute("pannesSignalees") %></p>
                </div>
            </div>
        </div>
    </div>
    <br><br>

    <div class="Other">
        <table>
            <thead>
            <tr>
                <td>ID Panne</td>
                <td>Equipement</td>
                <td>Signaler par</td>
                <td>Description</td>
                <td>Date signalement</td>
                <td>Date intervention</td>
                <td>Etat</td>
                <td>Confirmation</td>
            </tr>
            </thead>
            <tbody>
            <%
                List<Panne> pannes = (List<Panne>) request.getAttribute("pannes");
                if (pannes != null) {
                    for (Panne panne : pannes) {
            %>
            <tr>
                <td><%= panne.getId() %></td>
                <td><%= panne.getEquipement().getId() %> - <%= panne.getEquipement().getBatiment() %> - <%= panne.getEquipement().getSalle() %></td>
                <td><%= panne.getUser().getId() %> - <%= panne.getUser().getPrenom() %> - <%= panne.getUser().getNom() %></td>
                <td><%= panne.getDescription() %></td>
                <td><%= panne.getDateSignalement() %></td>
                <td><%= panne.getDateIntervention() %></td>
                <td><%= panne.getEtat() %></td>
                <td style="color: <%= panne.isRepared() ? "white" : "red" %>;">
                    <%= panne.isRepared() ? "Confirmé" : "Non confirmé" %>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
            <button class="btn"><a href="<%= request.getContextPath() %>/ManageInterventionServlet">Repartir les interventions</a></button>
        </table>
    </div>
</div>
</div>
<script src="js/Script.js"></script>
</body>
</html>
