package org.openmrs.module.kpdq.converter;

import org.openmrs.Obs;
import org.openmrs.module.kpdq.utils.RDQAReportUtils;
import org.openmrs.module.reporting.data.converter.DataConverter;

/**
 * Converter to get valueDatetime from an observation
 */
public class ObsValueDatetimeConverter implements DataConverter {
	@Override
	public Object convert(Object original) {
		Obs o = (Obs) original;

		if (o == null)
			return null;

		return RDQAReportUtils.formatdates(o.getValueDatetime(), RDQAReportUtils.DATE_FORMAT);
	}

	@Override
	public Class<?> getInputDataType() {
		return Obs.class;
	}

	@Override
	public Class<?> getDataType() {
		return String.class;
	}
}
