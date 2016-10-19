package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCEmployee;
import com.gangdian.qc.service.QCEmployeeServer;


@Controller
@RequestMapping("/qc")
public class QCEmployeeController {

	@Autowired
	private QCEmployeeServer employeeServer;
	
	/**
	 *                   增加一条雇员的记录
	 * @param employee
	 * @return
	 */
	@RequestMapping("addEmployee.do")
	@ResponseBody
	public boolean addEmployee(QCEmployee employee){
		return employeeServer.addEmployee(employee);
	}
	
	/**
	 *                  删除一条雇员的记录
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteEmployee.do")
	@ResponseBody
	public boolean deleteEmployee(Integer id){
		return employeeServer.deleteEmployee(id);
	}
	
	/**
	 *                 更新一条雇员的记录
	 * @param employee
	 * @return
	 */
	@RequestMapping("updateEmployee.do")
	@ResponseBody
	public boolean updateEmployee(QCEmployee employee){
		return employeeServer.updateEmployee(employee);
	}
	
	/**
	 *                  分页条件查询
	 * @param employee
	 * @param rows
	 * @param page
	 * @param sort
	 * @param order
	 * @return
	 */
	@RequestMapping("searchEmployee.do")
	@ResponseBody
	public Map<String, Object> searchEmployee(QCEmployee employee,
			Integer rows,Integer page,String sort,String order){
		return employeeServer.getEmployeePageList(employee, rows, page, sort, order);
	}
	
	/**
	 *           获取全部的雇员记录
	 * @return
	 */
	@RequestMapping("getAllEmployee.do")
	@ResponseBody
	public List<QCEmployee> getAllEmployee(){
		return employeeServer.getAllEmployee();
	}
	
	/**
	 *                 重复检查
	 * @param employee
	 * @return
	 */
	@RequestMapping("checkEmployee.do")
	@ResponseBody
	public boolean checkEmployee(QCEmployee employee){
		System.out.println(employee);
		return !employeeServer.checkEmployee(employee);
	}
}
