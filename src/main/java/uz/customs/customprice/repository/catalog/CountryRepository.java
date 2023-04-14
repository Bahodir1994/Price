package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import uz.customs.customprice.entity.catalog.Country;

import java.util.List;
import java.util.Optional;

public interface CountryRepository extends JpaRepository<Country, String> {
    Optional<Country> findByCodeAndLngaTpcd(String code, String lngaTpcd);

    Optional<Country> findByLngaTpcd(String lngaTpcd);

    List<Country> findAllByLngaTpcdOrderByCodeAsc(String lngaTpcd);
}
