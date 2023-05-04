package uz.customs.customprice.entity.earxiv;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;
import uz.customs.customprice.component.entityComponents.AbstractAuditingEntity;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "EARXIV", schema = "CPID", indexes = {@Index(columnList = "id", unique = true), @Index(columnList = "insuser", unique = false), @Index(columnList = "isdeleted", unique = false)})
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Earxiv extends AbstractAuditingEntity {
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

    @Column(name = "APP_ID", length = 50)
    private String appId;

    @Column(name = "FOLDER_ID")
    private String folderId;

    @Column(name = "NAME", columnDefinition = "VARCHAR(200) CCSID 1208")
    private String name;

    @Column(name = "USER_INN")
    private String userInn;

    @Column(name = "USER_PNFL")
    private String userPnfl;

    @Column(name = "DOCNAME", columnDefinition = "VARCHAR(200) CCSID 1208")
    private String docname;

    @Column(name = "DOC_TYPE")
    private String docType;

    @Column(name = "FILE_ID")
    @Size(max = 20, message = "Рақамлар катталиги чекланган(20 та гача)!")
    @NotBlank(message = "Майдон бўш бўлиши мумкун эмас!")
    private String fileId;

    @Column(name = "STATUS")
    private String status;

    @Column(name = "DOC_TYPE_NAME", columnDefinition = "VARCHAR(200) CCSID 1208")
    private String docTypeName;

    @Column(name = "SET_FOLDER_ID")
    private String setFolderId;

    @Column(name = "PART_NO", columnDefinition = "SMALLINT DEFAULT 1")
    private String partyNo;

    @Column(name = "DOC_ID", length = 50)
    private String docId;

    @Column(name = "HASH", length = 255)
    private String hash;

    @Column(name = "FILE_NUM", length = 50)
    private String fileNum;

    @Column(name = "FILE_DATE")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date fileDate;

    @Column(name = "DOCNAME_EX", columnDefinition = "VARCHAR(200) CCSID 1208")
    private String docNameEx;

}
