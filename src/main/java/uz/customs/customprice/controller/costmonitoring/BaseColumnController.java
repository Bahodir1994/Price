package uz.customs.customprice.controller.costmonitoring;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import uz.customs.customprice.entity.costmonitoring.BaseColumn;
import uz.customs.customprice.service.costmonitoring.baseColumnServices.BaseColumnService;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/routeV2/V3")
@RequiredArgsConstructor
public class BaseColumnController {
    private final BaseColumnService baseColumnService;

    @GetMapping("/data/cost_monitoring_base/v1")
    public ResponseEntity<Object> getColumnDataV1(@RequestBody BaseColumn baseColumn, HttpServletRequest request){
        return new ResponseEntity<>(baseColumnService.getColumns(request), HttpStatus.OK);
    }

    @PutMapping("/data/cost_monitoring_base/v1")
    public void putColumnDataV1(@RequestBody BaseColumn baseColumn, HttpServletRequest request){
        baseColumnService.putColumns(request, baseColumn);
    }

    @PostMapping("/data/cost_monitoring_base/v1")
    public void postColumnDataV1(@RequestBody BaseColumn baseColumn, HttpServletRequest request){
        baseColumnService.postColumns(request, baseColumn);
    }

    @DeleteMapping("/data/cost_monitoring_base/v1")
    public void deleteColumnDataV1(@RequestBody BaseColumn baseColumn){
        baseColumnService.deleteColumns(baseColumn.getId());
    }
}
