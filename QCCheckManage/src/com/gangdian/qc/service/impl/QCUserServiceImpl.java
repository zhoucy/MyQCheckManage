package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.DepartmentDao;
import com.gangdian.qc.dao.QCUserDao;
import com.gangdian.qc.dao.User2RoleDao;
import com.gangdian.qc.model.Department;
import com.gangdian.qc.model.QCCheckProject;
import com.gangdian.qc.model.QCUser;
import com.gangdian.qc.model.User2Role;
import com.gangdian.qc.service.DepartmentService;
import com.gangdian.qc.service.QCUserService;

@Service
public class QCUserServiceImpl implements QCUserService{

	@Autowired
	private QCUserDao qcUserDao;
	
	@Autowired 
	private User2RoleDao user2RoleDao;
	
	@Autowired
	private DepartmentDao dptDao;

	/** 增加用户 */
	public int addQCUser(QCUser user) {
		return qcUserDao.addQCUser(user);
	}

	/** 分页查找用户信息 */
	public List<QCUser> getQCUsers() {

		List<QCUser> users = qcUserDao.getQCUsers();
		return users;
	}
	
	public QCUser getUserById(String id){
		QCUser user= qcUserDao.getUserById(id);
		return user;
	}
	
	

	/** 查询用户名是否存在 */
	public QCUser checkQCUsername(QCUser user) {
		QCUser u= qcUserDao.checkQCUsername(user);
		if(u!=null){
			u.setDpt(dptDao.selectByPrimaryKey(u.getDepartmentid()));
		}
		return u;
	}

	/** 根据用户id删除用户 */
	public int deleteQCUser(String id) {
		return qcUserDao.deleteQCUser(id);
	}

	

	/** 更新用户 */
	public int updateQCUser(QCUser u) {
		return qcUserDao.updateQCUser(u);
	}

	public int getAllQCUsersNumbers(QCUser u) {
		// TODO Auto-generated method stub
		return qcUserDao.getAllQCUsersNumbers( u);
	}

	public int updateUserRights(QCUser qcUser) {
		// TODO Auto-generated method stub
		return qcUserDao.updateUserRights(qcUser);
	}

	
	public List<QCUser> listAllUser() {
		// TODO Auto-generated method stub
		return qcUserDao.listAllUser();
	}
	
	/**
	 * 给用户分配角色
	 * 
	 * @param record
	 * @return
	 * @throws Exception 
	 */
	public void  assignRoles(User2Role record) throws Exception{
		
		try{
			user2RoleDao.deleteByUserId(record.getUserId());
			user2RoleDao.insertSelective(record);
			
			} catch(Exception e){
				 throw e;//注意，这里必须是重新抛出，让spring来处理，不然是不会rollback的。
			}
		
	}
	/**
	 * 删除用户对应的角色
	 * @param record
	 * @return
	 */
	public int  deleteRoles(User2Role record){
		
		return user2RoleDao.deleteByUserId(record.getUserId());
		
	}
	
	

	public List<QCUser> selectByOther(QCUser user) {
		// TODO Auto-generated method stub
		return qcUserDao.selectByOther(user);
	}
	/**
	 * 分页查询用户
	 * @param pagesize 每页的数据量
	 * @param startIndex 
	 */

	public List<QCUser> queryPageQCUser(String id, String name, int startIndex,
			int pageSize) {
		 return qcUserDao.queryPageQCUser(id,name,startIndex,pageSize);
	}

	public List<QCUser> queryPageQCUser1(QCUser user, int startIndex,
			int pageSize) {
		return qcUserDao.queryPageQCUser1(user, startIndex, pageSize);
	}

	public User2Role getRoleName(String id) {
		return user2RoleDao.getRoleByid(id);
	}

	public List<Department> getDeptByBelong(String belong) {
		// TODO Auto-generated method stub
		return dptDao.getDeptByBelong(belong);
	}

	public List<Map<String, Object>> getUserUnionById(Integer uid,Integer rid,Integer pid) {
		return qcUserDao.getUserUnionById(uid, rid, pid);
	}

	public Map<String, Object> getUserPageListByRid(Integer rid, Integer rows,
			Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> total=qcUserDao.getUserPageListByRid(rid, null, null, sort, order);
		result.put("total", total!=null?total.size():0);
		result.put("rows", qcUserDao.getUserPageListByRid(rid, rows, page, sort, order));
		return result;
	}


	

}
