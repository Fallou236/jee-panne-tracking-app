package sn.uasz.l2i.servlets;

import jakarta.persistence.TypedQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.uasz.l2i.services.PanneService;
import sn.uasz.l2i.services.UserService;
import sn.uasz.l2i.services.InterventionService;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.models.Intervention;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

import java.io.IOException;
import java.util.List;

public class ManageInterventionServlet extends HttpServlet {
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
            PanneService panneService = new PanneService(em);
            UserService userService = new UserService(em);

            List<Panne> pannes = panneService.findAll();
            List<User> techniciens = userService.findAllTechniciens();

            request.setAttribute("pannes", pannes);
            request.setAttribute("techniciens", techniciens);

            request.getRequestDispatcher("/manageInterventions.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            InterventionService interventionService = new InterventionService(em);

            Long panneId = Long.parseLong(request.getParameter("panneId"));
            Long technicienId = Long.parseLong(request.getParameter("technicienId"));
            String details = request.getParameter("details");

            Panne panne = em.find(Panne.class, panneId);
            User technicien = em.find(User.class, technicienId);

            if (panne == null || technicien == null) {
                request.setAttribute("error", "Panne invalide ou technicien sélectionné.");
                request.getRequestDispatcher("/manageInterventions.jsp").forward(request, response);
                return;
            }

            if ("En cours".equals(panne.getEtat())) {
                response.sendRedirect(request.getContextPath() + "/manageError.jsp");
                return;
            }

            if ("Réparée".equals(panne.getEtat())) {
                response.sendRedirect(request.getContextPath() + "/manageError2.jsp");
                return;
            }

            TypedQuery<Intervention> query = em.createQuery(
                    "SELECT i FROM Intervention i WHERE i.panne = :panne", Intervention.class);
            query.setParameter("panne", panne);
            List<Intervention> interventions = query.getResultList();

            if (!interventions.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/manageError3.jsp");
                return;
            }


            Intervention intervention = new Intervention();
            intervention.setPanne(panne);
            intervention.setTechnicien(technicien);
            //On met la date a null
            intervention.setDetailsIntervention(details);
            intervention.setCout(0.0);
            intervention.setConfirmed(false);

            interventionService.save(intervention);

            response.sendRedirect("validIntervention.jsp");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
            request.getRequestDispatcher("/manageInterventions.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

}
