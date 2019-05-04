package org.openmrs.module.kpdq.converter;

import org.openmrs.PatientProgram;
import org.openmrs.calculation.result.SimpleResult;
import org.openmrs.module.kpdq.utils.RDQAReportUtils;
import org.openmrs.module.reporting.data.converter.DataConverter;

import java.util.Date;
import java.util.List;

/**
 * Returns a list of programs a patient is enrolled and the dates of enrollment
 * Where there is more than one program and HIV is part, date enrolled in hiv takes precedence
 */
public class PatientProgramEnrollmentDateConverter implements DataConverter {

	public static final String HIV = "dfdc6d40-2f2f-463d-ba90-cc97350441a8";

	@Override
	public Object convert(Object original) {

		SimpleResult baseResult = (SimpleResult) original;
		if (baseResult == null)
			return null;

		List<PatientProgram> result = (List<PatientProgram>)baseResult.getValue();

		if (result.size() == 1)
			return RDQAReportUtils.formatdates(result.get(0).getDateEnrolled(), RDQAReportUtils.DATE_FORMAT);

		return RDQAReportUtils.formatdates(hasHivProgram(result), RDQAReportUtils.DATE_FORMAT);
	}

	@Override
	public Class<?> getInputDataType() {
		return List.class;
	}

	@Override
	public Class<?> getDataType() {
		return String.class;
	}

	private Date hasHivProgram(List<PatientProgram> enrolledPrograms){

		Date enrollmentDate = null;
		for (PatientProgram p : enrolledPrograms){
			if (p.getProgram().getUuid().equals(HIV)) {
				enrollmentDate = p.getDateEnrolled();
				break;
			}
		if (enrollmentDate.equals(null))
			enrollmentDate = enrolledPrograms.get(0).getDateEnrolled();
		}
		return enrollmentDate;
	}
}
