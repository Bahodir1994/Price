package uz.customs.customprice.controller.authorization.esad;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uz.customs.customprice.entity.authorization.Role;
import uz.customs.customprice.entity.authorization.User;
import uz.customs.customprice.service.authorization.LogServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@RestController
@RequiredArgsConstructor
public class LogOutController {
    private final LogServiceImpl logService;

    @RequestMapping(value = "/exit/log-out", method = RequestMethod.GET)
    public void getPageExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        Set<Role> roles = user.getRoles();
        List<Role> roleList = new ArrayList<>(roles);

        String sessionID = (String) request.getSession().getAttribute("SessionID");
        logService.getBySesId(sessionID).ifPresent(
                log -> {
                    log.setExit(new Date());
                    logService.updateLog(log);
                }
        );

        String ip = InetAddress.getLocalHost().getHostAddress();
        try (final DatagramSocket socket = new DatagramSocket()) {
            socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
            ip = socket.getLocalAddress().getHostAddress();
        }
        request.getSession().invalidate();

        if ((ip.equals("192.168.224.224") || ip.equals("192.168.224.18") || ip.equals("192.168.224.127") || ip.equals("localhost"))) {
            response.sendRedirect(request.getContextPath() + "/");
        }else {
            response.sendRedirect("http://192.168.214.114:9080/esad/");
        }
    }

}
