package uz.customs.customprice.component.costmonitoring;

import org.springframework.data.jpa.domain.Specification;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class LocationOrPostSpecification implements Specification<BaseEntity> {
    @Override
    public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        return criteriaBuilder.notEqual(root.get("senderLocationId"), "TnfApp");
    }
}