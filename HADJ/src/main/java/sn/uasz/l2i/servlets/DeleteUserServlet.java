package sn.uasz.l2i.servlets;

import sn.uasz.l2i.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.models.User;

import java.io.IOException;
import java.util.List;

public class DeleteUserServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> utilisateurs = userService.findAllUtilisateurs();
        request.setAttribute("users", utilisateurs);
        request.getRequestDispatcher("/deleteUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] userIds = request.getParameterValues("userIds");
        if (userIds != null) {
            for (String userIdStr : userIds) {
                Long userId = Long.parseLong(userIdStr);
                User user = userService.find(userId);
                if (user != null && "Utilisateur".equals(user.getRole())) {
                    userService.delete(user);
                }
            }
        }
        response.sendRedirect("deleteUser");
    }
}
