package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProgress;

public interface QCProgressDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QCProgress record);

    int insertSelective(QCProgress record);

    QCProgress selectByPrimaryKey(Integer id);
    
    QCProgress selectByCode(Integer progressCode);

    int updateByPrimaryKeySelective(QCProgress record);

    int updateByPrimaryKey(QCProgress record);
    
    //获取全部的结果(工序)
    List<QCProgress> getAllProgress();
    //获取分页记录数
    List<QCProgress> getProgressPageSize(QCProgress record);
    //获取分页结果
    List<QCProgress> getProgressPageList(@Param("record") QCProgress record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    //重复检查
    List<QCProgress> checkProgress(QCProgress record);
}