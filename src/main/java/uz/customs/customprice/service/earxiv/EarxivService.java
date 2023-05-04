package uz.customs.customprice.service.earxiv;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.earxiv.Earxiv;
import uz.customs.customprice.repository.decisioncharges.EarxivRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EarxivService {
    private final EarxivRepository earxivRepository;

    public List<Earxiv> getListByAppId(String appId){
        return earxivRepository.findByAppId(appId);
    }
}
