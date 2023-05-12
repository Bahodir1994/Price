package uz.customs.customprice.entity.decisioncharges;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "STATUS_TYPE", schema = "CPID")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DecisionChargesStatusType {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "ID")
    private short id;
     
    @Column(name = "NAME")
    private String name;
     
    @Column(name = "COMMENT")
    private String comment;
     
    @Column(name = "INSUSER")
    private String insuser;
     
    @Column(name = "UPDUSER")
    private String upduser;
     
    @Column(name = "INSTIME")
    private Timestamp instime;
     
    @Column(name = "UPDTIME")
    private Timestamp updtime;
     
    @Column(name = "ISDELETED")
    private Short isdeleted;

    @Column(name = "LNGA_TPCD")
    private String lngaTpcd;
}
