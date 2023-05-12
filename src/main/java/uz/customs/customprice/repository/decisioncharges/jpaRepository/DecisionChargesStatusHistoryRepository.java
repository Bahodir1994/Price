package uz.customs.customprice.repository.decisioncharges.jpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.StatusH;

@Repository
public interface DecisionChargesStatusHistoryRepository extends JpaRepository<StatusH, String> {
}
