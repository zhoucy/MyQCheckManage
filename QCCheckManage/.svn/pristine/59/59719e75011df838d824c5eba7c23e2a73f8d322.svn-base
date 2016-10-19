	package com.springmvc.filter;
	
	import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
	
	import javax.servlet.Filter;
	import javax.servlet.FilterChain;
	import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
	import javax.servlet.ServletException;
	import javax.servlet.ServletRequest;
	import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gangdian.qc.controller.LoginController;
import com.gangdian.qc.model.QCUser;
import com.springmvc.util.CookieUtil;

	
	public class LoginFilter implements Filter {
	
		
		//为了调用login方法
		private LoginController loginController;		
		public void init(FilterConfig filterConfig) throws ServletException {
			ServletContext context=filterConfig.getServletContext();
			ApplicationContext ctx=WebApplicationContextUtils.getWebApplicationContext(context);
			loginController=(LoginController)ctx.getBean("loginController");
		}
	
		public void doFilter(ServletRequest request, ServletResponse response,
				FilterChain chain) throws IOException, ServletException {
			// 获得在下面代码中要用的request,response,session对象
			HttpServletRequest servletRequest = (HttpServletRequest) request;
			HttpServletResponse servletResponse = (HttpServletResponse) response;
			HttpSession session = servletRequest.getSession();
	
			// 获得用户请求的URI
			String path = servletRequest.getRequestURI();
	
			// 从session里取员工工号信息
			//session.removeAttribute("name");
			String name = (String) session.getAttribute("name");
	
			/*
			 * 创建类Constants.java，里面写的是无需过滤的页面 for (int i = 0; i <
			 * Constants.NoFilter_Pages.length; i++) {
			 * 
			 * if (path.indexOf(Constants.NoFilter_Pages[i]) > -1) {
			 * chain.doFilter(servletRequest, servletResponse); return; } }
			 */
	
			// 登陆页面无需过滤
			if (path.indexOf("login") > -1) {
				chain.doFilter(servletRequest, servletResponse);
				return;
			}
	        
			// 判断如果没有取到员工信息,就跳转到登陆页面
			if (name == null || "".equals(name)) {
				//增加的代码					
				//从cookie中获取用户名和密码并封装到user中
				QCUser user=CookieUtil.readCookie(servletRequest, servletResponse);
				//调用controller的登录方法,根据index跳转不同的页面
				if(user==null){
					servletResponse.sendRedirect("/QCCheckManage/login.jsp");
				}else{
					Map<String, Object> map=new HashMap<String, Object>();
					String index=loginController.login(servletRequest, servletResponse, map, user,null);
					if(index.contains(":/")){
				    	int i=index.indexOf(":/")+2;
				    	index=index.substring(i);
				    }else if(index=="login"||StringUtils.isEmpty(index)){
				    	index="login.jsp";
				    }
					servletResponse.sendRedirect("/QCCheckManage/"+index);
				}								
			} else {
				// 已经登陆,继续此次请求
				chain.doFilter(request, response);
			}
	
		}
	
		public void destroy() {
			// TODO Auto-generated method stub
	
		}
	
	}