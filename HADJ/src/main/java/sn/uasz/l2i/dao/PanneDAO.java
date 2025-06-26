package sn.uasz.l2i.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;

import java.util.List;

public class PanneDAO {
    private EntityManager em;

    public PanneDAO(EntityManager em) {
        this.em = em;
    }

    public Panne find(Long id) {
        return em.find(Panne.class, id);
    }

    public void save(Panne panne) {
        try {
            em.getTransaction().begin();
            em.persist(panne);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void update(Panne panne) {
        try {
            em.getTransaction().begin();
            em.merge(panne);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void delete(Panne panne) {
        try {
            em.getTransaction().begin();
            em.remove(em.contains(panne) ? panne : em.merge(panne));
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<Panne> findAll() {
        TypedQuery<Panne> query = em.createQuery("SELECT p FROM Panne p", Panne.class);
        return query.getResultList();
    }

    public List<Panne> findByUser(User user) {
        TypedQuery<Panne> query = em.createQuery("SELECT p FROM Panne p WHERE p.user = :user", Panne.class);
        query.setParameter("user", user);
        return query.getResultList();
    }
}
