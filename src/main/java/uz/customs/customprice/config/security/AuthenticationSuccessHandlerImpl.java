package uz.customs.customprice.config.security;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import uz.customs.customprice.component.httpSession.SessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.authorization.ActivUserCount;
import uz.customs.customprice.repository.authorization.UserRepository;
import uz.customs.customprice.service.authorization.LogServiceImpl;

@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Autowired
    HttpSession session; //autowiring session

    @Autowired
    UserRepository repository; //autowire the user repo

    @Autowired
    SessionData sessionData;

    @Autowired
    LogServiceImpl logService;


    private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        // TODO Auto-generated method stub
        SessionDataValue sessionDataValue = sessionData.getSessionData(session, request);
        ActivUserCount activeCount = logService.count();

    }

}