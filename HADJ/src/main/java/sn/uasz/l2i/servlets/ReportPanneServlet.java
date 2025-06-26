package sn.uasz.l2i.servlets;

import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.models.Equipement;
import sn.uasz.l2i.services.PanneService;
import sn.uasz.l2i.services.EquipementService;
import sn.uasz.l2i.persistence.PersistenceUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ReportPanneServlet extends HttpServlet {
    private PanneService panneService;
    private EquipementService equipementService;

    @Override
    public void init() throws ServletException {
        EntityManagerFactory emf = PersistenceUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        panneService = new PanneService(em);
        equipementService = new EquipementService(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Equipement> equipements = equipementService.findAll();
        request.setAttribute("equipements", equipements);
        request.getRequestDispatcher("/reportPanne.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Long equipementId = Long.parseLong(request.getParameter("equipementId"));
        String description = request.getParameter("description");
        Date dateSignalement = java.sql.Date.valueOf(request.getParameter("dateSignalement"));
        String etat = request.getParameter("etat");



        Equipement equipement = equipementService.find(equipementId);
        if (equipement.getEtat().equals("En panne")) {
            response.sendRedirect(request.getContextPath() + "/panneError.jsp");
            return;
        }

        if (equipement.getEtat().equals("En cours")) {
            response.sendRedirect(request.getContextPath() + "/panneError2.jsp");
            return;
        }

        Panne panne = new Panne();
        panne.setUser(user);
        panne.setEquipement(equipementService.find(equipementId));
        panne.setDescription(description);
        panne.setDateSignalement(dateSignalement);
        panne.setEtat(etat);
        panne.setRepared(false);

        panneService.save(panne);

        equipement.setEtat("En panne");
        equipementService.update(equipement);

        response.sendRedirect(request.getContextPath() + "/validSignalPanne.jsp");
    }
}
