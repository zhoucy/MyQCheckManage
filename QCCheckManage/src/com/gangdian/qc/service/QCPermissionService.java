package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;


import com.gangdian.qc.model.QCPermission;

public interface QCPermissionService {
    	    
	    //����
	    public boolean addPermission(QCPermission permission);
	    //ɾ��
	    public boolean deletePermission(Integer id);
	    //�޸�
	    public boolean updatePermission(QCPermission permission);
	    //��ѯȫ��
	    public List<QCPermission> getAllPermission();
	    //����id����
	    public QCPermission getPermissionById(Integer id);
	    //�ظ����
	    public boolean checkPermissionName(String name);
	    public boolean checkPermissionUrl(String url);
	    public boolean checkPermissionId(Integer id);
	    //��ҳ��ѯ
	    public Map<String, Object> getPermissionPageList(QCPermission permissison,
	    		Integer rows,Integer page,String sort,String order);
	    //����fatherid�Ҽ�¼
	    List<QCPermission> getPermissionByFatherid(Integer fatherid);
	    
}
