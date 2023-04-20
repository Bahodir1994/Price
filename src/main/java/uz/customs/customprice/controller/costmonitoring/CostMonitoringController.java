package uz.customs.customprice.controller.costmonitoring;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;
import uz.customs.customprice.service.costmonitoring.baseEntityServices.CostMonitoringDataService;
import uz.customs.customprice.service.costmonitoring.baseEntityServices.CostMonitoringService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/routeV2/V1")
@RequiredArgsConstructor
public class CostMonitoringController {

    private final CostMonitoringDataService costMonitoringDataService;
    private final CostMonitoringService costMonitoringService;

    @GetMapping(value = "/data/cost_monitoring_base/v1")
    public ModelAndView getDataV1(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        return costMonitoringService.getValues(httpServletRequest);
    }

    @GetMapping(value = "/data/cost_monitoring_base/v2")
    public DataTablesOutput<BaseEntity> getDataV2(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataService.dataTable(input);
    }

}
