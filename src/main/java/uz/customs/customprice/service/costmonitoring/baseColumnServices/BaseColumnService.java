package uz.customs.customprice.service.costmonitoring.baseColumnServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.controller.costmonitoring.HelperClasses.BaseArray;
import uz.customs.customprice.controller.costmonitoring.HelperClasses.BaseColumnDTO;
import uz.customs.customprice.controller.costmonitoring.HelperClasses.ColumnsBase;
import uz.customs.customprice.entity.costmonitoring.BaseColumn;
import uz.customs.customprice.repository.costmonitoring.BaseColumnRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
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

        Optional<BaseColumn> baseColumnActive = baseColumnRepository.findByInsUser(sessionGetterDataValue.getUserIdS())
                .stream()
                .filter(baseColumn -> baseColumn.getIsDefault() == 1)
                .collect(Collectors.collectingAndThen(Collectors.toList(),
                        list -> Optional.ofNullable(findUniqueElement(list))));
        baseColumnActive.ifPresentOrElse(
                baseColumn -> {
                    objectMap.put("activeSetting", baseColumn);
                    },
                () -> {
                    objectMap.put("activeSetting", baseColumnRepository.findById("1").get());}
        );

        objectMap.put("otherSettings", baseColumnRepository.findByInsUser(sessionGetterDataValue.getUserId()).stream()
                        .filter(baseColumn -> baseColumn.getIsDefault() == 0).collect(Collectors.toList())
        );

        return objectMap;
    }

    public void selectColumns(HttpServletRequest httpServletRequest, BaseColumnDTO baseColumnDTO){
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        baseColumnRepository.findByInsUserAndId(sessionGetterDataValue.getUserId(), baseColumnDTO.getId()).ifPresent(baseColumn -> {
            baseColumn.setIsDefault(1);
            baseColumnRepository.save(baseColumn);
        });
    }

    public void putColumns(HttpServletRequest httpServletRequest, BaseColumnDTO baseColumnDTO) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        baseColumnRepository.findByInsUserAndIsDefault(sessionGetterDataValue.getUserIdS(), 1).ifPresent(baseColumn -> {
            baseColumn.setIsDefault(0);
            baseColumnRepository.save(baseColumn);
        });
        baseColumnRepository.findByInsUserAndId(sessionGetterDataValue.getUserIdS(), baseColumnDTO.getId()).ifPresent(
                baseColumn -> {
                    if (!Objects.equals(baseColumn.getId(), "1")){
                        baseColumn.setIsDefault(1);
                    }
                    if (baseColumnDTO.getSettingName() != null && !Objects.equals(baseColumnDTO.getSettingName(), "")){
                        baseColumn.setSettingName(baseColumnDTO.getSettingName());
                    }
                    baseColumn.setUgtk(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("ugtk")).findFirst().get().isSelected());
                    baseColumn.setG7A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7A")).findFirst().get().isSelected());
                    baseColumn.setG7B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7B")).findFirst().get().isSelected());
                    baseColumn.setG7C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7C")).findFirst().get().isSelected());
                    baseColumn.setG7Ag7Bg7C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7Ag7Bg7C")).findFirst().get().isSelected());
                    baseColumn.setG1A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1A")).findFirst().get().isSelected());
                    baseColumn.setG1B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1B")).findFirst().get().isSelected());
                    baseColumn.setG1Ag1B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1Ag1B")).findFirst().get().isSelected());
                    baseColumn.setG32(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g32")).findFirst().get().isSelected());
                    baseColumn.setG37B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g37B")).findFirst().get().isSelected());
                    baseColumn.setG37C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g37C")).findFirst().get().isSelected());
                    baseColumn.setG2Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g2Name")).findFirst().get().isSelected());
                    baseColumn.setG8Code2(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g8Code2")).findFirst().get().isSelected());
                    baseColumn.setG33(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g33")).findFirst().get().isSelected());
                    baseColumn.setG31Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Name")).findFirst().get().isSelected());
                    baseColumn.setG15(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g15")).findFirst().get().isSelected());
                    baseColumn.setG11(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g11")).findFirst().get().isSelected());
                    baseColumn.setVidKontrakta(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vidKontrakta")).findFirst().get().isSelected());
                    baseColumn.setG34(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g34")).findFirst().get().isSelected());
                    baseColumn.setS34(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("s34")).findFirst().get().isSelected());
                    baseColumn.setG25(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g25")).findFirst().get().isSelected());
                    baseColumn.setG20A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20A")).findFirst().get().isSelected());
                    baseColumn.setG20B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20B")).findFirst().get().isSelected());
                    baseColumn.setG20Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20Name")).findFirst().get().isSelected());
                    baseColumn.setG20Ag20B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20Ag20B")).findFirst().get().isSelected());
                    baseColumn.setG22A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g22A")).findFirst().get().isSelected());
                    baseColumn.setG45(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45")).findFirst().get().isSelected());
                    baseColumn.setG45Usd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45Usd")).findFirst().get().isSelected());
                    baseColumn.setG42(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g42")).findFirst().get().isSelected());
                    baseColumn.setG42Usd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g42Usd")).findFirst().get().isSelected());
                    baseColumn.setIndxusd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("indxusd")).findFirst().get().isSelected());
                    baseColumn.setIndxusdLn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("indxusdLn")).findFirst().get().isSelected());
                    baseColumn.setG45Usded(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45Usded")).findFirst().get().isSelected());
                    baseColumn.setG45UsdedLn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45UsdedLn")).findFirst().get().isSelected());
                    baseColumn.setG31Marka(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Marka")).findFirst().get().isSelected());
                    baseColumn.setG35(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g35")).findFirst().get().isSelected());
                    baseColumn.setG38(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g38")).findFirst().get().isSelected());
                    baseColumn.setG41(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g41")).findFirst().get().isSelected());
                    baseColumn.setG43(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g43")).findFirst().get().isSelected());
                    baseColumn.setG31Amount(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Amount")).findFirst().get().isSelected());
                    baseColumn.setVesEd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vesEd")).findFirst().get().isSelected());
                    baseColumn.setGdvipdate(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("gdvipdate")).findFirst().get().isSelected());
                    baseColumn.setGc3Date(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("gc3Date")).findFirst().get().isSelected());
                    baseColumn.setMetod(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("metod")).findFirst().get().isSelected());
                    baseColumn.setVzaimosvyaz(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vzaimosvyaz")).findFirst().get().isSelected());
                    baseColumn.setIdn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("idn")).findFirst().get().isSelected());
                    baseColumn.setObl(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("obl")).findFirst().get().isSelected());
                    baseColumn.setLgot20(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot20")).findFirst().get().isSelected());
                    baseColumn.setLgot27(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot27")).findFirst().get().isSelected());
                    baseColumn.setLgot29(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot29")).findFirst().get().isSelected());
                    baseColumn.setSovstavka(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("sovstavka")).findFirst().get().isSelected());
                    baseColumn.setAsosQiymat(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("asosQiymat")).findFirst().get().isSelected());
                    baseColumn.setKtd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("ktd")).findFirst().get().isSelected());


                    baseColumnRepository.save(baseColumn);
                }
        );
    }

    public void postColumns(HttpServletRequest httpServletRequest, BaseColumnDTO baseColumnDTO) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        BaseColumn baseColumn = new BaseColumn();

        baseColumn.setInsUser(sessionGetterDataValue.getUserIdS());
        baseColumn.setSettingName(baseColumnDTO.getSettingName());
        baseColumn.setUgtk(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("ugtk")).findFirst().get().isSelected());
        baseColumn.setG7A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7A")).findFirst().get().isSelected());
        baseColumn.setG7B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7B")).findFirst().get().isSelected());
        baseColumn.setG7C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7C")).findFirst().get().isSelected());
        baseColumn.setG7Ag7Bg7C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g7Ag7Bg7C")).findFirst().get().isSelected());
        baseColumn.setG1A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1A")).findFirst().get().isSelected());
        baseColumn.setG1B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1B")).findFirst().get().isSelected());
        baseColumn.setG1Ag1B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g1Ag1B")).findFirst().get().isSelected());
        baseColumn.setG32(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g32")).findFirst().get().isSelected());
        baseColumn.setG37B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g37B")).findFirst().get().isSelected());
        baseColumn.setG37C(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g37C")).findFirst().get().isSelected());
        baseColumn.setG2Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g2Name")).findFirst().get().isSelected());
        baseColumn.setG8Code2(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g8Code2")).findFirst().get().isSelected());
        baseColumn.setG33(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g33")).findFirst().get().isSelected());
        baseColumn.setG31Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Name")).findFirst().get().isSelected());
        baseColumn.setG15(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g15")).findFirst().get().isSelected());
        baseColumn.setG11(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g11")).findFirst().get().isSelected());
        baseColumn.setVidKontrakta(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vidKontrakta")).findFirst().get().isSelected());
        baseColumn.setG34(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g34")).findFirst().get().isSelected());
        baseColumn.setS34(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("s34")).findFirst().get().isSelected());
        baseColumn.setG25(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g25")).findFirst().get().isSelected());
        baseColumn.setG20A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20A")).findFirst().get().isSelected());
        baseColumn.setG20B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20B")).findFirst().get().isSelected());
        baseColumn.setG20Name(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20Name")).findFirst().get().isSelected());
        baseColumn.setG20Ag20B(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g20Ag20B")).findFirst().get().isSelected());
        baseColumn.setG22A(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g22A")).findFirst().get().isSelected());
        baseColumn.setG45(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45")).findFirst().get().isSelected());
        baseColumn.setG45Usd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45Usd")).findFirst().get().isSelected());
        baseColumn.setG42(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g42")).findFirst().get().isSelected());
        baseColumn.setG42Usd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g42Usd")).findFirst().get().isSelected());
        baseColumn.setIndxusd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("indxusd")).findFirst().get().isSelected());
        baseColumn.setIndxusdLn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("indxusdLn")).findFirst().get().isSelected());
        baseColumn.setG45Usded(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45Usded")).findFirst().get().isSelected());
        baseColumn.setG45UsdedLn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g45UsdedLn")).findFirst().get().isSelected());
        baseColumn.setG31Marka(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Marka")).findFirst().get().isSelected());
        baseColumn.setG35(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g35")).findFirst().get().isSelected());
        baseColumn.setG38(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g38")).findFirst().get().isSelected());
        baseColumn.setG41(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g41")).findFirst().get().isSelected());
        baseColumn.setG43(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g43")).findFirst().get().isSelected());
        baseColumn.setG31Amount(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("g31Amount")).findFirst().get().isSelected());
        baseColumn.setVesEd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vesEd")).findFirst().get().isSelected());
        baseColumn.setGdvipdate(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("gdvipdate")).findFirst().get().isSelected());
        baseColumn.setGc3Date(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("gc3Date")).findFirst().get().isSelected());
        baseColumn.setMetod(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("metod")).findFirst().get().isSelected());
        baseColumn.setVzaimosvyaz(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("vzaimosvyaz")).findFirst().get().isSelected());
        baseColumn.setIdn(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("idn")).findFirst().get().isSelected());
        baseColumn.setObl(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("obl")).findFirst().get().isSelected());
        baseColumn.setLgot20(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot20")).findFirst().get().isSelected());
        baseColumn.setLgot27(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot27")).findFirst().get().isSelected());
        baseColumn.setLgot29(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("lgot29")).findFirst().get().isSelected());
        baseColumn.setSovstavka(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("sovstavka")).findFirst().get().isSelected());
        baseColumn.setAsosQiymat(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("asosQiymat")).findFirst().get().isSelected());
        baseColumn.setKtd(baseColumnDTO.getArrayList().stream().filter(columnsBase -> columnsBase.getValue().equals("ktd")).findFirst().get().isSelected());

        baseColumnRepository.saveAndFlush(baseColumn);
    }

    public void deleteColumns(String id) {
        baseColumnRepository.deleteById(id);
    }

    public List<BaseArray> setterMap(HttpServletRequest httpServletRequest) {
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        List<BaseArray> baseArrays = new ArrayList<>();
        List<BaseColumn> baseColumns = baseColumnRepository.findByInsUserOrId(sessionGetterDataValue.getUserIdS(), "1");
        for (BaseColumn baseColumn: baseColumns){
            baseArrays.add(new BaseArray(
                    baseColumn.getId(),
                    baseColumn.getSettingName(),
                    baseColumn.getIsDefault(),
                    setterToColumnBase(baseColumn)
            ));
        }
        return baseArrays;
    }

    public List<ColumnsBase> setterToColumnBase(BaseColumn baseColumn){
        List<ColumnsBase> columnsBases = new ArrayList<>();
        columnsBases.add(new ColumnsBase("appTableV1.ugtk", "ugtk", baseColumn.isUgtk()));
        columnsBases.add(new ColumnsBase("appTableV1.g7A", "g7A", baseColumn.isG7A()));
        columnsBases.add(new ColumnsBase("appTableV1.g7B", "g7B", baseColumn.isG7B()));
        columnsBases.add(new ColumnsBase("appTableV1.g7C", "g7C", baseColumn.isG7C()));
        columnsBases.add(new ColumnsBase("appTableV1.g7Ag7Bg7C", "g7Ag7Bg7C", baseColumn.isG7Ag7Bg7C()));
        columnsBases.add(new ColumnsBase("appTableV1.g1A", "g1A", baseColumn.isG1A()));
        columnsBases.add(new ColumnsBase("appTableV1.g1B", "g1B", baseColumn.isG1B()));
        columnsBases.add(new ColumnsBase("appTableV1.g1Ag1B", "g1Ag1B", baseColumn.isG1Ag1B()));
        columnsBases.add(new ColumnsBase("appTableV1.g32", "g32", baseColumn.isG32()));
        columnsBases.add(new ColumnsBase("appTableV1.g37B", "g37B", baseColumn.isG37B()));
        columnsBases.add(new ColumnsBase("appTableV1.g37C", "g37C", baseColumn.isG37C()));
        columnsBases.add(new ColumnsBase("appTableV1.g2Name", "g2Name", baseColumn.isG2Name()));
        columnsBases.add(new ColumnsBase("appTableV1.g8Code2", "g8Code2", baseColumn.isG8Code2()));
        columnsBases.add(new ColumnsBase("appTableV1.g33", "g33", baseColumn.isG33()));
        columnsBases.add(new ColumnsBase("appTableV1.g31Name", "g31Name", baseColumn.isG31Name()));
        columnsBases.add(new ColumnsBase("appTableV1.g15", "g15", baseColumn.isG15()));
        columnsBases.add(new ColumnsBase("appTableV1.g11", "g11", baseColumn.isG11()));
        columnsBases.add(new ColumnsBase("appTableV1.vidKontrakta", "vidKontrakta", baseColumn.isVidKontrakta()));
        columnsBases.add(new ColumnsBase("appTableV1.g34", "g34", baseColumn.isG34()));
        columnsBases.add(new ColumnsBase("appTableV1.s34", "s34", baseColumn.isS34()));
        columnsBases.add(new ColumnsBase("appTableV1.g25", "g25", baseColumn.isG25()));
        columnsBases.add(new ColumnsBase("appTableV1.g20A", "g20A", baseColumn.isG20A()));
        columnsBases.add(new ColumnsBase("appTableV1.g20B", "g20B", baseColumn.isG20B()));
        columnsBases.add(new ColumnsBase("appTableV1.g20Name", "g20Name", baseColumn.isG20Name()));
        columnsBases.add(new ColumnsBase("appTableV1.g20Ag20B", "g20Ag20B", baseColumn.isG20Ag20B()));
        columnsBases.add(new ColumnsBase("appTableV1.g22A", "g22A", baseColumn.isG22A()));
        columnsBases.add(new ColumnsBase("appTableV1.g45", "g45", baseColumn.isG45()));
        columnsBases.add(new ColumnsBase("appTableV1.g45Usd", "g45Usd", baseColumn.isG45Usd()));
        columnsBases.add(new ColumnsBase("appTableV1.g42", "g42", baseColumn.isG42()));
        columnsBases.add(new ColumnsBase("appTableV1.g42Usd", "g42Usd", baseColumn.isG42Usd()));
        columnsBases.add(new ColumnsBase("appTableV1.indxusd", "indxusd", baseColumn.isIndxusd()));
        columnsBases.add(new ColumnsBase("appTableV1.indxusdLn", "indxusdLn", baseColumn.isIndxusdLn()));
        columnsBases.add(new ColumnsBase("appTableV1.g45Usded", "g45Usded", baseColumn.isG45Usded()));
        columnsBases.add(new ColumnsBase("appTableV1.g45UsdedLn", "g45UsdedLn", baseColumn.isG45UsdedLn()));
        columnsBases.add(new ColumnsBase("appTableV1.g31Marka", "g31Marka", baseColumn.isG31Marka()));
        columnsBases.add(new ColumnsBase("appTableV1.g35", "g35", baseColumn.isG35()));
        columnsBases.add(new ColumnsBase("appTableV1.g38", "g38", baseColumn.isG38()));
        columnsBases.add(new ColumnsBase("appTableV1.g41", "g41", baseColumn.isG41()));
        columnsBases.add(new ColumnsBase("appTableV1.g43", "g43", baseColumn.isG43()));
        columnsBases.add(new ColumnsBase("appTableV1.g31Amount", "g31Amount", baseColumn.isG31Amount()));
        columnsBases.add(new ColumnsBase("appTableV1.vesEd", "vesEd", baseColumn.isVesEd()));
        columnsBases.add(new ColumnsBase("appTableV1.gdvipdate", "gdvipdate", baseColumn.isGdvipdate()));
        columnsBases.add(new ColumnsBase("appTableV1.gc3Date", "gc3Date", baseColumn.isGc3Date()));
        columnsBases.add(new ColumnsBase("appTableV1.metod", "metod", baseColumn.isMetod()));
        columnsBases.add(new ColumnsBase("appTableV1.vzaimosvyaz", "vzaimosvyaz", baseColumn.isVzaimosvyaz()));
        columnsBases.add(new ColumnsBase("appTableV1.idn", "idn", baseColumn.isIdn()));
        columnsBases.add(new ColumnsBase("appTableV1.obl", "obl", baseColumn.isObl()));
        columnsBases.add(new ColumnsBase("appTableV1.lgot20", "lgot20", baseColumn.isLgot20()));
        columnsBases.add(new ColumnsBase("appTableV1.lgot27", "lgot27", baseColumn.isLgot27()));
        columnsBases.add(new ColumnsBase("appTableV1.lgot29", "lgot29", baseColumn.isLgot29()));
        columnsBases.add(new ColumnsBase("appTableV1.sovstavka", "sovstavka", baseColumn.isSovstavka()));
        columnsBases.add(new ColumnsBase("appTableV1.asosQiymat", "asosQiymat", baseColumn.isAsosQiymat()));
        columnsBases.add(new ColumnsBase("appTableV1.ktd", "ktd", baseColumn.isKtd()));
        return columnsBases;
    }
}
