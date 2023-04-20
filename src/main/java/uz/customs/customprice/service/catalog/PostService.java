package uz.customs.customprice.service.catalog;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.catalog.Location;
import uz.customs.customprice.entity.catalog.Post;
import uz.customs.customprice.repository.catalog.LocationRepository;
import uz.customs.customprice.repository.catalog.PostRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService {
    private final PostRepository postRepository;

    public List<Post> getByLngaTpcd(String lngaTpcd) {
        return postRepository.findByLngaTpcd(lngaTpcd);
    }

}
