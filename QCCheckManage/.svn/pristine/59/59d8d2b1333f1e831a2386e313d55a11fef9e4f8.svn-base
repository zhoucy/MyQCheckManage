package com.gangdian.qc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProgressManHour;

public interface QCProgressManHourService {
    boolean deleteByPrimaryKey(Integer id);

    boolean insert(QCProgressManHour record);

    boolean insertSelective(QCProgressManHour record);

    QCProgressManHour selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(QCProgressManHour record);

    boolean updateByPrimaryKey(QCProgressManHour record);
    
    int getProHourPageSize(QCProgressManHour record);
    
    List<QCProgressManHour> getProHourPageList(@Param("record") QCProgressManHour record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    QCProgressManHour selectByOther(QCProgressManHour record);
}
