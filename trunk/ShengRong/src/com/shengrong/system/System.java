package com.shengrong.system;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class System {
	
	private static SystemSettings systemSettings = new SystemSettings(); 
	
	public static SystemSettings SystemSettings(){
		return System.systemSettings;
	}
	
	/**
	 * 对系统进行一些初始化的设置及相关参数的加载
	 * @return 初始化返回成功返回true；初始化错误返回false
	 */
	final static public boolean initSys(){
		
		return true;
	}
	
	public static Timestamp sysClock(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Timestamp ts = Timestamp.valueOf(df.format(new Date()));
		return ts;
	}
}
