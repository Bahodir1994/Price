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

@Entity
@Table(name = "APPS_RASP")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DistributedApplications {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @ManyToOne
    @JoinColumn(name = "APP_ID", insertable = false, updatable = false)
    @JsonIgnore
    private ApplicationDecisionCost apps;

    @Column(name = "APP_ID", columnDefinition = "VARCHAR(50)")
    private String appId;

    @Column(name = "INSPECTOR_ID", columnDefinition = "VARCHAR(50)")
    private String inspectorId;

    @Column(name = "INSPECTOR_NAME", columnDefinition = "VARCHAR(120) CCSID 1208")
    private String inspectorName;

    @Column(name = "LOCATION")
    private String location;

    @Column(name = "POST")
    private String post;
}
