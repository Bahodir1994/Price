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
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "COMMODITY", indexes = {@Index(columnList = "id", unique = true), @Index(columnList = "insuser", unique = false), @Index(columnList = "isdeleted", unique = false)})
@SQLDelete(sql = "update COMMODITY set isdeleted = 1 where id = ?")
@Where(clause = "isdeleted = 0")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommodityDecision extends AbstractAuditingEntity {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "APP_ID", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private ApplicationDecisionCost apps;

    @OneToMany(mappedBy = "commodity", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JsonIgnore
    private List<DecisionPayment> paymentList;

    @OneToMany(mappedBy = "commodity", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JsonIgnore
    private List<MethodCause> methodCauses;

    @Column(name = "APP_ID", columnDefinition = "VARCHAR(50)")
    private String appId;

    @Column(name = "CMDT_NUM")
    private Integer cmdtNum;

    @Column(name = "ORIGIN_COUNTRY", length = 3)
    @Digits(message = "Устун фақат сонлардан иборат бўлиши лозим", integer = 3, fraction = 0)
    private String originCountry;

    @Column(name = "ORIGIN_COUNTRY_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String orignCountrNm;

    @Column(name = "ORIGIN_ORG", columnDefinition = "VARCHAR(900) CCSID 1208")
    @NotBlank(message = "Устун тўлдирилмаган")
    @Size(max = 300, message = "Устун маълумоти катталиги чекланган")
    private String originOrg;

    @Column(name = "TRADE_NAME", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String tradeName;

    @Column(name = "TRADE_MARK", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String tradeMark;

    @Column(name = "MARK", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String mark;

    @Column(name = "MODEL", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String model;

    @Column(name = "ARTICLE", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String article;

    @Column(name = "SORT", columnDefinition = "VARCHAR(765) CCSID 1208")
    @Size(max = 255, message = "Устун маълумоти катталиги чекланган")
    private String sort;

    @Column(name = "STANDARTS", columnDefinition = "VARCHAR(1500) CCSID 1208")
    @Size(max = 500, message = "Устун маълумоти катталиги чекланган")
    private String standarts;

    @Column(name = "FUNCTIONS", columnDefinition = "VARCHAR(1500) CCSID 1208")
    @Size(max = 500, message = "Устун маълумоти катталиги чекланган")
    private String functions;

    @Column(name = "COM_PROP", columnDefinition = "VARCHAR(4000) CCSID 1208")
    @Size(max = 1300, message = "Устун маълумоти катталиги чекланган")
    private String comProp;

    @Column(name = "TECH_CHAR", columnDefinition = "VARCHAR(2000) CCSID 1208")
    @Size(max = 600, message = "Устун маълумоти катталиги чекланган")
    private String techChar;

    @Column(name = "PRODUCT_GOAL", columnDefinition = "VARCHAR(900) CCSID 1208")
    @Size(max = 300, message = "Устун маълумоти катталиги чекланган")
    private String productGoal;

    @Column(name = "HS_CODE", length = 10)
    @NotNull(message = "Устун тўлдирилмаган")
    @Size(min = 10, max = 10, message = "Устун 10 та сондан иборат бўлиши лозим")
    private String hsCode;

    @Column(name = "HS_NAME", columnDefinition = "VARCHAR(2000) CCSID 1208")
    private String hsName;

    @Column(name = "BRUTTO", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal brutto;

    @Column(name = "NETTO", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal netto;

    @Column(name = "BASIC_QTY", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal basicQty;

    @Column(name = "EXTRA_UNITS", length = 3)
    @Digits(message = "Устун фақат сонлардан иборат бўлиши лозим", integer = 3, fraction = 0)
    private String extraUnits;

    @Column(name = "EXTRA_QTY", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal extraQty;

    @Column(name = "PRICE", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal price;

    @Column(name = "CUSTOMS_PRICE", length = 4)
    @Digits(message = "Божхона қиймати фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal customsPrice;

    @Column(name = "CURRENCY_TYPE", length = 3)
    @Digits(message = "Устун фақат сонлардан иборат бўлиши лозим", integer = 3, fraction = 0)
    private String currencyType;

    @Column(name = "CARGO_SPACE", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal cargoSpace;

    @Column(name = "PACK_TYPE", length = 3)
    @Digits(message = "Устун фақат сонлардан иборат бўлиши лозим", integer = 3, fraction = 0)
    private String packType;

    @Column(name = "PACK_TYPE_NM", columnDefinition = "VARCHAR(90) CCSID 1208")
    private String packTypeNm;

    @Column(name = "PACK_QTY", length = 4)
    @Digits(message = "Устун фақат ҳақиқий сонлардан иборат бўлиши лозим", integer = 15, fraction = 3)
    private BigDecimal packQty;

    @Column(name = "EXTRA_INFO", columnDefinition = "VARCHAR(2000) CCSID 1208")
    @Size(max = 600, message = "Устун маълумоти катталиги чекланган")
    private String extraInfo;

    @Column(name = "HS_DEC_NUM", length = 20)
    @Size(max = 20, message = "Устун маълумоти катталиги чекланган")
    private String hsDecNum;

    @Column(name = "HS_DEC_DATE")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date hsDecDate;

    @Column(name = "IN_DEC_DATE")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date inDecDate;

    @Column(name = "IN_DEC_NUM", length = 30)
    @Size(max = 30, message = "Устун маълумоти катталиги чекланган")
    private String inDecNum;

    @Column(name = "METHOD", length = 3)
    @Digits(message = "Устун фақат сонлардан иборат бўлиши лозим", integer = 2, fraction = 1)
    private String method;

    @Column(name = "METHOD_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String methodNm;

    @Column(name = "METHOD_DESCRIPTION", columnDefinition = "VARCHAR(1500) CCSID 1208")
    private String methodDescription;

    @Column(name = "PAYMENT_YN", columnDefinition = " VARCHAR(3) DEFAULT 'NO' ")
    private String paymentYN = "NO";

    @Column(name = "CURRENCY_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String currencyNm;

    @Column(name = "CURRENCY_NMSYMBOL", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String currencyNmSymbol;

    @Column(name = "METHOD_URL", columnDefinition = "VARCHAR(220)")
    private String methodUrl;

    @Column(name = "METHOD_URL_DISCRIPTION", columnDefinition = "VARCHAR(220)")
    @Size(max = 220, message = "Устун маълумоти катталиги чекланган")
    private String methodUrlDiscription;
}
