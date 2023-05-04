package uz.customs.customprice.service.decisioncharges.dataServices;

import lombok.RequiredArgsConstructor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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

    @Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
    public DataTablesOutput<TransportType> dataTable(DataTablesInput input, String appId){

        DataTablesOutput<TransportType> tablesOutput =  transportTypeDataRepository.findAll(
                input,
                new ExcludeAnalystsSpecification(appId)
        );
        return tablesOutput;
    }

    private static class ExcludeAnalystsSpecification implements Specification<TransportType> {
        private final String appId;

        public ExcludeAnalystsSpecification(String appId) {
            this.appId = appId;
        }

        @Override
        public Predicate toPredicate(Root<TransportType> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
            Predicate isDeleted = criteriaBuilder.notEqual(root.get("isDeleted"), 1);
            Predicate whereAppIdIn = criteriaBuilder.notEqual(root.get("appId"), appId);
            Predicate finalPredicate = criteriaBuilder.and(isDeleted, whereAppIdIn);
            return finalPredicate;
        }
    }

}
