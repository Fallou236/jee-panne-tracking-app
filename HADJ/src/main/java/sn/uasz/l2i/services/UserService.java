package sn.uasz.l2i.services;

import sn.uasz.l2i.dao.UserDAO;
import sn.uasz.l2i.models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.List;

public class UserService {
    private EntityManager em;
    private UserDAO userDAO;

    public UserService(EntityManager em) {
        this.em = em;
        this.userDAO = new UserDAO(em);
    }

    public User find(Long id) {
        return userDAO.find(id);
    }

    public User findByEmailAndPassword(String email, String password) {
        try {
            return em.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password", User.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }


    public void save(User user) { userDAO.save(user); }

    public void update(User user) {
        userDAO.update(user);
    }

    public void delete(User user) {
        userDAO.delete(user);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    // Nouvelle méthode pour récupérer uniquement les utilisateurs avec le rôle "Utilisateur"
    public List<User> findAllUtilisateurs() {
        return em.createQuery("SELECT u FROM User u WHERE u.role = :role", User.class)
                .setParameter("role", "Utilisateur")
                .getResultList();
    }

    public List<User> findAllTechniciens() {
        return em.createQuery("SELECT u FROM User u WHERE u.role = :role", User.class)
                .setParameter("role", "Technician")
                .getResultList();
    }




}
