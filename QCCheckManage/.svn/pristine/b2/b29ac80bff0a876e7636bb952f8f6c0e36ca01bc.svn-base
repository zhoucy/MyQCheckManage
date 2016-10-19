package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProgressManHour;

public interface QCProgressManHourDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QCProgressManHour record);

    int insertSelective(QCProgressManHour record);

    QCProgressManHour selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCProgressManHour record);

    int updateByPrimaryKey(QCProgressManHour record);
    
    int getProHourPageSize(QCProgressManHour record);
    
    List<QCProgressManHour> getProHourPageList(@Param("record") QCProgressManHour record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    
    
    QCProgressManHour selectByOther(QCProgressManHour record);
}