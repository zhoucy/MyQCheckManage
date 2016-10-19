
package com.gangdian.qc.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("qc")
public class ProductReportController {
	/**
	 * QC检测报表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getQCCheckReport")
	public String  getQCCheckReport(HttpServletRequest request,
			HttpServletResponse response){
		String reportName=request.getParameter("reportName");//报表名称
		String pono = request.getParameter("pono");
		String nowDate  = request.getParameter("productDate");
		String groupid = request.getParameter("groupid");
		String model = request.getParameter("model");
		String prodectType = request.getParameter("prodectType");
		String type=request.getParameter("type");
		String belong=request.getParameter("belong");
	/*	ModelAndView modelAndView=new ModelAndView("jasper/report2");
		modelAndView.addObject("pono", pono);
		modelAndView.addObject("groupid", groupid);
		modelAndView.addObject("model", model);
		modelAndView.addObject("nowDate", nowDate);
		
		modelAndView.addObject("prodectType", prodectType);
		modelAndView.addObject("type", type);*/
		
		request.getSession().setAttribute("pono", pono);
		request.getSession().setAttribute("belong", belong);
		request.getSession().setAttribute("groupid", groupid);
		request.getSession().setAttribute("model", model);
		request.getSession().setAttribute("nowDate", nowDate);
		request.getSession().setAttribute("prodectType", prodectType);
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("reportName", reportName);
		return "redirect:/jasper/QCRecordReport.jsp";
		
		
	}
	/**
	 * 不良品条形码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getQCBadProject")
	public String  getQCBadProject(HttpServletRequest request,
			HttpServletResponse response){
		
		String project = request.getParameter("prodectType");
		String type=request.getParameter("type");
		
		request.getSession().setAttribute("project", project);
		request.getSession().setAttribute("type", type);
		
		return "redirect:/jasper/barcode.jsp";
		
		
	}
	/**
	 * 良品条形码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getQCGoodProject")
	public ModelAndView  getQCGoodProject(HttpServletRequest request,
			HttpServletResponse response){
		String project = request.getParameter("prodectType");
		String type=request.getParameter("type");
		ModelAndView modelAndView=new ModelAndView("jasper/goodProject");
		modelAndView.addObject("project", project);
		modelAndView.addObject("type", type);
		modelAndView.addObject("reportType","goodProject");
		request.getSession().setAttribute("reportType", "goodProject");
		request.getSession().setAttribute("type", type);
		return modelAndView;
	}
	/**
	 * 日报表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="getQCDateReport")
	public String  getQCDateReport(HttpServletRequest request,
			HttpServletResponse response){
		String reportName=request.getParameter("reportName");//报表名称
		String pono = request.getParameter("pono");//PONO
		String nowDate  = request.getParameter("productDate");//日期
		String startDate  = request.getParameter("startDate");//日期
		String groupid = request.getParameter("groupid");//组别
		String model = request.getParameter("model");//产品规格
		String prodectType = request.getParameter("prodectType");//产品类型
		String type=request.getParameter("type");//导出类型
		String targetProduct = request.getParameter("targetProduct");//目标产能
		String standardProduct = request.getParameter("standardProduct");//标准产能
		String sumWorker=request.getParameter("sumWorker");//投入人数
		String belong=request.getParameter("belong");//投入人数
		
		request.getSession().setAttribute("reportName", reportName);
		request.getSession().setAttribute("belong", belong);
		request.getSession().setAttribute("pono", pono);
		request.getSession().setAttribute("groupid", groupid);
		request.getSession().setAttribute("model", model);
		request.getSession().setAttribute("nowDate", nowDate);
		request.getSession().setAttribute("prodectType", prodectType);
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("standardProduct", standardProduct);
		request.getSession().setAttribute("targetProduct", targetProduct);
		request.getSession().setAttribute("sumWorker", sumWorker);
		request.getSession().setAttribute("startDate", startDate);
		return "redirect:/jasper/ProductionDateReport.jsp";
		
		/*ModelAndView modelAndView=new ModelAndView("jasper/ProductionDateReport");
		modelAndView.addObject("pono", pono);
		modelAndView.addObject("groupid", groupid);
		modelAndView.addObject("model", model);
		modelAndView.addObject("nowDate", nowDate);
		modelAndView.addObject("targetProduct", targetProduct);
		modelAndView.addObject("standardProduct", standardProduct);
		modelAndView.addObject("sumWorker", sumWorker);
		
		modelAndView.addObject("prodectType", prodectType);
		modelAndView.addObject("type", type);
		
		
		return modelAndView;
		*/
		
	}
	


}
