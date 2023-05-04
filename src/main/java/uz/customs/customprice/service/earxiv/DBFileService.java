package uz.customs.customprice.service.earxiv;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import uz.customs.customprice.entity.earxiv.DBFile;
import uz.customs.customprice.repository.earxiv.DBFileRepo;

@Service
@RequiredArgsConstructor
public class DBFileService {

    private final DBFileRepo dbFileRepo;

    public DBFile getByHash(String hash) {
        if (dbFileRepo.findByHash(hash) != null) {
            return dbFileRepo.findByHash(hash);
        } else return null;
    }
}
