package com.gangdian.qc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProductRecord;

public interface QCProductRecordService {
	
		boolean deleteByPrimaryKey(Integer id);

		boolean insert(QCProductRecord record);

		boolean insertSelective(QCProductRecord record);

	    QCProductRecord selectByPrimaryKey(Integer id);

	    boolean updateByPrimaryKeySelective(QCProductRecord record);

	    boolean updateByPrimaryKey(QCProductRecord record);
	    
	    int getPageSize(QCProductRecord record);
	    
	    /**
	     * 分页查找
	     * @param record
	     * @param rows
	     * @param page
	     * @param sort
	     * @param order
	     * @return
	     */
	    List<QCProductRecord> getPageList(QCProductRecord record,
	        	@Param("rows") Integer rows, @Param("page") Integer page,
	        	@Param("sort") String sort,@Param("order") String order);

	    /**
	     * 检查是否品名重复
	     * @param record 产品
	     * @return 生产产品
	     */
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
	    
	    /**
	     * 根据品名获得对应的产品
	     * @param model
	     * @return
	     */
	    QCProductRecord  selectByModel(String model);
	    
	    /**
	     * 获得所有的品名
	     * @return
	     */
	    List<String>  selectAllModel();
	    
	    List<QCProductRecord> getAllQCPR();
}
