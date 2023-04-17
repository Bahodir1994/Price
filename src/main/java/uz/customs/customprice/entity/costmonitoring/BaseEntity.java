package uz.customs.customprice.entity.costmonitoring;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "BASE", schema = "CATEGORY")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BaseEntity {
    @Id
    @Column(name = "ID", nullable = false)
    private int id;

    @Column(name = "DECL_ID", nullable = false, length = 22)
    private String declId;

    @Column(name = "CMDT_ID", nullable = false, length = 22)
    private String cmdtId;

    @Column(name = "UGTK", nullable = true, length = 5)
    private String ugtk;

    @Column(name = "G7A", nullable = true, length = 5)
    private String g7A;

    @Column(name = "G7B", nullable = true)
    private Date g7B;

    @Column(name = "G7C", nullable = true, length = 7)
    private String g7C;

    @Column(name = "G1A", nullable = false, length = 4)
    private String g1A;

    @Column(name = "G1B", nullable = true, length = 2)
    private String g1B;

    @Column(name = "G32", nullable = false)
    private int g32;

    @Column(name = "G37B", nullable = true, length = 2)
    private String g37B;

    @Column(name = "G37C", nullable = false, length = 3)
    private String g37C;

    @Column(name = "G2NAME", nullable = true, length = 100)
    private String g2Name;

    @Column(name = "G8CODE2", nullable = true, length = 14)
    private String g8Code2;

    @Column(name = "G33", nullable = false, length = 12)
    private String g33;

    @Column(name = "G31NAME", nullable = true, length = 500)
    private String g31Name;

    @Column(name = "G15", nullable = true, length = 3)
    private String g15;

    @Column(name = "G11", nullable = true, length = 3)
    private String g11;

    @Column(name = "VID_KONTRAKTA", nullable = false)
    private int vidKontrakta;

    @Column(name = "G34", nullable = true, length = 3)
    private String g34;

    @Column(name = "S34", nullable = true, length = 3)
    private String s34;

    @Column(name = "G25", nullable = false, length = 2)
    private String g25;

    @Column(name = "G20A", nullable = true, length = 2)
    private String g20A;

    @Column(name = "G20B", nullable = true, length = 6)
    private String g20B;

    @Column(name = "G20NAME", nullable = true, length = 40)
    private String g20Name;

    @Column(name = "G22A", nullable = false, length = 3)
    private String g22A;

    @Column(name = "G45", nullable = true, precision = 19, scale = 5)
    private BigDecimal g45;

    @Column(name = "G45USD", nullable = true, precision = 19, scale = 5)
    private BigDecimal g45Usd;

    @Column(name = "G42", nullable = true, precision = 19, scale = 5)
    private BigDecimal g42;

    @Column(name = "G42USD", nullable = true, precision = 19, scale = 5)
    private BigDecimal g42Usd;

    @Column(name = "INDXUSD", nullable = true, precision = 19, scale = 5)
    private BigDecimal indxusd;

    @Column(name = "INDXUSD_LN", nullable = true, precision = 19, scale = 5)
    private BigDecimal indxusdLn;

    @Column(name = "G45USDED", nullable = true, precision = 19, scale = 5)
    private BigDecimal g45Usded;

    @Column(name = "G45USDED_LN", nullable = true, precision = 19, scale = 5)
    private BigDecimal g45UsdedLn;

    @Column(name = "G31MARKA", nullable = true, length = 40)
    private String g31Marka;

    @Column(name = "G35", nullable = true, precision = 19, scale = 5)
    private BigDecimal g35;

    @Column(name = "G38", nullable = false, precision = 19, scale = 5)
    private BigDecimal g38;

    @Column(name = "G41", nullable = true, length = 3)
    private String g41;

    @Column(name = "G43", nullable = true, length = 1)
    private String g43;

    @Column(name = "G31AMOUNT", nullable = true, precision = 19, scale = 5)
    private BigDecimal g31Amount;

    @Column(name = "VES_ED", nullable = true, precision = 19, scale = 5)
    private BigDecimal vesEd;

    @Column(name = "GDVIPDATE", nullable = true)
    private Date gdvipdate;

    @Column(name = "GC3DATE", nullable = true)
    private Date gc3Date;

    @Column(name = "METOD", nullable = true, length = 60)
    private String metod;

    @Column(name = "VZAIMOSVYAZ", nullable = true)
    private Short vzaimosvyaz;

    @Column(name = "IDN", nullable = true, length = 27)
    private String idn;

    @Column(name = "OBL", nullable = false)
    private int obl;

    @Column(name = "LGOT20", nullable = true, length = 135)
    private String lgot20;

    @Column(name = "LGOT27", nullable = true, length = 135)
    private String lgot27;

    @Column(name = "LGOT29", nullable = true, length = 135)
    private String lgot29;

    @Column(name = "SOVSTAVKA", nullable = true, precision = 19, scale = 5)
    private BigDecimal sovstavka;

    @Column(name = "ASOS_QIYMAT", nullable = true, length = 815)
    private String asosQiymat;

    @Column(name = "KTD", nullable = false)
    private int ktd;
    
}
