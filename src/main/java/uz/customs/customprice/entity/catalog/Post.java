package uz.customs.customprice.entity.catalog;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "POST", schema = "CPID")
@Where(clause = "USE_YN = 'Y'")
@IdClass(PostPK.class)
public class Post {
    @Id
    @Column(name = "CODE", nullable = false, length = 5)
    private String code;
    
    @Column(name = "CD_DESC", length = 600)
    private String cdDesc;
    
    @Id
    @Column(name = "CD_ID", length = 20)
    private String cdId;
    
    @Column(name = "CD_ID_L", length = 2)
    private String cdIdL;
    
    @Column(name = "CD_NM", length = 600)
    private String cdNm;
    
    @Column(name = "CD_ORDR", length = 4)
    private String cdOrdr;
    
    @Id
    @Column(name = "LNGA_TPCD", length = 2)
    private String lngaTpcd;
    
    @Column(name = "USE_YN", length = 2)
    private String useYn;
    
    @Column(name = "LAT", length = 25)
    private String lat;
    
    @Column(name = "LONG", length = 25)
    private String long1;
    
    @Column(name = "ADRESS", length = 1200)
    private String adress;
    
    @Column(name = "TELEPHONE", length = 100)
    private String telephone;
    
    @Column(name = "HOURS", length = 600)
    private String hours;
    
    @Column(name = "DIRECTION", length = 300)
    private String direction;
    
    @Column(name = "LOCATION", length = 5)
    private String location;

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

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLong1() {
        return long1;
    }

    public void setLong1(String long1) {
        this.long1 = long1;
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

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
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
        Post post = (Post) o;
        return Objects.equals(code, post.code) && Objects.equals(cdDesc, post.cdDesc) && Objects.equals(cdId, post.cdId) && Objects.equals(cdIdL, post.cdIdL) && Objects.equals(cdNm, post.cdNm) && Objects.equals(cdOrdr, post.cdOrdr) && Objects.equals(lngaTpcd, post.lngaTpcd) && Objects.equals(useYn, post.useYn) && Objects.equals(lat, post.lat) && Objects.equals(long1, post.long1) && Objects.equals(adress, post.adress) && Objects.equals(telephone, post.telephone) && Objects.equals(hours, post.hours) && Objects.equals(direction, post.direction) && Objects.equals(location, post.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, cdDesc, cdId, cdIdL, cdNm, cdOrdr, lngaTpcd, useYn, lat, long1, adress, telephone, hours, direction, location);
    }
}
