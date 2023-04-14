package uz.customs.customprice.entity.catalog;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "COUNTRY", schema = "CPID")
public class Country {
    @Id
    @Column(name = "code")
    private String id;

    @Column(name = "CODE", columnDefinition = "VARCHAR(3) CCSID 1025")
    private String code;

    @Column(name = "LNGA_TPCD", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String lngaTpcd;

    @Column(name = "CD_ID", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String cdId;

    @Column(name = "CD_NM", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String cdNm;

    @Column(name = "CD_DESC", columnDefinition = "VARCHAR(600) CCSID 1208")
    private String cdDesc;

    @Column(name = "cd_ordr", columnDefinition = "VARCHAR(4) CCSID 1025")
    private String cdOrdr;

    @Column(name = "USE_YN", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String useYn;

    @Column(name = "CD_ID_L", columnDefinition = "VARCHAR(2) CCSID 1025")
    private String cdIdL;
}