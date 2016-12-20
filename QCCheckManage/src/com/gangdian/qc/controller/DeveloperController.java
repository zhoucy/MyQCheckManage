package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.service.DeveloperService;


@Controller
@RequestMapping("/qc")
public class DeveloperController {

	
	@Autowired
	private DeveloperService developerService;
	
	//分页查看(表,视图,存储过程)
	@RequestMapping("getDataByDataType.do")
	@ResponseBody
	public Map<String, Object> getDataByDataType(String dataType,
				Integer rows, Integer page, String sort, String order){
		return developerService.getDataByDataType(dataType, rows, page, sort, order);
	}
	
	//查看数据详情(表和视图)
	@RequestMapping("getDataDetails.do")
	@ResponseBody
	Map<String, Object> getDataDetails(String dataName,Integer rows,Integer page){
		return developerService.getDataDetails(dataName, rows, page);
	}
	//查看一条数据详情(表和视图)
	@RequestMapping("getColumnsByDataName.do")
	@ResponseBody
	List<Map<String, Object>> getColumnsByDataName(String dataName){
		return developerService.getColumnsByDataName(dataName);
	}
	
	
	//sql测试
	@RequestMapping("getDataBySql.do")
	@ResponseBody
	List<Map<String, Object>> getDataBySql(String sqlStr,Integer number){
		return developerService.getDataBySql(sqlStr, number);
	}
}
