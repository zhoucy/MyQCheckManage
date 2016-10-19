package com.gangdian.qc.service;

import java.util.List;

import com.gangdian.qc.model.QCFailDetail;

public interface QCFailDetailService {

	   int insert(QCFailDetail record);

	   int insertSelective(QCFailDetail record);
	   
	    /**
	     * 按照主订单id获取当前的员工分布
	     * @param parentId
	     * @return
	     */
	    List<QCFailDetail> selectByParentId(Integer parentId);
	    
	    int deleteByPrimaryKey(Integer id);
	    
	    int updateFailById(QCFailDetail record);
}
