package sn.uasz.l2i.servlets;

import jakarta.servlet.http.HttpSession;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.PanneService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

import java.io.IOException;
import java.util.List;

public class ChefHomeServlet extends HttpServlet {
    private PanneService panneService;
    private EntityManager em;

    @Override
    public void init() throws ServletException {
        EntityManagerFactory emf = PersistenceUtil.getEMF();
        em = emf.createEntityManager();
        panneService = new PanneService(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Panne> pannes = panneService.findAll();

        long totalPannes = pannes.size();
        long pannesReparees = pannes.stream().filter(p -> "Réparée".equals(p.getEtat())).count();
        long pannesEnReparation = pannes.stream().filter(p -> "En cours".equals(p.getEtat())).count();
        long pannesSignalees = pannes.stream().filter(p -> "Signalée".equals(p.getEtat())).count();

        request.setAttribute("totalPannes", totalPannes);
        request.setAttribute("pannesReparees", pannesReparees);
        request.setAttribute("pannesEnReparation", pannesEnReparation);
        request.setAttribute("pannesSignalees", pannesSignalees);
        request.setAttribute("pannes", pannes);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String prenom = user.getPrenom();
        String nom = user.getNom();

        request.setAttribute("prenom", prenom);
        request.setAttribute("nom", nom);

        request.getRequestDispatcher("directeurHome.jsp").forward(request, response);
    }

    @Override
    public void destroy() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
