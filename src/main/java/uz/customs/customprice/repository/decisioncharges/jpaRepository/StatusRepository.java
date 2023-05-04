package uz.customs.customprice.repository.decisioncharges.jpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesStatusType;

import java.util.List;

@Repository
public interface StatusRepository extends JpaRepository<DecisionChargesStatusType, String> {

    List<DecisionChargesStatusType> findByLngaTpcdOrderByIdAsc(String lngaTpcd);
}
