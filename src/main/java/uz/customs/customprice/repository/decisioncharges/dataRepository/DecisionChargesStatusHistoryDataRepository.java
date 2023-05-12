package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.StatusH;

@Repository
public interface DecisionChargesStatusHistoryDataRepository extends DataTablesRepository<StatusH, String> {
}
