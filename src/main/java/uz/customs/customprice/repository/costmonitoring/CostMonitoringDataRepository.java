package uz.customs.customprice.repository.costmonitoring;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;

@Repository
public interface CostMonitoringDataRepository extends DataTablesRepository<BaseEntity, String> {
}
