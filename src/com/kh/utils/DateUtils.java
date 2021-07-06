package com.kh.utils;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class DateUtils {

	/**
	 * @author STJ
	 * @param strDate : SQL Date 타입으로 변경하고픈 문자열 날짜 (ex:20210701)
	 * @param form : 분석하고 싶은 날짜 데이터의 형식 (ex:yyyyMMdd)
	 * @return 변환된 SQL Date 
	 */
	public static Date stringToDate(String strDate, String form) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat(form);
		return new java.sql.Date(sdf.parse(strDate).getTime());
	}
}
