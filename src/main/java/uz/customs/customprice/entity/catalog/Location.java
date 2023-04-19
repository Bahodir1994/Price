package uz.customs.customprice.entity.catalog;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "LOCATION", schema = "CPID")
@Where(clause = "USE_YN = 'Y'")
@IdClass(LocationPK.class)
public class Location {
    @Id
    @Column(name = "CODE", columnDefinition = "VARCHAR(4) CCSID 1025")
    private String code;
    
    @Id
    @Column(name = "CD_ID", columnDefinition = "VARCHAR(4) CCSID 1025")
    private String cdId;
    
    @Column(name = "CD_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String cdNm;
    
    @Column(name = "CD_DESC", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String cdDesc;
    
    @Column(name = "CD_ORDR", columnDefinition = "VARCHAR(4) CCSID 1025")
    private String cdOrdr;

    @Id
    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String lngaTpcd;
    
    @Column(name = "USE_YN", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String useYn;
    
    @Column(name = "CD_ID_L", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String cdIdL;
    
    @Column(name = "ADRESS", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String adress;
    
    @Column(name = "TELEPHONE", columnDefinition = "VARCHAR(30) CCSID 1025")
    private String telephone;

    @Column(name = "IDN", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String idn;

    @Column(name = "BRANCHID", columnDefinition = "VARCHAR(3) CCSID 1025")
    private String branchId;

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

    public String getIdn() {
        return idn;
    }

    public void setIdn(String idn) {
        this.idn = idn;
    }

    public String getBranchId() {
        return branchId;
    }

    public void setBranchId(String branchId) {
        this.branchId = branchId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Location location = (Location) o;
        return Objects.equals(code, location.code) && Objects.equals(cdId, location.cdId) && Objects.equals(cdNm, location.cdNm) && Objects.equals(cdDesc, location.cdDesc) && Objects.equals(cdOrdr, location.cdOrdr) && Objects.equals(lngaTpcd, location.lngaTpcd) && Objects.equals(useYn, location.useYn) && Objects.equals(cdIdL, location.cdIdL) && Objects.equals(adress, location.adress) && Objects.equals(telephone, location.telephone) && Objects.equals(idn, location.idn) && Objects.equals(branchId, location.branchId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdId, cdNm, cdDesc, cdOrdr, lngaTpcd, useYn, cdIdL, adress, telephone, idn, branchId);
    }
}
