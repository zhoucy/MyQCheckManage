package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProductPlan;

public interface QCProductPlanService {

	
	
	
	/**
	 *             增加一条记录
	 * @param qcpp 实体类
	 * @return     成功还是失败
	 */
	public boolean addQCPP(QCProductPlan qcpp);
	/**
	 * 
	 *            删除一条记录
	 * @param id  生产计划的id
	 * @return    成功还是失败
	 */
	public boolean deleteQCPP(Integer id);
	/**
	 *               更新一条记录
	 * @param qcpp   实体类
	 * @return       成功还是失败
	 */
	public boolean updateQCPP(QCProductPlan qcpp);
	/**
	 *             根据id获取记录
	 * @param id   生产计划id
	 * @return     成功还是失败
	 */
	public QCProductPlan getQCPPById(Integer id);
	/**
	 *                重复检查
	 * @param pono    生产单号
	 * @return        是否可用
	 */
	public boolean checkQCPP(String pono);
	/**
	 *               返回分页查询总记录数
	 * @param qcpp   实体类
	 * @return       记录数
	 */
	public int getQCPPPageSize(QCProductPlan qcpp);
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
			Integer rows,Integer page,String sort,String order);
	/**
	 *               分页查询结果
	 * @param qcpp   实体类
	 * @param rows   每页大小
	 * @param page   页码
	 * @param sort   排序的列
	 * @param order  升序还是降序
	 * @return       返回符合条件的结果
	 */
	public Map<String, Object> searchQCPP(QCProductPlan qcpp,
			Integer rows,Integer page,String sort,String order);
	
	/**
	 *            返货所有的订单号
	 * @return
	 */
	public List<String> getAllPonos();
	/**
	 *                根据生产单号获取mode
	 * @param pono    生产单号
	 * @return        返回model
	 */
	public QCProductPlan getByPono(String pono);
	
	
    //zhoucy  更新订单状态为完工
    public boolean updateQCPPStatus(String productStatus,
    					 int id,
    					 String lastUpUser);

}
