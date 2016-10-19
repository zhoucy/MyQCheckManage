package com.gangdian.qc.service;

import java.util.Map;

import com.gangdian.qc.model.QCWorktime;

public interface QCWorkTimeServer {

	
	
	//增加一条记录
	public boolean addQCWT(QCWorktime qcwt);
	//删除一条记录
	public boolean deleteQCWT(Integer id);
	//更新一条记录
	public boolean updateQCWT(QCWorktime qcwt);
	//分页条件查询
	public Map<String, Object> getQCWTPageList(String groupname,String belongname,
			Integer rows,Integer page,String sort,String order);
	//重复检查,检查groupid即可
	public boolean checkGroupid(String groupname);
}
