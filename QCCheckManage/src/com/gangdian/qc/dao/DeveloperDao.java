package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



//������Ԥ��(ֱ�Ӳ鿴��,��ͼ�ʹ洢����..),��ɾ�Ĺ��ܲ���
public interface DeveloperDao {

	
	//��ҳ�鿴(��,��ͼ,�洢����)
	List<Map<String, Object>> getDataByDataType(@Param("dataType") String dataType,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
	
	//�鿴��������(�����ͼ,�洢����û����),��ҳ��������,��Ϊ��̬�ֶ�������ȷ��
	List<Map<String, Object>> getDataDetails(@Param("dataName") String dataName,
			@Param("rows")	Integer rows, @Param("page") Integer page);	
	//��ȡ���������ܼ�¼��
	int getDataDetailsCount(@Param("dataName") String dataName);	
	//ȡһ���������������,����keyΪ��̬����datagrid�ṩ�ֶ�
	List<Map<String, Object>> getColumnsByDataName(@Param("dataName") String dataName);
	
	
	//sql����,����һ��sql��䷵�ؽ��~(����ܷ��ز�ѯ���ĵ��¼�)
	//ע��:1.Ҫ��׽���� 2.��ֹ���ش�������,ֻ����ǰ50�� 3.��ֹsql����г���delete,update,drop,insert,alter�ȹؼ���
	List<Map<String, Object>> getDataBySql(@Param("sqlStr") String sqlStr,@Param("number") Integer number);
}
