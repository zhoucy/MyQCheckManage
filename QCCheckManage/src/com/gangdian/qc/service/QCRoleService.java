package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCRole;

public interface QCRoleService {
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
    QCRole roleGetPermission(int id);
    
    
    
    //增加
    public boolean addRole(QCRole role);
    //删除
    public boolean deleteRole(QCRole role);
    //修改
    public boolean updateRole(QCRole role,Integer Roleid,String Rolename);
    //查询全部
    public List<QCRole> getAllRole();
    //重复检查
    public boolean checkRole(QCRole role);
    //分页查询
    public Map<String, Object> getRolePageList(QCRole role,
    		Integer rows,Integer page,String sort,String order);
    
   //根据id和名称获取权限
    public List<Integer> getPermissionID(Integer id,String name);
    //角色id重复检查
    public boolean checkRoleID(Integer id);
    //角色名称重复检查
    public boolean checkRoleName(String name);
    //通过角色id获取权限
    public List<Map<String, Object>> getPremissionByRoleId(Integer rid);

}
