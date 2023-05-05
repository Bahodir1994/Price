package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesPayment;
import uz.customs.customprice.repository.decisioncharges.dataRepository.DecisionChargesPaymentDataRepository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

@Service
@RequiredArgsConstructor
public class DecisionChargesPaymentDataService {
    private final DecisionChargesPaymentDataRepository decisionChargesPaymentDataRepository;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<DecisionChargesPayment> dataTable(DataTablesInput input, String cmdtId) {
        DataTablesOutput<DecisionChargesPayment> tablesOutput = decisionChargesPaymentDataRepository.findAll(
                input,
                new DecisionChargesPaymentDataService.ExcludeAnalystsSpecification(input, cmdtId)
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<DecisionChargesPayment> {
        private final DataTablesInput input;
        private final String cmdtId;

        public ExcludeAnalystsSpecification(DataTablesInput input, String cmdtId) {
            this.input = input;
            this.cmdtId = cmdtId;
        }

        @Override
        public Predicate toPredicate(Root<DecisionChargesPayment> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.equal(root.get("cmdtId"), cmdtId);
            Predicate finalPredicate = criteriaBuilder.and(isDeleted);
            return finalPredicate;
        }
    }

}
