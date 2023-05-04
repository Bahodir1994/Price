package uz.customs.customprice.service.decisioncharges.jpaServices;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.catalog.*;
import uz.customs.customprice.entity.decisioncharges.DecisionChargesStatusType;
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.entity.earxiv.Earxiv;
import uz.customs.customprice.repository.decisioncharges.dataRepository.ApplicationDecisionCostDataRepository;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.ApplicationDecisionCostRepository;
import uz.customs.customprice.service.catalog.*;
import uz.customs.customprice.service.earxiv.EarxivService;
import uz.customs.customprice.service.helperClasses.ApplicationDecisionCostDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ApplicationDecisionCostService {

    private final ApplicationDecisionCostDataRepository applicationDecisionCostDataRepository;
    private final ApplicationDecisionCostRepository applicationDecisionCostRepository;
    private final GetterSessionData getterSessionData;
    private final CountryService countryService;
    private final LocationService locationService;
    private final PostService postService;
    private final FeatMoveService featMoveService;
    private final UnitService unitService;
    private final CustomsModeService customsModeService;
    private final DeliveryTermsService deliveryTermsService;
    private final MethodService methodService;
    private final StatusService statusService;
    private final TransportTypeService transportTypeService;
    private final EarxivService earxivService;

    public ModelAndView getValues(HttpServletRequest httpServletRequest) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV3/appTableV1/appTableV1");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        ObjectMapper mapper = new ObjectMapper();
        modelAndView.addObject("sessionGetterDataValue", mapper.writeValueAsString(sessionGetterDataValue));
        modelAndView.addObject("sessionLanguage", sessionGetterDataValue.getLanguage());

        List<Country> country = countryService.findAllByLngaTpcdOrderByCodeAsc(lngaTpcd);
        List<Location> location = locationService.getByLngaTpcd(lngaTpcd);
        List<DecisionChargesStatusType> status = statusService.getByLngaTpcd(lngaTpcd);
        List<Post> post = postService.getByLngaTpcd(lngaTpcd);
        List<FeatMove> featMove = featMoveService.getByLngaTpcd(lngaTpcd);
        List<Unit> unit = unitService.getByLngaTpcd(lngaTpcd);
        List<CustomsMode> customsMode = customsModeService.getByLngaTpcd(lngaTpcd);
        List<DeliveryTerms> deliveryTerms = deliveryTermsService.getByLngaTpcd(lngaTpcd);
        List<Method> method = methodService.getByLngaTpcd(lngaTpcd);

        modelAndView.addObject("location", location);
        modelAndView.addObject("status", status);
        modelAndView.addObject("featMove", featMove);
        modelAndView.addObject("unit", unit);
        modelAndView.addObject("customsMode", customsMode);
        modelAndView.addObject("deliveryTerms", deliveryTerms);
        modelAndView.addObject("method", method);

        return modelAndView;
    }

    public ModelAndView getValues2(HttpServletRequest httpServletRequest, String appId) throws JsonProcessingException {
        ModelAndView modelAndView = new ModelAndView("resources/pages/appV3/appTableV1/appDetail");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);

        List<TransportType> getInDecViewTrType = transportTypeService.getByAppId(appId);
        modelAndView.addObject("transports", getInDecViewTrType);

//        Optional<ApplicationDecisionCost> apps = applicationDecisionCostRepository.findById(appId);
        ObjectMapper mapper = new ObjectMapper();
        modelAndView.addObject("sessionGetterDataValue", mapper.writeValueAsString(sessionGetterDataValue));
        modelAndView.addObject("sessionLanguage", sessionGetterDataValue.getLanguage());
        modelAndView.addObject("appId", mapper.writeValueAsString(appId));

        return modelAndView;
//        List<Earxiv> earxivList = new ArrayList<>();
//        earxivList = earxivRepo.findByAppId(appId);
//
//        if (sessionGetterDataValue.getUserRole() == 8 && (apps.getStatus() == 110 || apps.getStatus() == 135 || apps.getStatus() == 111 || apps.getStatus() == 118) ) {
//            Status status = statusService.getById(115);
//            apps.setStatus(status.getId());
//            apps.setStatusNm(status.getName());
//            appsservice.saveAppsStatus(apps);
//
//            /**todo ЛОК га ёзиш start todo**/
//            StatusM statusM = statusMService.getByAppId(appId);
//            statusM.setAppId(apps.getId());
//            statusM.setStatus(String.valueOf(apps.getStatus()));
//            statusM.setStatusComment(apps.getStatusNm());
//            statusM.setInsUser(sessionGetterDataValue.getUserId());
//            statusMService.saveStatusM(statusM);
//
//            StatusH statusH = new StatusH();
//            statusH.setStmainID(statusM.getId());
//            statusH.setAppId(statusM.getAppId());
//            statusH.setStatus(String.valueOf(apps.getStatus()));
//            statusH.setStatusComment(apps.getStatusNm());
//            statusH.setInsUser(sessionGetterDataValue.getUserId());
//            statusHService.saveStatusH(statusH);
//            /**todo ЛОК га ёзиш end todo**/
//
//        }
//        List<String> first = new ArrayList<String>();
//        first.add("1");
//        first.add("2");
//        first.add("3");
//        first.add("4");
//        List<String> second = new ArrayList<String>();
//        second.add("5");
//        second.add("6");
//
//        modelAndView.addObject("earxivList", earxivList);
//        modelAndView.addObject("appId", appId);
//        modelAndView.addObject("appStatus", apps.getStatus());
//        modelAndView.addObject("userRole", userRole);
//
//        List<Apps> InitialDecisionViewApp = appsservice.getInitialDecisionView(appId);
//        modelAndView.addObject("appInfo", InitialDecisionViewApp);
//
//        List<Commodity> getInitialDecisionViewCommodity = appsservice.getInitialDecisionViewCommodity(appId);
//        modelAndView.addObject("allCommodityFor", getInitialDecisionViewCommodity);
//
//        List<TransportType> getInDecViewTrType = transportTypeService.getByAppId(appId);
//        modelAndView.addObject("transports", getInDecViewTrType);
//
//        List<RollbackSp> listRollbackSpFirst = rollbackSpService.getlistRollbackSpFirstSecond(first);
//        modelAndView.addObject("rollbackInfoForFirst", listRollbackSpFirst);
//
//        List<RollbackSp> listRollbackSpSecond = rollbackSpService.getlistRollbackSpFirstSecond(second);
//        modelAndView.addObject("rollbackInfoForSecond", listRollbackSpSecond);
//
//        int Sizes = getInitialDecisionViewCommodity.size();
//        modelAndView.addObject("cmdtIdFirst", getInitialDecisionViewCommodity.get(0).getId());
    }

    public ApplicationDecisionCostDTO getValues3(String appId) {
        ApplicationDecisionCostDTO applicationDecisionCostDTO = applicationDecisionCostRepository.findByQueryApplicationAndCommoditySumAndTransportTypeSum(appId);
        applicationDecisionCostDTO.setEarxivList(earxivService.getListByAppId(appId));
        return applicationDecisionCostDTO;
    }

}
