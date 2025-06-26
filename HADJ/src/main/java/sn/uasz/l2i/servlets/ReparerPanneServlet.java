package sn.uasz.l2i.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sn.uasz.l2i.dao.EquipementDAO;
import sn.uasz.l2i.models.Equipement;
import sn.uasz.l2i.models.Intervention;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.EquipementService;
import sn.uasz.l2i.services.InterventionService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.servlet.http.HttpSession;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.services.PanneService;

import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ReparerPanneServlet extends HttpServlet {
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
                System.out.println("Pas d'intervention pour vous!: " + technicienId);
            } else {
                System.out.println("Found " + interventions.size() + " interventions for technician ID: " + technicienId);
            }

            request.setAttribute("interventions", interventions);
            request.getRequestDispatcher("/ReparerPanne.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            InterventionService interventionService = new InterventionService(em);
            PanneService  panneService = new PanneService(em);
            EquipementService equipementService = new EquipementService(em);

            Long interventionId = Long.parseLong(request.getParameter("interventionId"));
            double cout = Double.parseDouble(request.getParameter("cout"));

            Intervention intervention = interventionService.find(interventionId);
            if (intervention != null && intervention.isConfirmed()) {
                intervention.setDateIntervention(new Date());
                intervention.setCout(cout);
                interventionService.update(intervention);

                //On met a jour l'etat de la panne
                Panne panne = panneService.find(intervention.getPanne().getId());
                panne.setEtat("En Cours");
                panne.setDateIntervention(new Date());
                panneService.update(panne);

                //On met a jour l'etat de l'equipement
                Equipement equipement = equipementService.find(intervention.getPanne().getEquipement().getId());
                equipement.setEtat("En Réparation");
                equipementService.update(equipement);

                response.sendRedirect("validReparer.jsp");
            } else {

                request.setAttribute("errorMessage", "L'intervention n'est pas confirmée. Veuillez confirmer la prise en charge d'abord.");
                doGet(request, response);
            }
        } finally {
            em.close();
        }
    }
}
