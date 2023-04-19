package uz.customs.customprice.service.costmonitoring.logEntityServices;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.entity.catalog.Location;
import uz.customs.customprice.entity.costmonitoring.CPLog;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringDataLogRepository;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringLogRepository;
import uz.customs.customprice.service.catalog.CountryService;
import uz.customs.customprice.service.catalog.LocationService;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CostMonitoringLogService {

    private final CostMonitoringDataLogRepository costMonitoringDataLogRepository;
    private final CostMonitoringLogRepository costMonitoringLogRepository;
    private final GetterSessionData getterSessionData;
    private final LocationService locationService;

    @PersistenceContext
    private EntityManager entityManager;

    public void saveLog(HttpServletRequest request, long start, long end, long count){
        SessionDataValue sessionDataValue = getterSessionData.onlyGetSessionData(request);


        long d = end-start;
        System.out.println(d);
        CPLog cpLog = new CPLog();

        cpLog.setUserId(sessionDataValue.getUserId());
        cpLog.setUserNm(sessionDataValue.getUserName());
        cpLog.setLocationId(sessionDataValue.getUserLocation());
        cpLog.setLocationNm(sessionDataValue.getUserLocationName());
        cpLog.setPostId(sessionDataValue.getUserPost());
        cpLog.setPostNm(sessionDataValue.getUserPostName());
        cpLog.setResultTime(d);
//        cpLog.setG33(filterDTO.getG33());

        StringBuilder g31NameS = new StringBuilder();

        cpLog.setKeyword(g31NameS.toString());
        cpLog.setResultCount(Math.toIntExact(count));
//        cpLog.setG7a(filterDTO.getChechkPost());
//        cpLog.setG7b(filterDTO.getChechkDate());
//        cpLog.setG7c(filterDTO.getChechkNum());
//        cpLog.setG32(filterDTO.getChechkComNum());
//        cpLog.setComment(filterDTO.getChechkComment());
//        cpLog.setBelongs(filterDTO.getBelongs());
        costMonitoringLogRepository.save(cpLog);
    }

    public void saveLog2(HttpServletRequest request, String g33, long start, long end, long count, String keyword){
        SessionDataValue sessionDataValue = getterSessionData.onlyGetSessionData(request);

        long d = end-start;
        System.out.println(d);
        CPLog cpLog = new CPLog();

        cpLog.setUserId(sessionDataValue.getUserId());
        cpLog.setUserNm(sessionDataValue.getUserName());
        cpLog.setLocationId(sessionDataValue.getUserId());
        cpLog.setLocationNm(sessionDataValue.getUserLocationName());
        cpLog.setPostId(sessionDataValue.getUserPost());
        cpLog.setPostNm(sessionDataValue.getUserPostName());

        cpLog.setResultTime(d);
        cpLog.setG33(g33);

        cpLog.setKeyword(keyword);
        cpLog.setResultCount(Math.toIntExact(count));
        costMonitoringLogRepository.save(cpLog);
    }

    public ModelAndView getValues1(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV2/appTableV2/appTableV2");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        List<Location> location = locationService.getByLngaTpcd(lngaTpcd);
        modelAndView.addObject("location", location);

        return modelAndView;
    }

    public ModelAndView getValues2(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV2/appTableV3/appTableV3");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        List<Location> location = locationService.getByLngaTpcd(lngaTpcd);
        modelAndView.addObject("location", location);

        return modelAndView;
    }
}
