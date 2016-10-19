package com.gangdian.qc.service;


import java.text.ParseException;
import java.util.List;
import java.util.Map;




public interface CapacityService {
	
	//双击表格显示坏机信息
	public Map<String, Object> getDefective(String date,String hour,String pono,String groupname,String belongname);
	//双击表格显示部门信息
	public Map<String, Object> getDept(String deptname);
	//双击表格显示订单信息
	public Map<String, Object> getPonoInfo(String deptname,String date,String pono);
	
	
	
	//坏品率统计图highcharts
	public Map<String, Object> getHighCharts(String date,String timetype
			,String producttype,Integer groupid,Integer belong) throws ParseException;
	
	//产品类型统计图highcharts
	public Map<String, Object> getProductTypeHighCharts(String date,String timetype
			,String producttype,Integer groupid,Integer belong) throws ParseException;
	
	
	
	//产能统计(按时间)的替代方法
	public Map<String, Object> getCapaCityDetailByHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono);
	//产能统计(按工作小时)的替代方法
	public Map<String, Object> getCapaCityDetailByWorkHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono);
	
	
	
	//首页获取当天的正在生产的订单信息
	public List<Map<String, Object>> getTodayOrderOfIndex();
	//首页获取当天每个小时总产能的信息
	public Map<String, Object> getTodayCapacityOfIndex(String compareDay);
	//首页获取当天产品类型饼图信息
	public List<Map<String, Object>> getTodayTypeOfIndex();
	
	//获取订单的信息,选择订单时,同时给产品model和产品类型赋值
	public List<Map<String, Object>> getPonoAndUnion();
}
