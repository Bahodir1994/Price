package uz.customs.customprice.repository.decisioncharges.dataRepository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.TransportType;

@Repository
public interface TransportTypeDataRepository extends DataTablesRepository<TransportType, String> {
}
