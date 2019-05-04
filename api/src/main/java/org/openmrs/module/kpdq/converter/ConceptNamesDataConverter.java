package org.openmrs.module.kpdq.converter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Concept;
import org.openmrs.Obs;
import org.openmrs.module.reporting.data.converter.DataConverter;

/**
 * Returns concept names
 */
public class ConceptNamesDataConverter implements DataConverter {

	private Log log = LogFactory.getLog(getClass());

	public ConceptNamesDataConverter() {}

	/**
	 * @should return a blank string if valueNumeric is null
	 */
	@Override
	public Object convert(Object original) {

		Obs o = (Obs) original;

		if (o == null)
			return "";

		Concept answer = o.getValueCoded();

		if (answer == null)
			return "";

		return answer.getName().getName();
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
