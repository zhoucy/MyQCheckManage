package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCWorktimeMapper;
import com.gangdian.qc.model.QCWorktime;
import com.gangdian.qc.service.QCWorkTimeServer;

@Service
public class QCWorkTimeServerImpl implements QCWorkTimeServer{

	@Autowired
	private QCWorktimeMapper qcwtDao;
	public boolean addQCWT(QCWorktime qcwt) {
		int result=qcwtDao.insertSelective(qcwt);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	public boolean deleteQCWT(Integer id) {
		int result=qcwtDao.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	public boolean updateQCWT(QCWorktime qcwt) {
		int result=qcwtDao.updateByPrimaryKeySelective(qcwt);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	public Map<String, Object> getQCWTPageList(String groupname,String belongname,
			Integer rows,Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> total=qcwtDao.getQCWTPageList(groupname, belongname, null, null, null, null);
		result.put("rows", qcwtDao.getQCWTPageList(groupname, belongname, rows, page, sort, order));
		result.put("total",total!=null?total.size():0);
		return result;
	}

	public boolean checkGroupid(String groupname) {
		int result=qcwtDao.checkGroupid(groupname);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

}
