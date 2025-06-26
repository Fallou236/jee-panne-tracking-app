package sn.uasz.l2i.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.services.PanneService;

import java.io.IOException;
import java.util.List;

public class ConfirmReparationByUserServlet extends HttpServlet {
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
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            List<Panne> pannes = panneService.findByUser(user);

            request.setAttribute("pannes", pannes);
            request.getRequestDispatcher("/confirmReparationByUser.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            PanneService panneService = new PanneService(em);

            String panneIdStr = request.getParameter("panneId");
            if (panneIdStr != null && !panneIdStr.isEmpty()) {
                Long panneId = Long.parseLong(panneIdStr);
                boolean repared = Boolean.parseBoolean(request.getParameter("repared"));

                Panne panne = panneService.find(panneId);
                if (panne != null) {
                    panne.setRepared(repared);
                    panneService.update(panne);
                }
            }

            response.sendRedirect("validConfirmReparation.jsp");
        } finally {
            em.close();
        }
    }
}
