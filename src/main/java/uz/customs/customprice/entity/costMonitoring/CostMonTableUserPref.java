package uz.customs.customprice.entity.costMonitoring;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "COSTMONTABLEUSERPREF", schema = "CP")
public class CostMonTableUserPref extends AbstractAuditingEntity {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @Column(name = "USERID")
    String userId;

    @Column(name = "SETTING_NAME")
    String settingName;

    @Column(name = "ISDEFAULT")
    int isDefault;

    @Column(name = "FLEXCHECKINDETERMINATE1")
    int flexCheckIndeterminate1;

    @Column(name = "FLEXCHECKINDETERMINATE2")
    int flexCheckIndeterminate2;

    @Column(name = "FLEXCHECKINDETERMINATE3")
    int flexCheckIndeterminate3;

    @Column(name = "FLEXCHECKINDETERMINATE4")
    int flexCheckIndeterminate4;

    @Column(name = "FLEXCHECKINDETERMINATE5")
    int flexCheckIndeterminate5;

    @Column(name = "FLEXCHECKINDETERMINATE6")
    int flexCheckIndeterminate6;

    @Column(name = "FLEXCHECKINDETERMINATE7")
    int flexCheckIndeterminate7;

    @Column(name = "FLEXCHECKINDETERMINATE8")
    int flexCheckIndeterminate8;

    @Column(name = "FLEXCHECKINDETERMINATE9")
    int flexCheckIndeterminate9;

    @Column(name = "FLEXCHECKINDETERMINATE10")
    int flexCheckIndeterminate10;

    @Column(name = "FLEXCHECKINDETERMINATE11")
    int flexCheckIndeterminate11;

    @Column(name = "FLEXCHECKINDETERMINATE12")
    int flexCheckIndeterminate12;

    @Column(name = "FLEXCHECKINDETERMINATE13")
    int flexCheckIndeterminate13;

    @Column(name = "FLEXCHECKINDETERMINATE14")
    int flexCheckIndeterminate14;

    @Column(name = "FLEXCHECKINDETERMINATE15")
    int flexCheckIndeterminate15;

    @Column(name = "FLEXCHECKINDETERMINATE16")
    int flexCheckIndeterminate16;

    @Column(name = "FLEXCHECKINDETERMINATE17")
    int flexCheckIndeterminate17;

    @Column(name = "FLEXCHECKINDETERMINATE18")
    int flexCheckIndeterminate18;

    @Column(name = "FLEXCHECKINDETERMINATE19")
    int flexCheckIndeterminate19;

    @Column(name = "FLEXCHECKINDETERMINATE20")
    int flexCheckIndeterminate20;

    @Column(name = "FLEXCHECKINDETERMINATE21")
    int flexCheckIndeterminate21;

    @Column(name = "FLEXCHECKINDETERMINATE22")
    int flexCheckIndeterminate22;

    @Column(name = "FLEXCHECKINDETERMINATE23")
    int flexCheckIndeterminate23;

    @Column(name = "FLEXCHECKINDETERMINATE24")
    int flexCheckIndeterminate24;

    @Column(name = "FLEXCHECKINDETERMINATE25")
    int flexCheckIndeterminate25;

    @Column(name = "FLEXCHECKINDETERMINATE26")
    int flexCheckIndeterminate26;

    @Column(name = "FLEXCHECKINDETERMINATE27")
    int flexCheckIndeterminate27;

    @Column(name = "FLEXCHECKINDETERMINATE28")
    int flexCheckIndeterminate28;

    @Column(name = "FLEXCHECKINDETERMINATE29")
    int flexCheckIndeterminate29;

    @Column(name = "FLEXCHECKINDETERMINATE30")
    int flexCheckIndeterminate30;

    @Column(name = "FLEXCHECKINDETERMINATE31")
    int flexCheckIndeterminate31;

    @Column(name = "FLEXCHECKINDETERMINATE32")
    int flexCheckIndeterminate32;

    @Column(name = "FLEXCHECKINDETERMINATE33")
    int flexCheckIndeterminate33;

    @Column(name = "FLEXCHECKINDETERMINATE34")
    int flexCheckIndeterminate34;

    @Column(name = "FLEXCHECKINDETERMINATE35")
    int flexCheckIndeterminate35;

    @Column(name = "FLEXCHECKINDETERMINATE36")
    int flexCheckIndeterminate36;

    @Column(name = "FLEXCHECKINDETERMINATE37")
    int flexCheckIndeterminate37;

    @Column(name = "FLEXCHECKINDETERMINATE38")
    int flexCheckIndeterminate38;

    @Column(name = "FLEXCHECKINDETERMINATE39")
    int flexCheckIndeterminate39;

    @Column(name = "FLEXCHECKINDETERMINATE40")
    int flexCheckIndeterminate40;

    @Column(name = "FLEXCHECKINDETERMINATE41")
    int flexCheckIndeterminate41;

    @Column(name = "FLEXCHECKINDETERMINATE42")
    int flexCheckIndeterminate42;

    @Column(name = "FLEXCHECKINDETERMINATE43")
    int flexCheckIndeterminate43;

    @Column(name = "FLEXCHECKINDETERMINATE44")
    int flexCheckIndeterminate44;

    @Column(name = "FLEXCHECKINDETERMINATE45")
    int flexCheckIndeterminate45;

    @Column(name = "FLEXCHECKINDETERMINATE46")
    int flexCheckIndeterminate46;

}
