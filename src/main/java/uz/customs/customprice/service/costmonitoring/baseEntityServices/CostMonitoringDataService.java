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
