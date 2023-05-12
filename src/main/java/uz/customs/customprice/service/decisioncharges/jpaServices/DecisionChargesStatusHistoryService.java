package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.DecisionChargesStatusHistoryRepository;

@Service
@RequiredArgsConstructor
public class DecisionChargesStatusHistoryService {
    private final DecisionChargesStatusHistoryRepository decisionChargesStatusHistoryRepository;
}
