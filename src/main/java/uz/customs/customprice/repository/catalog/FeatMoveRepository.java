package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.catalog.FeatMove;
import uz.customs.customprice.entity.catalog.Location;

import java.util.List;

@Repository
public interface FeatMoveRepository extends JpaRepository<FeatMove, String> {
    List<FeatMove> findByLngaTpcd(String lngaTpcd);
}