package com.gangdian.qc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProductDelayCodeDao;
import com.gangdian.qc.model.QCProductDelayCode;
import com.gangdian.qc.service.QCProductDelayCodeService;


@Service
public class QCProductDelayCodeServiceImpl implements QCProductDelayCodeService {

	@Autowired
	private QCProductDelayCodeDao qcpcDao;
	/**
	 *               增加一条记录
	 * @param qcpc   责任代码实体类
	 * @return       返回添加成功或者失败
	 */
	public boolean addQCPC(QCProductDelayCode qcpc){
		int result=qcpcDao.addQCPC(qcpc);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}	
	/**
	 *              删除一条记录
	 * @param qcpc  责任代码实体类
	 * @return      返回删除成功还是失败
	 */
	public boolean deleteQCPC(QCProductDelayCode qcpc){
		int result=qcpcDao.addQCPC(qcpc);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 *              删除一条记录
	 * @param id    责任代码id
	 * @return      返回删除成功还是失败
	 */
	public boolean deleteQCPC(Integer id){
		int result=qcpcDao.deleteQCPC(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 *              更新一条记录
	 * @param qcpc  责任代码实体类
	 * @return      返回更新成功还是失败
	 */
	public boolean updateCPC(QCProductDelayCode qcpc){
		int result=qcpcDao.updateQCPC(qcpc);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 *               分页条件查询符合条件的记录数
	 * @param qcpc   责任代码实体类(查询条件)
	 * @return       返回符合条件的总记录数,为分页服务
	 */
	public int getPageSize(QCProductDelayCode qcpc){
		List<QCProductDelayCode> list=qcpcDao.getPageSize(qcpc);
		return list!=null?list.size():0;
	}
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
			Integer rows,Integer page,String sort,String order){
		List<QCProductDelayCode> qcpcList=qcpcDao.getPageList(qcpc, rows, page, sort, order);
		return qcpcList;
	}
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
			Integer rows,Integer page,String sort,String order){
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("total", getPageSize(qcpc));
		result.put("rows", getPageList(qcpc, rows, page, sort, order));
		return result;
	}	
	/**
	 *              重复检查
	 * @param qcpc  责任代码实体类
	 * @return      返回有还是没有的结果
	 */
	public boolean checkQCPC(QCProductDelayCode qcpc){
		return checkQCPC(qcpc.getDelayCode());
	}
	/**
	 *              重复检查
	 * @param code  错误编码
	 * @return      返回查询结果
	 */	
	public boolean checkQCPC(String code){
		List<QCProductDelayCode>  list=qcpcDao.checkQCOC(code);
		int result=list!=null?list.size():0;
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 *              根据id查找
	 * @param id    责任代码的id
	 * @return      返回一个实体类
	 */
	public QCProductDelayCode getQCPCByID(Integer id){
		return qcpcDao.getQCPCByID(id);
	}
	/**
	 * 查询 所有的代码
	 */
	public List<String[]> getAllCodes() {
		List<QCProductDelayCode> qcpclist=qcpcDao.getAllQCPC();
		List<String[]> result=new ArrayList<String[]>();
		if(qcpclist!=null&&qcpclist.size()>0){
			for (QCProductDelayCode qcpc : qcpclist) {
				String [] temp={qcpc.getDelayCode(),qcpc.getDescription()};
				result.add(temp);
			}
		}
		return result;
	}
	
	/**
	 * 根据代码查询部门
	 * @code 代码
	 * @return 责任部门
	 */
	public String getDepartmentByCode(String code) {
		return qcpcDao.getDepartmentByCode(code);
	}
	
}
