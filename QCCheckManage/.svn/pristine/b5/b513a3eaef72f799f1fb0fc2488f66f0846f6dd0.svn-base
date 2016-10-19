package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCRoleDao;
import com.gangdian.qc.model.QCRole;
import com.gangdian.qc.service.QCRoleService;

@Service
public class QCRoleServiceImpl implements QCRoleService{

	@Autowired QCRoleDao roleMapper;
	public int insert(QCRole record) {
		return roleMapper.insert(record);
	}

	public int insertSelective(QCRole record) {		
		return roleMapper.insertSelective(record);
	}

	public List<QCRole> roleGetUser(int id) {
		return roleMapper.roleGetUser(id);
	}

	public QCRole roleGetPermission(int id) {
		return roleMapper.roleGetPermission(id);
	}

	//增加一条记录
	public boolean addRole(QCRole role) {
		try {
			roleMapper.deleteRole(role);
			if(role.getPermission()!=null&&role.getPermission().size()>=1){
				for (Integer in : role.getPermission()) {
					role.setPermissionID(in);
					roleMapper.addRole(role);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//删除一条记录
	public boolean deleteRole(QCRole role) {
		int result=roleMapper.deleteRole(role);
		if(result>=1){
			return true;
		}else{
			return false;
		}	
	}

	//更新一条记录
	public boolean updateRole(QCRole role, Integer Roleid, String Rolename) {
		QCRole temp=new QCRole();
		temp.setId(Roleid);
		temp.setName(Rolename);
		try {
			roleMapper.deleteRole(temp);
			if(role.getPermission()!=null&&role.getPermission().size()>=1){
				for (Integer in : role.getPermission()) {
					role.setPermissionID(in);
					roleMapper.addRole(role);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	//获取全部角色
	public List<QCRole> getAllRole() {
		return roleMapper.getAllRole();
	}

	//角色重复检查
	public boolean checkRole(QCRole role) {
		List<QCRole> rolelist=roleMapper.checkRole(role);
		if(rolelist!=null&&rolelist.size()>=1){
			return true;
		}else{
			return false;
		}	
	}

	//分页条件查询
	public Map<String, Object> getRolePageList(QCRole role, Integer rows,
			Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<QCRole> qclist=roleMapper.getRolePageList(role, rows, page, sort, order);
		if(qclist!=null&&qclist.size()>=1){
			for (QCRole qcRole : qclist) {
				//为permission的数组树型赋值
				qcRole.setPermission(roleMapper.getPermissionID(qcRole.getId(),qcRole.getName()));
			}
		}
		List<QCRole> total=roleMapper.getRolePageSize(role);
		result.put("total", total!=null?total.size():0);
		result.put("rows", qclist);
		return result;
	}

	public List<Integer> getPermissionID(Integer id, String name) {
		return roleMapper.getPermissionID(id, name) ;
	}

	public boolean checkRoleID(Integer id) {
		QCRole temp=new QCRole();
		temp.setId(id);		
		List<QCRole> rolelist=roleMapper.checkRole(temp);
		if(rolelist!=null&&rolelist.size()>=1){
			return true;
		}else{
			return false;
		}
	}

	public boolean checkRoleName(String name) {
		QCRole temp=new QCRole();
		temp.setName(name);		
		List<QCRole> rolelist=roleMapper.checkRole(temp);
		if(rolelist!=null&&rolelist.size()>=1){
			return true;
		}else{
			return false;
		}
	}

	public List<Map<String, Object>> getPremissionByRoleId(Integer rid) {
		return roleMapper.getPremissionByRoleId(rid);
	}


	
	
	
	

}
