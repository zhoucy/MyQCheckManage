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

	
	//��ʱ��
	@RequestMapping("getCapaCityDetailByHour.do")
	@ResponseBody
	public Map<String, Object> getCapaCityDetailByHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono){
		return capacityService.getCapaCityDetailByHour(proDate, groupname, belongname, pono,
				showdate, showgroup, showbelong, showpono);
	}
	//������ʱ��
	@RequestMapping("getCapaCityDetailByWorkHour.do")
	@ResponseBody
	public Map<String, Object> getCapaCityDetailByWorkHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono){
		//return capacityService.getAnalogDefectRateByHour(proDate, groupname);
		return capacityService.getCapaCityDetailByWorkHour(proDate, groupname, belongname, pono, 
				showdate, showgroup, showbelong, showpono);
	}

	
	
	
	//������Ϣ
    @RequestMapping("getDefective.do")
	@ResponseBody
	public Map<String, Object> getDefective(String date,String hour,String pono,String groupname,String belongname){
    	Map<String, Object> result=capacityService.getDefective(date, hour, pono, groupname, belongname);
		return result;
	}
    //������Ϣ
    @RequestMapping("getDeptByDeptName.do")
    @ResponseBody
    public Map<String, Object> getDept(String deptname){
    	return capacityService.getDept(deptname);
    }
    //������Ϣ
    @RequestMapping("getPonoInfoByPono.do")
    @ResponseBody
    public Map<String, Object> getPonoInfoByPono(String deptname,String date,String pono){
    	return capacityService.getPonoInfo(deptname, date, pono);
    }
		
	
	//��Ʒ��highcharts
	@RequestMapping("getHighCharts.do")
	@ResponseBody
	public Map<String, Object> getHighCharts(String date, String timetype,
			String producttype,Integer group,Integer belong) throws ParseException{
		return capacityService.getHighCharts(date, timetype, producttype,group,belong);
	}
	//��Ʒ����highcharts
	@RequestMapping("getProductTypeHighCharts.do")
	@ResponseBody
	public Map<String, Object> getProductTypeHighCharts(String date, String timetype,
			String producttype,Integer group,Integer belong) throws ParseException{
		return capacityService.getProductTypeHighCharts(date, timetype, producttype, group,belong);
	}
	
	
	//��ҳ��ȡ��������������Ķ�����Ϣ
	@RequestMapping("getTodeyOrderOfIndex.do")
	@ResponseBody
	public List<Map<String, Object>> getTodeyOrderOfIndex(){
		return capacityService.getTodayOrderOfIndex();
	}
	//��ҳ��ȡ����ÿ��Сʱ�ܲ��ܵ���Ϣ
	@RequestMapping("getTodayCapacityOfIndex.do")
	@ResponseBody
	public Map<String, Object> getTodayCapacityOfIndex(){
		return capacityService.getTodayCapacityOfIndex(null);
	}
	//��ҳ��ȡ�����Ʒ���ͱ�ͼ��Ϣ
	@RequestMapping("getTodayTypeOfIndex.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayTypeOfIndex(){
		return capacityService.getTodayTypeOfIndex();
	}
	
	
	//��ȡ��������Ϣ,ѡ�񶩵�ʱ,ͬʱ����Ʒmodel�Ͳ�Ʒ���͸�ֵ
	@RequestMapping("getPonoAndUnion.do")
	@ResponseBody
	public List<Map<String, Object>> getPonoAndUnion() {
		return capacityService.getPonoAndUnion();
	}
}
