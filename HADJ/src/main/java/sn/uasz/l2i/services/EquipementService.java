package sn.uasz.l2i.services;

import jakarta.persistence.EntityManager;
import sn.uasz.l2i.dao.EquipementDAO;
import sn.uasz.l2i.models.Equipement;


import java.util.List;

public class EquipementService {
    private EntityManager em;
    private EquipementDAO equipementDAO;

    public EquipementService(EntityManager em) {
        this.em = em;
        this.equipementDAO = new EquipementDAO(em);
    }

    public List<Equipement> findAll() {
        return equipementDAO.findAll();
    }

    public Equipement find(Long id) {
        return equipementDAO.find(id);
    }

    public void save(Equipement equipement) {
        equipementDAO.save(equipement);
    }

    public void update(Equipement equipement) {
        equipementDAO.update(equipement);
    }

    public void delete(Equipement equipement) {
        equipementDAO.delete(equipement);
    }
}
