package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;
import uz.customs.customprice.repository.decisioncharges.dataRepository.ApplicationDecisionCostDataRepository;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.ApplicationDecisionCostRepository;
import uz.customs.customprice.repository.decisioncharges.dataRepository.CommodityDecisionDataRepository;
import uz.customs.customprice.service.catalog.*;

import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
public class CommodityDecisionCostDataService {

    private final ApplicationDecisionCostDataRepository applicationDecisionCostDataRepository;
    private final ApplicationDecisionCostRepository applicationDecisionCostRepository;
    private final CommodityDecisionDataRepository commodityDecisionDataRepository;
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
    public DataTablesOutput<CommodityDecision> dataTable(DataTablesInput input, HttpServletRequest httpServletRequest, String appId) {
        DataTablesOutput<CommodityDecision> tablesOutput = commodityDecisionDataRepository.findAll(
                input,
                new ExcludeAnalystsSpecification(input, appId)
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<CommodityDecision> {
        private final DataTablesInput input;
        private final String appId;

        public ExcludeAnalystsSpecification(DataTablesInput input, String appId) {
            this.input = input;
            this.appId = appId;
        }

        @Override
        public Predicate toPredicate(Root<CommodityDecision> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.equal(root.get("appId"), appId);
            Predicate finalPredicate = criteriaBuilder.and(isDeleted);
            return finalPredicate;
        }
    }
}