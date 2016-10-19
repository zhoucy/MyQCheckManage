package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCCheckProject;

public interface QCCheckProjectDao {
    int deleteByPrimaryKey(String id);

    int insert(QCCheckProject record);

    int insertSelective(QCCheckProject record);

    QCCheckProject selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(QCCheckProject record);

    int updateByPrimaryKey(QCCheckProject record);
	public  List<QCCheckProject>  queryPageProject(@Param("id")String id,@Param("name")String name,@Param("startIndex")int startIndex, @Param("pageSize")int pageSize);
	public  int getProjectCount(QCCheckProject record);
	
	

}