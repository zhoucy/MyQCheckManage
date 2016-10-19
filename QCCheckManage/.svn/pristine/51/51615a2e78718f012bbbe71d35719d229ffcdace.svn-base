package com.gangdian.qc.service;


import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCProductDelayCode;



public interface QCProductDelayCodeService  {


	/**
	 *               增加一条记录
	 * @param qcpc   责任代码实体类
	 * @return       返回添加成功或者失败
	 */
	public boolean addQCPC(QCProductDelayCode qcpc);


	/**
	 *              删除一条记录
	 * @param qcpc  责任代码实体类
	 * @return      返回删除成功还是失败
	 */
	public boolean deleteQCPC(QCProductDelayCode qcpc);
	/**
	 *              删除一条记录
	 * @param id    责任代码id
	 * @return      返回删除成功还是失败
	 */
	public boolean deleteQCPC(Integer id);
	/**
	 *              更新一条记录
	 * @param qcpc  责任代码实体类
	 * @return      返回更新成功还是失败
	 */
	public boolean updateCPC(QCProductDelayCode qcpc);
	/**
	 *               分页条件查询符合条件的记录数
	 * @param qcpc   责任代码实体类(查询条件)
	 * @return       返回符合条件的总记录数,为分页服务
	 */
	public int getPageSize(QCProductDelayCode qcpc);
	/**
	 *               分页条件查询
	 * @param qcpc   责任代码实体类(查询条件)
	 * @param rows   easyui定义的参数,每页大小
	 * @param page   easyui定义的参数,页数(第几页)
	 * @param sort   easyui定义的参数,需要排序的字段
	 * @param order  easyui定义的参数,排序升序还是降序
	 * @return       返回符合条件的集合list,为分页服务
	 */
	public List<QCProductDelayCode> getPageList(QCProductDelayCode qcpc,
			Integer rows,Integer page,String sort,String order);
	/**
	 *               分页条件查询
	 * @param qcpc   责任代码实体类(查询条件)
	 * @param rows   easyui定义的参数,每页大小
	 * @param page   easyui定义的参数,页数(第几页)
	 * @param sort   easyui定义的参数,需要排序的字段
	 * @param order  easyui定义的参数,排序升序还是降序
	 *        total  easyui定义的参数,需要后台获取给到前台,就是getPageSize返回的结果
	 * @return       返回符合条件的集合list
	 */
	public Map<String, Object> searchQCPC(QCProductDelayCode qcpc,
			Integer rows,Integer page,String sort,String order);
	/**
	 *              重复检查
	 * @param qcpc  责任代码实体类
	 * @return      返回有还是没有的结果
	 */
	public boolean checkQCPC(QCProductDelayCode qcpc);
	/**
	 *              重复检查
	 * @param code  错误编码
	 * @return      返回查询结果
	 */	
	public boolean checkQCPC(String code);
	/**
	 *              根据id查找
	 * @param id    责任代码的id
	 * @return      返回一个实体类
	 */
	public QCProductDelayCode getQCPCByID(Integer id);
	/**
	 *             返回全部的责任延迟代码
	 * @return
	 */
	public List<String []> getAllCodes();
	/**
	 *              根据code查找责任部门
	 * @param code  code
	 * @return      返回责任部门
	 */
	public String getDepartmentByCode(String code);
	
}
