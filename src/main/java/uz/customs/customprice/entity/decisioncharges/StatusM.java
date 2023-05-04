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
@Table(name = "STATUS_M")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class StatusM extends AbstractAuditingEntity {
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

    @Column(name = "STATUS", length = 3)
    private String status;

    @Column(name = "STATUS_COMMENT", columnDefinition = "VARCHAR(1500) CCSID 1208")
    private String statusComment;
}
