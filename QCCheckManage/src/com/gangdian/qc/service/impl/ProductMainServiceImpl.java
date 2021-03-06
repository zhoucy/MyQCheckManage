package com.gangdian.qc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gangdian.qc.dao.ProductMainDao;
import com.gangdian.qc.dao.QCProgressDao;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCProgress;
import com.gangdian.qc.service.ProductMainService;
import com.springmvc.common.ProductTypeEnum;

@Service
public class ProductMainServiceImpl implements ProductMainService{

	@Autowired
	private ProductMainDao mainDao;
	@Autowired
	private QCProgressDao progressDao;
	public boolean deleteByPrimaryKey(Integer id) {
		int status= mainDao.deleteByPrimaryKey(id);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public boolean insert(ProductMain record) {
		int status= mainDao.insert(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public boolean insertSelective(ProductMain record) {
		int status= mainDao.insertSelective(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public ProductMain selectByPrimaryKey(Integer id) {
		return  mainDao.selectByPrimaryKey(id);
		
	}

	public boolean updateByPrimaryKeySelective(ProductMain record) {
		int status= mainDao.updateByPrimaryKeySelective(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public boolean updateByPrimaryKey(ProductMain record) {
		int status= mainDao.updateByPrimaryKey(record);
		if(status>=1){
			return true;
		}else{
			return false;	
		}
	}

	public int queryMaxId() {
		return mainDao.queryMaxId();
	}

	/**
	 * 查出主订单 并且将设置工序
	 */
	public ProductMain selectByOther(ProductMain main) {
		 ProductMain m=mainDao.selectByOther(main);
		 if(m!=null){
			 QCProgress p=progressDao.selectByCode(m.getProgress());
			 m.setQcprogress(p);
		 }
		 return m;
	}
	 public ProductMain selectByOtherMax(ProductMain main){
		 ProductMain m= mainDao.selectByOtherMax(main);
		 if(m!=null){
			 QCProgress p=progressDao.selectByCode(m.getProgress());
			 m.setQcprogress(p);
		 }
		 return m;
	 }

	public List<ProductMain> selectByDate(String productDate) {
		return mainDao.selectByDate(productDate);
	}

	public int selectByPono(String pono) {
		return mainDao.selectByPono(pono);
	}

	public List<ProductMain> selectByGroupId(String groupid,Integer progress) {
		 List<ProductMain> mainList= mainDao.selectByGroupId(groupid, progress);
		 if(mainList!=null){
			for (int i=0;i<mainList.size();i++){
					
					 QCProgress p=progressDao.selectByCode(mainList.get(i).getProgress());
					 mainList.get(i).setQcprogress(p);
			
			}
		 }
			return mainList;
	}

	public List<ProductMain> selectAllMain(ProductMain main) {
		 List<ProductMain> mainList= mainDao.selectAllMain(main);
		 if(mainList!=null){
			for (int i=0;i<mainList.size();i++){
					
					 QCProgress p=progressDao.selectByCode(mainList.get(i).getProgress());
					 mainList.get(i).setQcprogress(p);
			
			}
		 }
			return mainList;
	}

	

	public Map<String, Object> getMainPageList(ProductMain main, Integer rows,Integer page, String sort, String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<ProductMain>  mainList=mainDao.getMainPageList( main, rows, page, sort, order);
		if(mainList!=null&&mainList.size()>0){
			for (ProductMain main1:mainList){
				main1.setProdectType(ProductTypeEnum.getName(main1.getProdectType()));
			
			}
		}		
		List<ProductMain> total=mainDao.getMainPageSize(main);
		result.put("total", total!=null?total.size():0);
		result.put("rows", mainList);
		return result;
	}

	public Map<Object, Object> selectProductNum(ProductMain main) {
		return mainDao.selectProductNum(main);
	}

	public List<Map<String, Object>> getTodayPMByGroupid(Integer groupid) {
		return mainDao.getTodayPMByGroupid(groupid);
	}

	public List<Map<String, Object>> getTodayPMByGroupidFromPlan(Integer groupid,String productDate) {
		return mainDao.getTodayPMByGroupidFromPlan(groupid,productDate);
	}
	
	public Map<String, Object> lockProducingQCPM(Integer groupid) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=mainDao.lockProducingQCPM(groupid);
		if(list!=null&&list.size()>0){
			result=list.get(0);
		}else{
			boolean isEmpty=true;
			result.put("isEmpty",isEmpty);
		}
		return result;
	}

	public List<Map<String, Object>> getPMByGroupidAndProductDate(
			Integer groupid, String productDate) {
		return mainDao.getPMByGroupidAndProductDate(groupid, productDate);
	}

	




}
