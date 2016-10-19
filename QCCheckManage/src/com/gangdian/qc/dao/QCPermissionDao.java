package com.gangdian.qc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCPermission;

public interface QCPermissionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QCPermission record);

    int insertSelective(QCPermission record);

    QCPermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QCPermission record);

    int updateByPrimaryKey(QCPermission record);
    
    //自定义的方法
    /**
     *           
     * @return   获取全部权限
     */
    List<QCPermission> getAllPermission();
    /**
     *                重复检查
     * @param record  实体类
     * @return        返回几个
     */
    int checkPermission(QCPermission record);
    /**
     *                  获取分页条件查询数量
     * @param record    实体类
     * @return          符合条件数量
     */
    int getPermissionPageSize(QCPermission record);
    /**
     *                分页条件查询
     * @param record  实体类
     * @param rows    每页大小
     * @param page    页码
     * @param sort    排序的字段
     * @param order   升序还是降序
     * @return        份儿条件查询的结果集
     */
    List<QCPermission> getPermissionPageList(@Param("record") QCPermission record,
    		@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
    
    /**
     *                 通过fatherid或获取记录
     * @param fatherid fatherid
     * @return         返回符合条件的记录
     */
    List<QCPermission> getPermissionByFatherid(@Param("fatherid") Integer fatherid);
    
}