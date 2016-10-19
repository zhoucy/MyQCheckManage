package com.gangdian.qc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.QCProductRecordDao;
import com.gangdian.qc.dao.QCProgressDao;
import com.gangdian.qc.dao.QCProgressManHourDao;
import com.gangdian.qc.model.QCProductRecord;
import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.model.QCProgressManHour;
import com.gangdian.qc.service.QCProductRecordService;
import com.springmvc.common.ProductTypeEnum;

@Service
public class QCProductRecordServiceImpl implements QCProductRecordService{

	@Autowired
	private QCProductRecordDao productRecordDao;
	
	@Autowired
	private QCProgressDao progress;
	
	@Autowired
	private QCProgressManHourDao manHourDao;
	
	public boolean deleteByPrimaryKey(Integer id) {
		int result=productRecordDao.deleteByPrimaryKey(id);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	public boolean insert(QCProductRecord record) {
		int result=productRecordDao.insert(record);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	public boolean insertSelective(QCProductRecord record) {
		int result=productRecordDao.insertSelective(record);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	public QCProductRecord selectByPrimaryKey(Integer id) {
		return productRecordDao.selectByPrimaryKey(id);
	}

	public boolean updateByPrimaryKeySelective(QCProductRecord record) {
		int result=productRecordDao.updateByPrimaryKeySelective(record);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	public boolean updateByPrimaryKey(QCProductRecord record) {
		int result=productRecordDao.updateByPrimaryKey(record);
		if(result>=1){
			return true;
		}else{
			return false;
		}
	}

	public int getPageSize(QCProductRecord record) {
		return productRecordDao.getPageSize(record);
	}

	public List<QCProductRecord> getPageList(QCProductRecord record,
			Integer rows, Integer page, String sort, String order) {
		return productRecordDao.getPageList(record, rows, page, sort, order);
	}

	public QCProductRecord checkProduct(QCProductRecord record) {
		return productRecordDao.checkProduct(record);
	}

	public List<QCProductRecord> productGetProgress(String model) {
		// TODO Auto-generated method stub
		return productRecordDao.productGetProgress(model);
	}

	public List<QCProductRecord> productGetProgressPage(QCProductRecord record,
			Integer rows, Integer page, String sort, String order) {
		// TODO Auto-generated method stub
		List<QCProductRecord> recordList= productRecordDao.productGetProgressPage(record, rows, page, sort, order);
		if(recordList!=null&&recordList.size()>0){
			for(int i=0;i<recordList.size();i++){
				QCProductRecord record2= recordList.get(i);
				record2.setProductType(ProductTypeEnum.getName(recordList.get(i).getProductType()));
				//record2.setProgressManHours(manHourDao.selectByOther(new QCProgressManHour(record2, progressid))));
				for(QCProgressManHour progressManHour : recordList.get(i).getProgressManHours()){
					progressManHour.setProgress(progress.selectByPrimaryKey(progressManHour.getProgressid()));
					
				}
			}
		}
		return recordList;
	}

	public QCProductRecord selectByModel(String model) {
		// TODO Auto-generated method stub
		return productRecordDao.selectByModel(model);
	}

	public List<String> selectAllModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<QCProductRecord> getAllQCPR(){
		return productRecordDao.getAllQCPR();
	}

}
