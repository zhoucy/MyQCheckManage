package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.ProductMain;

public interface SwipeServer {

	//新增一条生产记录product_main并且将订单和组别绑定起来,返回生产记录的id
	public Integer startQCPPandBindpono(ProductMain pm);
	//生产记录更新其结束时间,并且将订单和组别解除绑定
	public boolean endQCPPandUnbindpono(ProductMain pm);
	
	
	
	
	//id卡
	//删除全部id卡的信息
	public boolean deleteAllCard();
	//获取全部的id卡信息
	public List<Map<String, Object>> getAllCard();
	
	//刷卡器(组别和订单)
	//添加
	public boolean addMachine(Integer mgid,Integer mgroupid,String mgroupname,String mpono,String msequence,String mprintname);
	//删除	
	public boolean deleteMachineByGid(Integer gid);
	//更新
	public boolean updateMachine(Integer mgid,Integer mgroupid,String mgroupname,String mpono,String msequence,String mprintname);
	//获取全部的刷卡器信息
	public List<Map<String, Object>> getAllMachine();
	//根据id获取刷卡器的信息
	public List<Map<String, Object>> getMachineById(Integer gid);
	//gid重复检查
	public boolean checkMgid(int gid);
	
	//刷卡数据
	//获取全部的数据
	public List<Map<String, Object>> getAllData();
	//根据条件获取
	public Map<String, Object> getDataByCondition(String pono,Integer groupid,Integer position,String swipedate,String serialnum,
			Integer rows,Integer page, String sort, String order);
	
	//新增qc刷卡记录 -zhoucy
	int addCheckData( String serialnum, Integer groupid,
			String groupname,String pono,
			Integer position, String qcid) throws Exception;
	//根据组别和工位获取当天的工位数量
	
	List<Map<String, Object>> getCheckNum( Integer groupid,Integer position);
	
	
	/**
	 * 检查在指定工位是否存在订单批号 
	 * @param position 工位id
	 * @param serialnum 订单批号
	 * @return
	 */
	String checkSerialNum(@Param("position") Integer position,
			@Param("serialnum") String serialnum);
	
	
	
	
	//根据序列号获取坏机
	public List<Map<String, Object>> getFailureBySerialnum(String serialnum);
	
	//增加一条维修记录
	public boolean addRepairRecord(String serialnum,String badcode,String result,
			String description,String repairman);
	
	//根据维修者和维修日期获取维修记录
	public List<Map<String, Object>> getRepairRecordByManAndDate(String serialnum,String repairman,String repairdate);
	
	//根据维修者和维修日期获取维修数
	public int getRepairRecordNum(String repairman,String repairdate);
	
	
	
	//生产日报v2
	//QC检测详情
	public Map<String, Object> getQCCheckDetail(String qcid,String pono,String swipedate,
			Integer rows,Integer page,String sort,String order);
	//工位扫描数据
	public List<Map<String, Object>> getStationCount(Integer groupid);
}
