package uz.customs.customprice.repository.costmonitoring;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.costmonitoring.CPLog;

import java.util.Date;

@Repository
public interface CostMonitoringLogRepository extends JpaRepository<CPLog, String> {

    @Query("select c from CPLog c where " +
            " (:locationId='' or :locationId is null or c.locationId = :locationId) and " +
            " (:userNm='' or :userNm is null or lower(c.userNm) like lower(CONCAT('%',:userNm,'%')) ) and " +
            " (:resultTime is null or c.resultTime in (:resultTime)) and " +
            " (:insTimeStart is null or c.insTime >= :insTimeStart) and " +
            " (:insTimeEnd is null or c.insTime <= :insTimeEnd) and " +
            " (:g33=''or :g33 is null or c.g33 like CONCAT('%',:g33,'%')) and " +
            " (:resultCount is null or c.resultCount in (:resultCount))"
    )
    Page<CPLog> findByQuery(
            @Param("locationId") String locationId,
            @Param("userNm") String userNm,
            @Param("resultTime") Long resultTime,
            @Param("g33") Long g33,
            @Param("resultCount") Integer resultCount,
            @Param("insTimeStart") Date insTimeStart,
            @Param("insTimeEnd") Date insTimeend,
            Pageable pageable
    );

    @Query( value = "select" +
            "    c.location_id as locationId," +
            "    c.location_nm as locationNm," +
            "    c.user_id as userId," +
            "    c.user_nm as userNm," +
            "    avg(c.resulttime) as resultTime, " +
            "    count(c.g33) as g33," +
            "    count(c.keyword) as keyword," +
            "    sum(c.result_count) as resultCount from CP.CP_LOG c where" +
            " (:locationId='' or :locationId is null or c.location_id = :locationId) and " +
            " (:userNm='' or :userNm is null or c.user_nm = :userNm) and " +
            " (:resultTime is null or c.resulttime = :resultTime) and " +
            " (:g33 is null or c.g33 = :g33) and" +
            " (:keyword is null or c.keyword = :keyword) and " +
            " (:resultCount is null or c.result_count = :resultCount) and" +
            " (:insTimeStart is null or c.instime >= :insTimeStart) and " +
            " (:insTimeEnd is null or c.instime <= :insTimeEnd) " +
            "group by" +
            "    c.location_id," +
            "    c.location_nm," +
            "    c.user_id," +
            "    c.user_nm",
            countQuery = "select count(c.user_id) from CP.CP_LOG c where" +
                    " (:locationId='' or :locationId is null or c.location_id = :locationId) and " +
                    " (:userNm='' or :userNm is null or c.user_nm = :userNm) and " +
                    " (:resultTime is null or c.resulttime = :resultTime) and " +
                    " (:g33 is null or c.g33 = :g33) and" +
                    " (:keyword is null or c.keyword = :keyword) and " +
                    " (:resultCount is null or c.result_count = :resultCount) and" +
                    " (:insTimeStart is null or c.instime >= :insTimeStart) and " +
                    " (:insTimeEnd is null or c.instime <= :insTimeEnd) " +
                    "group by" +
                    "    c.location_id," +
                    "    c.location_nm," +
                    "    c.user_id," +
                    "    c.user_nm",
            nativeQuery = true
    )
    Page<Object[]> findByQuerySql(
            @Param("locationId") String locationId,
            @Param("userNm") String userNm,
            @Param("resultTime") Long resultTime,
            @Param("g33") Long g33,
            @Param("keyword") Long keyword,
            @Param("resultCount") Integer resultCount,
            @Param("insTimeStart") Date insTimeStart,
            @Param("insTimeEnd") Date insTimeend,
            Pageable pageable
    );

}
