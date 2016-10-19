package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCGroupDao;
import com.gangdian.qc.model.QCGroup;
import com.gangdian.qc.service.QCGroupService;

@Service
public class QCGroupServiceImpl implements QCGroupService{

	@Autowired
	private QCGroupDao qcGroupDao;
	
	public int addQCGroup(QCGroup qcGroup) {
		return qcGroupDao.addQCGroup(qcGroup);
	}

	public List<QCGroup> getQCGroups() {
		return qcGroupDao.getQCGroups();
	}

	public int getAllQCGroupsNumbers() {
		return qcGroupDao.getAllQCGroupsNumbers();
	}

	public QCGroup checkQCGroupname(QCGroup qcGroup) {
		return qcGroupDao.checkQCGroupname(qcGroup);
	}

	public int deleteQCGroup(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public QCGroup getQCGroup(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateQCGroup(QCGroup qcGroup) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 *     增加一条记录
	 */
	public boolean addGroup(QCGroup group) {
		int result=qcGroupDao.addGroup(group);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
    /**
     *      删除一条记录
     */
	public boolean deleteGroup(Integer id) {
		int result=qcGroupDao.deleteGroup(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *     (根据id)更新一条记录
	 */
	public boolean updateGroup(QCGroup group) {
		int result=qcGroupDao.updateGroup(group);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * .    根据id查询
	 */
	public QCGroup getGroupById(Integer id) {
		return qcGroupDao.getGroupById(id);
	}

	/**
	 *     查询全部的结果
	 */
	public List<QCGroup> getAllGroup() {
		return qcGroupDao.getAllGroup();
	}

	/**
	 *      分页条件查询
	 */
	public Map<String, Object> getGroupPageList(QCGroup group, Integer rows,
			Integer page, String sort, String order) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("total", qcGroupDao.getGroupPageSize(group));
		map.put("rows", qcGroupDao.getGroupPageList(group, rows, page, sort, order));
		return map;
	}

	/**
	 *    重复检查
	 */
	public boolean checkCode(String code) {
		QCGroup temp=new QCGroup();
		temp.setGroupCode(code);
		List<QCGroup> list=qcGroupDao.checkGroup(temp);
		if(list!=null&&list.size()>=1){
			return true;
		}else{
			return false;
		}	
	}

	


	
}
