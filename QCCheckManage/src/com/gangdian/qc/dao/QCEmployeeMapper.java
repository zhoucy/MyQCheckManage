package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCEmployee;

public interface QCEmployeeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QCEmployee record);

    int insertSelective(QCEmployee record);

    QCEmployee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCEmployee record);

    int updateByPrimaryKey(QCEmployee record);
    
    //��ҳ��ѯ
    List<QCEmployee> getEmployeePageList(@Param("record") QCEmployee record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    //��ѯȫ��
    List<QCEmployee> getAllEmployee();
    //������ѯ
    List<QCEmployee> getConditionEmployee(QCEmployee record);
}