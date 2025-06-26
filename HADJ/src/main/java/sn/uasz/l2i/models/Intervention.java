package sn.uasz.l2i.models;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Intervention {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Panne panne;

    @ManyToOne
    private User technicien;

    private Date dateIntervention;
    @Column(name = "description")
    private String detailsIntervention;

    private double cout;
    private boolean confirmed;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Panne getPanne() {
        return panne;
    }

    public void setPanne(Panne panne) {
        this.panne = panne;
    }

    public User getTechnicien() {
        return technicien;
    }

    public void setTechnicien(User technicien) {
        this.technicien = technicien;
    }

    public Date getDateIntervention() {
        return dateIntervention;
    }

    public void setDateIntervention(Date dateIntervention) {
        this.dateIntervention = dateIntervention;
    }

    public String getDetailsIntervention() {
        return detailsIntervention;
    }

    public void setDetailsIntervention(String detailsIntervention) {
        this.detailsIntervention = detailsIntervention;
    }

    public double getCout() {
        return cout;
    }

    public void setCout(double cout) {
        this.cout = cout;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setConfirmed(boolean confirmed) {
        this.confirmed = confirmed;
    }

}
