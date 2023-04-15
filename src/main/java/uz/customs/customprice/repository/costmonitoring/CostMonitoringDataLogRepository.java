package uz.customs.customprice.repository.costmonitoring;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.costmonitoring.CPLog;

@Repository
public interface CostMonitoringDataLogRepository extends DataTablesRepository<CPLog, String> {
}
