package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.FeatMove;
import uz.customs.customprice.entity.catalog.Post;
import uz.customs.customprice.repository.catalog.FeatMoveRepository;
import uz.customs.customprice.repository.catalog.PostRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class FeatMoveService {
    private final FeatMoveRepository featMoveRepository;

    public List<FeatMove> getByLngaTpcd(String lngaTpcd) {
        return featMoveRepository.findByLngaTpcd(lngaTpcd);
    }

}
