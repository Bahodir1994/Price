package uz.customs.customprice.controller.costmonitoring;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import uz.customs.customprice.entity.BaseEntity;
import uz.customs.customprice.service.costmonitoring.CostMonitoringDataService;

import javax.validation.Valid;

@RestController
@RequestMapping("/routeV2")
@RequiredArgsConstructor
public class CostMonitoringController {

    private final CostMonitoringDataService costMonitoringDataService;

    @GetMapping(value = "/data/cost_monitoring_base/v1")
    public DataTablesOutput<BaseEntity> getDataV1(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataService.dataTable(input);
    }

}
