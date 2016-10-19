package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.Department;

public interface DepartmentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
    
    //获取分页记录数
    List<Department> getDeptPageSize(Department record);
    //获取分页记录
    List<Department> getDeptPageList(@Param("record") Department record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    //另一个分页方法
    List<Map<String, Object>> getDeptPage(@Param("record") Department record,@Param("belongname") String belongname,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    //获取全部记录
    List<Department> getAllDept();
    //获取同属一个组织全部记录
    List<Department> getDeptByBelong(String belong);
    //重复检查
    List<Department> checkDept(Department record);
    
}