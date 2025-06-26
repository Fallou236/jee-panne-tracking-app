package sn.uasz.l2i.servlets;

import sn.uasz.l2i.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.models.User;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        try {
            emf = PersistenceUtil.getEMF();
            EntityManager em = emf.createEntityManager();
            userService = new UserService(em);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.findByEmailAndPassword(email, password);

        if (user != null) {
            request.getSession().setAttribute("user", user);
            String role = user.getRole();
            if ("ChefDeService".equals(role)) {
                response.sendRedirect("chefHome");
            } else if ("Technician".equals(role)) {
                response.sendRedirect("ConfirmInterventionServlet");
            } else {
                response.sendRedirect("UserHome");
            }
        } else {
            request.setAttribute("errorMessage", "Email ou Mot de passe incorrect !");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
