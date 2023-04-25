package uz.customs.customprice.service.costmonitoring.baseEntityServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringDataRepository;
import uz.customs.customprice.service.costmonitoring.logEntityServices.CostMonitoringLogService;

import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class CostMonitoringDataService {

    private final CostMonitoringDataRepository costMonitoringDataRepository;
    private final CostMonitoringLogService costMonitoringLogService;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<BaseEntity> dataTable(DataTablesInput input, HttpServletRequest httpServletRequest){
        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);
        DateRangeG7B dateRangeG7B = new DateRangeG7B(input);

        long timeRangeQueryStart = System.currentTimeMillis();
        DataTablesOutput<BaseEntity> baseEntityDataTablesOutput =  costMonitoringDataRepository.findAll(input, dateRangeSpecification.and(dateRangeG7B)/*.and(new ExcludeAnalystsSpecification()).and(fullNameSpecification)*/
//                (root, query, criteriaBuilder) -> {
//                    if (query.getResultType() != Long.class) {
//                        root.fetch("tnfCommodity", JoinType.LEFT);
//                    }
//                    return null;
//                }
        );
        long timeRangeQueryEnd = System.currentTimeMillis();

        String g33 = input.getColumn("g33").getSearch().getValue();
        if (!g33.equals("")){
            costMonitoringLogService.saveLog(
                    httpServletRequest,
                    timeRangeQueryStart,
                    timeRangeQueryEnd,
                    baseEntityDataTablesOutput.getRecordsFiltered(),
                    g33,
                    input.getColumn("g31Name").getSearch().getValue()
            );
        }

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
        return baseEntityDataTablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<BaseEntity> {
        @Override
        public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Expression<LocalDate> ugtkQuery = root.get("ugtk").as(LocalDate.class);
            Predicate g33 = criteriaBuilder.equal(root.get("g33"), "8537109100");
            Predicate codeUgtk = criteriaBuilder.equal(root.get("ugtk"), ugtkQuery);
            Predicate finalPredicate = criteriaBuilder.and(g33, codeUgtk);
            return finalPredicate;
        }
    }

}
