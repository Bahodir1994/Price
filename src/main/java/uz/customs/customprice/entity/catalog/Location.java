package uz.customs.customprice.entity.catalog;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "LOCATION", schema = "CPID")
@IdClass(LocationPK.class)
public class Location {
    @Id
    @Column(name = "CODE", nullable = false, length = 4)
    private String code;
    
    @Id
    @Column(name = "CD_ID", nullable = false, length = 4)
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
    
    @Column(name = "ADRESS", length = 1200)
    private String adress;
    
    @Column(name = "TELEPHONE", length = 100)
    private String telephone;

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

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Location location = (Location) o;
        return Objects.equals(code, location.code) && Objects.equals(cdId, location.cdId) && Objects.equals(cdNm, location.cdNm) && Objects.equals(cdDesc, location.cdDesc) && Objects.equals(cdOrdr, location.cdOrdr) && Objects.equals(lngaTpcd, location.lngaTpcd) && Objects.equals(useYn, location.useYn) && Objects.equals(cdIdL, location.cdIdL) && Objects.equals(adress, location.adress) && Objects.equals(telephone, location.telephone);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdId, cdNm, cdDesc, cdOrdr, lngaTpcd, useYn, cdIdL, adress, telephone);
    }
}
