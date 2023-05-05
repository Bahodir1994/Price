package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesPayment;
import uz.customs.customprice.repository.decisioncharges.dataRepository.DecisionChargesPaymentDataRepository;
import uz.customs.customprice.service.decisioncharges.jpaServices.CommodityDecisionService;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DecisionChargesPaymentDataService {
    private final DecisionChargesPaymentDataRepository decisionChargesPaymentDataRepository;
    private final CommodityDecisionService commodityDecisionService;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<DecisionChargesPayment> dataTable(DataTablesInput input, String appId) {
        List<CommodityDecision> commodityDecisionList = commodityDecisionService.getByAppId(appId);
        System.out.println(commodityDecisionList.stream().findAny().get().getId());
        DataTablesOutput<DecisionChargesPayment> tablesOutput = decisionChargesPaymentDataRepository.findAll(
                input,
                new DecisionChargesPaymentDataService.ExcludeAnalystsSpecification(input, commodityDecisionList)
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<DecisionChargesPayment> {
        private final DataTablesInput input;
        private final List<CommodityDecision> commodityDecisionList;

        public ExcludeAnalystsSpecification(DataTablesInput input, List<CommodityDecision> commodityDecisionList) {
            this.input = input;
            this.commodityDecisionList = commodityDecisionList;
        }

        @Override
        public Predicate toPredicate(Root<DecisionChargesPayment> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.in(root.get("cmdtId")).value(commodityDecisionList.stream().findAny().get().getId());
            Predicate finalPredicate = criteriaBuilder.and(isDeleted);
            return finalPredicate;
        }
    }

}
