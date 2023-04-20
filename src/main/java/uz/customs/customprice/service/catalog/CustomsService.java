package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.CustomsMode;
import uz.customs.customprice.entity.catalog.Post;
import uz.customs.customprice.repository.catalog.CustomsModeRepository;
import uz.customs.customprice.repository.catalog.PostRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomsService {
    private final CustomsModeRepository customsModeRepository;

    public List<CustomsMode> getByLngaTpcd(String lngaTpcd) {
        return customsModeRepository.findByLngaTpcd(lngaTpcd);
    }

}
