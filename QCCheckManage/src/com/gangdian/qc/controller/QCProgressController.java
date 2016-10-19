package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.service.QCProgressService;

@Controller
@RequestMapping(value="/qc")
public class QCProgressController {

	@Autowired
	private QCProgressService progressService;
	
	/**
	 *                     增加一条记录
	 * @param progress     实体类
	 * @return             结果
	 */
	@RequestMapping("addProgress.do")
	@ResponseBody
	public boolean addProgress(QCProgress progress){
		return progressService.addProgress(progress);
	}
	/**
	 * 
	 *             删除一条记录
	 * @param id   id
	 * @return     结果
	 */
	@RequestMapping("deleteProgress.do")
	@ResponseBody
	public boolean deleteProgress(Integer id){
		return progressService.deleteProgress(id);
	}
	
	/**
	 *                   更新一条记录
	 * @param progress   实体类
	 * @return           结果
	 */
	@RequestMapping("updateProgress.do")
	@ResponseBody
	public boolean updateProgress(QCProgress progress){
		return progressService.updateProgress(progress);
	}
	
	/**
	 *                     分页条件查询
	 * @param progress     实体类
	 * @param rows         每页大小
	 * @param page         页码
	 * @param sort         排序列
	 * @param order        升序降序
	 * @return             分页结果
	 */
	@RequestMapping("searchProgress.do")
	@ResponseBody
	public Map<String, Object> searchProgress(QCProgress progress,
			Integer rows,Integer page, String sort, String order){
		return progressService.getProgressPageList(progress, rows, page, sort, order);
	}
	
	/**
	 *                编码的重复检查
	 * @param code    编码
	 * @return        结果
	 */
	@RequestMapping("checkProgressCode.do")
	@ResponseBody
	public boolean checkProgressCode(Integer code){
		return !progressService.checkCode(code);
	}
	/**
	 *                 名称的重复检查
	 * @param name     名称
	 * @return         结果
	 */
	@RequestMapping("checkProgressName.do")
	@ResponseBody
	public boolean checkProgressName(String name){
		return !progressService.checkName(name);
	}
	
	@RequestMapping("getAllProgress.do")
	@ResponseBody
	public List<QCProgress> getAllProgress(){
		return progressService.getAllProgress();
	}
}
