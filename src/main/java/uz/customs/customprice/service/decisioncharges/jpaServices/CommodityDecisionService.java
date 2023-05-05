package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.decisioncharges.CommodityDecision;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.CommodityDecisionRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommodityDecisionService {
    private final CommodityDecisionRepository commodityDecisionRepository;

    public List<CommodityDecision> getByAppId(String appId){
        return commodityDecisionRepository.findByAppId(appId);
    }
}
