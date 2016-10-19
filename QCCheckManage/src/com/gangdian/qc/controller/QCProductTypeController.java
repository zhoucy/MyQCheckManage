package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProductType;
import com.gangdian.qc.service.QCProductTypeService;


@Controller
@RequestMapping(value="/qc")
public class QCProductTypeController {

	
	@Autowired
	private QCProductTypeService qcptService;
	/**
	 *              添加一条记录
	 * @param qcpt  实体类
	 * @return      返回添加结果
	 */
	@RequestMapping("addQCPT.do")
	@ResponseBody
	public boolean addQCPT(QCProductType qcpt){
		return qcptService.addQCPT(qcpt);
	}
	
	/**
	 *            删除一条记录
	 * @param id  id
	 * @return    删除结果
	 */
	@RequestMapping("deleteQCPT.do")
	@ResponseBody
	public boolean deleteQCPT(Integer id){
		return qcptService.deleteQCPT(id);
	}
	
	/**
	 *               更新一条记录
	 * @param qcpt   实体类
	 * @return       更新结果
	 */
	
	@RequestMapping("updateQCPT.do")
	@ResponseBody
	public boolean updateQCPT(QCProductType qcpt){
		return qcptService.updateQCPT(qcpt);
	}
	
	/**
	 *                     分页条件查询
	 * @param qcpt         实体类
	 * @param rows         每页大小
	 * @param page         页码
	 * @param sort         排序列
	 * @param order        升序,降序
	 * @return
	 */
	@RequestMapping("searchQCPT.do")
	@ResponseBody
	public Map<String, Object> searchQCPT(QCProductType qcpt,
			Integer rows,Integer page, String sort, String order){
		return qcptService.getQCPTPageList(qcpt, rows, page, sort, order);
	}
	
	/**
	 *                  产品类型编号重复检查
	 * @param QCPTnum   产品类型编号
	 * @return          检查结果
	 */
	@RequestMapping("checkQCPTNum.do")
	@ResponseBody
	public boolean checkQCPTNum(String QCPTnum){
		return !qcptService.checkNO(QCPTnum);
	}
	
	/**
	 *                产品类型名称重复检查
	 * @param name    产品类型名称
	 * @return        检查结果
	 */
	@RequestMapping("checkQCPTName.do")
	@ResponseBody
	public boolean checkQCPTName(String name){
		return !qcptService.checkName(name);
	}
	
	/**
	 *            获取全部的产品类型
	 * @return
	 */
	@RequestMapping("getAllQCPT.do")
	@ResponseBody
	public List<QCProductType> getAllQCPT(){
		return qcptService.getAllQCPT();
	}
	
	
}
