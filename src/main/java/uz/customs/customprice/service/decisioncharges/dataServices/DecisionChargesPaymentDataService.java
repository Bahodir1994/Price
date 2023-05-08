package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;
import uz.customs.customprice.entity.decisioncharges.DecisionPayment;
import uz.customs.customprice.repository.decisioncharges.dataRepository.DecisionChargesPaymentDataRepository;
import uz.customs.customprice.service.decisioncharges.jpaServices.CommodityDecisionService;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DecisionChargesPaymentDataService {
    private final DecisionChargesPaymentDataRepository decisionChargesPaymentDataRepository;
    private final CommodityDecisionService commodityDecisionService;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<DecisionPayment> dataTable(DataTablesInput input, String appId) {
        List<CommodityDecision> commodityDecisionList = commodityDecisionService.getByAppId(appId);
        List<String> cmdtIdList = new ArrayList<>();
        for (int i = 0; i < commodityDecisionList.size(); i++) {
            cmdtIdList.add(commodityDecisionList.get(i).getId());
        }

        System.out.println(commodityDecisionList.stream().findAny().get().getId());
        System.out.println(" cmdtIdList ---> " + cmdtIdList);
        DataTablesOutput<DecisionPayment> tablesOutput = decisionChargesPaymentDataRepository.findAll(
                input,
                new DecisionChargesPaymentDataService.ExcludeAnalystsSpecification(input, cmdtIdList)

        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<DecisionPayment> {
        private final DataTablesInput input;
        private final List<String> cmdtIdList;

        public ExcludeAnalystsSpecification(DataTablesInput input, List<String> cmdtIdList) {
            this.input = input;
            this.cmdtIdList = cmdtIdList;
        }

        @Override
        public Predicate toPredicate(Root<DecisionPayment> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.in(root.get("cmdtId")).value(cmdtIdList);
            Predicate finalPredicate = criteriaBuilder.and(isDeleted);
            return finalPredicate;
        }
    }

}
