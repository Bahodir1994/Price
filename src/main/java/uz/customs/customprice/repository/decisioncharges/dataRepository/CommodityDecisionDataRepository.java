package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;

@Repository
public interface CommodityDecisionDataRepository extends DataTablesRepository<CommodityDecision, String> {
}
