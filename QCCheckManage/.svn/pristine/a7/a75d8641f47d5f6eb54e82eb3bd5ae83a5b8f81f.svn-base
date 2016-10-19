package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCPermission;
import com.gangdian.qc.service.QCPermissionService;


@Controller
@RequestMapping(value="/qc")
public class PermissionController {

	
	@Autowired
	private QCPermissionService permissionService;
	
	/**
	 *                    增加一条记录
	 * @param permission  实体类
	 * @return            成功还是失败
	 */
	@RequestMapping(value="addQCPermission.do")
	@ResponseBody
	public boolean addPermission(QCPermission permission){
		return permissionService.addPermission(permission);
	}
	/**
	 *              删除一条记录
	 * @param id    删除的id
	 * @return      成功还是失败
	 */
	@RequestMapping(value="deleteQCPermission.do")
	@ResponseBody
	public boolean deletePermission(Integer id){
		return permissionService.deletePermission(id);
	}
	/**
	 *                     更新一条记录
	 * @param permission   实体类
	 * @return             成功还是失败
	 */
	@RequestMapping(value="updateQCPermission.do")
	@ResponseBody
	public boolean updatePermission(QCPermission permission){
		return permissionService.updatePermission(permission);
	}
	/**
	 *                      条件查询
	 * @param permission    实体类
	 * @param rows          每页大小
	 * @param page          页码
	 * @param sort          排序的列
	 * @param order         升序还是降序
	 * @return              符合条件的分页结果
	 */
	@RequestMapping(value="searchQCPermission.do")
	@ResponseBody
	public Map<String, Object> searchPermission(QCPermission permission,
			String rows,String page,String sort,String order){
		return permissionService.getPermissionPageList(permission, 
				Integer.parseInt(rows), Integer.parseInt(page), sort, order);
	}
	/**
	 *                  重复检查
	 * @param name      权限名称
	 * @return          有没有
	 */
	@RequestMapping(value="checkName.do")
	@ResponseBody
	public boolean checkName(@RequestParam("name") String name){
		return !permissionService.checkPermissionName(name);
	}
	/**
	 *              重复检查
	 * @param url   允许访问的url
	 * @return      有没有
	 */
	@RequestMapping(value="checkUrl.do")
	@ResponseBody
	public boolean checkUrl(@RequestParam("url") String url){
		return !permissionService.checkPermissionUrl(url);
	}
	
	/**
	 *             重复检查
	 * @param id   id
	 * @return     有没有
	 */
	@RequestMapping(value="checkId.do")
	@ResponseBody
	public boolean checkId(@RequestParam("id") Integer id){
		return !permissionService.checkPermissionId(id);
	}
	
	/**
	 *                   根据权限fatherid获取记录
	 * @param fatherid   fatherid
	 * @return           符合条件的记录
	 */
	@RequestMapping(value="getPermissionByFatherid.do")
	@ResponseBody
	public List<QCPermission> getPermissionByFatherid(Integer fatherid){
		return permissionService.getPermissionByFatherid(fatherid);
	}
	
}
