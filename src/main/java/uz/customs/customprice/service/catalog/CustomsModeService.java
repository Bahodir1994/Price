package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.CustomsMode;
import uz.customs.customprice.entity.catalog.Unit;
import uz.customs.customprice.repository.catalog.CustomsModeRepository;
import uz.customs.customprice.repository.catalog.UnitRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomsModeService {
    private final CustomsModeRepository customsModeRepository;

    public List<CustomsMode> getByLngaTpcd(String lngaTpcd) {
        return customsModeRepository.findByLngaTpcd(lngaTpcd);
    }

}
