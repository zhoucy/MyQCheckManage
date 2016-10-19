package com.gangdian.qc.service;

import java.util.List;


import com.gangdian.qc.model.QCCheckProject;

public interface QCCheckProjectService {

	boolean deleteByPrimaryKey(String id);

    boolean insert(QCCheckProject record);

    boolean insertSelective(QCCheckProject record);

    QCCheckProject selectByPrimaryKey(String id);

    boolean updateByPrimaryKeySelective(QCCheckProject record);

    boolean updateByPrimaryKey(QCCheckProject record);
	public  List<QCCheckProject>  queryPageProject(String id,String name,int startIndex, int pageSize);
	public int getProjectCount(QCCheckProject record);

}
