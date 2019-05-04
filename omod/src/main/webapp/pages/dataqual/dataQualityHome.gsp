<%
    ui.decorateWith("kpsystem", "standardPage")
%>

<div class="ke-page-content">
	${ ui.includeFragment("kpdq", "reports", [ heading: "Common Reports", reports: commonReports ]) }

	<% programReports.each { programName, programReports -> %>
		${ ui.includeFragment("kpdq", "reports", [ heading: programName, reports: programReports ]) }
	<% } %>
</div>