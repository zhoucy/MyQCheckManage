package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.gangdian.qc.model.QCProductPlan;

public interface QCProductPlanDao {
    int insert(QCProductPlan record);

    int insertSelective(QCProductPlan record);
    
    //自定义的方法
    int addQCPP(QCProductPlan record);
    
    int deleteQCPP(@Param("id") int id);
    
    int updateQCPP(QCProductPlan record);
   
    
    QCProductPlan getQCPPByID(@Param("id") int id);
    
    List<QCProductPlan> checkQCPP(@Param("pono") String pono);
     
    int getQCPPPageSize(QCProductPlan record);
       
    List<QCProductPlan> getQCPPPageList(@Param("record") QCProductPlan record,
    	@Param("rows") Integer rows, @Param("page") Integer page,
    	@Param("sort") String sort,@Param("order") String order);
    
    //获取所有
    List<QCProductPlan> getAllQCPP();
    //根据订单号获取QCProductPlan
    QCProductPlan getByPono(@Param("pono") String pono);
    
    //zhoucy  更新订单状态为完工
    int updateQCPPStatus(@Param("productStatus") String productStatus,
    					 @Param("id") int id,
    					 @Param("lastUpUser") String lastUpUser);
    
    
    //finish数+1
    int FinishNumberIncrease(@Param("pono") String pono);
    //finish数-1
    int FinishNumberDecrease(@Param("pono") String pono);
}