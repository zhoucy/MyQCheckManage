package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCCheckRecord;

public interface QCCheckRecordDao {
	
    int insert(QCCheckRecord record);

    int insertSelective(QCCheckRecord record);
    
    QCCheckRecord selectByPrimaryKey(String id);
    
    int  queryMaxId();
    
    Map querySumRecord(Integer id);
    
    List<Map<String, Object>> queryReportRecord(@Param("groupid") Integer groupid,
    		@Param("id") Integer id,@Param("progress") Integer progress);
    
    List<Map<String, Object>> dateReport2(@Param("groupid") Integer groupid,
    		@Param("id") Integer id);
    
    /**
     *  查询所有产线当前产能 标准工时 以及所产单号所有产能 
     * @return
     */
    List<Map<String, Object>> queryDateProduction(@Param("belongid") Integer belongid);
    
    void deleteByPrimaryKey(Integer id);
}