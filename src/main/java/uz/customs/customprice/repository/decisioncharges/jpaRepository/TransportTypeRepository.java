package uz.customs.customprice.repository.decisioncharges.jpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.TransportType;

@Repository
public interface TransportTypeRepository extends JpaRepository<TransportType, String> {
    TransportType findByAppId(String app_id);
}
