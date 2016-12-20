package com.gangdian.qc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCCheckProjectDao;
import com.gangdian.qc.model.QCCheckProject;
import com.gangdian.qc.model.QCUser;
import com.gangdian.qc.service.QCCheckProjectService;
@Service
public class QCCheckProjectServiceImpl implements QCCheckProjectService{

	@Autowired 
	private QCCheckProjectDao projectDao;
	
	public boolean deleteByPrimaryKey(String id) {
		int status= projectDao.deleteByPrimaryKey(id);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public boolean insert(QCCheckProject record) {
		int status= projectDao.insert(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public boolean insertSelective(QCCheckProject record) {
		int status= projectDao.insertSelective(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public QCCheckProject selectByPrimaryKey(String id) {
		return projectDao.selectByPrimaryKey(id);
	}

	public boolean updateByPrimaryKeySelective(QCCheckProject record) {
		int status= projectDao.updateByPrimaryKeySelective(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
		
	}

	public boolean updateByPrimaryKey(QCCheckProject record) {
		int status= projectDao.updateByPrimaryKey(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}

	}

	

	public List<QCCheckProject> queryPageProject(String id, String name,
			int startIndex, int pageSize) {
		return projectDao.queryPageProject(id, name, startIndex, pageSize);
	}

	public int getProjectCount(QCCheckProject record) {
		// TODO Auto-generated method stub
		return projectDao.getProjectCount(record);
	}

	public List<Map<String, Object>> getAllProjectIdAndName() {
		return projectDao.getAllProjectIdAndName();
	}
	
	

}
