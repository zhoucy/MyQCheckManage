package com.springmvc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


import org.junit.Test;

public class MyDateUtil {
	
	
	@Test
	public void testDate() throws ParseException {
		Date date=ZeroFormat("2017-12-1");
		
		System.out.println("时间:"+ new SimpleDateFormat("yyyy-MM-dd").format(date));
		System.out.println("周一:" + DateFormat(getWeekStart(date)));
		System.out.println("周末:" + DateFormat(getWeekEnd(date)));
		System.out.println("月初:" + DateFormat(getMonthStart(date)));
		System.out.println("月末:" + DateFormat(getMonthEnd(date)));
		System.out.println("季初:" + DateFormat(getQuarterStart(date)));
		System.out.println("季末:" + DateFormat(getQuarterEnd(date)));
		System.out.println("年初:" + DateFormat(getYearStart(date)));
		System.out.println("年末:" + DateFormat(getYearEnd(date)));
		System.out.println("第"+getWeekNum(new Date())+"/"+getWeekSum()+"周");
		System.out.println("年月是"+getYearAndMonth(date));
		System.out.println("是第"+getSeason(date)+"季度");
		System.out.println(DateFormat(ZeroFormat("2016-7-7")));
		System.out.println(DateFormat(ZeroFormat("7/7/2016")));
	}

	// 格式化年-月-日类型
	public static String DateFormat(Date date) {
		return new SimpleDateFormat("yyyy-MM-dd").format(date);
	}
	//格式化年月日时分秒
	public static String TimeFormat(Date date){
		return new SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(date);
	}
	//把输入时间转换成0时分0秒
	//时间有多种格式比如2016/7/13 ,7/13/2016, 2016-7-13,暂时只考虑后两种
	public static Date ZeroFormat(String dateStr) throws ParseException{
		Date date=null;
		if(dateStr.indexOf("/")>=0){
			SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
			date=sdf.parse(dateStr);
		}else{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			date=sdf.parse(dateStr);
		}	
		return date;
	}
	//得到当天是第几周
	public static int getWeekNum(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.WEEK_OF_YEAR);
	}
	//得到当年多少个周
	public static int getWeekSum(){
		return Calendar.getInstance().getWeeksInWeekYear();
	}
	//得到今天是那年那月
	public static String getYearAndMonth(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		String result=year+"-"+( month<10 ? "0" + month : month);;
		return result;
	}
		
	// 得到周一
	public static Date getWeekStart(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return cal.getTime();
	}
	// 得到周末
	public static Date getWeekEnd(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		return cal.getTime();
	}

	// 得到月初
	public static Date getMonthStart(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		return cal.getTime();
	}

	// 得到月末
	public static Date getMonthEnd(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.DAY_OF_MONTH, 0);
		return cal.getTime();
	}

	// 得到季初
	public static Date getQuarterStart(Date date) {
		return getFirstDateOfMonth(getSeasonDate(date)[0]); 
	}

	// 得到季末
	public static Date getQuarterEnd(Date date) {
		return getLastDateOfMonth(getSeasonDate(date)[2]);
	}

	// 得到年初
	public static Date getYearStart(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_YEAR, 1);
		return cal.getTime();
	}

	// 得到年末
	public static Date getYearEnd(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.YEAR, 1);
		cal.set(Calendar.DAY_OF_YEAR, 0);
		return cal.getTime();
	}	

	
	
	
	

	//取得季度月
	public static Date[] getSeasonDate(Date date) {  
        Date[] season = new Date[3];  
  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
  
        int nSeason = getSeason(date);  
        if (nSeason == 1) {// 第一季度  
            c.set(Calendar.MONTH, Calendar.JANUARY);  
            season[0] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.FEBRUARY);  
            season[1] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.MARCH);  
            season[2] = c.getTime();  
        } else if (nSeason == 2) {// 第二季度  
            c.set(Calendar.MONTH, Calendar.APRIL);  
            season[0] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.MAY);  
            season[1] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.JUNE);  
            season[2] = c.getTime();  
        } else if (nSeason == 3) {// 第三季度  
            c.set(Calendar.MONTH, Calendar.JULY);  
            season[0] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.AUGUST);  
            season[1] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.SEPTEMBER);  
            season[2] = c.getTime();  
        } else if (nSeason == 4) {// 第四季度  
            c.set(Calendar.MONTH, Calendar.OCTOBER);  
            season[0] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.NOVEMBER);  
            season[1] = c.getTime();  
            c.set(Calendar.MONTH, Calendar.DECEMBER);  
            season[2] = c.getTime();  
        }  
        return season;  
    } 
	
	//第一季度,第二季度,第三季度,第四季度
    public static int getSeason(Date date) {  
    	  
        int season = 0;  
  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        int month = c.get(Calendar.MONTH);  
        switch (month) {  
        case Calendar.JANUARY:  
        case Calendar.FEBRUARY:  
        case Calendar.MARCH:  
            season = 1;  
            break;  
        case Calendar.APRIL:  
        case Calendar.MAY:  
        case Calendar.JUNE:  
            season = 2;  
            break;  
        case Calendar.JULY:  
        case Calendar.AUGUST:  
        case Calendar.SEPTEMBER:  
            season = 3;  
            break;  
        case Calendar.OCTOBER:  
        case Calendar.NOVEMBER:  
        case Calendar.DECEMBER:  
            season = 4;  
            break;  
        default:  
            break;  
        }  
        return season;  
    } 
    //取得月第一天
    public static Date getFirstDateOfMonth(Date date) {  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));  
        return c.getTime();  
    }
    //取得月最后一天
    public static Date getLastDateOfMonth(Date date) {  
        Calendar c = Calendar.getInstance();  
        c.setTime(date);  
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));  
        return c.getTime();  
    }  

}
