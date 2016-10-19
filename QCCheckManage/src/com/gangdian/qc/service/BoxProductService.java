package com.gangdian.qc.service;

import com.gangdian.qc.model.BoxProduct;

public interface BoxProductService {
	
	 	int deleteByPrimaryKey(Integer id);

	    int insert(BoxProduct record);

	    int insertSelective(BoxProduct record);

	    BoxProduct selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(BoxProduct record);

	    int updateByPrimaryKey(BoxProduct record);
	    /**
	     * 按条件查询box条数
	     * @param record
	     * @return 结果条数
	     */
	    int getPageSize(BoxProduct record);

}
