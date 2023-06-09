package uz.customs.customprice.service.decisioncharges.specification;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.Search;
import org.springframework.data.jpa.domain.Specification;
import uz.customs.customprice.entity.decisioncharges.ApplicationDecisionCost;

import javax.persistence.criteria.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

import static org.springframework.util.StringUtils.hasText;

public class ApplicationDecisionCostSpecification implements Specification<ApplicationDecisionCost> {
    private final LocalDate minFirstDay;
    private final LocalDate maxFirstDay;

    public ApplicationDecisionCostSpecification(DataTablesInput input) {
        Search columnSearch = input.getColumn("appDate").getSearch();
        String dateFilter = columnSearch.getValue();
        columnSearch.setValue("");
        if (!hasText(dateFilter)) {
            minFirstDay = maxFirstDay = null;
            return;
        }
        String[] bounds = dateFilter.split(";");
        minFirstDay = getValue(bounds, 0);
        maxFirstDay = getValue(bounds, 1);
//        if (!hasText(dateFilter)) {
//            minFirstDay = LocalDateTime.now().toLocalDate().minusMonths(1);
//            maxFirstDay = LocalDateTime.now().toLocalDate();
//        } else {
//            String[] bounds = dateFilter.split(";");
//            minFirstDay = getValue(bounds, 0);
//            maxFirstDay = getValue(bounds, 1);
//        }
    }

    private LocalDate getValue(String[] bounds, int index) {
        if (bounds.length > index && hasText(bounds[index])) {
            try {
                return LocalDate.parse(bounds[index]);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return null;
    }

    @Override
    public Predicate toPredicate(Root<ApplicationDecisionCost> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        Expression<LocalDate> firstDay = root.get("appDate").as(LocalDate.class);
        if (minFirstDay != null && maxFirstDay != null) {
            return criteriaBuilder.between(firstDay, minFirstDay, maxFirstDay);
        } else if (minFirstDay != null) {
            return criteriaBuilder.greaterThanOrEqualTo(firstDay, minFirstDay);
        } else if (maxFirstDay != null) {
            return criteriaBuilder.lessThanOrEqualTo(firstDay, maxFirstDay);
        } else {
            return criteriaBuilder.conjunction();
        }
    }
}