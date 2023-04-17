package uz.customs.customprice.entity.catalog;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class UnitPK implements Serializable {
    @Id
    @Column(name = "CODE", nullable = false, length = 10)
    private String code;

    @Id
    @Column(name = "CD_ID", nullable = false, length = 10)
    private String cdId;

    @Id
    @Column(name = "LNGA_TPCD", nullable = false, length = 2)
    private String lngaTpcd;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCdId() {
        return cdId;
    }

    public void setCdId(String cdId) {
        this.cdId = cdId;
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
        UnitPK that = (UnitPK) o;
        return Objects.equals(code, that.code) && Objects.equals(cdId, that.cdId) && Objects.equals(lngaTpcd, that.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdId, lngaTpcd);
    }
}
