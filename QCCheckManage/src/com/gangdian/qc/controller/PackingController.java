package com.gangdian.qc.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.service.PackingService;


@Controller
@RequestMapping("/qc")
public class PackingController {

	
	@Autowired
	PackingService packingService;
	
	
	@RequestMapping("getBarCodeByPmid.do")
	@ResponseBody
	public Map<String, Object> getBarCodeByPmid(Integer pmid,String barcode,String date,
			Integer rows,Integer page, String sort, String order){
		return packingService.getBarCodeByPmid(pmid, rows, page, sort, order);
	}
	
	@RequestMapping("addPacking.do")
	@ResponseBody
	public Integer addPacking(Integer pmid, Long PackBarcode,
			Long BoxBarcode){
		return packingService.addPacking(pmid, PackBarcode, BoxBarcode);
	}
	
	@RequestMapping("delPackBarCode.do")
	@ResponseBody
	public boolean delPacking(Integer pmid, Integer BoxCount){
		return false;
	}
	
	@RequestMapping("getPonoAndPackingByPmid.do")
	@ResponseBody
	public List<Map<String, Object>> getPonoAndPackingByPmid(Integer pmid) {
		return packingService.getPonoAndPackingByPmid(pmid);
	}
	
}
