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
	 *                     ����һ����¼
	 * @param progress     ʵ����
	 * @return             ���
	 */
	@RequestMapping("addProgress.do")
	@ResponseBody
	public boolean addProgress(QCProgress progress){
		return progressService.addProgress(progress);
	}
	/**
	 * 
	 *             ɾ��һ����¼
	 * @param id   id
	 * @return     ���
	 */
	@RequestMapping("deleteProgress.do")
	@ResponseBody
	public boolean deleteProgress(Integer id){
		return progressService.deleteProgress(id);
	}
	
	/**
	 *                   ����һ����¼
	 * @param progress   ʵ����
	 * @return           ���
	 */
	@RequestMapping("updateProgress.do")
	@ResponseBody
	public boolean updateProgress(QCProgress progress){
		return progressService.updateProgress(progress);
	}
	
	/**
	 *                     ��ҳ������ѯ
	 * @param progress     ʵ����
	 * @param rows         ÿҳ��С
	 * @param page         ҳ��
	 * @param sort         ������
	 * @param order        ������
	 * @return             ��ҳ���
	 */
	@RequestMapping("searchProgress.do")
	@ResponseBody
	public Map<String, Object> searchProgress(QCProgress progress,
			Integer rows,Integer page, String sort, String order){
		return progressService.getProgressPageList(progress, rows, page, sort, order);
	}
	
	/**
	 *                ������ظ����
	 * @param code    ����
	 * @return        ���
	 */
	@RequestMapping("checkProgressCode.do")
	@ResponseBody
	public boolean checkProgressCode(Integer code){
		return !progressService.checkCode(code);
	}
	/**
	 *                 ���Ƶ��ظ����
	 * @param name     ����
	 * @return         ���
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
