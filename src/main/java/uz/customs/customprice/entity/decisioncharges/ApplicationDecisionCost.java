package uz.customs.customprice.entity.decisioncharges;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "APPS", indexes = {@Index(columnList = "id", unique = true), @Index(columnList = "insuser", unique = false),
        @Index(columnList = "isdeleted", unique = false), @Index(columnList = "status", unique = false)})
@SQLDelete(sql = "update APPS set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ApplicationDecisionCost extends AbstractAuditingEntity {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @OneToMany(mappedBy = "apps", cascade = CascadeType.REMOVE)
    private List<DistributedApplications> distributedApplications;

    @Column(name = "PERSON_ID", length = 50)
    private String personId;

    @Column(name = "APP_NUM", length = 50)
    private String appNum;

    @Column(name = "APP_NUMS", length = 50)
    private String appNumS;

    @CreatedDate
    @Column(name = "APP_DATE", columnDefinition = " date default current_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date appDate = new Date(new Date().getTime());

    @Column(name = "CUSTOMER_COUNTRY", length = 3)
    private String customerCountry;

    @Column(name = "CUSTOMER_COUNTRY_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String customerCountryNm;

    @Column(name = "SENDER_COUNTRY", length = 3)
    private String senderCountry;

    @Column(name = "SENDER_COUNTRY_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String senderCountryNm;

    @Column(name = "SENDER_ORG", columnDefinition = "VARCHAR(900) CCSID 1208")
    private String senderOrg;

    @Column(name = "SELLER_ORG", columnDefinition = "VARCHAR(900) CCSID 1208")
    private String sellerOrg;

    @Column(name = "TERMS", length = 3)
    private String terms;

    @Column(name = "TERMS_NM", columnDefinition = "VARCHAR(450) CCSID 1208")
    private String termsNm;

    @Column(name = "TERMS_ADDR", length = 50)
    private String termsAddr;

    @Column(name = "PERSON_FIO", columnDefinition = "VARCHAR(3000) CCSID 1208")
    private String personFio;

    @Column(name = "ORG_NAME", columnDefinition = "VARCHAR(900) CCSID 1208")
    private String orgName;

    @Column(name = "PERSON_POSITION", length = 2)
    private String personPosition;

    @Column(name = "PERSON_ADDR", columnDefinition = "VARCHAR(900) CCSID 1208")
    private String personAddr;

    @Column(name = "PERSON_TIN", length = 9)
    private String personTin;

    @Column(name = "PERSON_PIN", length = 14)
    private String personPin;

    @Column(name = "PERSON_MAIL", length = 100)
    private String personMail;

    @Column(name = "PERSON_PHONE", length = 20)
    private String personPhone;

    @Column(name = "LOCATION_ID", length = 4)
    private String locationId;

    @Column(name = "LOCATION_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String locationNm;

    @Column(name = "TRANS_EXP", length = 4)
    private BigDecimal transExp;

    @Column(name = "STATUS", columnDefinition = "SMALLINT DEFAULT 100")
    private int status;

    @Column(name = "STATUS_NM", columnDefinition = "VARCHAR(450) CCSID 1208")
    private String statusNm;

    @Column(name = "COMMENT", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String comment;

    @Column(name = "IMPORTER_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String importerNm;

    @Column(name = "IMPORTER_TIN", columnDefinition = "VARCHAR(30) CCSID 1025")
    private String importerTin;

    @Column(name = "VERSION_NUM", length = 50)
    private String versionNum = "1";

    @Column(name = "AUTHORIZED_PERSON", length = 50)
    private String authorizedPerson;

    @Column(name = "AUTHORIZED_PERSON_PIN", length = 50)
    private String authorizedPersonPin;

    @Column(name = "AUTHORIZED_PERSON_DOC", length = 50)
    private String authorizedPersonDoc;

    @Column(name = "AUTHORIZED_PERSON_DOC_DATE")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date authorizedPersonDocDate;

    @Column(name = "AUTHORIZED_PERSON_DOC_NUM", length = 50)
    private String authorizedPersonDocNum;

    @Column(name = "STATE_NUMBER", length = 50)
    private String stateNumber;

    @Column(name = "STATE_NUMBER_DATE")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date stateNumberDate;
}
