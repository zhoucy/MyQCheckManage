package com.gangdian.qc.controller;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gangdian.qc.model.QCCheckProject;
import com.gangdian.qc.model.QCUser;
import com.gangdian.qc.service.QCCheckProjectService;


@Controller
@RequestMapping(value="/qc")
public class QCProjectController {
	
	@Autowired
	private QCCheckProjectService projectService;

	
	@RequestMapping(value = "addQCProject.do")
	@ResponseBody
	public boolean addProject(QCCheckProject project) throws Exception {
		
		return this.projectService.insert(project);
		
		
	}


	/**
	 * 
	 * @param id 项目编码
	 * @param name 项目名称
	 * @param rows 每页显示的行数
	 * @param page  当前页数
	 * @param sort  排序字段
	 * @param order  排序方式
	 * @return 带总页数，和当前页面显示的项目 的 集合
	 */
	@RequestMapping(value="searchQCProject.do")
	@ResponseBody
	public  Map<String, Object> searchQCProject(QCCheckProject project,
			String rows,String page){
		//start index
		int startIndex=(Integer.parseInt(page)-1)*Integer.parseInt(rows);		
		List<QCCheckProject> l= this.projectService.queryPageProject(project.getId(), project.getName(), startIndex,Integer.parseInt(rows));
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", this.projectService.getProjectCount(project));
		jsonMap.put("rows", l);
		return jsonMap;
	}
	/**
	 * @param id qc项目编码
	 * @return model 返回带消息的当前页面
	 * */
	@RequestMapping(value="deleteQCProject.do")
	@ResponseBody
	public  boolean deleteQCProject(String id) throws Exception{
		return this.projectService.deleteByPrimaryKey(id);
		
	}
	
	
	@RequestMapping(value="modifyQCProject.do")
	@ResponseBody
	public boolean  modifyQCProject(QCCheckProject project) throws Exception{
		
		return	this.projectService.updateByPrimaryKeySelective(project);
			
		
	}
	

	@RequestMapping(value="checkProject.do")
	@ResponseBody
	public boolean checkUser(@RequestParam("id") String id) throws Exception{
		QCCheckProject project=this.projectService.selectByPrimaryKey(id);
		if(null!=project)return false;
		else return true;
	}
}
