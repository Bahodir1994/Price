package uz.customs.customprice.controller.costmonitoring.HelperClasses;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import uz.customs.customprice.controller.costmonitoring.HelperClasses.BaseArray;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BaseColumnDTO {

    List<ColumnsBase> arrayList;

    private String id;
    private String settingName;

}
