<%
	ui.decorateWith("kpsystem", "standardPage", [ layout: "sidebar" ])

	ui.includeJavascript("kpdq", "controllers/merge.js")

	def menuItems = [
			[ label: "Select patients manually", iconProvider: "kpdq", icon: "buttons/patient_merge.png", href: ui.pageLink("kpdq", "datamgr/mergePatients", [ returnUrl: ui.thisUrl() ]) ],
			[ label: "Back to home", iconProvider: "kpui", icon: "buttons/back.png", label: "Back to home", href: ui.pageLink("kpdq", "datamgr/dataManagerHome") ]
	]
%>

<script type="text/javascript">
	jQuery(function() {
		jQuery('#merge_selected').click(function() {
			var patientIds = [];
			jQuery('input.selected_patient:checked').each(function() {
				patientIds.push(jQuery(this).val());
			});

			if (patientIds.length == 2) {
				ui.navigate('kpdq', 'datamgr/mergePatients', { patient1: patientIds[0], patient2: patientIds[1], returnUrl: location.href });
			}
			else {
				kenyaui.notifyError('Please select exactly 2 patients to merge');
			}
		});
	});
</script>

<div class="ke-page-sidebar">
	${ ui.includeFragment("kpui", "widget/panelMenu", [ heading: "Tasks", items: menuItems ]) }
</div>

<div class="ke-page-content">
	<div class="ke-panel-frame" ng-controller="DuplicatePatients" ng-init="init()">
		<div class="ke-panel-heading">Possible Duplicate Patients</div>
		<div class="ke-panel-controls">
			<table style="width: 100%">
				<tr>
					<td style="text-align: left">Match by:
						<input ng-model="byIdentifier" ng-change="refresh()" ng-disabled="loading" type="checkbox" /> Identifier
						<input ng-model="byFamilyName" ng-change="refresh()" ng-disabled="loading" type="checkbox" /> Family name
						<input ng-model="byGivenName" ng-change="refresh()" ng-disabled="loading" type="checkbox" /> Given name
						<input ng-model="byGender" ng-change="refresh()" ng-disabled="loading" type="checkbox" /> Gender
						<input ng-model="byBirthdate" ng-change="refresh()" ng-disabled="loading" type="checkbox" /> Birthdate
					</td>
					<td style="text-align: right">
						<button type="button" id="merge_selected"><img src="${ ui.resourceLink("kpui", "images/glyphs/ok.png") }" /> Merge selected</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="ke-panel-content">
			<div ng-repeat="patient in results" class="ke-stack-item">
				<input type="checkbox" name="patientId" value="{{ patient.id }}" class="selected_patient" />
				${ ui.includeFragment("kpsystem", "patient/result.mini") }
			</div>
			<div ng-if="loading" style="text-align: center; padding-top: 5px">
				<img src="${ ui.resourceLink("kpui", "images/loading.gif") }" />
			</div>
		</div>
	</div>
</div>