package uz.customs.customprice.entity.decisioncharges;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import java.math.BigDecimal;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TransportType {
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

    @Column(name = "APP_ID", columnDefinition = "VARCHAR(50)")
    private String appId;

    @Column(name = "finish_country", length = 3)
    private String finishCountry;

    @Column(name = "finish_country_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String finishCountryNm;

    @Column(name = "end_country", length = 3)
    private String endCountry;

    @Column(name = "end_country_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String endCountryNm;

    @Column(name = "tarnsport_type", length = 2)
    private String tarnsportType;

    @Column(name = "tarnsport_type_NM", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String tarnsportTypeNm;

    @Column(name = "transport_price")
    @Digits(integer = 15, fraction = 3)
    private BigDecimal transportPrice;
}
