package uz.customs.customprice.entity.costMonitoring;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "CP_REPL", schema = "CP", catalog = "")
public class CpReplEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "CMDT_ID")
    private String cmdtId;
   
    @Column(name = "DECL_ID")
    private String declId;
   
    @Column(name = "UGTK")
    private String ugtk;
   
    @Column(name = "G7A")
    private String g7A;
   
    @Column(name = "G7B") /**/
    private Date g7B;
   
    @Column(name = "G7C")
    private String g7C;
   
    @Column(name = "G1A")
    private String g1A;
   
    @Column(name = "G1B")
    private String g1B;
   
    @Column(name = "G32")
    private int g32;
   
    @Column(name = "G37B")
    private String g37B;
   
    @Column(name = "G37C")
    private String g37C;

    @Column(name = "G2NAME")
    private String g2Name;
   
    @Column(name = "G8CODE2")  /**/
    private String g8Code2;
   
    @Column(name = "G33")
    private String g33;
   
    @Column(name = "G31NAME")
    private String g31Name;
   
    @Column(name = "G15") /**/
    private String g15;
   
    @Column(name = "G11") /**/
    private String g11;
   
    @Column(name = "VID_KONTRAKTA")
    private int vidKontrakta;
   
    @Column(name = "G34")  /**/
    private String g34;
   
    @Column(name = "S34") /**/
    private String s34;
   
    @Column(name = "G25")
    private String g25;
   
    @Column(name = "G20A")
    private String g20A;
   
    @Column(name = "G20B")
    private String g20B;
   
    @Column(name = "G20NAME")
    private String g20Name;
   
    @Column(name = "G22A")
    private String g22A;
   
    @Column(name = "G45") /**/
    private BigDecimal g45;
   
    @Column(name = "G45USD") /**/
    private BigDecimal g45Usd;
   
    @Column(name = "G42") /**/
    private BigDecimal g42;
   
    @Column(name = "G42USD") /**/
    private BigDecimal g42Usd;
   
    @Column(name = "INDXUSD") /**/
    private BigDecimal indxusd;
   
    @Column(name = "INDXUSD_LN")
    private BigDecimal indxusdLn;
   
    @Column(name = "G45USDED") /**/
    private BigDecimal g45Usded;
   
    @Column(name = "G45USDED_LN")
    private BigDecimal g45UsdedLn;
   
    @Column(name = "G31MARKA") /**/
    private String g31Marka;
   
    @Column(name = "G35") /**/
    private BigDecimal g35;
   
    @Column(name = "G38") /**/
    private BigDecimal g38;
   
    @Column(name = "G41")
    private String g41;
   
    @Column(name = "G43")
    private String g43;
   
    @Column(name = "G31AMOUNT") /**/
    private BigDecimal g31Amount;
   
    @Column(name = "VES_ED")  /**/
    private BigDecimal vesEd;
   
    @Column(name = "GDVIPDATE")  /**/
    private Date gdvipdate;
   
    @Column(name = "GC3DATE")  /**/
    private Date gc3Date;
   
    @Column(name = "METOD")
    private String metod;
   
    @Column(name = "VZAIMOSVYAZ")
    private Short vzaimosvyaz;
   
    @Column(name = "IDN")
    private String idn;
   
    @Column(name = "OBL")
    private int obl;
   
    @Column(name = "LGOT20")  /**/
    private String lgot20;
   
    @Column(name = "LGOT27")  /**/
    private String lgot27;
   
    @Column(name = "LGOT29")  /**/
    private String lgot29;
   
    @Column(name = "SOVSTAVKA")  /**/
    private BigDecimal sovstavka;
   
    @Column(name = "ASOS_QIYMAT")
    private String asosQiymat;
   
    @Column(name = "KTD")
    private int ktd;
   
    @Column(name = "GC3DATE_ALL")
    private int gc3DateAll;



}
