package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCCheckRecord;
import com.gangdian.qc.model.QCProductPlan;
import com.gangdian.qc.model.QCWorkerDetail;

public interface QCCheckRecordService {

	 int insert(QCCheckRecord record);

	 int insertSelective(QCCheckRecord record);
	 
	 QCCheckRecord selectByPrimaryKey(String id);
	    
	 int  queryMaxId();
	 
	 Map querySumRecord(Integer id);
	 
	 int deleteByPrimaryKey(Integer id);
	 /**
	  * 新增主订单时 同时插入记录表和默认的员工分布表
	  * @param main
	  * @param record
	  * @param workerDetail
	  * @throws Exception
	  */
	 void  insertNewRecord(ProductMain main,QCCheckRecord record,QCWorkerDetail workerDetail) throws Exception ;
	 /**
	  * - 查询当天所在组别所有产能 关联一个 QCCheckProjectTemp 防止数据缺失-->
	  * @param groupid 组别
	  * @param id (可为空) 父id 
	  * @return
	  */
	 List<Map<String, Object>> queryReportRecord(Integer groupid,Integer id,Integer progress);
	 
	 /**
	  * 通过生产单号获取到对应的产品model和type
	  * @param pono 生产单号
	  * @return
	  */
	 public Map<String,Object> getModelTypeByPono(String pono);
	 
	 
	 public QCProductPlan getByPono(String pono);
	 
	 /**
	     *  查询所有产线当前产能 标准工时 以及所产单号所有产能 
	     * @return
	     */
	 List<Map<String, Object>> queryDateProduction(Integer belongid);
	 /**
	  * 当天组别生产日报 
	  * @param groupid 组别
	  * @param id 订单id 可为空
	  * @return
	  */
	 List<Map<String, Object>> dateReport2(Integer groupid,
	    	 Integer id);
}
