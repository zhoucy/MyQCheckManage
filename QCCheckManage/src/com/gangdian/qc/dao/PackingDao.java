package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PackingDao {

	
	//查询所有的barcode
	List<Map<String, Object>> getBarCodeByPmid(@Param("pmid") Integer pmid,@Param("barcode") String barcode
			,@Param("date") String date,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
	//插入一条barcode(暂不使用,使用下面的方法)
	void addPacking(@Param("pmid") Integer pmid,@Param("PackBarcode") Long PackBarcode,
			@Param("BoxBarcode") Long BoxBarcode,@Param("result") Integer result);
	
	void addPackingMap(Map<String, Object> params);
	
	//删除一条barcode
	int delPacking(@Param("pmid") Integer pmid,@Param("BoxCount") Integer BoxCount);
	
	List<Map<String, Object>> getPonoAndPackingByPmid(@Param("pmid") Integer pmid);
}
