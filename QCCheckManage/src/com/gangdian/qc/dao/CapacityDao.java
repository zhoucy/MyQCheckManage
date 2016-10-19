package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



public interface CapacityDao {

	
	
	//获取坏机信息
	List<Map<String, Object>> getDefective(@Param("date") String date,@Param("hour") String hour,
		@Param("pono") String pono,@Param("groupname") String groupname,@Param("belongname") String belongname);
	//获取部门详细信息
	List<Map<String, Object>> getDept(@Param("deptname") String deptname);
	//获取订单信息
	List<Map<String, Object>> getPonoInfo(@Param("deptname") String deptname,@Param("date") String date,
			@Param("pono") String pono);
	

	
	//根据部门的id获取部门的信息(统计图调用的方法)
	List<Map<String, Object>> getDeptById(@Param("deptNO") Integer deptNO);
	//highcharts坏品率柱形图
	List<Map<String, Object>> getBadrateHighCharts(@Param("startday") String startday
			,@Param("endday") String endday,@Param("producttype") String producttype,
			@Param("groupid") Integer groupid,@Param("belong") Integer belong,@Param("timetype") String timetype);
	//highcharts产品类型柱形图
	List<Map<String, Object>> getProductTypeHighCharts(@Param("startday") String startday
			,@Param("endday") String endday,@Param("producttype") String producttype,
			@Param("groupid") Integer groupid,@Param("belong") Integer belong,@Param("timetype") String timetype);
	
	
	
	//产能统计(按时间)的替代方法
	//参数1:1.日期 2.组别 3.归属 4.订单
	//参数2:1.是否显示组别 2.是否显示归属 3.是否显示订单 4是否显示日期(暂时不用,只是占位)
	List<Map<String, Object>> getCapaCityDetailByHour(@Param("proDate") String proDate,@Param("groupname") String groupname,
			@Param("belongname") String belongname,@Param("pono") String pono,
			@Param("showdate") String showdate,@Param("showgroup") String showgroup,
			@Param("showbelong") String showbelong,@Param("showpono") String showpono);
	
	//产能统计(按工作小时)的替代方法
	//参数1:1.日期 2.组别 3.归属 4.订单
	//参数2:1.是否显示组别 2.是否显示归属 3.是否显示订单 4是否显示日期(暂时不用,只是占位)
	List<Map<String, Object>> getCapaCityDetailByWorkHour(@Param("proDate") String proDate,@Param("groupname") String groupname,
			@Param("belongname") String belongname,@Param("pono") String pono,
			@Param("showdate") String showdate,@Param("showgroup") String showgroup,
			@Param("showbelong") String showbelong,@Param("showpono") String showpono);
	
	
	//首页获取当天的正在生产的订单信息
	List<Map<String, Object>> getTodayOrderOfIndex();
	//首页获取当天每个小时总产能线图的信息
	List<Map<String, Object>> getTodayCapacityOfIndex(@Param("startday") String startday,@Param("endday") String endday);
	//首页获取当天产品类型饼图信息
	List<Map<String, Object>> getTodayTypeOfIndex();
	
	//获取订单的信息,选择订单时,同时给产品model和产品类型赋值
	List<Map<String, Object>> getPonoAndUnion();
}
