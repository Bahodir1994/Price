package uz.customs.customprice.component.costmonitoring;

import org.springframework.data.jpa.domain.Specification;
import uz.customs.customprice.entity.BaseEntity;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

public class RangeSpecification implements Specification<BaseEntity> {

    @Override
    public Specification<BaseEntity> and(Specification<BaseEntity> other) {
        return Specification.super.and(other);
    }

    @Override
    public Specification<BaseEntity> or(Specification<BaseEntity> other) {
        return Specification.super.or(other);
    }

    @Override
    public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        return null;
    }
}