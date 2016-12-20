package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.service.ProductMainService;

@Controller
@RequestMapping("qc")
public class ProductMainController {
	
	@Autowired
	private ProductMainService mainService;
	
	/**
	 *           删除一条记录
	 * @param id 被删除对象的id
	 * @return   结果
	 */
	@RequestMapping("deleteMain.do")
	@ResponseBody
	public boolean deleteMain(Integer id){
		return mainService.deleteByPrimaryKey(id);
	}
	
	/**
	 *               更新一条记录
	 * @param Main   实体类
	 * @return       结果
	 */
	@RequestMapping("updateMain.do")
	@ResponseBody
	public boolean updateMain(ProductMain main){
		return mainService.updateByPrimaryKeySelective(main);
	}
	
	/**
	 *                    分页条件查询
	 * @param main        实体类
	 * @param rows        每页大小
	 * @param page        页码
	 * @param sort        排序列
	 * @param order       升序降序
	 * @return            符合条件的记录
	 */
	@RequestMapping("searchMain.do")
	@ResponseBody
	public Map<String, Object> searchMain(ProductMain main, Integer rows,Integer page, String sort, String order){
		return mainService.getMainPageList(main, rows, page, sort, order);
	}
	
	//根据组别获取当天的订单生产信息(根据刷卡序列号数量)
	@RequestMapping("getTodayPMByGroupid.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayPMByGroupid(Integer groupid){
		return mainService.getTodayPMByGroupid(groupid);
	}
	
	// 根据组别获取当天的订单生产信息(根据生成计划订单的完成数量)
	@RequestMapping("getTodayPMByGroupidFromPlan.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayPMByGroupidFromPlan(Integer groupid,String productDate) {
		return mainService.getTodayPMByGroupidFromPlan(groupid,productDate);
	}
	
	//根据组别获取当天正在生产中的订单的id
	@RequestMapping("lockProducingQCPM.do")
	@ResponseBody
	public Map<String, Object> lockProducingQCPM(Integer groupid){
		return mainService.lockProducingQCPM(groupid);
	}
	//根据组别获取当前订单
	@RequestMapping("nowProduction.do")
	@ResponseBody
	public ProductMain nowProduction(Integer groupid){
		ProductMain main=new ProductMain();
		main.setGroupid(groupid);
		return mainService.selectByOtherMax(main);
	}
	
	//根据组别和日期获取pm
	@RequestMapping("getPMByGroupidAndProductDate.do")
	@ResponseBody
	public List<Map<String, Object>> getPMByGroupidAndProductDate(Integer groupid,String productDate){
		return mainService.getPMByGroupidAndProductDate(groupid, productDate);
	}
}

