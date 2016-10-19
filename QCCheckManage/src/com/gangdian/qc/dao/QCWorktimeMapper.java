package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCWorktime;

public interface QCWorktimeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCWorktime record);

    int insertSelective(QCWorktime record);

    QCWorktime selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCWorktime record);

    int updateByPrimaryKey(QCWorktime record);
    
    //��ҳ������ѯ
    List<Map<String, Object>> getQCWTPageList(@Param("groupname") String groupname,
    		@Param("belongname") String belongname,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    //�ظ����
    int checkGroupid(@Param("groupname") String groupname);
}