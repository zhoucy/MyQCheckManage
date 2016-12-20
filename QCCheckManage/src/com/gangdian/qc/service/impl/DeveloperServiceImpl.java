package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gangdian.qc.dao.DeveloperDao;
import com.gangdian.qc.service.DeveloperService;


@Service
public class DeveloperServiceImpl implements DeveloperService {

	@Autowired
	private DeveloperDao developerDao;
	
	//分页查看(表,视图,存储过程)
	public Map<String, Object> getDataByDataType(String dataType,
			Integer rows, Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=developerDao.getDataByDataType(dataType, null, null, null, null);
		result.put("rows", developerDao.getDataByDataType(dataType, rows, page, sort, order));
		result.put("total", list!=null?list.size():0);
		return result;
	}

	//查看数据详情(表和视图,存储过程没法看),分页但不排序,因为动态字段名难以确认
	public Map<String, Object> getDataDetails(String dataName,
			Integer rows, Integer page) {
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("rows", developerDao.getDataDetails(dataName, rows, page));
		result.put("total", developerDao.getDataDetailsCount(dataName));
		return result;
	}
	//查询一行数据,分析key为动态创建datagrid提供字段
	public List<Map<String, Object>> getColumnsByDataName(String dataName){
		return developerDao.getColumnsByDataName(dataName);
	}

	//sql测试,输入一条sql语句返回结果~(最好能返回查询消耗的时间)
	//注意:1.要捕捉错误 2.防止返回大量数据,最多只返回前100条 3.防止sql语句中出现delete,update,drop,insert,alter等关键词
	@Transactional(readOnly = true)
	public List<Map<String, Object>> getDataBySql(String sqlStr, Integer number) {
		String temp=sqlStr.toLowerCase();
		List<Map<String, Object>> result=null;
		if(temp.contains("delete")||temp.contains("update")||temp.contains("insert")||temp.contains("alter")||temp.contains("drop")){
			return null;
		}
		try {
			result=developerDao.getDataBySql(sqlStr, number);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return result;
	}

}
