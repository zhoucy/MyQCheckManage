package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProductDelayCode;

public interface QCProductDelayCodeDao {
	int insert(QCProductDelayCode record);

    int insertSelective(QCProductDelayCode record);   
 
    
    //自定义的方法
    int addQCPC(QCProductDelayCode record);
    
    int deleteQCPC(@Param("id") int id);
    
    int updateQCPC(QCProductDelayCode qcpc);
    
    QCProductDelayCode getQCPCByID(@Param("id") int id);
    
    List<QCProductDelayCode> checkQCOC(@Param("code") String code);
     
    List<QCProductDelayCode> getPageSize(QCProductDelayCode record);
       
    List<QCProductDelayCode> getPageList(@Param("record") QCProductDelayCode record,
    	@Param("rows") Integer rows, @Param("page") Integer page,
    	@Param("sort") String sort,@Param("order") String order);
    
    //获取所有
    List<QCProductDelayCode> getAllQCPC();
    //根据代码查询部门
    String getDepartmentByCode(@Param("code") String code);
}