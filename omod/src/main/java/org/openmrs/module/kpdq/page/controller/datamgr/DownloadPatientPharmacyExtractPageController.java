package org.openmrs.module.kpdq.page.controller.datamgr;

import org.openmrs.module.kpdq.api.KenyaDqService;
import org.openmrs.ui.framework.annotation.SpringBean;
import org.openmrs.ui.framework.page.FileDownload;

/**
 * Created by gitahi on 12/05/15.
 */
public class DownloadPatientPharmacyExtractPageController {

    public FileDownload controller(@SpringBean("kenyaDqService") KenyaDqService kenyaDqService) {
        String fileName = "PatientPharmacyExtract" + "-" + kenyaDqService.location() + "-" + kenyaDqService.timeStamp() + ".csv";
        FileDownload download = new FileDownload(fileName, "text/csv", kenyaDqService.downloadPatientPharmacyExtract());
        return download;
    }
}
