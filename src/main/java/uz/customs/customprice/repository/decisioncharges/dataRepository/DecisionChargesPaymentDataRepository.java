package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.DecisionPayment;

@Repository
public interface DecisionChargesPaymentDataRepository extends DataTablesRepository<DecisionPayment, String> {
}
