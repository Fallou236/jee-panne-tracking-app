package sn.uasz.l2i.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import sn.uasz.l2i.models.Intervention;

import java.util.List;

public class InterventionDAO {
    private EntityManager em;

    public InterventionDAO(EntityManager em) {
        this.em = em;
    }

    public void save(Intervention intervention) {
        em.getTransaction().begin();
        em.persist(intervention);
        em.getTransaction().commit();
    }

    public Intervention find(Long id) {
        return em.find(Intervention.class, id);
    }

    public List<Intervention> findByTechnicianId(Long technicienId) {
        TypedQuery<Intervention> query = em.createQuery("SELECT i FROM Intervention i WHERE i.technicien.id = :technicienId", Intervention.class);
        query.setParameter("technicienId", technicienId);
        return query.getResultList();
    }

    public void update(Intervention intervention) {
        em.getTransaction().begin();
        em.merge(intervention);
        em.getTransaction().commit();
    }

    public List<Intervention> findAll() {
        TypedQuery<Intervention> query = em.createQuery("SELECT i FROM Intervention i", Intervention.class);
        return query.getResultList();
    }
}