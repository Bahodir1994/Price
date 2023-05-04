package uz.customs.customprice.controller.decisioncharges;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import uz.customs.customprice.entity.earxiv.DBFile;
import uz.customs.customprice.entity.earxiv.Earxiv;
import uz.customs.customprice.service.earxiv.DBFileService;
import uz.customs.customprice.service.earxiv.EarxivService;

@RestController
@RequestMapping("/routeV3/V3")
@RequiredArgsConstructor
public class FileDownloadController {

    private final DBFileService dbFileService;
    private final EarxivService earxivService;

    @GetMapping("/download/{hash}/{fileId}/{id}")
    public ResponseEntity<byte[]> getFile(@PathVariable String hash, @PathVariable String fileId, @PathVariable String id ) {
        DBFile dbFile = dbFileService.getByHash(hash);
        Earxiv earxiv = earxivService.getByHashAndFileId(hash, fileId, id);
        String fileName = earxiv.getDocname();
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                .body(dbFile.getFiledata());
    }

}
