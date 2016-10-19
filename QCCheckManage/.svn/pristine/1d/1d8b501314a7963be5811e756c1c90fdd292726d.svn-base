package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCGroup;

public interface QCGroupService {
	/** 增加生产线 */
	public int addQCGroup(QCGroup qcGroup);

	/** 分页查找数据 */
	public List<QCGroup> getQCGroups();

	/** 查询所有生产线记录总数 */
	public int getAllQCGroupsNumbers();

	/** 查询生产线名是否存在 */
	public QCGroup checkQCGroupname(QCGroup qcGroup);

	/** 根据生产线id删除生产线 */
	public int deleteQCGroup(String id);

	/** 根据生产线id查找生产线 */
	public QCGroup getQCGroup(String id);

	/** 修改生产线 */
	public int updateQCGroup(QCGroup qcGroup);
	
	
	// 增加
	public boolean addGroup(QCGroup group);

	// 删除
	public boolean deleteGroup(Integer id);

	// 修改
	public boolean updateGroup(QCGroup group);

	// 根据id查询
	public QCGroup getGroupById(Integer id);

	// 查询全部
	public List<QCGroup> getAllGroup();

	// 分页查询
	public Map<String, Object> getGroupPageList( QCGroup group,
			 Integer rows, Integer page,
			 String sort,  String order);

	// 重复检查
	public boolean checkCode(String code);

}
