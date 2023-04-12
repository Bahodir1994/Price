package uz.customs.customprice.entity.costMonitoring;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Unit {
    private String id;
    private String name;
    private String shortname;
    private short isdeleted;
    private Short flag;


    @Id
    @Column(name = "ID")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Column(name = "SHORTNAME")
    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }


    @Column(name = "ISDELETED")
    public short getIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(short isdeleted) {
        this.isdeleted = isdeleted;
    }


    @Column(name = "FLAG")
    public Short getFlag() {
        return flag;
    }

    public void setFlag(Short flag) {
        this.flag = flag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Unit unit = (Unit) o;
        return isdeleted == unit.isdeleted && Objects.equals(id, unit.id) && Objects.equals(name, unit.name) && Objects.equals(shortname, unit.shortname) && Objects.equals(flag, unit.flag);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, shortname, isdeleted, flag);
    }
}
