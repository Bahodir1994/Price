package uz.customs.customprice.controller.authorization;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;

@RestController
@RequestMapping("/check_language_type")
public class LanguageController {

    @Autowired
    private LocaleResolver localeResolver;

    @PostMapping("/i18/v1")
    public void setLanguage(@RequestParam("langCode") String langCode, HttpServletRequest request, HttpSession session){
        session.setAttribute("lang", langCode);
    }
}
