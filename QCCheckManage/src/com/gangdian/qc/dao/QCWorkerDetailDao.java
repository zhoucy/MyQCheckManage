package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCWorkerDetail;

public interface QCWorkerDetailDao {
	
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
    int updateByPrimaryKeySelective(Map map);

    
    
    /**
     * 按照主订单id获取当前的员工分布
     * @param parentId
     * @return
     */
    List<QCWorkerDetail> selectByParentId(Integer parentId);
    
    
    int updateByPrimaryKey(QCWorkerDetail record);
    
    /**
     * 根据组别获取员工信息当天的汇总信息
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectBySumGroup(@Param("groupid") Integer groupid,@Param("id") Integer id,
    		@Param("progress") Integer progress);
    /**
     * 根据组别获取员工信息当天的详细信息
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectByGroup(Integer groupid);
}