package uz.customs.customprice.repository;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.BaseEntity;

@Repository
public interface CostMonitoringDataRepository extends DataTablesRepository<BaseEntity, String> {
}
