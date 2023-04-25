package uz.customs.customprice.controller.costmonitoring;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.controller.costmonitoring.HelperClasses.BaseColumnDTO;
import uz.customs.customprice.entity.costmonitoring.BaseColumn;
import uz.customs.customprice.service.costmonitoring.baseColumnServices.BaseColumnService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/routeV2/V3")
@RequiredArgsConstructor
public class BaseColumnController {
    private final BaseColumnService baseColumnService;
    private final GetterSessionData getterSessionData;

    @GetMapping("/data/cost_monitoring_base/v1")
    public ModelAndView getColumnDataV1(HttpServletRequest request) throws JsonProcessingException {
        ModelAndView model = new ModelAndView("/resources/pages/appV2/appTableV1/appSettingV1");
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(request);
        model.addObject("sessionLanguage", sessionGetterDataValue.getLanguage());
        return model;
    }

    @GetMapping("/data/cost_monitoring_base/v2")
    public ResponseEntity<Object> getColumnDataV2(HttpServletRequest request) throws JsonProcessingException {
        Map<String, Object> map = new HashMap<>();
        map.put("settings", baseColumnService.setterMap(request));
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @GetMapping("/data/cost_monitoring_base/v3")
    public ResponseEntity<Object> getColumnDataV3(HttpServletRequest httpServletRequest) {
        Map<String, Object> map = new HashMap<>();
        map.put("columns",  baseColumnService.getColumns(httpServletRequest));
        return new ResponseEntity<>(map, HttpStatus.OK);
    }

    @PutMapping("/data/cost_monitoring_base/v1")
    public void putColumnDataV1(@RequestBody BaseColumnDTO baseColumnDTO, HttpServletRequest request){
        baseColumnService.putColumns(request, baseColumnDTO);
    }

    @PostMapping("/data/cost_monitoring_base/v1")
    public ResponseEntity<Object> postColumnDataV1(@RequestBody BaseColumnDTO baseColumnDTO, HttpServletRequest request){
        baseColumnService.postColumns(request, baseColumnDTO);
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @DeleteMapping("/data/cost_monitoring_base/v1")
    public void deleteColumnDataV1(@RequestBody BaseColumn baseColumn){
        baseColumnService.deleteColumns(baseColumn.getId());
    }
}
