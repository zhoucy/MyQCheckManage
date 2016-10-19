package com.gangdian.qc.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCWorktime;
import com.gangdian.qc.service.QCWorkTimeServer;


@Controller
@RequestMapping("/qc")
public class QCWorkTimeController {
	
	@Autowired
	private QCWorkTimeServer qcwtServer;
	
	@RequestMapping("addQCWT.do")
	@ResponseBody
	public boolean addQCWT(QCWorktime qcwt){
		return qcwtServer.addQCWT(qcwt);
	}

	@RequestMapping("deleteQCWT.do")
	@ResponseBody
	public boolean deleteQCWT(Integer id){
		return qcwtServer.deleteQCWT(id);
	}
	
	@RequestMapping("updateQCWT.do")
	@ResponseBody
	public boolean updateQCWT(QCWorktime qcwt){
		return qcwtServer.updateQCWT(qcwt);
	}
	
	@RequestMapping("searceQCWT.do")
	@ResponseBody
	public Map<String, Object> searceQCWT(String groupname,String belongname,
			Integer rows,Integer page, String sort, String order){
		return qcwtServer.getQCWTPageList(groupname, belongname, rows, page, sort, order);
	}
	
	@RequestMapping("checkQCWTGroupid.do")
	@ResponseBody
	public boolean checkGroupid(String groupname){
		return !qcwtServer.checkGroupid(groupname);
	}
}
