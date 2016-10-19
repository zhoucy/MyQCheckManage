package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCPermission;
import com.gangdian.qc.model.QCRole;
import com.gangdian.qc.service.QCPermissionService;
import com.gangdian.qc.service.QCRoleService;


@Controller
@RequestMapping(value="/qc")
public class RoleController {
	
	
	@Autowired
	private QCRoleService roleService;
	@Autowired
	private QCPermissionService permissionService;
	
	/**
	 *             添加一条记录
	 * @param role 实体类
	 * @return     成功还是失败
	 */
	@RequestMapping(value="addQCRole.do")
	@ResponseBody
	public boolean addRole(QCRole role){
		return roleService.addRole(role);
	}
	/**
	 *              删除一条记录
	 * @param role  实体类
	 * @return      成功还是失败
	 */
	@RequestMapping(value="deleteQCRole.do")
	@ResponseBody
	public boolean deleteRole(QCRole role){
		return roleService.deleteRole(role);
	}
	/**
	 *                            更新一条记录
	 * @param role                实体类
	 * @param updateid            角色id where的条件
	 * @param updatename          角色姓名  where的条件
	 * @param updatedelpermissonid 角色权限 where的条件
	 * @return
	 */
	@RequestMapping(value="updateQCRole.do")
	@ResponseBody
	public boolean updateRole(QCRole role ,@RequestParam("updateid") Integer updateid,
			@RequestParam("updatename") String updatename){
		return roleService.updateRole(role, updateid, updatename);
	}
	/**
	 *               分页条件查询
	 * @param role   实体类
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序字段
	 * @param order  升序还是降序
	 * @return
	 */
	@RequestMapping(value="searchQCRole.do")
	@ResponseBody
	public Map<String, Object> searchRole(QCRole role,
			Integer rows,Integer page,String sort,String order){
		return roleService.getRolePageList(role, rows, page, sort, order);
	}
	/**
	 *                重复检查
	 * @param role    实体类
	 * @return        返回检查结果成功还是失败
	 */
	@RequestMapping(value="checkQCRoleID.do")
	@ResponseBody
	public boolean checkRoleID(@RequestParam("id") Integer id){
		return !roleService.checkRoleID(id);
	}
	/**
	 *              角色名称重复检查
	 * @param name  角色名称
	 * @return      检查结果
	 */
	@RequestMapping(value="checkQCRoleName.do")
	@ResponseBody
	public boolean checkRoleName(@RequestParam("name") String name){
		return !roleService.checkRoleName(name);
	}
	
	
	/**
	 *             获取全部的权限
	 * @return
	 */
	
	@RequestMapping(value="getAllPermission.do")
	@ResponseBody
	public List<QCPermission> getAllPermission(){
		return permissionService.getAllPermission();
	}
	
	/**
	 *                  根据角色id获取权限
	 * @param rid       角色id
	 * @return          符合条件的权限记录
	 */
	@RequestMapping(value="getPremissionByRoleId.do")
	@ResponseBody
	public List<Map<String, Object>> getPremissionByRoleId(Integer rid){
		return roleService.getPremissionByRoleId(rid);
	}

}
