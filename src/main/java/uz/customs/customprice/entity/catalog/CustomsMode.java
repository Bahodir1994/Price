package uz.customs.customprice.entity.catalog;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "CUSTOMS_MODE", schema = "CPID")
@Where(clause = "USE_YN = 'Y'")
@IdClass(FeatMovePK.class)
public class CustomsMode {
    @Id
    @Column(name = "CODE", columnDefinition = "VARCHAR(3) CCSID 1025")
    private String code;

    @Id
    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String lngaTpcd;

    @Id
    @Column(name = "CD_ID", columnDefinition = "VARCHAR(20) CCSID 1025")
    private String cdId;

    @Column(name = "CD_DESC", columnDefinition = "VARCHAR(600) CCSID 1208")
    String cdDesc;

    @Column(name = "CD_ID_L", columnDefinition = "VARCHAR(3) CCSID 1025")
    String cdIdL;

    @Column(name = "CD_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    String cdNm;

    @Column(name = "CD_ORDR", columnDefinition = "VARCHAR(4) CCSID 1025")
    String cdOrdr;

    @Column(name = "USE_YN", columnDefinition = "VARCHAR(2) CCSID 1025")
    String useYN;

    public CustomsMode() {
    }

    public CustomsMode(String code, String cdDesc, String cdId, String cdIdL, String cdNm, String cdOrdr, String lngaTpcd, String useYN) {
        this.code = code;
        this.cdDesc = cdDesc;
        this.cdId = cdId;
        this.cdIdL = cdIdL;
        this.cdNm = cdNm;
        this.cdOrdr = cdOrdr;
        this.lngaTpcd = lngaTpcd;
        this.useYN = useYN;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCdDesc() {
        return cdDesc;
    }

    public void setCdDesc(String cdDesc) {
        this.cdDesc = cdDesc;
    }

    public String getCdId() {
        return cdId;
    }

    public void setCdId(String cdId) {
        this.cdId = cdId;
    }

    public String getCdIdL() {
        return cdIdL;
    }

    public void setCdIdL(String cdIdL) {
        this.cdIdL = cdIdL;
    }

    public String getCdNm() {
        return cdNm;
    }

    public void setCdNm(String cdNm) {
        this.cdNm = cdNm;
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

    public String getUseYN() {
        return useYN;
    }

    public void setUseYN(String useYN) {
        this.useYN = useYN;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CustomsMode unit = (CustomsMode) o;
        return Objects.equals(code, unit.code) && Objects.equals(lngaTpcd, unit.lngaTpcd) && Objects.equals(cdId, unit.cdId) && Objects.equals(cdDesc, unit.cdDesc) && Objects.equals(cdIdL, unit.cdIdL) && Objects.equals(cdNm, unit.cdNm) && Objects.equals(cdOrdr, unit.cdOrdr) && Objects.equals(useYN, unit.useYN);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, lngaTpcd, cdId, cdDesc, cdIdL, cdNm, cdOrdr, useYN);
    }
}