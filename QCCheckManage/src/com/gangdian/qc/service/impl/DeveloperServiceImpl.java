package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gangdian.qc.dao.DeveloperDao;
import com.gangdian.qc.service.DeveloperService;


@Service
public class DeveloperServiceImpl implements DeveloperService {

	@Autowired
	private DeveloperDao developerDao;
	
	//��ҳ�鿴(��,��ͼ,�洢����)
	public Map<String, Object> getDataByDataType(String dataType,
			Integer rows, Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=developerDao.getDataByDataType(dataType, null, null, null, null);
		result.put("rows", developerDao.getDataByDataType(dataType, rows, page, sort, order));
		result.put("total", list!=null?list.size():0);
		return result;
	}

	//�鿴��������(�����ͼ,�洢����û����),��ҳ��������,��Ϊ��̬�ֶ�������ȷ��
	public Map<String, Object> getDataDetails(String dataName,
			Integer rows, Integer page) {
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("rows", developerDao.getDataDetails(dataName, rows, page));
		result.put("total", developerDao.getDataDetailsCount(dataName));
		return result;
	}
	//��ѯһ������,����keyΪ��̬����datagrid�ṩ�ֶ�
	public List<Map<String, Object>> getColumnsByDataName(String dataName){
		return developerDao.getColumnsByDataName(dataName);
	}

	//sql����,����һ��sql��䷵�ؽ��~(����ܷ��ز�ѯ���ĵ�ʱ��)
	//ע��:1.Ҫ��׽���� 2.��ֹ���ش�������,���ֻ����ǰ100�� 3.��ֹsql����г���delete,update,drop,insert,alter�ȹؼ���
	@Transactional(readOnly = true)
	public List<Map<String, Object>> getDataBySql(String sqlStr, Integer number) {
		String temp=sqlStr.toLowerCase();
		List<Map<String, Object>> result=null;
		if(temp.contains("delete")||temp.contains("update")||temp.contains("insert")||temp.contains("alter")||temp.contains("drop")){
			return null;
		}
		try {
			result=developerDao.getDataBySql(sqlStr, number);
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return result;
	}

}
