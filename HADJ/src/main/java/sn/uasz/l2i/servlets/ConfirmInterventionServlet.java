package sn.uasz.l2i.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.InterventionService;
import sn.uasz.l2i.models.Intervention;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

import java.io.IOException;
import java.util.List;

public class ConfirmInterventionServlet extends HttpServlet {
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

            String prenom = user.getPrenom();
            String nom = user.getNom();

            request.setAttribute("prenom", prenom);
            request.setAttribute("nom", nom);

            Long technicienId = user.getId();
            List<Intervention> interventions = interventionService.findByTechnicianId(technicienId);

            if (interventions == null || interventions.isEmpty()) {
                System.out.println("Pas d'intervention pour vous  !: " + technicienId);
            } else {
                System.out.println("Found " + interventions.size() + " interventions for technician ID: " + technicienId);
            }

            request.setAttribute("interventions", interventions);
            request.getRequestDispatcher("/technicianHome.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            InterventionService interventionService = new InterventionService(em);

            Long interventionId = Long.parseLong(request.getParameter("interventionId"));
            boolean confirmed = Boolean.parseBoolean(request.getParameter("confirmed"));

            Intervention intervention = interventionService.find(interventionId);
            if (intervention != null) {
                intervention.setConfirmed(confirmed);
                interventionService.update(intervention);
            }

            response.sendRedirect("validConfirmIntervention.jsp");
        } finally {
            em.close();
        }
    }
}
