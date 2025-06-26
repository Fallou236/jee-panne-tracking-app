package sn.uasz.l2i.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import sn.uasz.l2i.models.Equipement;
import sn.uasz.l2i.models.Panne;

import java.util.List;

public class EquipementDAO {
    private EntityManager em;

    public EquipementDAO(EntityManager em) {
        this.em = em;
    }

    public List<Equipement> findAll() {
        return em.createQuery("SELECT e FROM Equipement e", Equipement.class).getResultList();
    }

    public Equipement find(Long id) {
        return em.find(Equipement.class, id);
    }

    public void save(Equipement equipement) {
        em.getTransaction().begin();
        em.persist(equipement);
        em.getTransaction().commit();
    }

    public void update(Equipement equipement) {
        em.getTransaction().begin();
        em.merge(equipement);
        em.getTransaction().commit();
    }

    public void delete(Equipement equipement) {
        em.getTransaction().begin();
        em.remove(em.contains(equipement) ? equipement : em.merge(equipement));
        em.getTransaction().commit();
    }

    public List<Panne> findPannesByEquipement(Equipement equipement) {
        TypedQuery<Panne> query = em.createQuery("SELECT p FROM Panne p WHERE p.equipement = :equipement", Panne.class);
        query.setParameter("equipement", equipement);
        return query.getResultList();
    }
}
