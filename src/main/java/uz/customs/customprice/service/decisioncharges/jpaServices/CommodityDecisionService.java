package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.CommodityDecisionRepository;

@Service
@RequiredArgsConstructor
public class CommodityDecisionService {
    private final CommodityDecisionRepository commodityDecisionRepository;
}
