package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;

@Repository
public interface ApplicationDecisionCostDataRepository extends DataTablesRepository<ApplicationDecisionCost, String> {
}
