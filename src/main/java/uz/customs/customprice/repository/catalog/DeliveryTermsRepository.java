package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.catalog.DeliveryTerms;

import java.util.List;

@Repository
public interface DeliveryTermsRepository extends JpaRepository<DeliveryTerms, String> {
    List<DeliveryTerms> findByLngaTpcd(String lngaTpcd);
}