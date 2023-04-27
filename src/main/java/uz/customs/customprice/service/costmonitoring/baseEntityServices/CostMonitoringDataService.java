package uz.customs.customprice.service.costmonitoring.baseEntityServices;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringDataRepository;
import uz.customs.customprice.service.costmonitoring.logEntityServices.CostMonitoringLogService;

import javax.persistence.EntityManager;
import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CostMonitoringDataService {

    private final CostMonitoringDataRepository costMonitoringDataRepository;
    private final CostMonitoringLogService costMonitoringLogService;

    @Autowired
    private EntityManager entityManager;

//    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
//    public DataTablesOutput<BaseEntity> dataTable(DataTablesInput input, HttpServletRequest httpServletRequest){
//        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);
//        DateRangeG7B dateRangeG7B = new DateRangeG7B(input);
//
//        long timeRangeQueryStart = System.currentTimeMillis();
//
//        // Modify the findAll method call to add a custom Specification for g31Name search
//        Specification<BaseEntity> specification = dateRangeSpecification.and(dateRangeG7B);
//        String g31Name = input.getColumn("g31Name").getSearch().getValue();
//        if (!StringUtils.isEmpty(g31Name)) {
//            String[] g31NameValues = g31Name.split(","); // Split multiple values by comma
//            List<Specification<BaseEntity>> g31NameSpecifications = new ArrayList<>();
//            for (String g31NameValue : g31NameValues) {
//                g31NameSpecifications.add((root, query, builder) ->
//                        builder.like(builder.lower(root.get("g31Name")), "%" + g31NameValue.toLowerCase() + "%"));
//            }
//            specification = specification.and(Specification.where(g31NameSpecifications.get(0)));
//            for (int i = 1; i < g31NameSpecifications.size(); i++) {
//                specification = specification.or(g31NameSpecifications.get(i));
//            }
//        }
//
//        DataTablesOutput<BaseEntity> baseEntityDataTablesOutput =  costMonitoringDataRepository.findAll(
//                input,
//                specification
//        );
//        long timeRangeQueryEnd = System.currentTimeMillis();
//
//        String g33 = input.getColumn("g33").getSearch().getValue();
//        if (!g33.equals("") || !StringUtils.isEmpty(g31Name)){
//            costMonitoringLogService.saveLog(
//                    httpServletRequest,
//                    timeRangeQueryStart,
//                    timeRangeQueryEnd,
//                    baseEntityDataTablesOutput.getRecordsFiltered(),
//                    g33,
//                    g31Name
//            );
//        }
//
//        return baseEntityDataTablesOutput;
//    }


    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<BaseEntity> dataTable(DataTablesInput input, HttpServletRequest httpServletRequest){
        DateRangeSpecification dateRangeSpecification = new DateRangeSpecification(input);
        DateRangeG7B dateRangeG7B = new DateRangeG7B(input);

        long timeRangeQueryStart = System.currentTimeMillis();

        DataTablesOutput<BaseEntity> baseEntityDataTablesOutput =  costMonitoringDataRepository.findAll(
                input,
                dateRangeSpecification
                        .and(dateRangeG7B)
                        .and((new ExcludeAnalystsSpecification(input)))
        );

        long timeRangeQueryEnd = System.currentTimeMillis();
        String g33 = input.getColumn("g33").getSearch().getValue();
        String g31Name = input.getColumn("g31Name").getSearch().getValue();
        if (!g33.equals("") || !g31Name.equals("")){
            costMonitoringLogService.saveLog(
                    httpServletRequest,
                    timeRangeQueryStart,
                    timeRangeQueryEnd,
                    baseEntityDataTablesOutput.getRecordsFiltered(),
                    g33,
                    input.getColumn("g31Name").getSearch().getValue()
            );
        }

        return baseEntityDataTablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<BaseEntity> {
        private final DataTablesInput input;

        public ExcludeAnalystsSpecification(DataTablesInput input) {
            this.input = input;
        }

        @Override
        public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            String g31NameSearchValue = input.getColumn("g31Name").getSearch().getValue();
            if (StringUtils.isEmpty(g31NameSearchValue)) {
                return null; // No search value provided, return null predicate
            }
            String[] searchValues = g31NameSearchValue.split("#"); // assuming search values are comma-separated
            Predicate combinedPredicate = null;
            for (String searchValue : searchValues) {
                searchValue = searchValue.trim();
                Predicate likePredicate = criteriaBuilder.like(criteriaBuilder.lower(root.get("g31Name")), "%" + searchValue.toLowerCase() + "%");
                if (combinedPredicate == null) {
                    combinedPredicate = likePredicate;
                } else {
                    combinedPredicate = criteriaBuilder.or(combinedPredicate, likePredicate);
                }
            }
            return combinedPredicate;
        }
    }

}
