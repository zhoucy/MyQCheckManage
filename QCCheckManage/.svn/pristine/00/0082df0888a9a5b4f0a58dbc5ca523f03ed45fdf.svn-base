package com.gangdian.qc.service;

import java.util.List;

import com.gangdian.qc.model.QCWorkerDetail;

public interface QCWorkDetailService {

	int insert(QCWorkerDetail record);

    int insertSelective(QCWorkerDetail record);
    
    /**
     * 按时间段和主订单id更新
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(QCWorkerDetail record);
    
  /**
   * 按时间段和主订单id更新
   * @param record 	 QCWorkerDetail 调入调出对象
   * @param period  String[] 时间段数组
   * @return
   */
    boolean updateByPrimaryKeySelective(QCWorkerDetail record,String[] period);
    
    
    int updateByPrimaryKey(QCWorkerDetail record);
    
    /**
     * 按照主订单id获取当前的员工分布
     * @param parentId
     * @return
     */
    List<QCWorkerDetail> selectByParentId(Integer parentId);
    
    
    /**
     * 根据组别获取员工信息当天的汇总信息
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectByGroup(Integer groupid);
    
    
    /**
     * 根据组别获取员工信息当天的详细信息
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectBySumGroup(Integer groupid,Integer id,Integer progress);
}
