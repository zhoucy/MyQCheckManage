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
	 *                    ����һ����¼
	 * @param permission  ʵ����
	 * @return            �ɹ�����ʧ��
	 */
	@RequestMapping(value="addQCPermission.do")
	@ResponseBody
	public boolean addPermission(QCPermission permission){
		return permissionService.addPermission(permission);
	}
	/**
	 *              ɾ��һ����¼
	 * @param id    ɾ����id
	 * @return      �ɹ�����ʧ��
	 */
	@RequestMapping(value="deleteQCPermission.do")
	@ResponseBody
	public boolean deletePermission(Integer id){
		return permissionService.deletePermission(id);
	}
	/**
	 *                     ����һ����¼
	 * @param permission   ʵ����
	 * @return             �ɹ�����ʧ��
	 */
	@RequestMapping(value="updateQCPermission.do")
	@ResponseBody
	public boolean updatePermission(QCPermission permission){
		return permissionService.updatePermission(permission);
	}
	/**
	 *                      ������ѯ
	 * @param permission    ʵ����
	 * @param rows          ÿҳ��С
	 * @param page          ҳ��
	 * @param sort          �������
	 * @param order         �����ǽ���
	 * @return              ���������ķ�ҳ���
	 */
	@RequestMapping(value="searchQCPermission.do")
	@ResponseBody
	public Map<String, Object> searchPermission(QCPermission permission,
			String rows,String page,String sort,String order){
		return permissionService.getPermissionPageList(permission, 
				Integer.parseInt(rows), Integer.parseInt(page), sort, order);
	}
	/**
	 *                  �ظ����
	 * @param name      Ȩ������
	 * @return          ��û��
	 */
	@RequestMapping(value="checkName.do")
	@ResponseBody
	public boolean checkName(@RequestParam("name") String name){
		return !permissionService.checkPermissionName(name);
	}
	/**
	 *              �ظ����
	 * @param url   ������ʵ�url
	 * @return      ��û��
	 */
	@RequestMapping(value="checkUrl.do")
	@ResponseBody
	public boolean checkUrl(@RequestParam("url") String url){
		return !permissionService.checkPermissionUrl(url);
	}
	
	/**
	 *             �ظ����
	 * @param id   id
	 * @return     ��û��
	 */
	@RequestMapping(value="checkId.do")
	@ResponseBody
	public boolean checkId(@RequestParam("id") Integer id){
		return !permissionService.checkPermissionId(id);
	}
	
	/**
	 *                   ����Ȩ��fatherid��ȡ��¼
	 * @param fatherid   fatherid
	 * @return           ���������ļ�¼
	 */
	@RequestMapping(value="getPermissionByFatherid.do")
	@ResponseBody
	public List<QCPermission> getPermissionByFatherid(Integer fatherid){
		return permissionService.getPermissionByFatherid(fatherid);
	}
	
}
