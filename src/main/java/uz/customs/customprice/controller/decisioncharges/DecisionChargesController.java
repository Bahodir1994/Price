package uz.customs.customprice.controller.decisioncharges;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;
import uz.customs.customprice.service.decisioncharges.dataServices.ApplicationDecisionCostDataService;
import uz.customs.customprice.service.decisioncharges.jpaServices.ApplicationDecisionCostService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;


@RestController
@RequestMapping("/routeV3/V1")
@RequiredArgsConstructor
public class DecisionChargesController {

    private final ApplicationDecisionCostDataService applicationDecisionCostDataService;
    private final ApplicationDecisionCostService applicationDecisionCostService;

    @GetMapping(value = "/data/decision_charges/v1")
    public ModelAndView getDataV1(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        return applicationDecisionCostService.getValues(httpServletRequest);
    }

    @GetMapping(value = "/data/decision_charges/v2")
    public DataTablesOutput<ApplicationDecisionCost> getDataV2(@Valid DataTablesInput input, HttpServletRequest httpServletRequest) throws UnexpectedRollbackException {
        return applicationDecisionCostDataService.dataTable(input, httpServletRequest);
    }
}