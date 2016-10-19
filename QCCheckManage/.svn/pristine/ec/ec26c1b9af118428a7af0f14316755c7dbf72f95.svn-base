package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.DepartmentDao;
import com.gangdian.qc.model.Department;
import com.gangdian.qc.service.DepartmentService;


@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao deptDao;
	

	/**
	 *  增加一条记录
	 */
	public boolean addDept(Department dept) {
		int result=deptDao.insertSelective(dept);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 *    删除一条记录
	 */
	public boolean deleteDept(Integer id) {
		int result=deptDao.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *    更新一条记录
	 */
	public boolean updateDept(Department dept) {
		int result=deptDao.updateByPrimaryKeySelective(dept);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *    根据id获取记录
	 */
	public Department getDeptById(Integer id) {
		return deptDao.selectByPrimaryKey(id);
	}

	/**
	 *     获取全部的部门信息
	 */
	public List<Department> getAllDept() {
		return deptDao.getAllDept();
	}

	/**
	 *    分页查询
	 */
	public Map<String, Object> getDeptPageList(Department dept,String belongname,
			Integer rows,Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		//result.put("total", deptDao.getDeptPageSize(dept).size());
		//result.put("rows", deptDao.getDeptPageList(dept, rows, page, sort, order));
		List<Map<String, Object>> total=deptDao.getDeptPage(dept, belongname, null, null, null, null);
		result.put("total", total!=null?total.size():0);
		result.put("rows", deptDao.getDeptPage(dept, belongname, rows, page, sort, order));
		return result;
	}

	/**
	 *    code的重复检查
	 */
	public boolean checkCode(String code) {
		Department temp=new Department();
		temp.setCode(code);
		List<Department> result=deptDao.getDeptPageSize(temp);
		if(result!=null&&result.size()>0){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 *    name的重复检查
	 */
	public boolean checkName(String name) {
		Department temp=new Department();
		temp.setName(name);
		List<Department> result=deptDao.getDeptPageSize(temp);
		if(result!=null&&result.size()>0){
			return true;
		}else{
			return false;
		}	
	}
	
	/**
	 * 根据名称获取
	 * 
	 */
	public Department getDeptByName(String name){
		Department temp=new Department();
		temp.setName(name);
		//只是名称怪怪的本质还是返回一个符合查询条件的list
		List<Department> result=deptDao.checkDept(temp);
		if(result!=null&&result.size()>0){
			return result.get(0);
		}else{
			return null;
		}
	}
	//根据belong获取部门
	public List<Department> getDeptByBelong(String belong){
		return deptDao.getDeptByBelong(belong);
	}
	
	public String getDeptNameByDeptCode(String code){
		Department temp=new Department();
		temp.setCode(code);
		List<Department> result=deptDao.checkDept(temp);
		if(result!=null&&result.size()>0){
			return result.get(0).getName();
		}else{
			return "没有";
		}
	}

}
