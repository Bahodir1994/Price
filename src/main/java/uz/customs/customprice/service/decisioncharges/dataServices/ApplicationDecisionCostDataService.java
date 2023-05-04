package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;
import uz.customs.customprice.repository.decisioncharges.dataRepository.ApplicationDecisionCostDataRepository;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.ApplicationDecisionCostRepository;
import uz.customs.customprice.service.catalog.*;
import uz.customs.customprice.service.decisioncharges.specification.ApplicationDecisionCostSpecification;

import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
public class ApplicationDecisionCostDataService {

    private final ApplicationDecisionCostDataRepository applicationDecisionCostDataRepository;
    private final ApplicationDecisionCostRepository applicationDecisionCostRepository;
    private final GetterSessionData getterSessionData;
    private final CountryService countryService;
    private final LocationService locationService;
    private final PostService postService;
    private final FeatMoveService featMoveService;
    private final UnitService unitService;
    private final CustomsModeService customsModeService;
    private final DeliveryTermsService deliveryTermsService;
    private final MethodService methodService;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<ApplicationDecisionCost> dataTable(DataTablesInput input, HttpServletRequest httpServletRequest){
        ApplicationDecisionCostSpecification rangeSpecification = new ApplicationDecisionCostSpecification(input);

        DataTablesOutput<ApplicationDecisionCost> tablesOutput =  applicationDecisionCostDataRepository.findAll(
                input,
                rangeSpecification.and(new ExcludeAnalystsSpecification(input)),
                (root, query, criteriaBuilder) -> {
                    if (query.getResultType() != Long.class) {
                        root.fetch("distributedApplications", JoinType.LEFT);
                    }
                    return null;
                }
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<ApplicationDecisionCost> {
        private final DataTablesInput input;

        public ExcludeAnalystsSpecification(DataTablesInput input) {
            this.input = input;
        }

        @Override
        public Predicate toPredicate(Root<ApplicationDecisionCost> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.notEqual(root.get("isDeleted"), 1);
            Predicate finalPredicate = criteriaBuilder.and(isDeleted);
            return finalPredicate;
        }
    }
}