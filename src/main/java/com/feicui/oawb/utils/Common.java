package com.feicui.oawb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Common {
	
	public static final int hashIterations = 10;
	
	/**
	 * 获取系统当前时间
	 * @return
	 */
	public static String getCurrentTime(){
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(date);
		return time;
	}
	
	/**
	 * 获取系统当前日期
	 * @return
	 */
	public static String getCurrentDate(){
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String time = dateFormat.format(date);
		return time;
	}
}
