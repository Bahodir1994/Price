package uz.customs.customprice.repository.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.catalog.Method;
import uz.customs.customprice.entity.catalog.Unit;

import java.util.List;

@Repository
public interface MethodRepository extends JpaRepository<Method, String> {
    List<Method> findByLngaTpcd(String lngaTpcd);
}