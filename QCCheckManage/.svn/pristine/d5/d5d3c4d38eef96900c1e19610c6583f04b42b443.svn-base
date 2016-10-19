package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import com.gangdian.qc.model.QCProgress;

public interface QCProgressService {

	
	/**
	 *                    增加一条记录
	 * @param progress    实体类
	 * @return            结果
	 */
	public boolean addProgress(QCProgress progress);
	/**
	 *               删除一条记录
	 * @param id     实体类
	 * @return       结果
	 */
	public boolean deleteProgress(Integer id);
	/**
	 *                  更新一条记录
	 * @param progress  实体类
	 * @return          结果
	 */
	public boolean updateProgress(QCProgress progress);
	
	/**
	 *                根据id获取记录
	 * @param id      id
	 * @return        结果
	 */
	public QCProgress getProgressById(Integer id);
	/**
	 *     
	 * @return    返回所有的工序信息
	 */
	public List<QCProgress> getAllProgress();
	/**
	 *                   分页条件查询
	 * @param progress   工序实体类
	 * @param rows       每页大小
	 * @param page       页码
	 * @param sort       排序列
	 * @param order      升序降序
	 * @return           符合条件的记录数
	 */
	public Map<String, Object> getProgressPageList(QCProgress progress,
			Integer rows,Integer page, String sort, String order);
	/**
	 *             编码重复检查
	 * @param code 编码
	 * @return     结果
	 */
	public boolean checkCode(Integer code);
	/**
	 *                 名称重复检查
	 * @param name     名称
	 * @return         结果
	 */
	public boolean checkName(String name);
}
