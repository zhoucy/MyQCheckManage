package com.gangdian.qc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.BoxProductDao;
import com.gangdian.qc.model.BoxProduct;
import com.gangdian.qc.service.BoxProductService;

@Service
public class BoxProductServiceImpl implements BoxProductService{
	
	@Autowired
	private BoxProductDao boxDao;

	public int deleteByPrimaryKey(Integer id) {
		return boxDao.deleteByPrimaryKey(id);
	}

	public int insert(BoxProduct record) {
		return boxDao.insert(record);
	}

	public int insertSelective(BoxProduct record) {
		return boxDao.insertSelective(record);
	}

	public BoxProduct selectByPrimaryKey(Integer id) {
		return boxDao.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(BoxProduct record) {
		return boxDao.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(BoxProduct record) {
		return boxDao.updateByPrimaryKey(record);
	}

	public int getPageSize(BoxProduct record) {
		
		return boxDao.getPageSize(record);
	}

}
