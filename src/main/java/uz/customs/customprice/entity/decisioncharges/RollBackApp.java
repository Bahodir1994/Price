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

import javax.persistence.*;

@Entity
@Table(name = "ROLLBACK_APP")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RollBackApp extends AbstractAuditingEntity {
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
    @JoinColumn(name = "STATUS_H_ID", insertable = false, updatable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private StatusH statusH;

    @Column(name = "STATUS_H_ID", columnDefinition = "VARCHAR(50)")
    private String statusHId;

    @Column(name = "ROLLBACK_ID", columnDefinition = "VARCHAR(50)")
    private String rollbackId;

    @Column(name = "ROLLBACK_NAME", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String rollbackName;
}
