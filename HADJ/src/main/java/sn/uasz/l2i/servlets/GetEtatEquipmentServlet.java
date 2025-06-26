package sn.uasz.l2i.servlets;

import sn.uasz.l2i.models.Equipement;
import sn.uasz.l2i.models.Panne;
import sn.uasz.l2i.services.EquipementService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import sn.uasz.l2i.persistence.PersistenceUtil;
import sn.uasz.l2i.services.PanneService;

import java.io.IOException;
import java.util.List;

public class GetEtatEquipmentServlet extends HttpServlet {
    private EquipementService equipementService;

    @Override
    public void init() throws ServletException {
        EntityManagerFactory emf = PersistenceUtil.getEMF();
        EntityManager em = emf.createEntityManager();
        equipementService = new EquipementService(em);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Equipement> equipements = equipementService.findAll();
        request.setAttribute("equipements", equipements);
        request.getRequestDispatcher("equipments.jsp").forward(request, response);
    }
}
