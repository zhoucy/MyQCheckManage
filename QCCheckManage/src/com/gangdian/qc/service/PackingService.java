package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

public interface PackingService {

	
	public Map<String, Object> getBarCodeByPmid(Integer pmid,String barcode,String date,
			Integer rows,Integer page, String sort, String order);
	
	public Map<String, Object> getBarCodeByPmid(Integer pmid,
			Integer rows,Integer page, String sort, String order);
	
	public Integer addPacking(Integer pmid,Long PackBarcode,Long BoxBarcode);	
	
	public boolean delPacking(Integer pmid, Integer BoxCount);
	
	List<Map<String, Object>> getPonoAndPackingByPmid(Integer pmid);
}
