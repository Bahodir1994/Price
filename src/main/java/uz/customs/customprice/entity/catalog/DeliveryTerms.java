package uz.customs.customprice.entity.catalog;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "DELIVERY_TERMS", schema = "CPID")
public class DeliveryTerms {
    
    @Id
    @Column(name = "ID", columnDefinition = "VARCHAR(3) CCSID 1025")
    private String id;
    
    @Column(name = "NAME", columnDefinition = "VARCHAR(400) CCSID 1208")
    private String name;
    
    @Column(name = "SIGN", columnDefinition = "VARCHAR(200) CCSID 1025")
    private String sign;
    
    @Column(name = "RAQAM", columnDefinition = "VARCHAR(6) CCSID 1025")
    private String raqam;
    
    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String lngaTpcd;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getRaqam() {
        return raqam;
    }

    public void setRaqam(String raqam) {
        this.raqam = raqam;
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
        DeliveryTerms that = (DeliveryTerms) o;
        return Objects.equals(id, that.id) && Objects.equals(name, that.name) && Objects.equals(sign, that.sign) && Objects.equals(raqam, that.raqam) && Objects.equals(lngaTpcd, that.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, sign, raqam, lngaTpcd);
    }
}
