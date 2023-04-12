package uz.customs.customprice.component.repository.earxiv;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import uz.customs.customprice.entity.earxiv.DBFile;

@Repository
public interface DBFileRepo extends JpaRepository<DBFile, String> {
    DBFile findByHash(String hash);
}