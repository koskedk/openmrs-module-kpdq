<%
    ui.decorateWith("kpsystem", "standardPage", [layout: "sidebar"])

    def menuItems = [
            [label: "Merge patient records", iconProvider: "kpdq", icon: "buttons/patient_merge.png", href: ui.pageLink("kpdq", "datamgr/findDuplicatePatients")],
            [label: "Data Analysis file", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadAnalysisFile")],
            [label: "Data Dictionary", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadDataDictionary")],
            [label: "DW Patient Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientExtract")],
            [label: "DW Patient Status Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientStatusExtract")],
            [label: "DW Patient Visit Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientVisitExtract")],
            [label: "DW Patient Pharmacy Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientPharmacyExtract")],
            [label: "DW Patient Laboratory Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientLaboratoryExtract")],
            [label: "DW Patient WAB/WHO/CD4 Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadPatientWABWHOCD4Extract")],
            [label: "DW ART Patient Extract", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadARTPatientExtract")],
            [label: "DW All (Except Visit)", iconProvider: "kpdq", icon: "buttons/download_analysis_file.png", href: ui.pageLink("kpdq", "datamgr/downloadAll")]
    ]
%>

<div class="ke-page-sidebar">
    ${ui.includeFragment("kpui", "widget/panelMenu", [heading: "Tasks", items: menuItems])}
</div>

<div class="ke-page-content">
    ${ui.includeFragment("kpsystem", "system/databaseSummary")}
</div>