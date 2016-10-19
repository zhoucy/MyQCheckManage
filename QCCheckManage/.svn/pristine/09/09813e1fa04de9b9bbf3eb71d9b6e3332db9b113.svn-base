package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gangdian.qc.dao.ProductMainDao;
import com.gangdian.qc.dao.QCCheckRecordDao;
import com.gangdian.qc.dao.QCProductPlanDao;
import com.gangdian.qc.dao.QCProductRecordDao;
import com.gangdian.qc.dao.QCWorkerDetailDao;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCCheckRecord;
import com.gangdian.qc.model.QCProductPlan;
import com.gangdian.qc.model.QCWorkerDetail;
import com.gangdian.qc.service.QCCheckRecordService;
import com.springmvc.util.Const;

@Service
public class QCCheckServiceImpl implements QCCheckRecordService{

	@Autowired
	private QCCheckRecordDao recordDao;
	@Autowired
	private ProductMainDao mainDao;
	@Autowired
	private QCWorkerDetailDao detailDao;
	
	@Autowired
	private QCProductRecordDao qcProductRecordDao;
	
	
	@Autowired
	private QCProductPlanDao planDao;
	
	private Logger log = Logger.getLogger(this.getClass().getName());
	
	public int insert(QCCheckRecord record) {
		log.info("insert into qccheckRcord : "+record);
		return recordDao.insert(record);
	}

	public int insertSelective(QCCheckRecord record) {
		log.info("insertSelective into qccheckRcord : "+record);
		return recordDao.insertSelective(record);
	}

	public QCCheckRecord selectByPrimaryKey(String id) {
		log.info(id);
		return recordDao.selectByPrimaryKey(id);
	}

	public synchronized int queryMaxId() {
		log.info("select maxID "+recordDao.queryMaxId());
		return recordDao.queryMaxId();
	}

	public Map querySumRecord(Integer id) {
		return recordDao.querySumRecord(id);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void insertNewRecord(ProductMain main,QCCheckRecord record,
			QCWorkerDetail workerDetail) throws Exception {
		try{
			log.info("insert main:"+main+"  and  qcworkerDetail :"+workerDetail);
			this.mainDao.insert(main);
			for(int i=1;i<=Const.WORKERHOURS;i++)
		{
			workerDetail.setHourperiod(i+"");
			detailDao.insert(workerDetail);
		}
		
		} catch(Exception e){
			 throw e;//注意，这里必须是重新抛出，让spring来处理，不然是不会rollback的。
		}
		
	}

	public List<Map<String, Object>> queryReportRecord(Integer groupid,Integer id , Integer progress) {
		//id为空则按工序查找  id不为空则按id查找
		if(id!=null){
			progress=null;
		}
		return recordDao.queryReportRecord(groupid,id,progress);
		
	}

	
	public Map<String, Object> getModelTypeByPono(String pono) {
		Map<String, Object> map=new HashMap<String, Object>();
		log.info("get model and type by pono:"+pono);
		QCProductPlan plan=planDao.getByPono(pono);
		String productType="";
		if(plan!=null){
			
			productType=qcProductRecordDao.selectByPrimaryKey(plan.getProductId())
					.getProductType();
		}
		map.put("plan", plan);
		map.put("productType", productType);
		return map;
		
	}

	public QCProductPlan getByPono(String pono) {
		log.info("get plan By Pono:"+pono);
		return planDao.getByPono(pono);
	}

	public List<Map<String, Object>> queryDateProduction(Integer belongid) {
		return recordDao.queryDateProduction(belongid);
	}

	public int deleteByPrimaryKey(Integer id) {
		 recordDao.deleteByPrimaryKey(id);
		 return 1;
	}

	public List<Map<String, Object>> dateReport2(Integer groupid, Integer id) {
		
		return recordDao.dateReport2(groupid, id);
	}
	
	

}
