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

	/** �����û� */
	public int addQCUser(QCUser user) {
		return qcUserDao.addQCUser(user);
	}

	/** ��ҳ�����û���Ϣ */
	public List<QCUser> getQCUsers() {

		List<QCUser> users = qcUserDao.getQCUsers();
		return users;
	}
	
	public QCUser getUserById(String id){
		QCUser user= qcUserDao.getUserById(id);
		return user;
	}
	
	

	/** ��ѯ�û����Ƿ���� */
	public QCUser checkQCUsername(QCUser user) {
		QCUser u= qcUserDao.checkQCUsername(user);
		if(u!=null){
			u.setDpt(dptDao.selectByPrimaryKey(u.getDepartmentid()));
		}
		return u;
	}

	/** �����û�idɾ���û� */
	public int deleteQCUser(String id) {
		return qcUserDao.deleteQCUser(id);
	}

	

	/** �����û� */
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
	 * ���û������ɫ
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
				 throw e;//ע�⣬��������������׳�����spring��������Ȼ�ǲ���rollback�ġ�
			}
		
	}
	/**
	 * ɾ���û���Ӧ�Ľ�ɫ
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
	 * ��ҳ��ѯ�û�
	 * @param pagesize ÿҳ��������
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
