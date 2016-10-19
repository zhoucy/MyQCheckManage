package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProductTypeDao;
import com.gangdian.qc.model.QCProductType;
import com.gangdian.qc.service.QCProductTypeService;


@Service
public class QCProductTypeServiceImpl implements QCProductTypeService {

	
	@Autowired
	private QCProductTypeDao qcptDao;
	
	public boolean addQCPT(QCProductType qcpt) {
		int result=qcptDao.insertSelective(qcpt);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	public boolean deleteQCPT(Integer id) {
		int result=qcptDao.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	public boolean updateQCPT(QCProductType qcpt) {
		int result=qcptDao.updateByPrimaryKeySelective(qcpt);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	public List<QCProductType> getAllQCPT() {
		return qcptDao.getAllQCPT();
	}

	public QCProductType getQCPTById(Integer id) {
		return qcptDao.selectByPrimaryKey(id);
	}

	public Map<String, Object> getQCPTPageList(QCProductType qcpt,
			Integer rows, Integer page, String sort, String order) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<QCProductType> total=qcptDao.getQCPTPageSize(qcpt);
		map.put("total", total!=null?total.size():0);
		map.put("rows", qcptDao.getQCPTPageList(qcpt, rows, page, sort, order));
		return map;
	}

	public boolean checkNO(String qcptNO) {
		QCProductType temp=new QCProductType();
		temp.setProductNo(qcptNO);
		List<QCProductType> list=qcptDao.getQCPTPageSize(temp);
		int result=list!=null?list.size():0;
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	public boolean checkName(String name) {
		QCProductType temp=new QCProductType();
		temp.setProductName(name);
		List<QCProductType> list=qcptDao.getQCPTPageSize(temp);
		int result=list!=null?list.size():0;
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

}
