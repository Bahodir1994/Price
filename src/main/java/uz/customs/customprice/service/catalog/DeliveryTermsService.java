package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.DeliveryTerms;
import uz.customs.customprice.entity.catalog.Post;
import uz.customs.customprice.repository.catalog.DeliveryTermsRepository;
import uz.customs.customprice.repository.catalog.PostRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DeliveryTermsService {
    private final DeliveryTermsRepository deliveryTermsRepository;

    public List<DeliveryTerms> getByLngaTpcd(String lngaTpcd) {
        return deliveryTermsRepository.findByLngaTpcd(lngaTpcd);
    }

}
