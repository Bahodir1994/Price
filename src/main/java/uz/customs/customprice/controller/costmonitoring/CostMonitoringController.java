package uz.customs.customprice.controller.costmonitoring;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.entity.costmonitoring.CPLog;
import uz.customs.customprice.service.catalog.CountryService;
import uz.customs.customprice.service.costmonitoring.baseEntityServices.CostMonitoringDataService;
import uz.customs.customprice.service.costmonitoring.baseEntityServices.CostMonitoringService;
import uz.customs.customprice.service.costmonitoring.logEntityServices.CostMonitoringDataLogService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/routeV2")
@RequiredArgsConstructor
public class CostMonitoringController {

    private final CostMonitoringDataService costMonitoringDataService;
    private final CostMonitoringDataLogService costMonitoringDataLogService;
    private final GetterSessionData getterSessionData;
    private final CountryService countryService;
    private final CostMonitoringService costMonitoringService;

    @GetMapping(value = "/data/cost_monitoring_base/v1")
    public ModelAndView getDataV1(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        return  costMonitoringService.getValues(httpServletRequest);
    }

    @GetMapping(value = "/data/cost_monitoring_base/v2")
    public DataTablesOutput<BaseEntity> getDataV2(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataService.dataTable(input);
    }

    /******************************************************************************************************************/

    @GetMapping(value = "/data/cost_monitoring_base/v3")
    public ModelAndView getDataV3() throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("/resources/pages/appV2/appTableV2");

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc("UZ");
        modelAndView.addObject("country", country);
        return modelAndView;
    }

    @GetMapping(value = "/data/cost_monitoring_base/v4")
    public DataTablesOutput<CPLog> getDataV4(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataLogService.dataTable(input);
    }

    /******************************************************************************************************************/

    @GetMapping(value = "/data/cost_monitoring_base/v5")
    public ModelAndView getDataV5() throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("/resources/pages/appV2/appTableV3");

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc("UZ");
        modelAndView.addObject("country", country);
        return modelAndView;
    }

    @GetMapping(value = "/data/cost_monitoring_base/v6")
    public DataTablesOutput<CPLog> getDataV6(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataLogService.dataTable(input);
    }

}
