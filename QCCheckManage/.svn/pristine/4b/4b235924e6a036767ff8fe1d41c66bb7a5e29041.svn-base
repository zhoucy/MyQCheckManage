package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.gangdian.qc.model.QCRole;

public interface QCRoleDao {
    int insert(QCRole record);

    int insertSelective(QCRole record);
    /**
     * 通过角色获取对应的用户
     * @param id
     * @return
     */
    List<QCRole> roleGetUser(int id);
    
    /**
     * 通过角色获取相应的权限
     * @param id
     * @return
     */
    QCRole roleGetPermission(@Param("id") Integer id);
    
    
    /**
     *                  增加一条记录
     * @param record    实体类
     * @return          返回影响列数量
     */
    int addRole(QCRole record);
    /**
     *                   删除一条记录
     * @param record     实体类
     * @return           返回影响列数量
     */
    int deleteRole(QCRole record);
    /**
     *                           更新一条记录
     * @param record             实体类
     * @param Roleid             定位id
     * @param Rolename           定位name
     * @param RolepermissionID   定位permissionId
     * @return                   返回影响列
     */
    int updateRole(@Param("record") QCRole record,@Param("Roleid") Integer Roleid,
    		@Param("Rolename") String Rolename);
    /**
     *           
     * @return   查询所有角色
     */
    List<QCRole> getAllRole();
    /**
     *                获取符合条件的角色
     * @param record  实体类
     * @return        返回符合条件的角色
     */
    List<QCRole> checkRole(QCRole record);
    /**
     *                   分页查询返回记录数
     * @param record     实体类
     * @return           返回符合条件的记录数
     */
    List<QCRole> getRolePageSize(QCRole record);
    /**
     *                    分页条件查询
     * @param record      实体类
     * @param rows        每页大小
     * @param page        页码
     * @param sort        排序的列
     * @param order       升序还是降序
     * @return            符合条件的分页结果集
     */
    List<QCRole> getRolePageList(@Param("record") QCRole record,
    		@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
    
    //根据id,那么获取permission
    List<Integer> getPermissionID(@Param("id") Integer id,@Param("name") String name);
    //根据角色id获取角色的权限列表
    List<Map<String, Object>> getPremissionByRoleId(@Param("rid") Integer rid);
}