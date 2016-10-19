package com.gangdian.qc.controller;


import java.text.ParseException;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gangdian.qc.service.CapacityService;



@Controller
@RequestMapping("/qc")
public class CapacityController {

	@Autowired
	private CapacityService capacityService;

	
	//按时间
	@RequestMapping("getCapaCityDetailByHour.do")
	@ResponseBody
	public Map<String, Object> getCapaCityDetailByHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono){
		return capacityService.getCapaCityDetailByHour(proDate, groupname, belongname, pono,
				showdate, showgroup, showbelong, showpono);
	}
	//按工作时间
	@RequestMapping("getCapaCityDetailByWorkHour.do")
	@ResponseBody
	public Map<String, Object> getCapaCityDetailByWorkHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono){
		//return capacityService.getAnalogDefectRateByHour(proDate, groupname);
		return capacityService.getCapaCityDetailByWorkHour(proDate, groupname, belongname, pono, 
				showdate, showgroup, showbelong, showpono);
	}

	
	
	
	//坏机信息
    @RequestMapping("getDefective.do")
	@ResponseBody
	public Map<String, Object> getDefective(String date,String hour,String pono,String groupname,String belongname){
    	Map<String, Object> result=capacityService.getDefective(date, hour, pono, groupname, belongname);
		return result;
	}
    //部门信息
    @RequestMapping("getDeptByDeptName.do")
    @ResponseBody
    public Map<String, Object> getDept(String deptname){
    	return capacityService.getDept(deptname);
    }
    //订单信息
    @RequestMapping("getPonoInfoByPono.do")
    @ResponseBody
    public Map<String, Object> getPonoInfoByPono(String deptname,String date,String pono){
    	return capacityService.getPonoInfo(deptname, date, pono);
    }
		
	
	//坏品率highcharts
	@RequestMapping("getHighCharts.do")
	@ResponseBody
	public Map<String, Object> getHighCharts(String date, String timetype,
			String producttype,Integer group,Integer belong) throws ParseException{
		return capacityService.getHighCharts(date, timetype, producttype,group,belong);
	}
	//产品类型highcharts
	@RequestMapping("getProductTypeHighCharts.do")
	@ResponseBody
	public Map<String, Object> getProductTypeHighCharts(String date, String timetype,
			String producttype,Integer group,Integer belong) throws ParseException{
		return capacityService.getProductTypeHighCharts(date, timetype, producttype, group,belong);
	}
	
	
	//首页获取当天的正在生产的订单信息
	@RequestMapping("getTodeyOrderOfIndex.do")
	@ResponseBody
	public List<Map<String, Object>> getTodeyOrderOfIndex(){
		return capacityService.getTodayOrderOfIndex();
	}
	//首页获取当天每个小时总产能的信息
	@RequestMapping("getTodayCapacityOfIndex.do")
	@ResponseBody
	public Map<String, Object> getTodayCapacityOfIndex(){
		return capacityService.getTodayCapacityOfIndex(null);
	}
	//首页获取当天产品类型饼图信息
	@RequestMapping("getTodayTypeOfIndex.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayTypeOfIndex(){
		return capacityService.getTodayTypeOfIndex();
	}
	
	
	//获取订单的信息,选择订单时,同时给产品model和产品类型赋值
	@RequestMapping("getPonoAndUnion.do")
	@ResponseBody
	public List<Map<String, Object>> getPonoAndUnion() {
		return capacityService.getPonoAndUnion();
	}
}
