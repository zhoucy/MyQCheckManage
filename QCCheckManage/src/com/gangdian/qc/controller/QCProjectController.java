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
	 * @param id ��Ŀ����
	 * @param name ��Ŀ����
	 * @param rows ÿҳ��ʾ������
	 * @param page  ��ǰҳ��
	 * @param sort  �����ֶ�
	 * @param order  ����ʽ
	 * @return ����ҳ�����͵�ǰҳ����ʾ����Ŀ �� ����
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
	 * @param id qc��Ŀ����
	 * @return model ���ش���Ϣ�ĵ�ǰҳ��
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
