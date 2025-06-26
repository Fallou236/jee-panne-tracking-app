package sn.uasz.l2i.services;

import jakarta.persistence.EntityManager;
import sn.uasz.l2i.dao.InterventionDAO;
import sn.uasz.l2i.models.Intervention;

import java.util.List;

public class InterventionService {
    private InterventionDAO interventionDAO;

    public InterventionService(EntityManager em) {
        this.interventionDAO = new InterventionDAO(em);
    }

    public void save(Intervention intervention) {
        interventionDAO.save(intervention);
    }

    public Intervention find(Long id) {
        return interventionDAO.find(id);
    }

    public List<Intervention> findByTechnicianId(Long technicienId) {
        return interventionDAO.findByTechnicianId(technicienId);
    }

    public List<Intervention> findAll() {
        return interventionDAO.findAll();
    }

    public void update(Intervention intervention) {
        interventionDAO.update(intervention);
    }
}
