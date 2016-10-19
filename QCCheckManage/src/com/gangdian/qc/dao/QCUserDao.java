package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.QCUser;

public interface QCUserDao {
	/** 增加用户 */
	public int addQCUser(QCUser qcUser);

	/** 分页查找数据 */
	public List<QCUser> getQCUsers();

	/** 查询所有用户记录总数 */
	public int getAllQCUsersNumbers(QCUser qcUser);
	
	
	public QCUser getUserById(String id);

	/** 查询用户名是否存在 */
	public QCUser checkQCUsername(QCUser qcUser);

	/** 根据用户id删除用户 */
	
	public int deleteQCUser(String id);


	/** 修改用户 */
	public int updateQCUser(QCUser qcUser);

	public int updateUserRights(QCUser qcUser);
	
	public List<QCUser> listAllUser();
	
	/**查询用户*/
	public  List<QCUser>  selectByOther(QCUser user);
	
	public  List<QCUser>  queryPageQCUser(@Param("id")String id,@Param("name")String name,@Param("startIndex")int startIndex, @Param("pageSize")int pageSize);
	public  List<QCUser>  queryPageQCUser1(QCUser user,@Param("startIndex")int startIndex, @Param("pageSize")int pageSize);
	
    //根据uid(用户id),rid(角色id),pid(权限id)查询用户的所有关联信息(此结果包含大量重复记录,慎用)
	public List<Map<String, Object>> getUserUnionById(@Param("uid") Integer uid,
			@Param("rid") Integer rid,@Param("pid") Integer pid);
	//根据rid分页查询角色为rid的所有用户
    public List<Map<String, Object>> getUserPageListByRid(@Param("rid") Integer rid,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
}
