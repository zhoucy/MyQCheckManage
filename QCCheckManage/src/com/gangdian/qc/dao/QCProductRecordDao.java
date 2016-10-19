package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProductRecord;

public interface QCProductRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QCProductRecord record);

    int insertSelective(QCProductRecord record);

    QCProductRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCProductRecord record);

    int updateByPrimaryKey(QCProductRecord record);
    
    int getPageSize(QCProductRecord record);
    
    List<QCProductRecord> getPageList(@Param("record") QCProductRecord record,
        	@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
    
    QCProductRecord checkProduct(QCProductRecord record);
    /**
     * 通过品名获取它的工序
     * @param model 允许为空
     * @return
     */
    List<QCProductRecord> productGetProgress(String model);
   /**
    * 
    * @param record 查询数据
    * @param rows  每页显示行数
    * @param page 当前页
    * @param sort 排序字段
    * @param order 升序 降序
    * @return
    */
    List<QCProductRecord> productGetProgressPage(@Param("record") QCProductRecord record,
        	@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
    
    
    QCProductRecord  selectByModel(String model);
    
    List<QCProductRecord> getAllQCPR();
}