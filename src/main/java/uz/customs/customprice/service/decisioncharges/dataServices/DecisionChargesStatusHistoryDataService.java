package uz.customs.customprice.service.decisioncharges.dataServices;




import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.decisioncharges.StatusH;
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.repository.decisioncharges.dataRepository.DecisionChargesStatusHistoryDataRepository;

import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class DecisionChargesStatusHistoryDataService {
    private final DecisionChargesStatusHistoryDataRepository decisionChargesStatusHistoryDataRepository;
    private final GetterSessionData getterSessionData;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<StatusH> dataTable(DataTablesInput input, String appId, HttpServletRequest httpServletRequest, @RequestParam Map<String, String> queryParameters){
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);
        String globalSearch = input.getSearch().getValue();
        input.getSearch().setValue("");
        DataTablesOutput<StatusH> tablesOutput =  decisionChargesStatusHistoryDataRepository.findAll(
                input,
                new DecisionChargesStatusHistoryDataService.ExcludeAnalystsSpecification(appId, lngaTpcd, globalSearch)
                ,
                (root, query, criteriaBuilder) -> {
                    if (query.getResultType() != Long.class) {
                        root.fetch("statusType", JoinType.LEFT);
                    }
                    return null;
                }
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<StatusH> {
        private final String appId;
        private final String lngaTpcd;
        private final String globalSearch;

        public ExcludeAnalystsSpecification(String appId, String lngaTpcd, String globalSearch) {
            this.appId = appId;
            this.lngaTpcd = lngaTpcd;
            this.globalSearch = globalSearch;
        }

        @Override
        public Predicate toPredicate(Root<StatusH> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate searchPanes1 = criteriaBuilder.like(root.get("statusComment"), '%'+globalSearch+'%');
            Predicate searchPanes2 = criteriaBuilder.like(root.get("comment"), '%'+globalSearch+'%');
            Predicate searchPanes3 = criteriaBuilder.like(root.get("sortedInsNm"), '%'+globalSearch+'%');

            Predicate whereAppIdIn = criteriaBuilder.equal(root.get("appId"), appId);
            Predicate statusTypeLngaTpcd = criteriaBuilder.equal(root.get("statusType").get("lngaTpcd"), lngaTpcd);
            Predicate orListPredicates = criteriaBuilder.or(searchPanes1, searchPanes2, searchPanes3);

            Predicate andListPredicates;
            if (!globalSearch.equals("")){
                andListPredicates = criteriaBuilder.and(whereAppIdIn, statusTypeLngaTpcd, orListPredicates);
            }else {
                andListPredicates = criteriaBuilder.and(whereAppIdIn, statusTypeLngaTpcd);
            }
            return andListPredicates;
        }
    }

}
