package uz.customs.customprice.service.helperClasses.decisioncharges;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class DecisionPaymentDTO {

    private String id;
    private String cmdtId;

    private String g47Type;
    private String g47Base;
    private String g47AltBase;
    private String g47Rate;
    private String g47AltRate;
    private String currRate;
    private String g47AltBaseEdIzm;
    private String g47Sum;
    private String g47Sp;
}
