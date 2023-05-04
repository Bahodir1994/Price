package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesStatusType;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.StatusRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StatusService {

    private final StatusRepository statusRepository;

    public List<DecisionChargesStatusType> getByLngaTpcd(String lngaTpcd) {
        return statusRepository.findByLngaTpcdOrderByIdAsc(lngaTpcd);
    }
}
