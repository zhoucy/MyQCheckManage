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
	 *             ���һ����¼
	 * @param role ʵ����
	 * @return     �ɹ�����ʧ��
	 */
	@RequestMapping(value="addQCRole.do")
	@ResponseBody
	public boolean addRole(QCRole role){
		return roleService.addRole(role);
	}
	/**
	 *              ɾ��һ����¼
	 * @param role  ʵ����
	 * @return      �ɹ�����ʧ��
	 */
	@RequestMapping(value="deleteQCRole.do")
	@ResponseBody
	public boolean deleteRole(QCRole role){
		return roleService.deleteRole(role);
	}
	/**
	 *                            ����һ����¼
	 * @param role                ʵ����
	 * @param updateid            ��ɫid where������
	 * @param updatename          ��ɫ����  where������
	 * @param updatedelpermissonid ��ɫȨ�� where������
	 * @return
	 */
	@RequestMapping(value="updateQCRole.do")
	@ResponseBody
	public boolean updateRole(QCRole role ,@RequestParam("updateid") Integer updateid,
			@RequestParam("updatename") String updatename){
		return roleService.updateRole(role, updateid, updatename);
	}
	/**
	 *               ��ҳ������ѯ
	 * @param role   ʵ����
	 * @param rows   ÿҳ��С
	 * @param page   ҳ��
	 * @param sort   �����ֶ�
	 * @param order  �����ǽ���
	 * @return
	 */
	@RequestMapping(value="searchQCRole.do")
	@ResponseBody
	public Map<String, Object> searchRole(QCRole role,
			Integer rows,Integer page,String sort,String order){
		return roleService.getRolePageList(role, rows, page, sort, order);
	}
	/**
	 *                �ظ����
	 * @param role    ʵ����
	 * @return        ���ؼ�����ɹ�����ʧ��
	 */
	@RequestMapping(value="checkQCRoleID.do")
	@ResponseBody
	public boolean checkRoleID(@RequestParam("id") Integer id){
		return !roleService.checkRoleID(id);
	}
	/**
	 *              ��ɫ�����ظ����
	 * @param name  ��ɫ����
	 * @return      �����
	 */
	@RequestMapping(value="checkQCRoleName.do")
	@ResponseBody
	public boolean checkRoleName(@RequestParam("name") String name){
		return !roleService.checkRoleName(name);
	}
	
	
	/**
	 *             ��ȡȫ����Ȩ��
	 * @return
	 */
	
	@RequestMapping(value="getAllPermission.do")
	@ResponseBody
	public List<QCPermission> getAllPermission(){
		return permissionService.getAllPermission();
	}
	
	/**
	 *                  ���ݽ�ɫid��ȡȨ��
	 * @param rid       ��ɫid
	 * @return          ����������Ȩ�޼�¼
	 */
	@RequestMapping(value="getPremissionByRoleId.do")
	@ResponseBody
	public List<Map<String, Object>> getPremissionByRoleId(Integer rid){
		return roleService.getPremissionByRoleId(rid);
	}

}
