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
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.entity.costmonitoring.CPLog;
import uz.customs.customprice.service.catalog.CountryService;
import uz.customs.customprice.service.costmonitoring.logEntityServices.CostMonitoringDataLogService;
import uz.customs.customprice.service.costmonitoring.logEntityServices.CostMonitoringLogService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/routeV2/V2")
@RequiredArgsConstructor
public class CostMonitoringLogController {

    private final CostMonitoringDataLogService costMonitoringDataLogService;
    private final CostMonitoringLogService costMonitoringLogService;
    private final CountryService countryService;

    /******************************************************************************************************************/

    @GetMapping(value = "/data/cost_monitoring_base/v1")
    public ModelAndView getDataV3(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        return costMonitoringLogService.getValues1(httpServletRequest);
    }

    @GetMapping(value = "/data/cost_monitoring_base/v2")
    public DataTablesOutput<CPLog> getDataV4(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataLogService.dataTable(input);
    }

    /******************************************************************************************************************/

    @GetMapping(value = "/data/cost_monitoring_base/v3")
    public ModelAndView getDataV5(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        return costMonitoringLogService.getValues2(httpServletRequest);
    }

    @GetMapping(value = "/data/cost_monitoring_base/v4")
    public DataTablesOutput<CPLog> getDataV6(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataLogService.dataTable(input);
    }

}
