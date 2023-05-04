package uz.customs.customprice.entity.decisioncharges;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "STATUS_TYPE", schema = "CPID")
@IdClass(StatusTypeEntityPK.class)
public class DecisionChargesStatusType {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID")
    private short id;
    @Basic
    @Column(name = "NAME")
    private String name;
    @Basic
    @Column(name = "COMMENT")
    private String comment;
    @Basic
    @Column(name = "INSUSER")
    private String insuser;
    @Basic
    @Column(name = "UPDUSER")
    private String upduser;
    @Basic
    @Column(name = "INSTIME")
    private Timestamp instime;
    @Basic
    @Column(name = "UPDTIME")
    private Timestamp updtime;
    @Basic
    @Column(name = "ISDELETED")
    private Short isdeleted;
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "LNGA_TPCD")
    private String lngaTpcd;

    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getInsuser() {
        return insuser;
    }

    public void setInsuser(String insuser) {
        this.insuser = insuser;
    }

    public String getUpduser() {
        return upduser;
    }

    public void setUpduser(String upduser) {
        this.upduser = upduser;
    }

    public Timestamp getInstime() {
        return instime;
    }

    public void setInstime(Timestamp instime) {
        this.instime = instime;
    }

    public Timestamp getUpdtime() {
        return updtime;
    }

    public void setUpdtime(Timestamp updtime) {
        this.updtime = updtime;
    }

    public Short getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(Short isdeleted) {
        this.isdeleted = isdeleted;
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
        DecisionChargesStatusType that = (DecisionChargesStatusType) o;
        return id == that.id && Objects.equals(name, that.name) && Objects.equals(comment, that.comment) && Objects.equals(insuser, that.insuser) && Objects.equals(upduser, that.upduser) && Objects.equals(instime, that.instime) && Objects.equals(updtime, that.updtime) && Objects.equals(isdeleted, that.isdeleted) && Objects.equals(lngaTpcd, that.lngaTpcd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, comment, insuser, upduser, instime, updtime, isdeleted, lngaTpcd);
    }
}
