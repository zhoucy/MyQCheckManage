package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.PackingDao;
import com.gangdian.qc.service.PackingService;

@Service
public class PackingServiceImpl implements PackingService{

	@Autowired
	PackingDao packingDao;
	


	
	public Map<String, Object> getBarCodeByPmid(Integer pmid,String barcode, String date,
			Integer rows,Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=packingDao.getBarCodeByPmid(pmid, barcode, date, null, null, null, null);
		int total=list!=null?list.size():0;
		result.put("rows", packingDao.getBarCodeByPmid(pmid, barcode, date, rows, page, sort, order));
		result.put("total", total);
		return result;
	}

	public Map<String, Object> getBarCodeByPmid(Integer pmid,
			Integer rows,Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=packingDao.getBarCodeByPmid(pmid, null, null, null, null, null, null);
		int total=list!=null?list.size():0;
		result.put("rows", packingDao.getBarCodeByPmid(pmid, null, null, rows, page, sort, order));
		result.put("total", total);
		return result;
	}

	public Integer addPacking(Integer pmid, Long PackBarcode,
			Long BoxBarcode) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("pmid", pmid);
		params.put("BoxBarcode", BoxBarcode);
		params.put("PackBarcode", PackBarcode);		
		packingDao.addPackingMap(params);
		Integer result=(Integer) params.get("result");
		return result;
	}

	public boolean delPacking(Integer pmid, Integer BoxCount) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Map<String, Object>> getPonoAndPackingByPmid(Integer pmid) {
		return packingDao.getPonoAndPackingByPmid(pmid);
	}

	




	

}
