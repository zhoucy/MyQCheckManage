package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

public interface DeveloperService {

	//分页查看(表,视图,存储过程)
	Map<String, Object> getDataByDataType(String dataType,
			Integer rows,Integer page,String sort,String order);
	
	//查看数据详情(表和视图)
	Map<String, Object> getDataDetails(String dataName,Integer rows,Integer page);
	//查看第一条数据详情(表和视图)
	List<Map<String, Object>> getColumnsByDataName(String dataName);
	
	//sql测试
	List<Map<String, Object>> getDataBySql(String sqlStr,Integer number);
}
