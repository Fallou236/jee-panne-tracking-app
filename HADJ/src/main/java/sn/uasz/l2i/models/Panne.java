package sn.uasz.l2i.models;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Panne {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private Equipement equipement;

    private String description;
    private Date dateSignalement;
    private Date dateIntervention;
    private String etat;
    private Boolean isRepared = null;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Equipement getEquipement() {
        return equipement;
    }

    public void setEquipement(Equipement equipement) {
        this.equipement = equipement;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateSignalement() {
        return dateSignalement;
    }

    public void setDateSignalement(Date dateSignalement) {
        this.dateSignalement = dateSignalement;
    }

    public Date getDateIntervention() {
        return dateIntervention;
    }

    public void setDateIntervention(Date dateIntervention) {
        this.dateIntervention = dateIntervention;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Boolean isRepared() {
        return isRepared;
    }

    public void setRepared(Boolean repared) {
        isRepared = repared;
    }


    @Override
    public String toString() {
        return "Panne{" +
                "id=" + id +
                ", user=" + user +
                ", equipement=" + equipement +
                ", description='" + description + '\'' +
                ", dateSignalement=" + dateSignalement +
                ", dateIntervention=" + dateIntervention +
                ", etat='" + etat + '\'' +
                ", isRepared=" + isRepared +// Include in toString method
                '}';
    }
}
