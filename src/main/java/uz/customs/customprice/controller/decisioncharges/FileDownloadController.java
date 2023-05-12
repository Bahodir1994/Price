package uz.customs.customprice.controller.decisioncharges;

import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import uz.customs.customprice.entity.earxiv.DBFile;
import uz.customs.customprice.entity.earxiv.Earxiv;
import uz.customs.customprice.service.earxiv.DBFileService;
import uz.customs.customprice.service.earxiv.EarxivService;
import uz.customs.customprice.service.helperClasses.decisioncharges.FileDTO;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

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

    @PostMapping(value = "/data/decision_charges/v6")
    @Transactional
    public ResponseEntity<Object> openDocs(@RequestBody FileDTO fileDTO, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        try {
            DBFile dbFile = dbFileService.getByHash(fileDTO.getHash());
            Earxiv earxiv =  earxivService.getByHashAndFileId(fileDTO.getHash(), fileDTO.getFileId(), fileDTO.getEarxivId());
            String fileName = earxiv.getDocname();
            map.put("fileData", dbFile.getFiledata());
            map.put("fileName", fileName);
            String fileType = FilenameUtils.getExtension(fileName);
            map.put("fileType", fileType);

            return new ResponseEntity<>(map, HttpStatus.OK);
        }catch (Exception ee){
            map.put("message", ee.getMessage());
            return new ResponseEntity<>(map, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
