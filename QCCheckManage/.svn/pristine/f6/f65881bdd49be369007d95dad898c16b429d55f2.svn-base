package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


public interface SwipeDao {

	//维修
	//根据序列号获取坏机
	List<Map<String, Object>> getFailureBySerialnum(@Param("serialnum") String serialnum);
	//增加一条维修记录
	int addRepairRecord(@Param("serialnum") String serialnum,@Param("badcode") String badcode,
			@Param("result") String result,@Param("description") String description,
			@Param("repairman") String repairman);
	//根据序列号,维修者和维修日期获取维修记录
	List<Map<String, Object>> getRepairRecordByManAndDate(@Param("serialnum") String serialnum,
			@Param("repairman") String repairman,@Param("repairdate") String repairdate);
	//根据维修者和维修日期获取维修数
	int getRepairRecordNum(@Param("repairman") String repairman,@Param("repairdate") String repairdate);
	
	
	
	//id卡
	//删除全部的id卡
	int deleteAllCard();
	//获取全部的id卡
	List<Map<String, Object>> getAllCard();
	
	
	//刷卡器(组别和订单)
	//新增一条刷卡器
	int addMachine(@Param("mgid") Integer mgid,@Param("mgroupid") Integer mgroupid,
			@Param("mgroupname") String mgroupname,@Param("mpono") String mpono,
			@Param("msequence") String msequence,@Param("mprintname") String mprintname);
	//根据gid删除刷卡器
	int deleteMachineByGid(@Param("mgid") Integer mgid);
	//根据组别删除刷卡器
	int deleteMachineByGroupId(@Param("mgroupid") Integer mgroupid);
	//根据gid更新组别或者订单信息
	int updateMachineByGid(@Param("mgid") Integer mgid,@Param("mgroupid") Integer mgroupid,
			@Param("mgroupname") String mgroupname,@Param("mpono") String mpono,
			@Param("msequence") String msequence,@Param("mprintname") String mprintname);
	//获取全部的刷卡器信息
	List<Map<String, Object>> getAllMachine();
	//根据id获取刷卡器的信息
	List<Map<String, Object>> getMachineById(@Param("mgid") Integer mgid);
	//根据groupid获取刷卡器的信息
	List<Map<String, Object>> getMachineByGroupId(@Param("mgroupid") Integer mgroupid);
	
	
	//订单和组别的绑定
	int bind(@Param("mgroupid") Integer mgroupid,@Param("mpono") String mpono);
	
	
	//刷卡数据
	//获取全部的数据
	List<Map<String, Object>> getAllData();
	//根据条件获取
	List<Map<String, Object>> getDataByCondition(@Param("pono") String pono,@Param("groupid") Integer groupid,
			@Param("position") Integer position,@Param("swipedate") String swipedate,@Param("serialnum") String serialnum,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
		//新增一条qc刷卡记录
	int addCheckData(@Param("serialnum") String serialnum,@Param("groupid") Integer groupid,
			@Param("groupname") String groupname,@Param("pono") String pono,
			@Param("position") Integer position,@Param("qcid")  String qcid) ;	
	
	//根据组别获取当天的工位数量信息
	List<Map<String, Object>> getCheckNum(@Param("groupid") Integer groupid,
			@Param("position") Integer position);
	/**
	 * 检查在指定工位是否存在订单批号 
	 * @param position 工位id
	 * @param serialnum 订单批号
	 * @return
	 */
	String checkSerialNum(@Param("position") Integer position,
			@Param("serialnum") String serialnum);
	
	
	
	
	
	//生产日报v2QC检测详情
	//QC检测详情
	List<Map<String, Object>> getQCCheckDetail(@Param("qcid") String qcid,
			@Param("pono") String pono,@Param("swipedate") String swipedate,
			@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
	
	//工位扫描数据
	List<Map<String, Object>> getStationCount(@Param("groupid") Integer groupid);
}
