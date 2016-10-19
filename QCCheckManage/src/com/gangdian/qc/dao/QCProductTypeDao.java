package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCProductType;

public interface QCProductTypeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QCProductType record);

    int insertSelective(QCProductType record);

    QCProductType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCProductType record);

    int updateByPrimaryKey(QCProductType record);
    
    //��ȡȫ���Ĳ�Ʒ����
    List<QCProductType> getAllQCPT();
    //��ȡ��¼��
    List<QCProductType> getQCPTPageSize(QCProductType record);
    //��ҳ��ѯ
    List<QCProductType> getQCPTPageList(@Param("record")QCProductType record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
}