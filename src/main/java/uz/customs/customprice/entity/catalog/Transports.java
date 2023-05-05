package uz.customs.customprice.entity.catalog;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Where;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "TRANSPORTS")
@Where(clause = "USE_YN = 'Y'")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Transports {
    @Id
    @Column(name = "CODE", columnDefinition = "VARCHAR(3) CCSID 1025")
    String code;

    @Column(name = "CD_DESC", columnDefinition = "VARCHAR(600) CCSID 1208")
    String cdDesc;

    @Column(name = "CD_ID", columnDefinition = "VARCHAR(20) CCSID 1025")
    String cdId;

    @Column(name = "CD_ID_L", columnDefinition = "VARCHAR(2) CCSID 1025")
    String cdIdL;

    @Column(name = "CD_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    String cdNm;

    @Column(name = "CD_SHORT_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    String cdShortNm;

    @Column(name = "CD_ORDR", columnDefinition = "VARCHAR(4) CCSID 1025")
    String cdOrdr;

    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    String lngaTpcd;

    @Column(name = "USE_YN", columnDefinition = "VARCHAR(2) CCSID 1025")
    String useYN;
}
