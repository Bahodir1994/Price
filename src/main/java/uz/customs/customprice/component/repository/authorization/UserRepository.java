package uz.customs.customprice.component.repository.authorization;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.authorization.User;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, String> {

    User findByUsername(String username);
    List<User> findByLocationAndPostAndRole(String userLocation, String userPost, Integer userRole);
    User findByUserid(String userid);
//    @Query("select u.id, u.fullname, us.sysId from User u left join UserESystem us on u.id = us.userId where" +
//            "(u.role = :role) and" +
//            "(u.location = :locationId) and" +
//            "(us.sysId = : sysId)")
//    Optional<User> findBySqlQuerys(
//            @Param("role") Integer role,
//            @Param("locationId") String locationId,
//            @Param("sysId") String sysId
//    );
}
