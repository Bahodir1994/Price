package uz.customs.customprice.entity.costMonitoring;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "CP_STAT", schema = "CP", catalog = "")
public class CpStatEntity {

    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "COUNT_CMDT")
    private String countCmdt;

    @Column(name = "EXTM_INDXUSD")
    private BigDecimal extmIndxUsd;

    public CpStatEntity() {
    }

    public CpStatEntity(String id, String countCmdt, BigDecimal extmIndxUsd) {
        this.id = id;
        this.countCmdt = countCmdt;
        this.extmIndxUsd = extmIndxUsd;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCountCmdt() {
        return countCmdt;
    }

    public void setCountCmdt(String countCmdt) {
        this.countCmdt = countCmdt;
    }

    public BigDecimal getExtmIndxUsd() {
        return extmIndxUsd;
    }

    public void setExtmIndxUsd(BigDecimal extmIndxUsd) {
        this.extmIndxUsd = extmIndxUsd;
    }
}
