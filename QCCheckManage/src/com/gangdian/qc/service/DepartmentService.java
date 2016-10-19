package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.Department;



public interface DepartmentService {

	/**
	 *                ����һ����¼
	 * @param dept    ʵ����
	 * @return        ���
	 */
	public boolean addDept(Department dept);
	
	/**
	 *             ɾ��һ����¼
	 * @param id   ʵ����
	 * @return     ���
	 */
	public boolean deleteDept(Integer id);
	
	/**.
	 *               ����һ����¼
	 * @param dept   ʵ����
	 * @return       ���
	 */
	public boolean updateDept(Department dept);
	/**
	 *             ����id��ѯ
	 * @param id   ��ѯid
	 * @return     ���������ļ�¼
	 */
	public Department getDeptById(Integer id);
	/**
	 *            
	 * @return   �������еĲ�����Ϣ
	 */
	public List<Department> getAllDept();
	
	/**
	 *                ��ҳ��ѯ
	 * @param dept    ʵ����
	 * @param rows    ÿҳ��С
	 * @param page    ҳ��
	 * @param sort    ������
	 * @param order   ������
	 * @return        ���������ļ�¼
	 */
	public Map<String, Object> getDeptPageList(Department dept,String belongname,
			Integer rows,Integer page, String sort, String order);
	
	/**
	 *                �����ظ����
	 * @param code    �����ı���
	 * @return        ���
	 */
	public boolean checkCode(String code);
	/**
	 *                �����ظ����
	 * @param name    ����������
	 * @return        ���
	 */
	public boolean checkName(String name);
	/**
	 *             ���ݲ������Ʋ�ѯ��¼
	 * @param name ��������
	 * @return     ���
	 */
	public Department getDeptByName(String name);
	/**
	 *              ���ݲ���code���Ҳ�������
	 * @param code  ����code
	 * @return      ��������
	 */
	public String getDeptNameByDeptCode(String code);
	/**
	 *                  ���ݲ����������ҷ��������Ĳ���
	 * @param belong    ����������id
	 * @return          ���������Ĳ���
	 */
	public List<Department> getDeptByBelong(String belong);
}
