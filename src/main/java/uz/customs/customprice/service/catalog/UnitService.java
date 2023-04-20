package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.Post;
import uz.customs.customprice.entity.catalog.Unit;
import uz.customs.customprice.repository.catalog.PostRepository;
import uz.customs.customprice.repository.catalog.UnitRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UnitService {
    private final UnitRepository unitRepository;

    public List<Unit> getByLngaTpcd(String lngaTpcd) {
        return unitRepository.findByLngaTpcd(lngaTpcd);
    }

}
