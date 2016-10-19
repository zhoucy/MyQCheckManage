package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCProductType;

public interface QCProductTypeService {

	
	
	//增删改查
	public boolean addQCPT(QCProductType qcpt);
	
	public boolean deleteQCPT(Integer id);
	
	public boolean updateQCPT(QCProductType qcpt);
	
	public List<QCProductType> getAllQCPT();
	
	public QCProductType getQCPTById(Integer id);
	//分页查询
	public Map<String, Object> getQCPTPageList(QCProductType qcpt,
			Integer rows,Integer page, String sort, String order);
	
	//产品类型编码重复检查
	public boolean checkNO(String qcptNO);
	//产品姓名的重复检查
	public boolean checkName(String name);
}
