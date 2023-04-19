package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.catalog.Location;
import uz.customs.customprice.entity.catalog.Unit;

import java.util.List;

@Repository
public interface UnitRepository extends JpaRepository<Unit, String> {
    List<Unit> findByLngaTpcd(String lngaTpcd);
}