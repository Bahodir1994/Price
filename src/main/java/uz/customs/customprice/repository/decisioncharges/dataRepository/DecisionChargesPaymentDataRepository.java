package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesPayment;

@Repository
public interface DecisionChargesPaymentDataRepository extends DataTablesRepository<DecisionChargesPayment, String> {
}
