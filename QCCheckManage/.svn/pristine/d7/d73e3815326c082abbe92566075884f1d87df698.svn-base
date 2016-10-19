package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCGroup;

public interface QCGroupDao {
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
	
	//增加
	int addGroup(QCGroup record);
	//删除
	int deleteGroup(@Param("id") Integer id);
	//修改
	int updateGroup(QCGroup record);
	//根据id查询
	QCGroup getGroupById(@Param("id") Integer id);
	//查询全部
	List<QCGroup> getAllGroup();
	//分页记录数
	int getGroupPageSize(QCGroup record);
	//分页查询
	List<QCGroup> getGroupPageList(@Param("record") QCGroup record,
			@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
	//重复检查
	List<QCGroup> checkGroup(QCGroup record);

}
