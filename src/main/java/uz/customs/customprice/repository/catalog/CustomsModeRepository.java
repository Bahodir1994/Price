package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.catalog.CustomsMode;
import uz.customs.customprice.entity.catalog.Unit;

import java.util.List;

@Repository
public interface CustomsModeRepository extends JpaRepository<CustomsMode, String> {
    List<CustomsMode> findByLngaTpcd(String lngaTpcd);
}