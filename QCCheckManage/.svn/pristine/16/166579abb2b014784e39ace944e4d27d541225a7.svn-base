package com.gangdian.qc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.gangdian.qc.model.QCRole;
import com.gangdian.qc.model.QCUser;
import com.gangdian.qc.model.User2Role;
import com.gangdian.qc.service.DepartmentService;
import com.gangdian.qc.service.QCRoleService;
import com.gangdian.qc.service.QCUserService;
import com.gangdian.qc.service.impl.QCUserServiceImpl;
import com.springmvc.util.Const;

@Controller
@RequestMapping(value="/qc")
public class UserController {
	
	@Autowired
	private  QCUserService 	userService;
	
	@Autowired
	private  QCRoleService roleService;
	@Autowired
	private  DepartmentService dptService;
	
	@RequestMapping(value = "addQCUser.do")
	@ResponseBody
	public boolean addUser(QCUser user) throws Exception {
		int status= this.userService.addQCUser(user);
		if(status>=1){
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="searchQCUser.do")
	@ResponseBody
	public  Map<String, Object> searchQCUser(QCUser user,
			String rows,String page){
		int startIndex=(Integer.parseInt(page)-1)*Integer.parseInt(rows);		
		List<QCUser> l= this.userService.queryPageQCUser(user.getId(),user.getName(),startIndex, Integer.parseInt(rows));
		//List<QCUser> l1= this.userService.queryPageQCUser1(user,startIndex, Integer.parseInt(rows));
		for(int i=0;i<l.size();i++){
			QCUser u=l.get(i);
			u.setUser2Role(userService.getRoleName(u.getId()));
			u.setDpt(dptService.getDeptById(u.getGroupid()));
			
		}
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", this.userService.getAllQCUsersNumbers(user));
		jsonMap.put("rows", l);
		return jsonMap;
	}
	
  
	@RequestMapping(value="searchUserBy.do")
	@ResponseBody
	public  Map<String, Object>  searchUserBy(QCUser user ){
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<QCUser> users= this.userService.selectByOther(user);
		jsonMap.put("total", 5);
		jsonMap.put("rows", users);
		return jsonMap;
		
		
	}
	
	/**
	 * @param id qc项目编码
	 * @return model 返回带消息的当前页面
	 * @throws Exception 
	 * */
/*	@RequestMapping(value="deleteQCUser.do")
	public  ModelAndView deleteQCUser(String id) throws Exception{
		this.userService.deleteQCUser(id);
		ModelAndView	model=new ModelAndView("qc/QCUser");
		model.addObject("message","删除成功");
		return model;
	}
	*/
	
	@RequestMapping(value="deleteQCUser.do")
	@ResponseBody
	public boolean deleteUser(@RequestParam("id") String id) throws Exception{
		int status=this.userService.deleteQCUser(id);
		if(status>=1){
			return true;
		}else{
			return false;
		}
	}
	
	@RequestMapping(value="modifyQCUser.do")
	@ResponseBody
	public boolean  modifyQCUser(QCUser qcUser) throws Exception{
		int status=this.userService.updateQCUser(qcUser);
		if(status>=1){
			return true;
		}else{
			return false;
		}
	}
	
	@RequestMapping(value="checkUser.do")
	@ResponseBody
	public boolean checkUser(QCUser qcUser){
		QCUser user=this.userService.getUserById(qcUser.getId());
		if(user!=null) return false;
		else return true;
	}
	
	@RequestMapping(value="getAllRole.do")
	@ResponseBody
	public  List<QCRole> getAllRole(){
		
		return roleService.getAllRole();
	}
	
	@RequestMapping(value="assign.do")
	@ResponseBody
	public String assign(@RequestParam("userId") String userId,@RequestParam("roleId") Integer roleId){
		User2Role record=new User2Role(null, userId, roleId, null);
		try {
			userService.assignRoles(record);
			return "分配成功";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return e.getMessage();
		}	
	}
	
	/**
	 *              获取 与user表关联的所有信息
	 * @param uid   用户id
	 * @param rid   角色id
	 * @param pid   权限id
	 * @return      user表关联的信息记录
	 */
	@RequestMapping(value="getUserUnionById.do")
	@ResponseBody
	public List<Map<String, Object>> getUserUnionById(Integer uid,Integer rid,Integer pid){
		return userService.getUserUnionById(uid,rid,pid);
	}
	
	/**
	 *                   根据角色id分页获取用户信息
	 * @param rid        角色id
	 * @param rows       每页大小
	 * @param page       页码
	 * @param sort       排序列
	 * @param order      升序降序
	 * @return
	 */
	@RequestMapping(value="getUserPageListByRid.do")
	@ResponseBody
	public Map<String, Object> getUserPageListByRid(Integer rid, Integer rows,
			Integer page, String sort, String order){
		return userService.getUserPageListByRid(rid, rows, page, sort, order);
	}
	
	
}
