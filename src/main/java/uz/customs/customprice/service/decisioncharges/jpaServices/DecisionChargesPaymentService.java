package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.decisioncharges.DecisionPayment;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.DecisionChargesPaymentRepository;
import uz.customs.customprice.service.helperClasses.decisioncharges.DecisionPaymentDTO;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
public class DecisionChargesPaymentService {

    private final DecisionChargesPaymentRepository decisionChargesPaymentRepository;

    public void postPayment(DecisionPaymentDTO input) {
        DecisionPayment decisionPayment = new DecisionPayment();
        decisionPayment.setCmdtId(input.getCmdtId());
        decisionPayment.setG47Base(new BigDecimal(input.getG47Base()));
        decisionPayment.setG47AltBase(new BigDecimal(input.getG47AltBase()));
        decisionPayment.setG47Rate(new BigDecimal(input.getG47Rate()));
        decisionPayment.setG47AltRate(new BigDecimal(input.getG47AltRate()));
//        decisionPayment.setG47Currkod(new BigDecimal(input.getG47Currkod()));
        decisionPayment.setG47Sum(new BigDecimal(input.getG47Sum()));
        decisionPayment.setG47Sp(input.getG47Sp());
//        decisionPayment.setG47ClcType(input.getG47ClcType());
        decisionPayment.setG47Type(input.getG47Type());
//        decisionPayment.setG47AltBaseCurrkod(input.getG47AltBaseCurrkod());
        decisionPayment.setCurrRate(new BigDecimal(input.getCurrRate()));
        decisionPayment.setG47AltBaseEdIzm(input.getG47AltBaseEdIzm());
//        decisionPayment.setG47SumCurrkod(input.getG47SumCurrkod());

        decisionChargesPaymentRepository.save(decisionPayment);
    }

    public void updatePayment(DecisionPaymentDTO input) {
        decisionChargesPaymentRepository.findById(input.getId()).ifPresentOrElse(
                decisionPayment -> {
                    decisionPayment.setCmdtId(input.getCmdtId());
                    decisionPayment.setG47Base(new BigDecimal(input.getG47Base()));
                    decisionPayment.setG47AltBase(new BigDecimal(input.getG47AltBase()));
                    decisionPayment.setG47Rate(new BigDecimal(input.getG47Rate()));
                    decisionPayment.setG47AltRate(new BigDecimal(input.getG47AltRate()));
//        decisionPayment.setG47Currkod(new BigDecimal(input.getG47Currkod()));
                    decisionPayment.setG47Sum(new BigDecimal(input.getG47Sum()));
                    decisionPayment.setG47Sp(input.getG47Sp());
//        decisionPayment.setG47ClcType(input.getG47ClcType());
                    decisionPayment.setG47Type(input.getG47Type());
//        decisionPayment.setG47AltBaseCurrkod(input.getG47AltBaseCurrkod());
                    decisionPayment.setCurrRate(new BigDecimal(input.getCurrRate()));
                    decisionPayment.setG47AltBaseEdIzm(input.getG47AltBaseEdIzm());
//        decisionPayment.setG47SumCurrkod(input.getG47SumCurrkod());

                    decisionChargesPaymentRepository.save(decisionPayment);
                },
                () -> {
                    System.out.println("somthing error when updating!!!");
                }
        );
    }

    public void deletePayment(DecisionPaymentDTO input) {
        decisionChargesPaymentRepository.findById(input.getId()).ifPresentOrElse(
                decisionChargesPaymentRepository::delete,
                () -> {
                    System.out.println("somthing error when deleting!!!");
                }
        );
    }

}
