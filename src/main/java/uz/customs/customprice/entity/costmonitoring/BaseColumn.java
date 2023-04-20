package uz.customs.customprice.entity.costmonitoring;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;

import javax.persistence.*;

@Entity
@Table(name = "BASE_COLUMN", schema = "CATEGORY")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BaseColumn extends AbstractAuditingEntity {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(columnDefinition = "VARCHAR(50)")
    private String id;

    private String settingName;

    @Column(columnDefinition = " SMALLINT DEFAULT 0")
    private int isDefault;

    private boolean ugtk;
    private boolean g7A;
    private boolean g7B;
    private boolean me;
    private boolean g7Ag7Bg7C;
    private boolean g1A;
    private boolean g1B;
    private boolean g1Ag1B;
    private boolean g32;
    private boolean g37B;
    private boolean g37C;
    private boolean g2Name;
    private boolean g8Code2;
    private boolean g33;
    private boolean g31Name;
    private boolean g15;
    private boolean g11;
    private boolean vidKontrakta;
    private boolean g34;
    private boolean s34;
    private boolean g25;
    private boolean g20A;
    private boolean g20B;
    private boolean g20Name;
    private boolean g20Ag20B;
    private boolean g22A;
    private boolean g45;
    private boolean g45Usd;
    private boolean g42;
    private boolean g42Usd;
    private boolean indxusd;
    private boolean indxusdLn;
    private boolean g45Usded;
    private boolean g45UsdedLn;
    private boolean g31Marka;
    private boolean g35;
    private boolean g38;
    private boolean g41;
    private boolean g43;
    private boolean g31Amount;
    private boolean vesEd;
    private boolean gdvipdate;
    private boolean gc3Date;
    private boolean metod;
    private boolean vzaimosvyaz;
    private boolean idn;
    private boolean obl;
    private boolean lgot20;
    private boolean lgot27;
    private boolean lgot29;
    private boolean sovstavka;
    private boolean asosQiymat;
    private boolean ktd;


}
