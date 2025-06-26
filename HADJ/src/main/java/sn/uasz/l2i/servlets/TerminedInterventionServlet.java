package sn.uasz.l2i.servlets;

import sn.uasz.l2i.models.Intervention;
import sn.uasz.l2i.services.InterventionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

import java.io.IOException;
import java.util.List;

public class TerminedInterventionServlet extends HttpServlet {
    private InterventionService interventionService;

    @Override
    public void init() throws ServletException {
        EntityManagerFactory emf = PersistenceUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        interventionService = new InterventionService(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Intervention> interventions = interventionService.findAll();
        request.setAttribute("interventions", interventions);
        request.getRequestDispatcher("interventions.jsp").forward(request, response);
    }
}
