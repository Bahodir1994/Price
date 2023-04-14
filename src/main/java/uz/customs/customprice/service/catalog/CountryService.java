package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.repository.catalog.CountryRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CountryService {
    private final CountryRepository countyRepo;


    public Optional<Country> getByCodeAndLngaTpcd(String code, String lngaTpcd) {
        return countyRepo.findByCodeAndLngaTpcd(code, lngaTpcd);
    }

    public Optional<Country> getByLngaTpcd(String lngaTpcd) {
        return countyRepo.findByLngaTpcd(lngaTpcd);
    }

    public List<Country> findAllByLngaTpcdOrderByCodeAsc(String lngaTpcd) {
        return countyRepo.findAllByLngaTpcdOrderByCodeAsc(lngaTpcd);
    }
}
