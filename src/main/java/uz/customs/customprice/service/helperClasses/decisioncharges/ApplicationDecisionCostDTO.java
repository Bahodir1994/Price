package uz.customs.customprice.service.helperClasses.decisioncharges;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import uz.customs.customprice.entity.earxiv.Earxiv;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
public class ApplicationDecisionCostDTO {

    private String id;
    private String appNum;
    private Date appDate;
    private String appNumS;
    private String versionNum;
    private Integer status;
    private String statusNm;
    private String locationId;
    private String personFio;
    private String customerCountryNm;
    private String sellerOrg;
    private String personPhone;
    private String importerNm;
    private String senderCountryNm;
    private String senderOrg;
    private String importerTin;
    private String authorizedPersonPin;
    private String authorizedPersonDoc;
    private String stateNumber;
    private Date stateNumberDate;
    private BigDecimal customsPriceSum;
    private String customsPriceCurrency;
    private BigDecimal priceSum;
    private String priceCurrency;
    private BigDecimal nettoSum;
    private BigDecimal bruttoSum;
    private String termsNm;
    private String termsAddr;
    private BigDecimal transportPriceSum;
    private String stateNumber2;
    private Date stateNumberDate2;
    private List<Earxiv> earxivList;

    public ApplicationDecisionCostDTO(String id, String appNum, Date appDate, String appNumS, String versionNum, Integer status, String statusNm, String locationId, String personFio, String customerCountryNm, String sellerOrg, String personPhone, String importerNm, String senderCountryNm, String senderOrg, String importerTin, String authorizedPersonPin, String authorizedPersonDoc, String stateNumber, Date stateNumberDate, BigDecimal customsPriceSum, String customsPriceCurrency, BigDecimal priceSum, String priceCurrency, BigDecimal nettoSum, BigDecimal bruttoSum, String termsNm, String termsAddr, BigDecimal transportPriceSum, String stateNumber2, Date stateNumberDate2) {
        this.id = id;
        this.appNum = appNum;
        this.appDate = appDate;
        this.appNumS = appNumS;
        this.versionNum = versionNum;
        this.status = status;
        this.statusNm = statusNm;
        this.locationId = locationId;
        this.personFio = personFio;
        this.customerCountryNm = customerCountryNm;
        this.sellerOrg = sellerOrg;
        this.personPhone = personPhone;
        this.importerNm = importerNm;
        this.senderCountryNm = senderCountryNm;
        this.senderOrg = senderOrg;
        this.importerTin = importerTin;
        this.authorizedPersonPin = authorizedPersonPin;
        this.authorizedPersonDoc = authorizedPersonDoc;
        this.stateNumber = stateNumber;
        this.stateNumberDate = stateNumberDate;
        this.customsPriceSum = customsPriceSum;
        this.customsPriceCurrency = customsPriceCurrency;
        this.priceSum = priceSum;
        this.priceCurrency = priceCurrency;
        this.nettoSum = nettoSum;
        this.bruttoSum = bruttoSum;
        this.termsNm = termsNm;
        this.termsAddr = termsAddr;
        this.transportPriceSum = transportPriceSum;
        this.stateNumber2 = stateNumber2;
        this.stateNumberDate2 = stateNumberDate2;
    }

    public ApplicationDecisionCostDTO(List<Earxiv> earxivList){
        this.earxivList = earxivList;
    }
}

