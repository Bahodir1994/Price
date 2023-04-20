package uz.customs.customprice.service.costmonitoring.baseEntityServices;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.catalog.*;
import uz.customs.customprice.service.catalog.*;
import uz.customs.customprice.service.costmonitoring.baseColumnServices.BaseColumnService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CostMonitoringService {
    private final GetterSessionData getterSessionData;
    private final CountryService countryService;
    private final LocationService locationService;
    private final PostService postService;
    private final FeatMoveService featMoveService;
    private final UnitService unitService;
    private final CustomsModeService customsModeService;
    private final DeliveryTermsService deliveryTermsService;
    private final MethodService methodService;
    private final BaseColumnService baseColumnService;

    public ModelAndView getValues(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV2/appTableV1/appTableV1");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        ObjectMapper mapper = new ObjectMapper();
        modelAndView.addObject("sessionGetterDataValue", mapper.writeValueAsString(sessionGetterDataValue));
        modelAndView.addObject("sessionLanguage", sessionGetterDataValue.getLanguage());

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc(lngaTpcd);
        List<Location> location = locationService.getByLngaTpcd(lngaTpcd);
        List<Post> post = postService.getByLngaTpcd(lngaTpcd);
        List<FeatMove> featMove = featMoveService.getByLngaTpcd(lngaTpcd);
        List<Unit> unit = unitService.getByLngaTpcd(lngaTpcd);
        List<CustomsMode> customsMode = customsModeService.getByLngaTpcd(lngaTpcd);
        List<DeliveryTerms> deliveryTerms = deliveryTermsService.getByLngaTpcd(lngaTpcd);
        List<Method> method = methodService.getByLngaTpcd(lngaTpcd);

        modelAndView.addObject("columns",  mapper.writeValueAsString(baseColumnService.getColumns(httpServletRequest)));
        modelAndView.addObject("country", country);
        modelAndView.addObject("location", location);
        modelAndView.addObject("post", post);
        modelAndView.addObject("featMove", featMove);
        modelAndView.addObject("unit", unit);
        modelAndView.addObject("customsMode", customsMode);
        modelAndView.addObject("deliveryTerms", deliveryTerms);
        modelAndView.addObject("method", method);

        return modelAndView;
    }
}
