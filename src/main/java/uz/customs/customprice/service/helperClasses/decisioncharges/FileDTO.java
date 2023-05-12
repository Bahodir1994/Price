package uz.customs.customprice.service.helperClasses.decisioncharges;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.PackagePrivate;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@PackagePrivate
public class FileDTO {
    String hash;
    String fileId;
    String earxivId;
}
