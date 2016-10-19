package com.gangdian.qc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gangdian.qc.model.Department;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCGroup;
import com.gangdian.qc.model.QCPermission;
import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.model.QCRole;
import com.gangdian.qc.model.QCUser;
import com.gangdian.qc.model.User2Role;
import com.gangdian.qc.service.DepartmentService;
import com.gangdian.qc.service.ProductMainService;
import com.gangdian.qc.service.QCGroupService;
import com.gangdian.qc.service.QCProgressService;
import com.gangdian.qc.service.QCRoleService;
import com.gangdian.qc.service.QCUserService;
import com.springmvc.common.ProductTypeEnum;
import com.springmvc.sys.DateUtil;
import com.springmvc.util.CookieUtil;

@Controller
@RequestMapping(value="qc")
public class LoginController {
	
	@Autowired
	private QCUserService qcUserService;
	@Autowired
	private QCRoleService qcRoleService;

	@Autowired
	private DepartmentService dptService;
	
	@Autowired
	private ProductMainService mainService;
	
	@RequestMapping(value = "login.do")
	public String login(HttpServletRequest request,HttpServletResponse response,Map<String, Object> map,QCUser user,String remeberme) {

		String index="";
		QCUser qcuser = this.qcUserService.checkQCUsername(user);
		if (qcuser == null) {
			map.put("message", "用户名或密码错误");
			index= "login";
		} else {
			//存入用户名和 权限url到session 控制权限
			User2Role urs=qcuser.getUser2Role();
			//获取组别
			List<Department> dptList =dptService.getAllDept();
			//获取当前组别的生产信息
			ProductMain main=new ProductMain();
			main.setGroupid(qcuser.getGroupid());
			main.setProductDate(DateUtil.dateToStr(new Date()));
			List<Department> dptList2=new ArrayList<Department>(); 
			if(qcuser.getDpt()!=null){
				dptList2=dptService.getDeptByBelong(qcuser.getDpt().getBelong());
			}
			List<QCPermission> permissionList=new ArrayList<QCPermission>();
			if(null!=urs){
				QCRole roles=qcRoleService.roleGetPermission(urs.getRoleId());
				if(roles.getId()==2){
					index="redirect:/qc/QCCheck.jsp";
				}else{
					index="redirect:/indexx.jsp";
				}
				
				if(null!=roles){
					
					 permissionList=roles.getPermissionList();
					
					}
					
				}
			request.getSession().setAttribute("productTypes", ProductTypeEnum.values());
			request.getSession().setAttribute("dptList", dptList);
			request.getSession().setAttribute("groupid", qcuser.getGroupid());
			request.getSession().setAttribute("name", qcuser.getName());
			request.getSession().setAttribute("permissionList", permissionList);
			//保存到cookie
			if(remeberme!=null&&remeberme.trim().equals("on")){
				CookieUtil.saveCookie(qcuser, response);
			}
		}
		return index;
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		//清除cookie
		CookieUtil.clearCookie(response);
		HttpSession session = request.getSession();
		if (session != null) {
			Object obj = session.getAttribute("name");
			if (obj != null) {
				//移除session
				session.removeAttribute("name");
			
			}
			session.invalidate();
		}
		return "login";

	}
}
