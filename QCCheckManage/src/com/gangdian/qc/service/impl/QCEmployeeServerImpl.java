package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCEmployeeMapper;
import com.gangdian.qc.model.QCEmployee;
import com.gangdian.qc.service.QCEmployeeServer;


@Service
public class QCEmployeeServerImpl implements QCEmployeeServer {

	@Autowired
	private QCEmployeeMapper employeeDao;
	
	public boolean addEmployee(QCEmployee employee) {
		boolean result=employeeDao.insertSelective(employee)>=1?true:false;
		return result;		
	}

	public boolean deleteEmployee(Integer id) {
		boolean result=employeeDao.deleteByPrimaryKey(id)>=1?true:false;
		return result;
	}

	public boolean updateEmployee(QCEmployee employee) {
		boolean result=employeeDao.updateByPrimaryKeySelective(employee)>=1?true:false;
		return result;
	}

	public Map<String, Object> getEmployeePageList(QCEmployee employee,
			Integer rows,Integer page,String sort,String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<QCEmployee> list=employeeDao.getEmployeePageList(employee, null, null, null, null);
		result.put("total", list!=null?list.size():0);
		result.put("rows", employeeDao.getEmployeePageList(employee, rows, page, sort, order));
		return result;
	}

	public List<QCEmployee> getAllEmployee() {
		return employeeDao.getAllEmployee();
	}

	public boolean checkEmployee(QCEmployee employee) {
		List<QCEmployee> list=employeeDao.getConditionEmployee(employee);
		if(list!=null){
			return list.size()>=1?true:false;
		}
		return false;
	}

	public QCEmployee getEmployeeById(Integer id) {
		return employeeDao.selectByPrimaryKey(id);
	}

}
