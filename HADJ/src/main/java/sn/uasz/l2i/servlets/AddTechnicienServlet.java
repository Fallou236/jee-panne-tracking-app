package sn.uasz.l2i.servlets;

import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

import java.io.IOException;

public class AddTechnicienServlet extends HttpServlet {
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
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setNom(nom);
        user.setPrenom(prenom);
        user.setEmail(email);
        user.setPassword(password);  // Hash the password here if you are using hashing
        user.setRole(role);

        userService.save(user);

        response.sendRedirect(request.getContextPath() + "/validAddTechnicien.jsp");
    }
}
