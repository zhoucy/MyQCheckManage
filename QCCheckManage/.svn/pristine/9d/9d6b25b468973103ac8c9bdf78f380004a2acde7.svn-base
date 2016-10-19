package com.springmvc.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gangdian.qc.model.QCPermission;

public class AdminLoginCheck extends HttpServlet implements Filter {

	// 通过 一个过滤器 Filter 进行权限控制
	private FilterConfig filterConfig;

	// Handle the passed-in FilterConfig

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;

	}

	// Process the request/response pair
	public void doFilter(ServletRequest request, ServletResponse response,      
	                             FilterChain chain) {//System.out.println(this.getClass()+": doFilter()");      
	
		  HttpServletRequest servletRequest = (HttpServletRequest)request;      
//		    try {
//			chain.doFilter(servletRequest, response);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (ServletException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}      
	            HttpServletResponse servletResponse = (HttpServletResponse)response;      
	            HttpSession ses = servletRequest.getSession();      
	            List<QCPermission> urlList =( List<QCPermission>) ses.getAttribute("permissionList");  
	            String path = servletRequest.getRequestURI();
	           
	            try {//System.out.println("in Adminloginf........"); 
	            	 if (path.endsWith("do")) {
	 	    			chain.doFilter(servletRequest, servletResponse);
	 	    			return;
	 	    		}
	                if(urlList ==null)      
	                {      
	                	servletResponse.sendRedirect(servletRequest.getContextPath());      
	                }else{      
	                 Boolean allow= false ;      
	                 for(int i=0;i<urlList.size();i++){
	                    if(urlList.get(i).getUrl().equals(servletRequest.getServletPath())){      
	                    	allow=true;      
	                    }      
	                 }      
	                 if(allow){      
	                	 chain.doFilter(servletRequest, servletResponse);} 
	                 else {
	                	 servletResponse.sendRedirect("/QCCheckManage/failure.jsp");}
	                }  
	            } catch (ServletException sx) {      
	                filterConfig.getServletContext().log(sx.getMessage());      
	            } catch (IOException iox) {      
	                filterConfig.getServletContext().log(iox.getMessage());      
	            }     
	        }

	// Clean up resources
	public void destroy() {
	}
}