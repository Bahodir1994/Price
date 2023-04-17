package uz.customs.customprice.service.costmonitoring.baseEntityServices;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.entity.catalog.Location;
import uz.customs.customprice.service.catalog.CountryService;
import uz.customs.customprice.service.catalog.LocationService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CostMonitoringService {
    private final GetterSessionData getterSessionData;
    private final CountryService countryService;
    private final LocationService locationService;

    public ModelAndView getValues(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV2/appTableV1/jsp/appTableV1");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        ObjectMapper mapper = new ObjectMapper();
        modelAndView.addObject("sessionGetterDataValue", mapper.writeValueAsString(sessionGetterDataValue));
        modelAndView.addObject("sessionLanguage", sessionGetterDataValue.getLanguage());

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc(lngaTpcd);
        List<Location> location = locationService.getByLngaTpcd(lngaTpcd);
        modelAndView.addObject("country", country);
        modelAndView.addObject("location", location);

        return modelAndView;
    }
}
