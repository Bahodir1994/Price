package uz.customs.customprice.entity.decisioncharges;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;
import uz.customs.customprice.entity.catalog.Country;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "STATUS_H")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class StatusH extends AbstractAuditingEntity {
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

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "STMAIN_ID", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private StatusM statusM;

    @OneToMany(mappedBy="statusH", cascade = CascadeType.ALL)
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    @JsonIgnore
    private List<RollBackApp> rollBackApps;

    @Column(name = "STMAIN_ID", columnDefinition = "VARCHAR(50)")
    private String stmainID;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "STATUS", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private DecisionChargesStatusType statusType;

    @Column(name = "HISTORY_NUM")
    private Integer historyNum;

    @Column(name = "STATUS", length = 3)
    private String status;

    @Column(name = "STATUS_COMMENT", columnDefinition = "VARCHAR(1500) CCSID 1208")
    private String statusComment;

    @Column(name = "SORTED_INS_ID", length = 50, updatable = false)
    private String sortedInsId;

    @Column(name = "SORTED_INS_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String sortedInsNm;

    @Column(name = "COMMENT", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String comment;
}
