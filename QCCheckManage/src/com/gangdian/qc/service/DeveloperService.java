package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

public interface DeveloperService {

	//��ҳ�鿴(��,��ͼ,�洢����)
	Map<String, Object> getDataByDataType(String dataType,
			Integer rows,Integer page,String sort,String order);
	
	//�鿴��������(�����ͼ)
	Map<String, Object> getDataDetails(String dataName,Integer rows,Integer page);
	//�鿴��һ����������(�����ͼ)
	List<Map<String, Object>> getColumnsByDataName(String dataName);
	
	//sql����
	List<Map<String, Object>> getDataBySql(String sqlStr,Integer number);
}
