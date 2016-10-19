package com.gangdian.qc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCFailDetailDao;
import com.gangdian.qc.model.QCFailDetail;
import com.gangdian.qc.service.QCFailDetailService;

@Service
public class QCFailDetailServiceImpl implements QCFailDetailService{

	@Autowired
	private QCFailDetailDao failDetailDao;
	public int insert(QCFailDetail record) {
		// TODO Auto-generated method stub
		return failDetailDao.insert(record);
	}

	public int insertSelective(QCFailDetail record) {
		// TODO Auto-generated method stub
		return failDetailDao.insertSelective(record);
	}

	public List<QCFailDetail> selectByParentId(Integer parentId) {
		return failDetailDao.selectByParentId(parentId);
	}

	public int deleteByPrimaryKey(Integer id) {
		return failDetailDao.deleteByPrimaryKey(id);
	}

	public int updateFailById(QCFailDetail record) {
		return failDetailDao.updateFailById(record);
	}
	
	

}
