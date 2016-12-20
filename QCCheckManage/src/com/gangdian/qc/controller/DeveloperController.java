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
	
	//��ҳ�鿴(��,��ͼ,�洢����)
	@RequestMapping("getDataByDataType.do")
	@ResponseBody
	public Map<String, Object> getDataByDataType(String dataType,
				Integer rows, Integer page, String sort, String order){
		return developerService.getDataByDataType(dataType, rows, page, sort, order);
	}
	
	//�鿴��������(�����ͼ)
	@RequestMapping("getDataDetails.do")
	@ResponseBody
	Map<String, Object> getDataDetails(String dataName,Integer rows,Integer page){
		return developerService.getDataDetails(dataName, rows, page);
	}
	//�鿴һ����������(�����ͼ)
	@RequestMapping("getColumnsByDataName.do")
	@ResponseBody
	List<Map<String, Object>> getColumnsByDataName(String dataName){
		return developerService.getColumnsByDataName(dataName);
	}
	
	
	//sql����
	@RequestMapping("getDataBySql.do")
	@ResponseBody
	List<Map<String, Object>> getDataBySql(String sqlStr,Integer number){
		return developerService.getDataBySql(sqlStr, number);
	}
}
