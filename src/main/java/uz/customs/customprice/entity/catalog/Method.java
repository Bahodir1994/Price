package uz.customs.customprice.entity.catalog;

import org.hibernate.annotations.Where;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "METHOD", schema = "CPID")
@Where(clause = "isdeleted = 0")
@IdClass(MethodPK.class)
public class Method {
    @Id
    @Column(name = "id")
    private String id;

    @Id
    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String lngaTpcd;

    @Column(name = "NAME", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String name;

    @CreatedBy
    @Column(name = "insuser", length = 50, updatable = false)
    private String insUser;

    @LastModifiedBy
    @Column(name = "upduser", length = 50)
    private String updUser;

    @CreatedDate
    @Column(name = "instime", columnDefinition = " timestamp default current_timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date insTime = new Date(System.currentTimeMillis());

    @LastModifiedDate
    @Column(name = "updtime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updTime;

    @Column(name = "isdeleted", columnDefinition = " SMALLINT DEFAULT 0")
    private int isDeleted;

    public Method() {
    }

    public Method(String id, String lngaTpcd, String name, String insUser, String updUser, Date insTime, Date updTime, int isDeleted) {
        this.id = id;
        this.lngaTpcd = lngaTpcd;
        this.name = name;
        this.insUser = insUser;
        this.updUser = updUser;
        this.insTime = insTime;
        this.updTime = updTime;
        this.isDeleted = isDeleted;
    }

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInsUser() {
        return insUser;
    }

    public void setInsUser(String insUser) {
        this.insUser = insUser;
    }

    public String getUpdUser() {
        return updUser;
    }

    public void setUpdUser(String updUser) {
        this.updUser = updUser;
    }

    public Date getInsTime() {
        return insTime;
    }

    public void setInsTime(Date insTime) {
        this.insTime = insTime;
    }

    public Date getUpdTime() {
        return updTime;
    }

    public void setUpdTime(Date updTime) {
        this.updTime = updTime;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Method method = (Method) o;
        return isDeleted == method.isDeleted && Objects.equals(id, method.id) && Objects.equals(lngaTpcd, method.lngaTpcd) && Objects.equals(name, method.name) && Objects.equals(insUser, method.insUser) && Objects.equals(updUser, method.updUser) && Objects.equals(insTime, method.insTime) && Objects.equals(updTime, method.updTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, lngaTpcd, name, insUser, updUser, insTime, updTime, isDeleted);
    }
}