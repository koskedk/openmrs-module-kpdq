<%
	ui.decorateWith("kpui", "panel", [ heading: config.heading ])

	def onReportClick = { report ->
		def opts = [ appId: currentApp.id, reportUuid: report.definitionUuid, returnUrl: ui.thisUrl() ]
		"""location.href = '${ ui.pageLink('kpsystem', 'report', opts) }';"""
	}
%>

${ ui.includeFragment("kpsystem", "widget/reportStack", [ reports: config.reports, onReportClick: onReportClick ]) }