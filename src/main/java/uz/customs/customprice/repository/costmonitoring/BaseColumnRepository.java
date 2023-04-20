package uz.customs.customprice.repository.costmonitoring;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.costmonitoring.BaseColumn;

import java.util.List;
import java.util.Optional;

@Repository
public interface BaseColumnRepository extends JpaRepository<BaseColumn, String>  {
    List<BaseColumn> findByInsUser(String insUser);

    Optional<BaseColumn> findByIdAndInsUserAndIsDefault(String id, String insUser, int isDefault);
}
