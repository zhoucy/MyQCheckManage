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
	 *  ����һ����¼
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
	 *    ɾ��һ����¼
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
	 *    ����һ����¼
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
	 *    ����id��ȡ��¼
	 */
	public Department getDeptById(Integer id) {
		return deptDao.selectByPrimaryKey(id);
	}

	/**
	 *     ��ȡȫ���Ĳ�����Ϣ
	 */
	public List<Department> getAllDept() {
		return deptDao.getAllDept();
	}

	/**
	 *    ��ҳ��ѯ
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
	 *    code���ظ����
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
	 *    name���ظ����
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
	 * �������ƻ�ȡ
	 * 
	 */
	public Department getDeptByName(String name){
		Department temp=new Department();
		temp.setName(name);
		//ֻ�����ƹֵֹı��ʻ��Ƿ���һ�����ϲ�ѯ������list
		List<Department> result=deptDao.checkDept(temp);
		if(result!=null&&result.size()>0){
			return result.get(0);
		}else{
			return null;
		}
	}
	//����belong��ȡ����
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
			return "û��";
		}
	}

}
