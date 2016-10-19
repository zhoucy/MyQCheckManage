package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProductPlan;
import com.gangdian.qc.model.QCProductRecord;
import com.gangdian.qc.service.QCProductPlanService;
import com.gangdian.qc.service.QCProductRecordService;


@Controller
@RequestMapping(value="/qc")
public class QCProductPlanController {

	
	@Autowired
	private QCProductPlanService qcppService;
	@Autowired
	private QCProductRecordService prodRecService;
	
	
	
	/**
	 *             添加一条记录
	 * @param qcpp 实体类
	 * @return     返回成功还是失败
	 */
	@RequestMapping(value="addQCPP.do")
	@ResponseBody
	public boolean addQCPP(QCProductPlan qcpp){
		if(qcpp==null){
			qcpp=new QCProductPlan();
		}
		qcpp.setFinishNumber(0);
		qcpp.setProductStatus("待产");
		return qcppService.addQCPP(qcpp);
	}
	@RequestMapping(value="updateStatus.do")
	@ResponseBody
	public boolean updateStatus(Integer id ,String username){
		String productStatus="已完工";
		return qcppService.updateQCPPStatus(productStatus, id, username);
	}
	
	/**
	 *             删除一条记录
	 * @param id   生产计划的id
	 * @return     返回删除成功还是失败
	 */
	@RequestMapping(value="deleteQCPP.do")
	@ResponseBody
	public boolean deleteQCPP(@RequestParam("id") int id){
		return qcppService.deleteQCPP(id);
	}
	
	/**
	 *              更新一条记录
	 * @param qcpp  实体类
	 * @return     返回成功还是失败
	 */
	@RequestMapping(value="updateQCPP.do")
	@ResponseBody
	public boolean updateQCPP(QCProductPlan qcpp){
		return qcppService.updateQCPP(qcpp);
	}
	
	/**
	 *               条件查询
	 * @param qcpp   实体类
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序的列
	 * @param order  升序,降序
	 * @return
	 */
	@RequestMapping(value="searchQCPP.do")
	@ResponseBody
	public Map<String, Object> searchQCPP(QCProductPlan qcpp,
			Integer rows,Integer page,String sort,String order){
		//烦人的转换
		if(sort!=null&&sort.equals("productSpecific")){
			sort="product_specific";
		}
		if(sort!=null&&sort.equals("orderNumber")){
			sort="order_number";
		}
		if(sort!=null&&sort.equals("productId")){
			sort="product_id";
		}
		if(sort!=null&&sort.equals("finishNumber")){
			sort="finish_number";
		}
		if(sort!=null&&sort.equals("preProductDate")){
			sort="pre_product_date";
		}
		if(sort!=null&&sort.equals("productStatus")){
			sort="product_status";
		}
		if(sort!=null&&sort.equals("preShipmentDate")){
			sort="pre_shipment_date";
		}
		return qcppService.searchQCPP(qcpp, rows, page, sort, order);
	}
	
	/**
	 *              重复检查
	 * @param pono  订单号
	 * @return      是否可以使用
	 */
	@RequestMapping(value="checkQCPP.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean checkQCPP(@RequestParam("pono") String pono){
		return !qcppService.checkQCPP(pono);
	}
	
	/**
	 * 获得所有的生产产品
	 * @return
	 */
	@RequestMapping(value="getAllModels")
	@ResponseBody
	public List<QCProductRecord> getAllModels()
	{
		return prodRecService.productGetProgress(null);
		
	}
	
	/**
	 * 通过产品id获得规格
	 * @param id 产品id
	 * @return 生产产品
	 */
	@RequestMapping(value="getSpeById")
	@ResponseBody
	public QCProductRecord getSpeById( @RequestParam("id")Integer id)
	{
		return prodRecService.selectByPrimaryKey(id);
		
	}
		
	
}
