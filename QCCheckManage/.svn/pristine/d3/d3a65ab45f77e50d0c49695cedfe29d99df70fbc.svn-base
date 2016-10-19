package com.gangdian.qc.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCGroup;
import com.gangdian.qc.service.QCGroupService;


@Controller
@RequestMapping(value="/qc")
public class QCGroupController {

	
	@Autowired
	private QCGroupService groupService;
	
	/**
	 *               增加一条记录
	 * @param group  实体类	
	 * @return       结果
	 */
	@RequestMapping("addGroup.do")
	@ResponseBody
	public boolean addGroup(QCGroup group){
		return groupService.addGroup(group);
	}
	/**
	 *            删除一条记录
	 * @param id  id
	 * @return    结果
	 */
	@RequestMapping("deleteGroup.do")
	@ResponseBody
	public boolean deleteGroup(Integer id){
		return groupService.deleteGroup(id);
	}
	/**
	 *              (根据id)更新一条记录
	 * @param group 实体类
	 * @return      结果
	 */
	@RequestMapping("updateGroup.do")
	@ResponseBody
	public boolean updateGroup(QCGroup group){
		return groupService.updateGroup(group);
	}
	/**
	 *               条件分页查询
	 * @param group  实体类(查询条件)
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序列
	 * @param order  升序降序
	 * @return       返回符合条件的结果
	 */
	@RequestMapping("searchGroup.do")
	@ResponseBody
	public Map<String, Object> searchGroup(QCGroup group,Integer rows,
			Integer page, String sort, String order){
		return groupService.getGroupPageList(group, rows, page, sort, order);
	}
	/**
	 *               拉别编号重复检查
	 * @param code   编号
	 * @return       返回检查结果
	 */
	@RequestMapping("checkGroupCode.do")
	@ResponseBody
	public boolean checkGroup(@RequestParam("code") String code){
		return !groupService.checkCode(code.trim());
	}
	
}
