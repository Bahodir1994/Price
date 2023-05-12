package uz.customs.customprice.controller.decisioncharges;

import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import uz.customs.customprice.config.MessagingConf.ValidationMessaging;
import uz.customs.customprice.entity.decisioncharges.DecisionPayment;
import uz.customs.customprice.service.decisioncharges.dataServices.DecisionChargesPaymentDataService;
import uz.customs.customprice.service.decisioncharges.jpaServices.DecisionChargesPaymentService;
import uz.customs.customprice.service.helperClasses.decisioncharges.DecisionPaymentDTO;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/routeV3/V4")
@RequiredArgsConstructor
@Validated
@Import(ValidationMessaging.class)
public class DecisionChargesPaymentController {

    private final MessageSource messageSource;
    private final DecisionChargesPaymentDataService decisionChargesPaymentDataService;
    private final DecisionChargesPaymentService decisionChargesPaymentService;

    @GetMapping(value = "/data/decision_charges/v1")
    public DataTablesOutput<DecisionPayment> getDataV1(@Valid DataTablesInput input, @RequestParam String appId) throws UnexpectedRollbackException {
        return decisionChargesPaymentDataService.dataTable(input, appId);
    }

    @PostMapping(value = "/data/decision_charges/v1")
    public ResponseEntity<?> postDataV1(HttpServletRequest request, @RequestBody DecisionPaymentDTO input) throws UnexpectedRollbackException {

        decisionChargesPaymentService.postPayment(input);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PutMapping(value = "/data/decision_charges/v1")
    public ResponseEntity<?> putDataV1(@RequestBody DecisionPaymentDTO input) throws UnexpectedRollbackException {
        decisionChargesPaymentService.updatePayment(input);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @DeleteMapping(value = "/data/decision_charges/v1")
    public ResponseEntity<?> deleteDataV1(@RequestBody DecisionPaymentDTO input) throws UnexpectedRollbackException {
        decisionChargesPaymentService.deletePayment(input);
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

}
