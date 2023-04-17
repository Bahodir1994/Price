package uz.customs.customprice.entity.catalog;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class PostPK implements Serializable {
    @Id
    @Column(name = "CODE", nullable = false, length = 5)
    private String code;

    @Id
    @Column(name = "CD_ID", nullable = true, length = 20)
    private String cdId;

    @Id
    @Column(name = "LNGA_TPCD", nullable = true, length = 2)
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
        PostPK postPK = (PostPK) o;
        return Objects.equals(code, postPK.code) && Objects.equals(cdId, postPK.cdId) && Objects.equals(lngaTpcd, postPK.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdId, lngaTpcd);
    }
}
