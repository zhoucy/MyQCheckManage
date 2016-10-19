package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.Department;



public interface DepartmentService {

	/**
	 *                增加一条记录
	 * @param dept    实体类
	 * @return        结果
	 */
	public boolean addDept(Department dept);
	
	/**
	 *             删除一条记录
	 * @param id   实体类
	 * @return     结果
	 */
	public boolean deleteDept(Integer id);
	
	/**.
	 *               更新一条记录
	 * @param dept   实体类
	 * @return       结果
	 */
	public boolean updateDept(Department dept);
	/**
	 *             根据id查询
	 * @param id   查询id
	 * @return     符合条件的记录
	 */
	public Department getDeptById(Integer id);
	/**
	 *            
	 * @return   返回所有的部门信息
	 */
	public List<Department> getAllDept();
	
	/**
	 *                分页查询
	 * @param dept    实体类
	 * @param rows    每页大小
	 * @param page    页码
	 * @param sort    排序列
	 * @param order   升序降序
	 * @return        符合条件的记录
	 */
	public Map<String, Object> getDeptPageList(Department dept,String belongname,
			Integer rows,Integer page, String sort, String order);
	
	/**
	 *                编码重复检查
	 * @param code    待检查的编码
	 * @return        结果
	 */
	public boolean checkCode(String code);
	/**
	 *                名称重复检查
	 * @param name    待检查的名称
	 * @return        结果
	 */
	public boolean checkName(String name);
	/**
	 *             根据部门名称查询记录
	 * @param name 部门名称
	 * @return     结果
	 */
	public Department getDeptByName(String name);
	/**
	 *              根据部门code查找部门名称
	 * @param code  部门code
	 * @return      部门名称
	 */
	public String getDeptNameByDeptCode(String code);
	/**
	 *                  根据部门隶属查找符合条件的部门
	 * @param belong    部门隶属的id
	 * @return          符合条件的部门
	 */
	public List<Department> getDeptByBelong(String belong);
}
