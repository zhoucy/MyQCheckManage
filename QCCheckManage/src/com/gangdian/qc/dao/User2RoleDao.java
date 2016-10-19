package com.gangdian.qc.dao;

import com.gangdian.qc.model.User2Role;

public interface User2RoleDao {
    int insert(User2Role record);

    int insertSelective(User2Role record);
    
    User2Role getRoleByid(String userId);
    /**
     * 根据用户id删除对应角色
     * @param userId
     * @return
     */
    int deleteByUserId(String userId);
}