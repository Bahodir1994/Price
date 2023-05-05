package uz.customs.customprice.controller.decisioncharges;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesPayment;
import uz.customs.customprice.service.decisioncharges.dataServices.DecisionChargesPaymentDataService;

import javax.validation.Valid;

@RestController
@RequestMapping("/routeV3/V4")
@RequiredArgsConstructor
public class DecisionChargesPaymentController {
    private final DecisionChargesPaymentDataService decisionChargesPaymentDataService;

    @GetMapping(value = "/data/decision_charges/v1")
    public DataTablesOutput<DecisionChargesPayment> getDataV2(@Valid DataTablesInput input, @RequestParam String cmdtId) throws UnexpectedRollbackException {
        return decisionChargesPaymentDataService.dataTable(input, cmdtId);
    }
}
