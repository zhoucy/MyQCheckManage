package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCPermissionDao;
import com.gangdian.qc.model.QCPermission;
import com.gangdian.qc.service.QCPermissionService;


@Service
public class QCPermissionServiceImpl implements QCPermissionService{

	@Autowired 
	private QCPermissionDao qcPermissionMapper;
	

	/**
	 * 增加一条
	 */
	public boolean addPermission(QCPermission permission) {
		int result=qcPermissionMapper.insertSelective(permission);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	//删除一条记录
	public boolean deletePermission(Integer id) {
		int result=qcPermissionMapper.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	//更新一条记录
	public boolean updatePermission(QCPermission permission) {
		int result=qcPermissionMapper.updateByPrimaryKeySelective(permission);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	//获取全部记录
	public List<QCPermission> getAllPermission() {		
		return qcPermissionMapper.getAllPermission();
	}

	//根据id获取记录
	public QCPermission getPermissionById(Integer id) {
		return qcPermissionMapper.selectByPrimaryKey(id);
	}

	//权限名称重复检查
	public boolean checkPermissionName(String name) {
		QCPermission temp=new QCPermission();
		temp.setName(name);
		int result=qcPermissionMapper.checkPermission(temp);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	//权限允许访问url重复检查
	public boolean checkPermissionUrl(String url) {
		QCPermission temp=new QCPermission();
		temp.setUrl(url);
		int result=qcPermissionMapper.checkPermission(temp);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	
	//权限id的重复检查
	public boolean checkPermissionId(Integer id){
		QCPermission temp=new QCPermission();
		temp.setId(id);
		int result=qcPermissionMapper.checkPermission(temp);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	//分页条件查询
	public Map<String, Object> getPermissionPageList(QCPermission permissison,
			Integer rows, Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("total", qcPermissionMapper.getPermissionPageSize(permissison));
		result.put("rows", qcPermissionMapper.getPermissionPageList(permissison, rows, page, sort, order));
		return result;
	}

	public List<QCPermission> getPermissionByFatherid(Integer fatherid) {
		return qcPermissionMapper.getPermissionByFatherid(fatherid);
	}

}