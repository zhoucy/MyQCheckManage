package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PackingDao {

	
	//��ѯ���е�barcode
	List<Map<String, Object>> getBarCodeByPmid(@Param("pmid") Integer pmid,@Param("barcode") String barcode
			,@Param("date") String date,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
	//����һ��barcode(�ݲ�ʹ��,ʹ������ķ���)
	void addPacking(@Param("pmid") Integer pmid,@Param("PackBarcode") Long PackBarcode,
			@Param("BoxBarcode") Long BoxBarcode,@Param("result") Integer result);
	
	void addPackingMap(Map<String, Object> params);
	
	//ɾ��һ��barcode
	int delPacking(@Param("pmid") Integer pmid,@Param("BoxCount") Integer BoxCount);
	
	List<Map<String, Object>> getPonoAndPackingByPmid(@Param("pmid") Integer pmid);
}
