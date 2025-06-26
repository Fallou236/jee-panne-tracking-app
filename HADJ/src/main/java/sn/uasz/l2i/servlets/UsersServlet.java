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
import java.util.List;

public class UsersServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        EntityManagerFactory emf = PersistenceUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        userService = new UserService(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.findAllUtilisateurs();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("users.jsp").forward(request, response);
    }
}
