package uz.customs.customprice.component.httpSession;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import uz.customs.customprice.entity.authorization.Role;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SessionDataValue {
    String userId;
    String userIdS;
    String userName;
    Integer userRole;
    String userRoleName;
    String userLocation;
    String userLocationName;
    String userPost;
    String userPostName;
    List<Role> roles;
    String language;
}
