package com.gangdian.qc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProductPlanDao;
import com.gangdian.qc.model.QCProductPlan;
import com.gangdian.qc.service.QCProductPlanService;


@Service
public class QCProductPlanServiceImpl implements QCProductPlanService {
	
	@Autowired
	private QCProductPlanDao qcppDao;
	
	/**
	 *             增加一条记录
	 * @param qcpp 实体类
	 * @return     成功还是失败
	 */
	public boolean addQCPP(QCProductPlan qcpp) {
		int result=qcppDao.addQCPP(qcpp);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 * 
	 *            删除一条记录
	 * @param id  生产计划的id
	 * @return    成功还是失败
	 */
	public boolean deleteQCPP(Integer id) {
		int result=qcppDao.deleteQCPP(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	
	/**
	 *               更新一条记录
	 * @param qcpp   实体类
	 * @return       成功还是失败
	 */
	public boolean updateQCPP(QCProductPlan qcpp) {
		int result=qcppDao.updateQCPP(qcpp);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	/**
	 *             根据id获取记录
	 * @param id   生产计划id
	 * @return     成功还是失败
	 */
	public QCProductPlan getQCPPById(Integer id) {
		return qcppDao.getQCPPByID(id);
	}

	/**
	 *                重复检查
	 * @param pono    生产单号
	 * @return        是否可用
	 */
	public boolean checkQCPP(String pono) {
		List<QCProductPlan> qcppList=qcppDao.checkQCPP(pono);
		if(qcppList!=null&&qcppList.size()>=1){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 *               返回分页查询总记录数
	 * @param qcpp   实体类
	 * @return       记录数
	 */
	public int getQCPPPageSize(QCProductPlan qcpp) {
		return qcppDao.getQCPPPageSize(qcpp);
	}

	/**
	 *               分页查询结果
	 * @param qcpp   实体类
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序的列
	 * @param order  升序还是降序
	 * @return       返回符合条件的结果
	 */
	public List<QCProductPlan> getQCPPPageList(QCProductPlan qcpp,
			Integer rows, Integer page, String sort, String order) {
		return qcppDao.getQCPPPageList(qcpp, rows, page, sort, order);
	}

	/**
	 *               分页查询结果
	 * @param qcpp   实体类
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序的列
	 * @param order  升序还是降序
	 * @return       返回符合条件的结果
	 */
	public Map<String, Object> searchQCPP(QCProductPlan qcpp, Integer rows,
			Integer page, String sort, String order) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<QCProductPlan> result=getQCPPPageList(qcpp, rows, page, sort, order);
		map.put("total", getQCPPPageSize(qcpp));
		map.put("rows", result);
			
		//增加footer,显示平均值和合计,不需要计算的请无视
		List<QCProductPlan> footer=new ArrayList<QCProductPlan>();
		if(result!=null&&result.size()>0){
			QCProductPlan average=new QCProductPlan();
			QCProductPlan total=new QCProductPlan();
			Integer total1=0;
			Integer total2=0;
			for (QCProductPlan temp : result) {				
				if(temp.getOrderNumber()!=null){total1=total1+temp.getOrderNumber();}
				if(temp.getFinishNumber()!=null){total2=total2+temp.getFinishNumber();}				
			}
			average.setModel("平均值:");
			average.setOrderNumber(total1/result.size());
			average.setFinishNumber(total2/result.size());
			total.setModel("共计:");
			total.setOrderNumber(total1);
			total.setFinishNumber(total2);
			footer.add(total);
			footer.add(average);
		}
		map.put("footer", footer);
		
		return map;
	}

	/**
	 *            返货所有的订单号
	 * @return
	 */
	public List<String> getAllPonos() {
		List<QCProductPlan> qcpplist=qcppDao.getAllQCPP();
		List<String> result=new ArrayList<String>();
		if(qcpplist!=null&&qcpplist.size()>0){
			for (QCProductPlan qcpp : qcpplist) {
				result.add(qcpp.getPono());
			}
		}
		return result;
	}

	/**
	 *                根据生产单号获取mode
	 * @param pono    生产单号
	 * @return        返回model
	 */
	public QCProductPlan getByPono(String pono) {
		return qcppDao.getByPono(pono);
	}

	public boolean updateQCPPStatus(String productStatus, int id, String lastUpUser) {
		int result=qcppDao.updateQCPPStatus(productStatus, id, lastUpUser);
		if(result>=1){
			return true;
		}else{
			return false;
		}		
	}


}
