package com.gangdian.qc.dao;

import com.gangdian.qc.model.BoxProduct;

public interface BoxProductDao {
    int deleteByPrimaryKey(Integer id);

    int insert(BoxProduct record);

    int insertSelective(BoxProduct record);

    BoxProduct selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BoxProduct record);

    int updateByPrimaryKey(BoxProduct record);
    
    int getPageSize(BoxProduct record);
}