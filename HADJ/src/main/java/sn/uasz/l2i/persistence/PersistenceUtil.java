package sn.uasz.l2i.persistence;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class PersistenceUtil {

    private static final EntityManagerFactory emf;

    static {
        emf = Persistence.createEntityManagerFactory("demojpa-pu");
    }

    public static EntityManagerFactory getEMF() {
        return emf;
    }

}
