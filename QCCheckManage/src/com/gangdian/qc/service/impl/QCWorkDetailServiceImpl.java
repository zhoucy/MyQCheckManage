package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCWorkerDetailDao;
import com.gangdian.qc.model.QCWorkerDetail;
import com.gangdian.qc.service.QCWorkDetailService;

@Service
public class QCWorkDetailServiceImpl implements QCWorkDetailService{

	@Autowired
	private QCWorkerDetailDao detailDao;
	
	public int insert(QCWorkerDetail record) {
		return detailDao.insert(record);
	}

	public int insertSelective(QCWorkerDetail record) {
		return detailDao.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(QCWorkerDetail record) {
		return detailDao.updateByPrimaryKeySelective(record);
	}
	public int updateByPrimaryKey(QCWorkerDetail record) {
		return detailDao.updateByPrimaryKey(record);
	}

	public List<QCWorkerDetail> selectByParentId(Integer parentId) {
		return detailDao.selectByParentId(parentId);
	}

	public   List<QCWorkerDetail> selectByGroup(Integer groupid) {
		// TODO Auto-generated method stub
		return detailDao.selectByGroup(groupid);
	}
	
	   /**
     * 根据组别获取员工信息当天的详细信息
     * @param groupid
     * @return
     */
    public List<QCWorkerDetail> selectBySumGroup(Integer groupid,Integer id,Integer progress){
    	//id为空则按工序查找  id不为空则按id查找
		if(id!=null){
			progress=null;
		}
    	return detailDao.selectBySumGroup(groupid,id,progress);
    	
    }

	public boolean updateByPrimaryKeySelective(QCWorkerDetail record,
			String[] period) {
		HashMap<Object, Object> map= new HashMap<Object, Object>(2);
		map.put("record", record);
		map.put("period", period);
		int status= detailDao.updateByPrimaryKeySelective(map);
	
		if(status>=1){
			return true;
		}else return false;
	}

}
