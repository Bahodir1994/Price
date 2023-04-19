package uz.customs.customprice.entity.catalog;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class MethodPK implements Serializable {
    @Id
    @Column(name = "ID", nullable = false, length = 10)
    private String id;

    @Id
    @Column(name = "LNGA_TPCD", nullable = false, length = 2)
    private String lngaTpcd;

    public String getId() {
        return id;
    }

    public void setId(String id) {
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
        MethodPK that = (MethodPK) o;
        return Objects.equals(id, that.id) && Objects.equals(lngaTpcd, that.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, lngaTpcd);
    }
}
