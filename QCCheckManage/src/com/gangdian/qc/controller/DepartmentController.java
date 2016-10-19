package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.Department;
import com.gangdian.qc.service.DepartmentService;


@Controller
@RequestMapping(value="/qc")
public class DepartmentController {

	@Autowired
	private DepartmentService deptService;

	/**
	 *              增加一条记录
	 * @param dept  实体类
	 * @return      结果
	 */
	@RequestMapping("addDept.do")
	@ResponseBody
	public boolean addDept(Department dept){
		return deptService.addDept(dept);
	}
	/**
	 *           删除一条记录
	 * @param id 被删除对象的id
	 * @return   结果
	 */
	@RequestMapping("deleteDept.do")
	@ResponseBody
	public boolean deleteDept(Integer id){
		return deptService.deleteDept(id);
	}
	
	/**
	 *               更新一条记录
	 * @param dept   实体类
	 * @return       结果
	 */
	@RequestMapping("updateDept.do")
	@ResponseBody
	public boolean updateDept(Department dept){
		return deptService.updateDept(dept);
	}
	
	/**
	 *                    分页条件查询
	 * @param dept        实体类
	 * @param belongname  部门隶属
	 * @param rows        每页大小
	 * @param page        页码
	 * @param sort        排序列
	 * @param order       升序降序
	 * @return            符合条件的记录
	 */
	@RequestMapping("searchDept.do")
	@ResponseBody
	public Map<String, Object> searchDept(Department dept,String belongname,
			Integer rows,Integer page, String sort, String order){
		return deptService.getDeptPageList(dept,belongname,rows,page,sort,order);
	}
	
	
	/**
	 *                 编码重复检查
	 * @param code     待检查的编码
	 * @return         结果
	 */
	@RequestMapping("checkDeptCode.do")
	@ResponseBody
	public boolean checkDeptCode(@RequestParam("code") String code){
		return !deptService.checkCode(code);
	}
	/**
	 *             检查部门名称
	 * @param name 部门名称
	 * @return     检查结果
	 */
	@RequestMapping("checkDeptName.do")
	@ResponseBody
	public boolean checkDeptName(@RequestParam("name") String name){
		return !deptService.checkName(name);
	}
	
	
	/**
	 *          获取全部部门信息
	 * @return
	 */
	@RequestMapping("getAllDept.do")
	@ResponseBody
	public List<Department> getAllDept(){
		return deptService.getAllDept();
	}
	
	/**
	 *           获取生产中心(假设生产中心隶属于编号为31的生产部)
	 * @return
	 */
	@RequestMapping("getAllProductDept.do")
	@ResponseBody
	public List<Department> getAllProductDept(){
		return deptService.getDeptByBelong("31");
	}
	
	/**
	 *                 根据部门隶属获取对应的部门
	 * @param belong   部门隶属id
	 * @return         符合条件的部门
	 */
	@RequestMapping("getDeptByBelong.do")
	@ResponseBody
	public List<Department> getDeptByBelong(String belong){
		return deptService.getDeptByBelong(belong);
	}
	/**
	 *             根据id获取部门名称
	 * @param id   部门id
	 * @return     部门名称
	 */
	
	@RequestMapping("getDeptNameByID.do")
	@ResponseBody
	public String getDeptNameByID(Integer id){
		return deptService.getDeptById(id).getName();
	}
}
