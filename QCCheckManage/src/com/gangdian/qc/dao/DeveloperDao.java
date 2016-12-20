package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



//开发者预览(直接查看表,视图和存储过程..),增删改功能不做
public interface DeveloperDao {

	
	//分页查看(表,视图,存储过程)
	List<Map<String, Object>> getDataByDataType(@Param("dataType") String dataType,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
	
	//查看数据详情(表和视图,存储过程没法看),分页但不排序,因为动态字段名难以确认
	List<Map<String, Object>> getDataDetails(@Param("dataName") String dataName,
			@Param("rows")	Integer rows, @Param("page") Integer page);	
	//获取数据详情总记录数
	int getDataDetailsCount(@Param("dataName") String dataName);	
	//取一行数据详情的数据,分析key为动态创建datagrid提供字段
	List<Map<String, Object>> getColumnsByDataName(@Param("dataName") String dataName);
	
	
	//sql测试,输入一条sql语句返回结果~(最好能返回查询消耗的事件)
	//注意:1.要捕捉错误 2.防止返回大量数据,只返回前50条 3.防止sql语句中出现delete,update,drop,insert,alter等关键词
	List<Map<String, Object>> getDataBySql(@Param("sqlStr") String sqlStr,@Param("number") Integer number);
}
