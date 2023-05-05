package uz.customs.customprice.controller.decisioncharges;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.service.decisioncharges.dataServices.ApplicationDecisionCostDataService;
import uz.customs.customprice.service.decisioncharges.dataServices.TransportTypeDataService;
import uz.customs.customprice.service.decisioncharges.jpaServices.ApplicationDecisionCostService;
import uz.customs.customprice.service.decisioncharges.dataServices.CommodityDecisionCostDataService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;


@RestController
@RequestMapping("/routeV3/V2")
@RequiredArgsConstructor
public class DecisionChargesDetailController {

    private final ApplicationDecisionCostService applicationDecisionCostService;
    private final CommodityDecisionCostDataService commodityDecisionCostDataService;
    private final TransportTypeDataService transportTypeDataService;

    @GetMapping(value = "/data/decision_charges/v1")
    public ModelAndView getDataV1(HttpServletRequest httpServletRequest, @RequestParam String id) throws JsonProcessingException {
        return applicationDecisionCostService.getValues2(httpServletRequest, id);
    }

    @GetMapping(value = "/data/decision_charges/v2")
    public DataTablesOutput<CommodityDecision> getDataV2(@Valid DataTablesInput input, HttpServletRequest httpServletRequest, @RequestParam String appId) throws UnexpectedRollbackException {
        return commodityDecisionCostDataService.dataTable(input, httpServletRequest, appId);
    }

    @GetMapping(value = "/data/decision_charges/v3")
    public DataTablesOutput<TransportType> getDataV3(@Valid DataTablesInput input, @RequestParam Map<String, String> queryParameters, @RequestParam String appId, HttpServletRequest httpServletRequest) throws UnexpectedRollbackException {
        return transportTypeDataService.dataTable(input, appId, httpServletRequest, queryParameters);
    }

    @GetMapping(value = "/data/decision_charges/v4")
    public ResponseEntity<Object> getDataV3(@RequestParam String appId) {
        return new ResponseEntity<>(applicationDecisionCostService.getValues3(appId), HttpStatus.OK);
    }

}