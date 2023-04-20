package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.Method;
import uz.customs.customprice.entity.catalog.Unit;
import uz.customs.customprice.repository.catalog.MethodRepository;
import uz.customs.customprice.repository.catalog.UnitRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MethodService {
    private final MethodRepository methodRepository;

    public List<Method> getByLngaTpcd(String lngaTpcd) {
        return methodRepository.findByLngaTpcd(lngaTpcd);
    }

}
