package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCEmployee;

public interface QCEmployeeServer {

	
	//增加
	public boolean addEmployee(QCEmployee employee);
	//删除
	public boolean deleteEmployee(Integer id);
	//修改
	public boolean updateEmployee(QCEmployee employee);
	//分页条件查询
	public Map<String, Object> getEmployeePageList(QCEmployee employee,
			Integer rows,Integer page,String sort,String order);
	//查询全部
	public List<QCEmployee> getAllEmployee();
	//根据id查询
	public QCEmployee getEmployeeById(Integer id);
	//重复验证
	public boolean checkEmployee(QCEmployee employee);
}
