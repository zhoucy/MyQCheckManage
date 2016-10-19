package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;


import com.gangdian.qc.model.QCPermission;

public interface QCPermissionService {
    	    
	    //增加
	    public boolean addPermission(QCPermission permission);
	    //删除
	    public boolean deletePermission(Integer id);
	    //修改
	    public boolean updatePermission(QCPermission permission);
	    //查询全部
	    public List<QCPermission> getAllPermission();
	    //根据id查找
	    public QCPermission getPermissionById(Integer id);
	    //重复检查
	    public boolean checkPermissionName(String name);
	    public boolean checkPermissionUrl(String url);
	    public boolean checkPermissionId(Integer id);
	    //分页查询
	    public Map<String, Object> getPermissionPageList(QCPermission permissison,
	    		Integer rows,Integer page,String sort,String order);
	    //根据fatherid找记录
	    List<QCPermission> getPermissionByFatherid(Integer fatherid);
	    
}
