package uz.customs.customprice.service.authorization;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import uz.customs.customprice.component.utils.Utils;
import uz.customs.customprice.repository.authorization.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String userName) {
        UserDetails userDetails = userRepository.findByUsername(Utils.RepMus(userName.trim()));
        return userDetails;
    }
}
