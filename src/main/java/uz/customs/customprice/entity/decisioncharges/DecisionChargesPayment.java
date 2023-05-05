package uz.customs.customprice.entity.decisioncharges;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DecisionChargesPayment {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CMDT_ID", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private CommodityDecision commodity;

    @Column(name = "CMDT_ID", columnDefinition = "VARCHAR(50)")
    private String cmdtId;

    @Column(name = "G47BASE", precision = 19, scale = 3)
    private BigDecimal g47Base;

    @Column(name = "G47ALTBASE", precision = 19, scale = 3)
    private BigDecimal g47AltBase;

    @Column(name = "G47RATE", precision = 19, scale = 3)
    private BigDecimal g47Rate;

    @Column(name = "G47ALTRATE", precision = 19, scale = 3)
    private BigDecimal g47AltRate;

    @Column(name = "G47CURRKOD", columnDefinition = "VARCHAR(3)")
    private String g47Currkod;

    @Column(name = "G47SUM", precision = 19, scale = 3)
    private BigDecimal g47Sum;

    @Column(name = "G47SP", columnDefinition = "VARCHAR(4)")
    private String g47Sp;

    @Column(name = "G47CLCTYPE")
    private int g47ClcType;

    @Column(name = "G47TYPE", columnDefinition = "VARCHAR(4)")
    private String g47Type;

    @Column(name = "G47ALTBASECURRKOD", columnDefinition = "VARCHAR(3)")
    private String g47AltBaseCurrkod;

    @Column(name = "CURRRATE", precision = 10, scale = 2)
    private BigDecimal currRate;

    @Column(name = "G47ALTBASEEDIZM", columnDefinition = "VARCHAR(20)")
    private String g47AltBaseEdIzm;

    @Column(name = "G47SUMCURRKOD", columnDefinition = "VARCHAR(3)")
    private String g47SumCurrkod;
}
