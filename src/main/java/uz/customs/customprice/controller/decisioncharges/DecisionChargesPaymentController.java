package uz.customs.customprice.controller.decisioncharges;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.web.bind.annotation.*;
import uz.customs.customprice.entity.decisioncharges.DecisionPayment;
import uz.customs.customprice.service.decisioncharges.dataServices.DecisionChargesPaymentDataService;
import uz.customs.customprice.service.decisioncharges.jpaServices.DecisionChargesPaymentService;
import uz.customs.customprice.service.helperClasses.decisioncharges.DecisionPaymentDTO;

import javax.validation.Valid;

@RestController
@RequestMapping("/routeV3/V4")
@RequiredArgsConstructor
public class DecisionChargesPaymentController {
    private final DecisionChargesPaymentDataService decisionChargesPaymentDataService;
    private final DecisionChargesPaymentService decisionChargesPaymentService;

    @GetMapping(value = "/data/decision_charges/v1")
    public DataTablesOutput<DecisionPayment> getDataV1(@Valid DataTablesInput input, @RequestParam String appId) throws UnexpectedRollbackException {
        return decisionChargesPaymentDataService.dataTable(input, appId);
    }

    @PostMapping(value = "/data/decision_charges/v1")
    public void postDataV1(@Valid DecisionPaymentDTO input) throws UnexpectedRollbackException {
        decisionChargesPaymentService.postPayment(input);
    }

    @PutMapping(value = "/data/decision_charges/v1")
    public void putDataV1(@Valid DecisionPaymentDTO input) throws UnexpectedRollbackException {
        decisionChargesPaymentService.updatePayment(input);
    }

    @DeleteMapping(value = "/data/decision_charges/v1")
    public void deleteDataV1(@Valid DecisionPaymentDTO input) throws UnexpectedRollbackException {
        decisionChargesPaymentService.deletePayment(input);
    }

}
