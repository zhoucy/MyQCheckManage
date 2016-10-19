package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCRole;

public interface QCRoleService {
	int insert(QCRole record);

    int insertSelective(QCRole record);
    /**
     * ͨ����ɫ��ȡ��Ӧ���û�
     * @param id
     * @return
     */
    List<QCRole> roleGetUser(int id);
    
    /**
     * ͨ����ɫ��ȡ��Ӧ��Ȩ��
     * @param id
     * @return
     */
    QCRole roleGetPermission(int id);
    
    
    
    //����
    public boolean addRole(QCRole role);
    //ɾ��
    public boolean deleteRole(QCRole role);
    //�޸�
    public boolean updateRole(QCRole role,Integer Roleid,String Rolename);
    //��ѯȫ��
    public List<QCRole> getAllRole();
    //�ظ����
    public boolean checkRole(QCRole role);
    //��ҳ��ѯ
    public Map<String, Object> getRolePageList(QCRole role,
    		Integer rows,Integer page,String sort,String order);
    
   //����id�����ƻ�ȡȨ��
    public List<Integer> getPermissionID(Integer id,String name);
    //��ɫid�ظ����
    public boolean checkRoleID(Integer id);
    //��ɫ�����ظ����
    public boolean checkRoleName(String name);
    //ͨ����ɫid��ȡȨ��
    public List<Map<String, Object>> getPremissionByRoleId(Integer rid);

}
