package uz.customs.customprice.service.costmonitoring.logEntityServices;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.jpa.datatables.mapping.Column;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.costmonitoring.CPLog;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringDataLogRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;

import java.util.ArrayList;
import java.util.List;

import static antlr.build.ANTLR.root;
import static org.springframework.security.oauth2.common.AuthenticationScheme.query;

@Service
@RequiredArgsConstructor
public class CostMonitoringDataLogService {

    private final CostMonitoringDataLogRepository costMonitoringDataLogRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<CPLog> getReportInspector(DataTablesInput input){
        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);

        // Create CriteriaBuilder and CriteriaQuery
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = criteriaBuilder.createQuery(Object[].class);
        Root<CPLog> root = query.from(CPLog.class);

        // Define the columns to select
        query.multiselect(
                root.get("locationId").alias("locationId"),
                root.get("locationNm").alias("locationNm"),
                root.get("userId").alias("userId"),
                root.get("userNm").alias("userNm"),
                criteriaBuilder.avg(root.get("resultTime")).alias("resultTime"),
                criteriaBuilder.count(root.get("g33")).alias("g33"),
                criteriaBuilder.count(root.get("keyword")).alias("keyword"),
                criteriaBuilder.sum(root.get("resultCount")).alias("resultCount")
        );

        // Group by locationId, locationNm, userId, and userNm
        query.groupBy(
                root.get("locationId"),
                root.get("locationNm"),
                root.get("userId"),
                root.get("userNm")
        );

        // Apply the date range specification as well as any other specifications needed
        Predicate predicate = dateRangeSpecification.toPredicate(root, query, criteriaBuilder);

        for (Column column : input.getColumns()) {
            String columnName = column.getData();
            String searchValue = column.getSearch().getValue();
            if (StringUtils.isNotEmpty(searchValue)) {
                predicate = criteriaBuilder.and(predicate,
                        criteriaBuilder.like(root.get(columnName), "%" + searchValue + "%"));
            }
        }

        query.where(predicate);

        // Execute the query and transform the result into CPLog objects
        List<Object[]> resultTotalCount = entityManager.createQuery(query).getResultList();
        List<Object[]> result = entityManager.createQuery(query)
                .setFirstResult(input.getStart())
                .setMaxResults(input.getLength())
                .getResultList();
        List<CPLog> cpLogs = new ArrayList<>();
        for (Object[] row : result) {
            CPLog cpLog = new CPLog();
            cpLog.setLocationId(String.valueOf(row[0]));
            cpLog.setLocationNm((String) row[1]);
            cpLog.setUserId((String) row[2]);
            cpLog.setUserNm((String) row[3]);
            cpLog.setResultTime(Double.valueOf((Double) row[4]).longValue());
            cpLog.setG33(row[5].toString());
            cpLog.setKeyword(row[6].toString());
            cpLog.setResultCount( Long.valueOf((Long) row[7]).intValue());
            cpLogs.add(cpLog);
        }

        // Create a DataTablesOutput object with the transformed result and input parameters
        DataTablesOutput<CPLog> output = new DataTablesOutput<>();
        output.setDraw(input.getDraw());
        output.setData(cpLogs);
        output.setRecordsFiltered(resultTotalCount.size());
        output.setRecordsTotal(resultTotalCount.size());

        return output;
    }

//    public DataTablesOutput<CPLog> getReportInspector(DataTablesInput input) {
//        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);
//
//        // Create CriteriaBuilder and CriteriaQuery
//        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = criteriaBuilder.createQuery(Object[].class);
//        Root<CPLog> root = query.from(CPLog.class);
//
//        // Define the columns to select
//        query.multiselect(
//                root.get("locationId").alias("locationId"),
//                root.get("locationNm").alias("locationNm"),
//                root.get("userId").alias("userId"),
//                root.get("userNm").alias("userNm"),
//                criteriaBuilder.avg(root.get("resultTime")).alias("resultTime"),
//                criteriaBuilder.count(root.get("g33")).alias("g33"),
//                criteriaBuilder.count(root.get("keyword")).alias("keyword"),
//                criteriaBuilder.sum(root.get("resultCount")).alias("resultCount")
//        );
//
//        // Group by locationId, locationNm, userId, and userNm
//        query.groupBy(
//                root.get("locationId"),
//                root.get("locationNm"),
//                root.get("userId"),
//                root.get("userNm")
//        );
//
//        // Apply the date range specification as well as any other specifications needed
//        Predicate predicate = dateRangeSpecification.toPredicate(root, query, criteriaBuilder);
//
//        for (Column column : input.getColumns()) {
//            String columnName = column.getData();
//            String searchValue = column.getSearch().getValue();
//            if (StringUtils.isNotEmpty(searchValue)) {
//                predicate = criteriaBuilder.and(predicate,
//                        criteriaBuilder.like(root.get(columnName), "%" + searchValue + "%"));
//            }
//        }
//
//        query.where(predicate);
//
//        // Create a TypedQuery object and set the pagination parameters
//        TypedQuery<Object[]> typedQuery = entityManager.createQuery(query);
//        typedQuery.setFirstResult(input.getStart());
//        typedQuery.setMaxResults(input.getLength());
//
//        // Execute the query and transform the result into CPLog objects
//        List<Object[]> result = typedQuery.getResultList();
//        List<CPLog> cpLogs = new ArrayList<>();
//        for (Object[] row : result) {
//            CPLog cpLog = new CPLog();
//            cpLog.setLocationId(String.valueOf(row[0]));
//            cpLog.setLocationNm((String) row[1]);
//            cpLog.setUserId((String) row[2]);
//            cpLog.setUserNm((String) row[3]);
//            cpLog.setResultTime(Double.valueOf((Double) row[4]).longValue());
//            cpLog.setG33(row[5].toString());
//            cpLog.setKeyword(row[6].toString());
//            cpLog.setResultCount(Long.valueOf((Long) row[7]).intValue());
//            cpLogs.add(cpLog);
//        }
//
//        // Create a DataTablesOutput object with the transformed result and input parameters
//        DataTablesOutput<CPLog> output = new DataTablesOutput<>();
//        output.setDraw(input.getDraw());
//        output.setData(cpLogs);
//        output.setRecordsFiltered(result.size());
//        output.setRecordsTotal(result.size());
//
//        return output;
//    }


//    public DataTablesOutput<CPLog> getReportInspector(DataTablesInput input){
//        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);
//
//        // Create CriteriaBuilder and CriteriaQuery
//        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
//        CriteriaQuery<Object[]> query = criteriaBuilder.createQuery(Object[].class);
//        Root<CPLog> root = query.from(CPLog.class);
//
//        // Define the columns to select
//        query.multiselect(
//                root.get("locationId").alias("locationId"),
//                root.get("locationNm").alias("locationNm"),
//                root.get("userId").alias("userId"),
//                root.get("userNm").alias("userNm"),
//                criteriaBuilder.avg(root.get("resultTime")).alias("resultTime"),
//                criteriaBuilder.count(root.get("g33")).alias("g33"),
//                criteriaBuilder.count(root.get("keyword")).alias("keyword"),
//                criteriaBuilder.sum(root.get("resultCount")).alias("resultCount")
//        );
//
//        // Group by locationId, locationNm, userId, and userNm
//        query.groupBy(
//                root.get("locationId"),
//                root.get("locationNm"),
//                root.get("userId"),
//                root.get("userNm")
//        );
//
//        // Apply the date range specification as well as any other specifications needed
//        Predicate predicate = dateRangeSpecification.toPredicate(root, query, criteriaBuilder);
//
//        for (Column column : input.getColumns()) {
//            String columnName = column.getData();
//            String searchValue = column.getSearch().getValue();
//            if (StringUtils.isNotEmpty(searchValue)) {
//                predicate = criteriaBuilder.and(predicate,
//                        criteriaBuilder.like(root.get(columnName), "%" + searchValue + "%"));
//            }
//        }
//
//        query.where(predicate);
//
//        // Execute the query and transform the result into CPLog objects
//        List<Object[]> result = entityManager.createQuery(query).getResultList();
//        List<CPLog> cpLogs = new ArrayList<>();
//        for (Object[] row : result) {
//            CPLog cpLog = new CPLog();
//            cpLog.setLocationId(String.valueOf(row[0]));
//            cpLog.setLocationNm((String) row[1]);
//            cpLog.setUserId((String) row[2]);
//            cpLog.setUserNm((String) row[3]);
//            cpLog.setResultTime(Double.valueOf((Double) row[4]).longValue());
//            cpLog.setG33(row[5].toString());
//            cpLog.setKeyword(row[6].toString());
//            cpLog.setResultCount( Long.valueOf((Long) row[7]).intValue());
//            cpLogs.add(cpLog);
//        }
//
//        // Create a DataTablesOutput object with the transformed result and input parameters
//        DataTablesOutput<CPLog> output = new DataTablesOutput<>();
//        output.setDraw(input.getDraw());
//        output.setData(cpLogs);
//        output.setRecordsFiltered(result.size());
//        output.setRecordsTotal(result.size());
//
//        return output;
//    }

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<CPLog> getReportCommodity(DataTablesInput input){
        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);

//        String searchValue = escapeContent(input.getSearch().getValue());
//        input.getSearch().setValue("");
//        Specification<TnfApp> fullNameSpecification = (Specification<TnfApp>) (root, query, criteriaBuilder) -> {
//            if (!hasText(searchValue)) {
//                return null;
//            }
//            String[] parts = searchValue.split(" ");
//            Expression<String> firstNameExpression = criteriaBuilder.lower(root.get("g7a"));
//            Expression<String> lastNameExpression = criteriaBuilder.lower(root.get("g7b"));
//            if (parts.length == 2 && hasText(parts[0]) && hasText(parts[1])) {
//                return criteriaBuilder.or(
//                        criteriaBuilder.and(
//                                criteriaBuilder.equal(firstNameExpression, parts[0]),
//                                criteriaBuilder.like(lastNameExpression, parts[1] + "%", '~')
//                        ),
//                        criteriaBuilder.and(
//                                criteriaBuilder.equal(lastNameExpression, parts[0]),
//                                criteriaBuilder.like(firstNameExpression, parts[1] + "%", '~')
//                        )
//                );
//            } else {
//                return criteriaBuilder.or(
//                        criteriaBuilder.like(firstNameExpression, searchValue + "%", '~'),
//                        criteriaBuilder.like(lastNameExpression, searchValue + "%", '~')
//                );
//            }
//        };

        return costMonitoringDataLogRepository.findAll(
                input,
                dateRangeSpecification/*.and(new SpecificationCommodity()).and(fullNameSpecification)*/
//                (root, query, criteriaBuilder) -> {
//                    if (query.getResultType() != Long.class) {
//                        root.fetch("tnfCommodity", JoinType.LEFT);
//                    }
//                    return null;
//                }
        );
    }

}
