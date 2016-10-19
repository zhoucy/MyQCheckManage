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
	 *             ���һ����¼
	 * @param qcpp ʵ����
	 * @return     ���سɹ�����ʧ��
	 */
	@RequestMapping(value="addQCPP.do")
	@ResponseBody
	public boolean addQCPP(QCProductPlan qcpp){
		if(qcpp==null){
			qcpp=new QCProductPlan();
		}
		qcpp.setFinishNumber(0);
		qcpp.setProductStatus("����");
		return qcppService.addQCPP(qcpp);
	}
	@RequestMapping(value="updateStatus.do")
	@ResponseBody
	public boolean updateStatus(Integer id ,String username){
		String productStatus="���깤";
		return qcppService.updateQCPPStatus(productStatus, id, username);
	}
	
	/**
	 *             ɾ��һ����¼
	 * @param id   �����ƻ���id
	 * @return     ����ɾ���ɹ�����ʧ��
	 */
	@RequestMapping(value="deleteQCPP.do")
	@ResponseBody
	public boolean deleteQCPP(@RequestParam("id") int id){
		return qcppService.deleteQCPP(id);
	}
	
	/**
	 *              ����һ����¼
	 * @param qcpp  ʵ����
	 * @return     ���سɹ�����ʧ��
	 */
	@RequestMapping(value="updateQCPP.do")
	@ResponseBody
	public boolean updateQCPP(QCProductPlan qcpp){
		return qcppService.updateQCPP(qcpp);
	}
	
	/**
	 *               ������ѯ
	 * @param qcpp   ʵ����
	 * @param rows   ÿҳ��С
	 * @param page   ҳ��
	 * @param sort   �������
	 * @param order  ����,����
	 * @return
	 */
	@RequestMapping(value="searchQCPP.do")
	@ResponseBody
	public Map<String, Object> searchQCPP(QCProductPlan qcpp,
			Integer rows,Integer page,String sort,String order){
		//���˵�ת��
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
	 *              �ظ����
	 * @param pono  ������
	 * @return      �Ƿ����ʹ��
	 */
	@RequestMapping(value="checkQCPP.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean checkQCPP(@RequestParam("pono") String pono){
		return !qcppService.checkQCPP(pono);
	}
	
	/**
	 * ������е�������Ʒ
	 * @return
	 */
	@RequestMapping(value="getAllModels")
	@ResponseBody
	public List<QCProductRecord> getAllModels()
	{
		return prodRecService.productGetProgress(null);
		
	}
	
	/**
	 * ͨ����Ʒid��ù��
	 * @param id ��Ʒid
	 * @return ������Ʒ
	 */
	@RequestMapping(value="getSpeById")
	@ResponseBody
	public QCProductRecord getSpeById( @RequestParam("id")Integer id)
	{
		return prodRecService.selectByPrimaryKey(id);
		
	}
		
	
}
