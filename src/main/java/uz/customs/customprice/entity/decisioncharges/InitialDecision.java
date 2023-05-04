package uz.customs.customprice.entity.decisioncharges;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.*;
import org.springframework.format.annotation.DateTimeFormat;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "IN_DEC", indexes = {@Index(columnList = "id", unique = true), @Index(columnList = "insuser", unique = false),
        @Index(columnList = "isdeleted", unique = false), @Index(columnList = "status", unique = false)})
@SQLDelete(sql = "update IN_DEC set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class InitialDecision extends AbstractAuditingEntity {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CMDT_ID", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private CommodityDecision commodity;

    @Column(name = "CMDT_ID", columnDefinition = "VARCHAR(50)")
    private String cmdtId;

    @Column(name = "IN_DEC_NUM", length = 30)
    private String inDecNum;

    @Column(name = "IN_DEC_NUMS", length = 30)
    private String inDecNumS;

    @Column(name = "IN_DEC_DATE", columnDefinition = " date default current_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date inDecDate = new Date(new Date().getTime());

    @Column(name = "IN_DEC_LOCATION", length = 4)
    private String inDecLocation;

    @Column(name = "IN_DEC_LOCATION_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String inDecLocationNm;

    @Column(name = "PERSON_ID", length = 50)
    private String personId;

    @Column(name = "HS_CODE", length = 10)
    private String hsCode;

    @Column(name = "HS_NAME", columnDefinition = "VARCHAR(2000) CCSID 1208")
    private String hsName;

    @Column(name = "METHOD", length = 3)
    private String method;

    @Column(name = "METHOD_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String methodNm;

    @Column(name = "ORIGIN_COUNTRY", length = 3)
    private String originCountry;

    @Column(name = "ORIGIN_COUNTRY_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String orignCountrNm;

    @Column(name = "IN_DEC_BASIS", columnDefinition = "VARCHAR(60) CCSID 1208")
    private String inDecBasis;

    @Column(name = "COMMENT_MARKS", columnDefinition = "VARCHAR(60) CCSID 1208")
    private String commentMarks;

    @Column(name = "CUSTOMS_PREFERENCE", length = 4)
    private BigDecimal customsPreference;

    @Column(name = "CUSTOMS_PAYMENTS", length = 4)
    private BigDecimal customsPayments;

    @Column(name = "STATUS", columnDefinition = "SMALLINT DEFAULT 100")
    private int status = 100;

    @Column(name = "STATUS_NM", columnDefinition = "VARCHAR(450) CCSID 1208")
    private String statusNm;

    @Column(name = "IN_DEC_END_DATE", columnDefinition = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date inDecEndDate;

    @Column(name = "IN_DEC_USR_ENDED_DATE", columnDefinition = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date inDecUserEndedDate;

    @Column(name = "COMMENT_ENDED", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String commentEnded;

    /*if endActiv == 100 its activ else ended inDec*/
    @Column(name = "END_ACTIV", columnDefinition = "SMALLINT DEFAULT 100")
    private int endActiv = 100;


    @Column(name = "TPO_ID", length = 50)
    private String tpoId;

    @Column(name = "PAY_ID", length = 50)
    private String payId;

    @Column(name = "G3A", columnDefinition = "VARCHAR(5)")
    private String g3a;

    @Column(name = "G3B", columnDefinition = "date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date g3b;

    @Column(name = "G3C", columnDefinition = "VARCHAR(10)")
    private String g3c;

    @Column(name = "G19BASE")
    @Digits(integer = 15, fraction = 3)
    private BigDecimal g19Base;

    @Column(name = "STAVKA", columnDefinition = "VARCHAR(50)")
    private String stavka;

    @Column(name = "G19SUM")
    @Digits(integer = 15, fraction = 3)
    private BigDecimal g19Sum;

    @Column(name = "VERSION_NUM", columnDefinition = "VARCHAR(50)")
    private String versionNum;
}
