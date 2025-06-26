package sn.uasz.l2i.services;

import jakarta.persistence.EntityManager;
import sn.uasz.l2i.dao.PanneDAO;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.models.User;

import java.util.List;

public class PanneService {
    private PanneDAO panneDAO;
    private EntityManager em;

    public PanneService(EntityManager em) {
        this.panneDAO = new PanneDAO(em);
    }

    public Panne find(Long id) {
        return panneDAO.find(id);
    }

    public void save(Panne panne) {
        panneDAO.save(panne);
    }

    public void update(Panne panne) {
        panneDAO.update(panne);
    }

    public void delete(Panne panne) {
        panneDAO.delete(panne);
    }

    public List<Panne> findAll() {
        return panneDAO.findAll();
    }

    public List<Panne> findByUser(User user) {
        return panneDAO.findByUser(user);
    }

}
