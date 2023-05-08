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

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DecisionChargesPaymentDataService {
    private final DecisionChargesPaymentDataRepository decisionChargesPaymentDataRepository;
    private final CommodityDecisionService commodityDecisionService;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<DecisionPayment> dataTable(DataTablesInput input, String appId) {
        List<CommodityDecision> commodityDecisionList = null;
        List<String> cmdtIdList = new ArrayList<>();
        if (input.getColumn("cmdtId").getSearch().getValue().equals("")){
            commodityDecisionList = commodityDecisionService.getByAppId(appId);
            for (int i = 0; i < commodityDecisionList.size(); i++) {
                cmdtIdList.add(commodityDecisionList.get(i).getId());
            }
        }else {
            String str = input.getColumn("cmdtId").getSearch().getValue();
            String[] arr = str.split("\\+"); // split the string at each "+"
            cmdtIdList = Arrays.asList(arr);
        }

        DataTablesOutput<DecisionPayment> tablesOutput = decisionChargesPaymentDataRepository.findAll(
                input,
                new DecisionChargesPaymentDataService.ExcludeAnalystsSpecification(input, cmdtIdList),
                (root, query, criteriaBuilder) -> {
                    if (query.getResultType() != Long.class) {
                        root.fetch("commodity", JoinType.LEFT);
                    }
                    return null;
                }


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
