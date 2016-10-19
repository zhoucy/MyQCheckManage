package com.gangdian.qc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.model.QCProgressManHour;
import com.gangdian.qc.service.QCProgressManHourService;
import com.gangdian.qc.service.QCProgressService;

@Controller
@RequestMapping(value="product")
public class QCProgressManHourController {

	@Autowired
	private QCProgressManHourService proManHourService;
	
	@Autowired
	private QCProgressService progressServive;
	

	@RequestMapping("addProHour.do")
	@ResponseBody
	public boolean addProHour(QCProgressManHour ProHour){
		return proManHourService.insertSelective(ProHour);
	}
	
	@RequestMapping("deleteProHour.do")
	@ResponseBody
	public boolean deleteProHour(Integer id){
		return proManHourService.deleteByPrimaryKey(id);
	}
	
	@RequestMapping("updateProHour.do")
	@ResponseBody
	public boolean updateProHour(QCProgressManHour ProHour){
		return proManHourService.updateByPrimaryKeySelective(ProHour);
	}
	
	@RequestMapping("searchProHour.do")
	@ResponseBody
	public Map<String, Object> searchProHour(QCProgressManHour ProHour,
			Integer rows,Integer page, String sort, String order){
		if(sort!=null&&sort.equals("model")){
			sort="p.model";
		}
		if(sort!=null&&sort.equals("manMinute")){
			sort="man_minute";
		}
		if(sort!=null&&sort.equals("manHour")){
			sort="man_hour";
		}
		 Map<String, Object> result=new HashMap<String, Object>();
			result.put("total", proManHourService.getProHourPageSize(ProHour));
			result.put("rows", proManHourService.getProHourPageList(ProHour, rows, page, sort, order));
			return result;
	}
	
	@RequestMapping("getAllProgress.do")
	@ResponseBody
	public List<QCProgress> getAllProgress(){
		return progressServive.getAllProgress();
	}
	

}
