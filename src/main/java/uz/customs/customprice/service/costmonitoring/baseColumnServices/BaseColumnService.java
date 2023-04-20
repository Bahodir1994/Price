package uz.customs.customprice.service.costmonitoring.baseColumnServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.costmonitoring.BaseColumn;
import uz.customs.customprice.repository.costmonitoring.BaseColumnRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BaseColumnService {
    private final BaseColumnRepository baseColumnRepository;
    private final GetterSessionData getterSessionData;

    private static <T> T findUniqueElement(List<T> elements) {
        if (elements.size() == 1) {
            return elements.get(0);
        }
        return null;
    }

    public Map<String, Object> getColumns(HttpServletRequest httpServletRequest) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        Map<String, Object> objectMap = new HashMap<>();

        Optional<BaseColumn> baseColumnActive = baseColumnRepository.findByInsUser(sessionGetterDataValue.getUserId())
                .stream()
                .filter(baseColumn -> baseColumn.getIsDefault() == 1)
                .collect(Collectors.collectingAndThen(Collectors.toList(),
                        list -> Optional.ofNullable(findUniqueElement(list))));
        baseColumnActive.ifPresentOrElse(
                baseColumn -> {objectMap.put("activeSetting", baseColumn);},
                () -> {objectMap.put("activeSetting", baseColumnRepository.findById("1").get());});

        objectMap.put("otherSettings", baseColumnRepository.findByInsUser(sessionGetterDataValue.getUserId()).stream()
                        .filter(baseColumn -> baseColumn.getIsDefault() == 0).collect(Collectors.toList())
        );

        return objectMap;
    }

    public void putColumns(HttpServletRequest httpServletRequest, BaseColumn baseColumn) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        baseColumnRepository.findByIdAndInsUserAndIsDefault(baseColumn.getId(), sessionGetterDataValue.getUserId(), 1).ifPresent(
                baseColumn1 -> {
                    baseColumn1.setIsDefault(0);
                    baseColumnRepository.save(baseColumn1);
                }
        );
        baseColumnRepository.save(baseColumn);
    }

    public void postColumns(HttpServletRequest httpServletRequest, BaseColumn baseColumn) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        baseColumn.setInsUser(sessionGetterDataValue.getUserId());
        baseColumnRepository.saveAndFlush(baseColumn);
    }

    public void deleteColumns(String id) {
        baseColumnRepository.deleteById(id);
    }
}
