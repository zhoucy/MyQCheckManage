package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.gangdian.qc.model.QCRole;

public interface QCRoleDao {
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
    QCRole roleGetPermission(@Param("id") Integer id);
    
    
    /**
     *                  ����һ����¼
     * @param record    ʵ����
     * @return          ����Ӱ��������
     */
    int addRole(QCRole record);
    /**
     *                   ɾ��һ����¼
     * @param record     ʵ����
     * @return           ����Ӱ��������
     */
    int deleteRole(QCRole record);
    /**
     *                           ����һ����¼
     * @param record             ʵ����
     * @param Roleid             ��λid
     * @param Rolename           ��λname
     * @param RolepermissionID   ��λpermissionId
     * @return                   ����Ӱ����
     */
    int updateRole(@Param("record") QCRole record,@Param("Roleid") Integer Roleid,
    		@Param("Rolename") String Rolename);
    /**
     *           
     * @return   ��ѯ���н�ɫ
     */
    List<QCRole> getAllRole();
    /**
     *                ��ȡ���������Ľ�ɫ
     * @param record  ʵ����
     * @return        ���ط��������Ľ�ɫ
     */
    List<QCRole> checkRole(QCRole record);
    /**
     *                   ��ҳ��ѯ���ؼ�¼��
     * @param record     ʵ����
     * @return           ���ط��������ļ�¼��
     */
    List<QCRole> getRolePageSize(QCRole record);
    /**
     *                    ��ҳ������ѯ
     * @param record      ʵ����
     * @param rows        ÿҳ��С
     * @param page        ҳ��
     * @param sort        �������
     * @param order       �����ǽ���
     * @return            ���������ķ�ҳ�����
     */
    List<QCRole> getRolePageList(@Param("record") QCRole record,
    		@Param("rows") Integer rows, @Param("page") Integer page,
        	@Param("sort") String sort,@Param("order") String order);
    
    //����id,��ô��ȡpermission
    List<Integer> getPermissionID(@Param("id") Integer id,@Param("name") String name);
    //���ݽ�ɫid��ȡ��ɫ��Ȩ���б�
    List<Map<String, Object>> getPremissionByRoleId(@Param("rid") Integer rid);
}