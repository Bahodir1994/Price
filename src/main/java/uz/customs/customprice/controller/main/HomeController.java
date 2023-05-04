package uz.customs.customprice.controller.main;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/routeV0/V1")
@RequiredArgsConstructor
public class HomeController {

    @GetMapping(value = "/data/home/v1")
    public ModelAndView getDataV1(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/StarterPage/homes");
        return modelAndView;
    }

}
