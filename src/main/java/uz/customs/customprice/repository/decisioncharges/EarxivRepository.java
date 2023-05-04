package uz.customs.customprice.repository.decisioncharges;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import uz.customs.customprice.entity.earxiv.Earxiv;

import java.util.List;

@Repository
public interface EarxivRepository extends JpaRepository<Earxiv, String> {

    List<Earxiv> findByAppId(String appId);

    List<Earxiv> findAllByAppId(String appId);

    Earxiv findByHashAndFileId(String hash, String fileId);

    Page<Earxiv> findByAppId(String appId, Pageable pageable);

    @Transactional
    void deleteAllByAppId(String appId);

    Earxiv findByHashAndFileIdAndId(String hash, String fileId, String id);
}
