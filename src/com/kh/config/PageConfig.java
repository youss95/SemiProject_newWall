package com.kh.config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PageConfig {
	public static int ADOPT_RECORD_COUNT_PER_PAGE = 12;
	public static int ADOPTION_RECORD_COUNT_PER_PAGE = 20;
	public static int ANIMAL_RECORD_COUNT_PER_PAGE = 10;
	public static int REVIEW_RECORD_COUNT_PER_PAGE = 8;
	public static int ADMIN_PROTECT_RECORD_COUNT_PER_PAGE = 10;
	public static int PROTECT_COUNT_PER_PAGE = 4;
	public static int LOST_COUNT_PER_PAGE = 6;
	public static int ADOPT_NAVI_COUNT_PER_PAGE = 10;
}
