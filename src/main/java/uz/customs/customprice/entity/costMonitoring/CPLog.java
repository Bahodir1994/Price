package uz.customs.customprice.entity.costMonitoring;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.Duration;
import java.util.Date;

@Entity
@Table(name = "CP_LOG", schema = "CP", indexes = {@Index(columnList = "id", unique = true), @Index(columnList = "user_Id", unique = false)})
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CPLog {
    @Id
    @GeneratedValue(generator = "uuid4")
    @GenericGenerator(name = "uuid4", strategy = "org.hibernate.id.UUIDGenerator")
    @Column(name = "id", columnDefinition = "VARCHAR(50)")
    private String id;

    @Column(name = "USER_ID", length = 50)
    private String userId;

    @Column(name = "USER_NM", columnDefinition = "VARCHAR(90) CCSID 1208")
    private String userNm;

    @Column(name = "LOCATION_ID", length = 4)
    private String locationId;

    @Column(name = "LOCATION_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String locationNm;

    @Column(name = "POST_ID", length = 10)
    private String postId;

    @Column(name = "POST_NM", columnDefinition = "VARCHAR(180) CCSID 1208")
    private String postNm;

    @CreatedDate
    @Column(name = "instime", columnDefinition = " timestamp default current_timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date insTime = new Date(System.currentTimeMillis());

    @Column(name = "resulttime", length = 50)
    private long resultTime;

    @Column(name = "G33", length = 10)
    private String g33;

    @Column(name = "KEYWORD", columnDefinition = "VARCHAR(300) CCSID 1208")
    private String keyword;

    @Column(name = "RESULT_COUNT", length = 10)
    private int resultCount;

    @Column(name = "G7A", length = 5)
    private String g7a;

    @Column(name = "G7B")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    private Date g7b;

    @Column(name = "G7C", length = 7)
    private String g7c;

    @Column(name = "G32", length = 3)
    private String g32;

    @Column(name = "COMMENT", columnDefinition = "VARCHAR(300) CCSID 1208")
    private String comment;

    @Column(name = "BELONGS", columnDefinition = " SMALLINT ")
    private int belongs;

}
