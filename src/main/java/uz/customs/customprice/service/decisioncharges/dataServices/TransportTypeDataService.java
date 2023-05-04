package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.component.httpSession.GetterSessionData;
import uz.customs.customprice.component.httpSession.SessionDataValue;
import uz.customs.customprice.entity.catalog.Country;
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.repository.decisioncharges.dataRepository.TransportTypeDataRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;

@Service
@RequiredArgsConstructor
public class TransportTypeDataService {

    @PersistenceContext
    private EntityManager entityManager;

    private final TransportTypeDataRepository transportTypeDataRepository;
    private final GetterSessionData getterSessionData;

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<TransportType> dataTable(DataTablesInput input, String appId, HttpServletRequest httpServletRequest){
        SessionDataValue sessionGetterDataValue = getterSessionData.onlyGetSessionData(httpServletRequest);
        String lngaTpcd = sessionGetterDataValue.getLanguage().substring(3, 5);

        DataTablesOutput<TransportType> tablesOutput =  transportTypeDataRepository.findAll(
                input,
                new ExcludeAnalystsSpecification(appId, lngaTpcd),
                (root, query, criteriaBuilder) -> {
                    if (query.getResultType() != Long.class) {
                        root.fetch("finishCountryJoin", JoinType.LEFT);
                        root.fetch("endCountryJoin", JoinType.LEFT);
                    }
                    return null;
                }
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<TransportType> {
        private final String appId;
        private final String lngaTpcd;

        public ExcludeAnalystsSpecification(String appId, String lngaTpcd) {
            this.appId = appId;
            this.lngaTpcd = lngaTpcd;
        }

        @Override
        public Predicate toPredicate(Root<TransportType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate whereAppIdIn = criteriaBuilder.equal(root.get("appId"), appId);
//            Join<TransportType, Country> finishCountryJoin = root.join("finishCountryJoin", JoinType.LEFT);
//            Join<TransportType, Country> endCountryJoin = root.join("endCountryJoin", JoinType.LEFT);
//            Predicate finishCountryLngaTpcd = criteriaBuilder.equal(finishCountryJoin.get("lngaTpcd"), lngaTpcd);
//            Predicate endCountryLngaTpcd = criteriaBuilder.equal(endCountryJoin.get("lngaTpcd"), lngaTpcd);
            Predicate finalPredicate = criteriaBuilder.and(whereAppIdIn
//                    , finishCountryLngaTpcd,
//                    endCountryLngaTpcd
            );
            return finalPredicate;
        }
    }

}
