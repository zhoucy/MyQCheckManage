package com.springmvc.sys;

import java.io.UnsupportedEncodingException;
import java.sql.Time;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ZUtil {
	
	private static final transient Logger log = LoggerFactory.getLogger(ZUtil.class);

	/*public static String  stringUtil(String string){
		if(string.equals("")&&string==null){
			
			return "";
		}
		else  return string;
		
	}
	*/
	
	public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }
	
	public  static  String  replaceP(String str){
	    String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("-");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
		
	}
	
	public static String encodeStr(String str) {
		 try {
		 return new String(str.getBytes("ISO-8859-1"), "UTF-8");
		 } catch (UnsupportedEncodingException e) {
		 e.printStackTrace();
		 return null;
		 }
	}
	 /**
	  * 获取现在时间
	  * 
	  * @return返回短时间格式 yyyy-MM-dd
	  */

	 public static Date getNowDateShort() {
		  Date currentTime = new Date();
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		  String dateString = formatter.format(currentTime);
		  ParsePosition pos = new ParsePosition(8);
		  Date currentTime_2 = formatter.parse(dateString, pos);
		  return currentTime_2;
		 }
	 /**
	  * 获取现在时间
	  * 
	  * @return返回字符串格式 yyyy-MM-dd HH:mm:ss
	  */
	 public static String getStringDate() {
	  Date currentTime = new Date();
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String dateString = formatter.format(currentTime);
	  return dateString;
	 }
	 /**
	  * 将长时间格式字符串转换为时间 yyyy-MM-dd HH:mm:ss
	  * 
	  * @param strDate
	  * @return
	  */
	 public static Date strToDateLong(String strDate) {
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  ParsePosition pos = new ParsePosition(0);
	  Date strtodate = formatter.parse(strDate, pos);
	  return strtodate;
	 }
	 /**
	  * 将长时间格式时间转换为字符串 yyyy-MM-dd HH:mm:ss
	  * 
	  * @param dateDate
	  * @return
	  */
	 public static String dateToStrLong(java.util.Date dateDate) {
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String dateString = formatter.format(dateDate);
	  return dateString;
	 }
	 /**
	  * 将短时间格式时间转换为字符串 yyyy-MM-dd
	  * 
	  * @param dateDate
	  * @param k
	  * @return
	  */
	 public static String dateToStr(java.util.Date dateDate) {
	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	  String dateString = formatter.format(dateDate);
	  return dateString;
	 }
	 public static void main(String[] args) throws ParseException {
			String str=String.format("%s:%s",0.00,12);
			System.out.println(str);
			System.out.println(1.09%1);
			  String sbtime="20:10";
		        String setime="20:30";
		        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		        Time btime=new Time(sdf.parse(sbtime).getTime());
		        Time etime=new Time(sdf.parse(setime).getTime());
		        long diff = sdf.parse(sbtime).getTime() - sdf.parse(setime).getTime();
			Time time=new Time(10, 12, 0);
			System.out.println(diff/(1000*60));
			
			int i=0;
			i=(i++) + (i++) ;
			System.out.println(i);
			
			String  str1="hs1210";
			if(ZUtil.replaceP("hs-121000001").contains(str1)){
				System.out.println("有订单");
			};
			System.out.println(ZUtil.replaceP("H2016-03-02")+6000);
			System.out.println((int)(4.44*18));
			
			System.out.println(Integer.parseInt(new java.text.DecimalFormat("0").format(4.4*18)));
			
			log.info("121");
	 }
	
	 

}
class Outer {
	
	 
	 public static void main(String[] args) {
		 
		   String src = "王大锤+wefw";
	         char[] t1 = null;
	         t1 = src.toCharArray();
	         int t0 = t1.length;
	         int count = 0;
	         for (int i = 0; i < t0; i++) {
	        if (Character.toString(t1[i]).matches("[\\u4E00-\\u9FA5]+")) {
	            count ++;
	        	}
	        	System.out.println(count);
	         }
	 }
	 
}

