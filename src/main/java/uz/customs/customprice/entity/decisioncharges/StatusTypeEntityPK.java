package uz.customs.customprice.entity.decisioncharges;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class StatusTypeEntityPK implements Serializable {
    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private short id;
    @Column(name = "LNGA_TPCD")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String lngaTpcd;

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getLngaTpcd() {
        return lngaTpcd;
    }

    public void setLngaTpcd(String lngaTpcd) {
        this.lngaTpcd = lngaTpcd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StatusTypeEntityPK that = (StatusTypeEntityPK) o;
        return id == that.id && Objects.equals(lngaTpcd, that.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, lngaTpcd);
    }
}
