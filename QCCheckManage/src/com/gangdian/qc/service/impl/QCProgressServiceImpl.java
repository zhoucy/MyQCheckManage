package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProgressDao;
import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.service.QCProgressService;

@Service
public class QCProgressServiceImpl implements QCProgressService {

	@Autowired
	private QCProgressDao progressDao;
	/**
	 *  增加一条记录
	 */
	public boolean addProgress(QCProgress progress) {
		int result=progressDao.insertSelective(progress);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 *   删除一条记录
	 */
	public boolean deleteProgress(Integer id) {
		int result=progressDao.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *    更新一条记录
	 */
	public boolean updateProgress(QCProgress progress) {
		int result=progressDao.updateByPrimaryKeySelective(progress);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
 
	/**
	 *     根据id获取记录
	 */
	public QCProgress getProgressById(Integer id) {
		return progressDao.selectByPrimaryKey(id);
	}

	/**
	 *   获取全部的工序信息
	 */
	public List<QCProgress> getAllProgress() {
		return progressDao.getAllProgress();
	}

	/**
	 *    分页条件查询
	 */
	public Map<String, Object> getProgressPageList(QCProgress progress,
			Integer rows, Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<QCProgress> total=progressDao.getProgressPageSize(progress);
		result.put("total", total!=null?total.size():0);
		result.put("rows", progressDao.getProgressPageList(progress, rows, page, sort, order));
		return result;
	}

	/**
	 *    编码重复检查
	 */
	public boolean checkCode(Integer code) {
		
		QCProgress result=progressDao.selectByCode(code);
		if(result!=null){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 *    名称重复检查
	 */
	public boolean checkName(String name) {
		QCProgress temp=new QCProgress();
		temp.setProgressName(name);
		List<QCProgress> list=progressDao.checkProgress(temp);
		int result=list!=null?list.size():0;
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}


}
