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
import uz.customs.customprice.entity.BaseEntity;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.service.catalog.CountryService;
import uz.customs.customprice.service.costmonitoring.CostMonitoringDataService;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/routeV2")
@RequiredArgsConstructor
public class CostMonitoringController {

    private final CostMonitoringDataService costMonitoringDataService;
    private final CountryService countryService;

    @GetMapping(value = "/data/cost_monitoring_base/v1")
    public ModelAndView getDataV1() throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("/resources/pages/appV2/appTableV1");

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc("UZ");
        modelAndView.addObject("country", country);
        return modelAndView;
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
    public DataTablesOutput<BaseEntity> getDataV4(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataService.dataTable(input);
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
    public DataTablesOutput<BaseEntity> getDataV6(@Valid DataTablesInput input) throws UnexpectedRollbackException {
        return costMonitoringDataService.dataTable(input);
    }

}
