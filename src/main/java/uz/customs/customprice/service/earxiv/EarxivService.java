package uz.customs.customprice.service.earxiv;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.earxiv.Earxiv;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.EarxivRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EarxivService {
    private final EarxivRepository earxivRepository;

    public List<Earxiv> getListByAppId(String appId){
        return earxivRepository.findByAppId(appId);
    }

    public Earxiv getByHashAndFileId(String hash, String fileId, String id) {
        if (earxivRepository.findByHashAndFileIdAndId(hash, fileId, id) != null) {
            return earxivRepository.findByHashAndFileIdAndId(hash, fileId, id);
        } else return null;
    }
}
