package sn.uasz.l2i.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sn.uasz.l2i.models.Equipement;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.EquipementService;
import sn.uasz.l2i.services.InterventionService;
import sn.uasz.l2i.models.Intervention;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.services.PanneService;

import java.io.IOException;
import java.util.List;

public class CloseSignalPanneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        try {
            emf = PersistenceUtil.getEMF();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize JPA EntityManagerFactory", e);
        }
    }

    @Override
    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            InterventionService interventionService = new InterventionService(em);
            // Get the list of interventions for the logged-in technician
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Long technicienId = user.getId();
            List<Intervention> interventions = interventionService.findByTechnicianId(technicienId);

            if (interventions == null || interventions.isEmpty()) {
                System.out.println("Pas d'intervention pour vous  !: " + technicienId);
            } else {
                System.out.println("Found " + interventions.size() + " interventions pour technicien ID: " + technicienId);
            }

            request.setAttribute("interventions", interventions);
            request.getRequestDispatcher("/closeSignalPanne.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            InterventionService interventionService = new InterventionService(em);
            PanneService panneService = new PanneService(em);
            EquipementService equipementService = new EquipementService(em);

            Long interventionId = Long.parseLong(request.getParameter("interventionId"));

            Intervention intervention = interventionService.find(interventionId);
            if (intervention != null) {
                Panne panne = panneService.find(intervention.getPanne().getId());
                panne.setEtat("Réparée");
                panneService.update(panne);

                //On met a jour l'etat de l'equipement
                Equipement equipement = equipementService.find(intervention.getPanne().getEquipement().getId());
                equipement.setEtat("Fonctionel");
                equipementService.update(equipement);
            }

            response.sendRedirect("validation.jsp");
        } finally {
            em.close();
        }
    }
}
