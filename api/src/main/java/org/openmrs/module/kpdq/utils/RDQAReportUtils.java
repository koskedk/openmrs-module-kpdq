package org.openmrs.module.kpdq.utils;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Add description of the class
 */
public class RDQAReportUtils {

	public static final String DATE_FORMAT = "dd/MM/yyyy";

	public static String formatdates(Date date, String format){
		if (date == null)
			return "Missing";

		Format formatter;
		formatter = new SimpleDateFormat(format);
		String s = formatter.format(date);

		return s;

	}
}
