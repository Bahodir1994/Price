package uz.customs.customprice.entity.catalog;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Tnved {

    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "UNIT1")
    private String unit1;

    @Column(name = "UNIT2")
    private String unit2;

    @Column(name = "LICENSE")
    private Short license;

    @Column(name = "ISDELETED")
    private short isdeleted;

    @Column(name = "STARTDATE")
    private Date startdate;

    @Column(name = "FINISHDATE")
    private Date finishdate;
}
