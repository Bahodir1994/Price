package uz.customs.customprice.service.decisioncharges.jpaServices;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.decisioncharges.TransportType;
import uz.customs.customprice.repository.decisioncharges.jpaRepository.TransportTypeRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TransportTypeService {

    @PersistenceContext
    private EntityManager entityManager;

    private final TransportTypeRepository transportTypeRepository;

    public List<TransportType> getByAppId(String app_id) {
        String queryForList = "select\n" +
                "    t.id,\n" +
                "    t.instime,\n" +
                "    t.insuser,\n" +
                "    t.isdeleted,\n" +
                "    t.updtime,\n" +
                "    t.upduser,\n" +
                "    t.app_id,\n" +
                "    c2.cd_nm end_country,\n" +
                "    c1.cd_nm finish_country,\n" +
                "    tt.name  tarnsport_type,\n" +
                "    t.transport_price, \n" +
                "    t.end_country_nm, \n" +
                "    t.finish_country_nm, \n" +
                "    t.tarnsport_type_nm \n" +
                "from\n" +
                "    transporttype t\n" +
                "left join\n" +
                "    cpid.country c1\n" +
                "on\n" +
                "    c1.code=t.finish_country\n" +
                "and c1.lnga_tpcd='UZ'\n" +
                "left join\n" +
                "    cpid.country c2\n" +
                "on\n" +
                "    c2.code=t.end_country\n" +
                "and c2.lnga_tpcd='UZ'\n" +
                "left join\n" +
                "    cpid.transport tt\n" +
                "on\n" +
                "    tt.id=t.tarnsport_type\n" +
                "where\n" +
                "    t.isdeleted=0\n" +
                "and t.app_id='" + app_id + "'";
        return (List<TransportType>) entityManager.createNativeQuery(queryForList, TransportType.class).getResultList();
    }
}
