<%
	ui.decorateWith("kpsystem", "standardPage")
%>

<div class="ke-page-content">
	${ ui.includeFragment("kpdq", "patient/mergePatients", [ patient1: patient1, patient2: patient2, returnUrl: returnUrl ]) }
</div>