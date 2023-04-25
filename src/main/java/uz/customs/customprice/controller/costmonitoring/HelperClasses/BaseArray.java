package uz.customs.customprice.controller.costmonitoring.HelperClasses;

import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BaseArray {
    private String id;
    private String settingName;
    private Integer isDefault;
    private List<ColumnsBase> selected;
}
