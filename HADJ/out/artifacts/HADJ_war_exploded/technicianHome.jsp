<%@ page import="sn.uasz.l2i.models.Intervention" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        h2{
            color: white;
        }
    </style>
    <script>
        function handleSubmit(form) {
            form.submit();
            setTimeout(function() {
                window.location.href = 'validation.jsp';
            }, 500);
        }
    </script>
</head>
<body>
<div class="Navigation">
    <a href="" class="Items">
        <i class="fa-brands fa-microsoft"></i>
        <span>APPEQUIPMENT UASZ</span>
    </a>
    <a href="technicienHome" class="Items">
        <i class="fa-solid fa-tachometer-alt"></i>
        <span>Tableau de Bord</span>
    </a>
    <a href="<%= request.getContextPath() %>/ReparerPanne" class="Items">
        <i class="fa-solid fa-tools"></i>
        <span>Intervenir pour reparer panne</span>
    </a>
    <a href="<%= request.getContextPath() %>/CloseSignalPanneServlet" class="Items">
        <i class="fa-solid fa-tools"></i>
        <span>Cloturer un signalement</span>
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
        </div>
    </div>

    <div class="Other">
        <h2>Interventions pour <%= request.getAttribute("prenom")%> <%= request.getAttribute("nom")%> </h2>
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
</div>
</div>
<script src="js/Script.js"></script>
</body>
</html>
