package uz.customs.customprice.service.costmonitoring;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.component.costmonitoring.DateRangeSpecification;
import uz.customs.customprice.entity.BaseEntity;
import uz.customs.customprice.repository.CostMonitoringDataRepository;

import javax.persistence.criteria.*;

@Service
@RequiredArgsConstructor
public class CostMonitoringDataService {

    private final CostMonitoringDataRepository costMonitoringDataRepository;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<BaseEntity> dataTable(DataTablesInput input){
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

        return costMonitoringDataRepository.findAll(
                input,
                dateRangeSpecification/*.and(new ExcludeAnalystsSpecification()).and(fullNameSpecification)*/
//                (root, query, criteriaBuilder) -> {
//                    if (query.getResultType() != Long.class) {
//                        root.fetch("tnfCommodity", JoinType.LEFT);
//                    }
//                    return null;
//                }
        );
    }

    private static class ExcludeAnalystsSpecification implements Specification<BaseEntity> {
        @Override
        public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate senderLocationId = criteriaBuilder.notEqual(root.get("statusNm"), "Analyst");
            Predicate senderPostId = criteriaBuilder.notEqual(root.get("senderPostId"), "Analystic");
            Predicate finalPredicate = criteriaBuilder.and(senderLocationId, senderPostId);
            return finalPredicate;
        }
    }

}
