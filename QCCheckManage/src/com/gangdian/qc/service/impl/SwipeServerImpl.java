package com.gangdian.qc.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gangdian.qc.dao.ProductMainDao;
import com.gangdian.qc.dao.SwipeDao;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.service.SwipeServer;

@Service
public class SwipeServerImpl implements SwipeServer{

	@Autowired
	private SwipeDao swipeDao;
	@Autowired
	private ProductMainDao pmDao;
	
	//开始生产
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public Integer startQCPPandBindpono(ProductMain pm) {
		int result=0;
		if(pm!=null){
			Date date=new Date();
			pm.setId(null);
			pm.setProductTime(date);
			pm.setProductDate(new SimpleDateFormat("yyyy-MM-dd").format(date));			
			swipeDao.bind(pm.getGroupid(), pm.getPono());
			pmDao.insertSelective(pm);
			result=pm.getId();						
		}		
		return result;
	}

	//结束生产
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public boolean endQCPPandUnbindpono(ProductMain pm) {
		if(pm!=null&&pm.getId()!=null&&!pm.getId().equals("")){
			ProductMain temp=new ProductMain();
			temp.setId(pm.getId());
			temp.setEndTime(new Date());
			int mgroupid=pmDao.selectByPrimaryKey(pm.getId()).getGroupid();
			swipeDao.bind(mgroupid, null);
			pmDao.updateByPrimaryKeySelective(temp);
			return true;		
		}
		return false;
	}

	public boolean deleteAllCard() {
		boolean result=swipeDao.deleteAllCard()>0?true:false;
		return result;
	}

	public List<Map<String, Object>> getAllCard() {
		return swipeDao.getAllCard();
	}

	public boolean addMachine(Integer mgid,Integer mgroupid,String mgroupname,
			String mpono,String msequence,String mprintname) {
        boolean result=swipeDao.addMachine(mgid, mgroupid, mgroupname, mpono,msequence,mprintname)>0?true:false;
		return result;
	}

	public boolean deleteMachineByGid(Integer gid) {
		boolean result=swipeDao.deleteMachineByGid(gid)>0?true:false;
		return result;
	}
	
	public boolean updateMachine(Integer mgid,Integer mgroupid,String mgroupname,
			String mpono,String msequence,String mprintname){
		boolean result=swipeDao.updateMachineByGid(mgid, mgroupid, mgroupname, mpono,msequence,mprintname)>0?true:false;
		return result;
	}

	public List<Map<String, Object>> getAllMachine() {
		return swipeDao.getAllMachine();
	}

	public List<Map<String, Object>> getMachineById(Integer gid) {
		return swipeDao.getMachineById(gid);
	}

	public List<Map<String, Object>> getAllData() {
		return swipeDao.getAllData();
	}

	public Map<String, Object> getDataByCondition(String pono,
			Integer groupid, Integer position, String swipedate,String serialnum,
			Integer rows,Integer page, String sort, String order) {
		if(swipedate!=null&&swipedate.equals("today")){
			swipedate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		/*if(position==null){//开始工位
			List<Map<String, Object>> templist=swipeDao.getMachineByGroupId(groupid);
			if(templist!=null&&templist.size()>0){
				Object seq=templist.get(0).get("msequence");
				if(seq!=null){
					String [] str=seq.toString().split(";");
					position=Integer.valueOf(str[0]);
				}else{
					return null;
				}
			}else{
				return null;
			}  
		}*/
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=swipeDao.getDataByCondition(pono, groupid, position, swipedate, serialnum,
				null, null, null, null);
		result.put("total", list!=null?list.size():0);
		result.put("rows", swipeDao.getDataByCondition(pono, groupid, position, swipedate, serialnum,
				rows, page, sort, order));
		
		return result;
	}

	public boolean checkMgid(int gid){
		List<Map<String, Object>> list=swipeDao.getMachineById(gid);
		if(list!=null&&list.size()>0){
			return true;
		}
		return false;
	}
	
	
	
	
	public int addCheckData(String serialnum, Integer groupid,
			String groupname, String pono, Integer position, String qcid) throws Exception{
		return swipeDao.addCheckData(serialnum, groupid, groupname, pono, position, qcid);
	}
	
	public List<Map<String, Object>> getCheckNum( Integer groupid,Integer position){
		
		return swipeDao.getCheckNum(  groupid, position);
	}

	public String checkSerialNum(Integer position, String serialnum) {
		return swipeDao.checkSerialNum(position, serialnum);
	}

	
	
	
	
	
	
	public List<Map<String, Object>> getFailureBySerialnum(String serialnum) {
		return swipeDao.getFailureBySerialnum(serialnum);
	}

	public boolean addRepairRecord(String serialnum, String badcode,
			String result, String description, String repairman) {
		boolean flag=swipeDao.addRepairRecord(serialnum, badcode, result, description, repairman)>=1?true:false;
		return flag;
	}

	public List<Map<String, Object>> getRepairRecordByManAndDate(String serialnum,
			String repairman, String repairdate) {
		return swipeDao.getRepairRecordByManAndDate(serialnum,repairman, repairdate);
	}

	public int getRepairRecordNum(String repairman, String repairdate) {
		return swipeDao.getRepairRecordNum(repairman, repairdate);
	}

	public Map<String, Object> getQCCheckDetail(String qcid, String pono,
			String swipedate, Integer rows, Integer page, String sort,
			String order) {
		Map<String, Object> result=new HashMap<String, Object>();
		List<Map<String, Object>> list=swipeDao.getQCCheckDetail(qcid, pono, swipedate, null, null, null, null);
		result.put("total", list!=null?list.size():0);
		result.put("rows", swipeDao.getQCCheckDetail(qcid, pono, swipedate, rows, page, sort, order));
		return result;
	}

	public List<Map<String, Object>> getStationCount(Integer groupid) {
		return swipeDao.getStationCount(groupid);
	}

	


}
