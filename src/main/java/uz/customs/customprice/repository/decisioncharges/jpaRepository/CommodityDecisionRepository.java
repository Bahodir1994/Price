package uz.customs.customprice.repository.decisioncharges.jpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommodityDecisionRepository extends JpaRepository<CommodityDecision, String> {
    List<CommodityDecision> findByAppId(String appId);
}
