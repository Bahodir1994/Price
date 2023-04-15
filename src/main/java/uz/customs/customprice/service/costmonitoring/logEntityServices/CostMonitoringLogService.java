package uz.customs.customprice.service.costmonitoring.logEntityServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.costmonitoring.CPLog;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringDataLogRepository;
import uz.customs.customprice.repository.costmonitoring.CostMonitoringLogRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
public class CostMonitoringLogService {

    private final CostMonitoringDataLogRepository costMonitoringDataLogRepository;
    private final CostMonitoringLogRepository costMonitoringLogRepository;
    private final GetterSessionData getterSessionData;

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

}
