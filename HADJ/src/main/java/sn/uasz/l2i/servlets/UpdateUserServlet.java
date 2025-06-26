package sn.uasz.l2i.servlets;

import sn.uasz.l2i.models.User;
import sn.uasz.l2i.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;

public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = PersistenceUtil.getEMF();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userId"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        EntityManager em = emf.createEntityManager();
        UserService userService = new UserService(em);

        try {
            User user = userService.find(userId);
            if (user != null) {
                user.setNom(nom);
                user.setPrenom(prenom);
                user.setEmail(email);
                user.setRole(role);
                userService.update(user);
                request.setAttribute("success", "Utilisateur modifié avec succès.");
            } else {
                request.setAttribute("error", "Utilisateur non trouvé.");
            }
            request.getRequestDispatcher("/UpdateUser.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Une erreur est survenue lors de la modification de l'utilisateur.");
            request.getRequestDispatcher("/UpdateUser.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        if (emf != null) {
            emf.close();
        }
    }
}
