package uz.customs.customprice.entity.catalog;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "DEPARTMENT", schema = "CPID")
@IdClass(DepartmentPK.class)
public class Department {
    @Id
    @Column(name = "CODE", nullable = false, length = 10)
    private String code;

    @Id
    @Column(name = "CD_ID", nullable = false, length = 10)
    private String cdId;

    @Column(name = "CD_NM", length = 600)
    private String cdNm;

    @Column(name = "CD_DESC", length = 600)
    private String cdDesc;

    @Column(name = "CD_ORDR", length = 4)
    private String cdOrdr;

    @Id
    @Column(name = "LNGA_TPCD", nullable = false, length = 2)
    private String lngaTpcd;

    @Column(name = "USE_YN", length = 2)
    private String useYn;

    @Column(name = "CD_ID_L", length = 2)
    private String cdIdL;

    @Column(name = "LOCATION", length = 4)
    private String location;

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

    public String getCdNm() {
        return cdNm;
    }

    public void setCdNm(String cdNm) {
        this.cdNm = cdNm;
    }

    public String getCdDesc() {
        return cdDesc;
    }

    public void setCdDesc(String cdDesc) {
        this.cdDesc = cdDesc;
    }

    public String getCdOrdr() {
        return cdOrdr;
    }

    public void setCdOrdr(String cdOrdr) {
        this.cdOrdr = cdOrdr;
    }

    public String getLngaTpcd() {
        return lngaTpcd;
    }

    public void setLngaTpcd(String lngaTpcd) {
        this.lngaTpcd = lngaTpcd;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getCdIdL() {
        return cdIdL;
    }

    public void setCdIdL(String cdIdL) {
        this.cdIdL = cdIdL;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Department that = (Department) o;
        return Objects.equals(code, that.code) && Objects.equals(cdId, that.cdId) && Objects.equals(cdNm, that.cdNm) && Objects.equals(cdDesc, that.cdDesc) && Objects.equals(cdOrdr, that.cdOrdr) && Objects.equals(lngaTpcd, that.lngaTpcd) && Objects.equals(useYn, that.useYn) && Objects.equals(cdIdL, that.cdIdL) && Objects.equals(location, that.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdId, cdNm, cdDesc, cdOrdr, lngaTpcd, useYn, cdIdL, location);
    }
}
