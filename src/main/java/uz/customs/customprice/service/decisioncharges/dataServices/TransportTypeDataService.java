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
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.repository.decisioncharges.dataRepository.TransportTypeDataRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class TransportTypeDataService {

    @PersistenceContext
    private EntityManager entityManager;

    private final TransportTypeDataRepository transportTypeDataRepository;
    private final GetterSessionData getterSessionData;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<TransportType> dataTable(DataTablesInput input, String appId, HttpServletRequest httpServletRequest, @RequestParam Map<String, String> queryParameters){
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);
        String globalSearch = input.getSearch().getValue();
        input.getSearch().setValue("");
        DataTablesOutput<TransportType> tablesOutput =  transportTypeDataRepository.findAll(
                input,
                new ExcludeAnalystsSpecification(appId, lngaTpcd, globalSearch)
                ,
                (root, query, criteriaBuilder) -> {
                    if (query.getResultType() != Long.class) {
                        root.fetch("finishCountryJoin", JoinType.LEFT);
                        root.fetch("endCountryJoin", JoinType.LEFT);
                        root.fetch("transports", JoinType.LEFT);
                    }
                    return null;
                }
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<TransportType> {
        private final String appId;
        private final String lngaTpcd;
        private final String globalSearch;

        public ExcludeAnalystsSpecification(String appId, String lngaTpcd, String globalSearch) {
            this.appId = appId;
            this.lngaTpcd = lngaTpcd;
            this.globalSearch = globalSearch;
        }

        @Override
        public Predicate toPredicate(Root<TransportType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate whereAppIdIn = criteriaBuilder.equal(root.get("appId"), appId);
            Predicate searchPanes1 = criteriaBuilder.like(root.get("finishCountryNm"), globalSearch);
            Predicate searchPanes2 = criteriaBuilder.like(root.get("endCountryNm"), globalSearch);
            Predicate searchPanes3 = criteriaBuilder.like(root.get("finishCountry"), globalSearch);
            Predicate searchPanes4 = criteriaBuilder.like(root.get("endCountry"), globalSearch);
            Predicate searchPanes5 = criteriaBuilder.like(root.get("tarnsportTypeNm"), globalSearch);
            Predicate searchPanes6 = criteriaBuilder.like(root.get("tarnsportType"), globalSearch);

            Predicate finishCountryLngaTpcd = criteriaBuilder.equal(root.get("finishCountryJoin").get("lngaTpcd"), lngaTpcd);
            Predicate endCountryLngaTpcd = criteriaBuilder.equal(root.get("endCountryJoin").get("lngaTpcd"), lngaTpcd);
            Predicate transportCode = criteriaBuilder.equal(root.get("transports").get("lngaTpcd"), lngaTpcd);
            Predicate orListPredicates = criteriaBuilder.or(searchPanes1, searchPanes2, searchPanes3, searchPanes4, searchPanes5, searchPanes6);
            Predicate andListPredicates;
            if (!globalSearch.equals("")){
                andListPredicates = criteriaBuilder.and(whereAppIdIn, finishCountryLngaTpcd, endCountryLngaTpcd, transportCode, orListPredicates);
            }else {
                andListPredicates = criteriaBuilder.and(whereAppIdIn, finishCountryLngaTpcd, endCountryLngaTpcd, transportCode);
            }
            return andListPredicates;
        }
    }

}
