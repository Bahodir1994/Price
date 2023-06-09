package uz.customs.customprice.service.costmonitoring.baseEntityServices;


import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.Search;
import org.springframework.data.jpa.domain.Specification;
import uz.customs.customprice.entity.costmonitoring.BaseEntity;

import javax.persistence.criteria.*;
import java.time.LocalDate;

import static org.springframework.util.StringUtils.hasText;

public class DateRangeG7B implements Specification<BaseEntity> {
    private final LocalDate minFirstDay;
    private final LocalDate maxFirstDay;

    public DateRangeG7B(DataTablesInput input) {
        Search columnSearch = input.getColumn("g7B").getSearch();
        String dateFilter = columnSearch.getValue();
        columnSearch.setValue("");
        if (!hasText(dateFilter)) {
            minFirstDay = maxFirstDay = null;
            return;
        }
        String[] bounds = dateFilter.split(";");
        minFirstDay = getValue(bounds, 0);
        maxFirstDay = getValue(bounds, 1);
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
    public Predicate toPredicate(Root<BaseEntity> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
        Expression<LocalDate> firstDay = root.get("g7B").as(LocalDate.class);
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
