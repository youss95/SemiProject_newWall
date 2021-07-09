package com.kh.config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PageConfig {
	public static int ADOPT_RECORD_COUNT_PER_PAGE = 12;
	public static int ANIMAL_RECORD_COUNT_PER_PAGE = 10;
	public static int LOST_RECORD_COUNT_PER_PAGE = 8;
	public static int LOST_NAVI_COUNT_PER_PAGE = 5;
	public static int ADOPT_NAVI_COUNT_PER_PAGE = 10;
}
