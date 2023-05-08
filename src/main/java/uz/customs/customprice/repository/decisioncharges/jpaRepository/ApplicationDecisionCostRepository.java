package uz.customs.customprice.repository.decisioncharges.jpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;
import uz.customs.customprice.service.helperClasses.decisioncharges.ApplicationDecisionCostDTO;

import java.util.Optional;

@Repository
public interface ApplicationDecisionCostRepository extends JpaRepository<ApplicationDecisionCost, String> {
    Optional<ApplicationDecisionCost> findById(String id);


    @Query("SELECT NEW uz.customs.customprice.service.helperClasses.ApplicationDecisionCostDTO(a.id, a.appNum, a.appDate, a.appNumS, a.versionNum, a.status, a.statusNm, a.locationId, a.personFio, a.customerCountryNm, a.sellerOrg, a.personPhone, a.importerNm, a.senderCountryNm, a.senderOrg, a.importerTin, a.authorizedPersonPin, a.authorizedPersonDoc, a.stateNumber, a.stateNumberDate, SUM(cm.customsPrice), cm.currencyNm, SUM(cm.price), cm.currencyNm, SUM(cm.netto), SUM(cm.brutto), a.termsNm, a.termsAddr, SUM(tr.transportPrice), a.stateNumber, a.stateNumberDate) FROM ApplicationDecisionCost a LEFT JOIN CommodityDecision cm ON a.id = cm.appId AND cm.isDeleted = 0 LEFT JOIN TransportType tr ON a.id = tr.appId WHERE a.id = :appId GROUP BY a.id, a.appNum, a.appDate, a.appNumS, a.versionNum, a.status, a.statusNm, a.locationId, a.personFio, a.customerCountryNm, a.sellerOrg, a.personPhone, a.importerNm, a.senderCountryNm, a.senderOrg, a.importerTin, a.authorizedPersonPin, a.authorizedPersonDoc, a.stateNumber, a.stateNumberDate, cm.currencyNm, cm.currencyNm, a.termsNm, a.termsAddr, a.stateNumber, a.stateNumberDate")
    ApplicationDecisionCostDTO findByQueryApplicationAndCommoditySumAndTransportTypeSum(@Param("appId") String appId);
}
