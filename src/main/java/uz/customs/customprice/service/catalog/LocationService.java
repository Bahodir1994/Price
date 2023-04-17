package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.Location;
import uz.customs.customprice.repository.catalog.LocationRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LocationService {
    private final LocationRepository locationRepository;

    public List<Location> getByLngaTpcd(String lngaTpcd) {
        return locationRepository.findByLngaTpcd(lngaTpcd);
    }

}
