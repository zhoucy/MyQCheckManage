package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;




import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCCheckProject;
import com.gangdian.qc.service.QCCheckProjectService;
import com.gangdian.qc.service.SwipeServer;
import com.springmvc.common.PrintLable;
import com.springmvc.sys.ZUtil;
import com.springmvc.util.Const;
import com.springmvc.util.print.PrintUtil;


@Controller
@RequestMapping("/qc")
public class SwipeController {

	@Autowired
	private SwipeServer swipeServer;
	@Autowired
	private QCCheckProjectService checkProjectService;
	private  Logger log=Logger.getLogger(this.getClass());
	//获取id卡的信息
	@RequestMapping("getCardInfo.do")
	@ResponseBody
	public List<Map<String, Object>> getCardInfo(){
		return swipeServer.getAllCard();
	}
	
	//获取组别与订单的绑定信息
	@RequestMapping("getBindPono.do")
	@ResponseBody
	public List<Map<String, Object>> getBindPono(){
		return swipeServer.getAllMachine();
	}
	
	//获取全部刷卡的信息
	@RequestMapping("getSwipeData.do")
	@ResponseBody
	public List<Map<String, Object>> getSwipeData(){
		return swipeServer.getAllData();
	}
	
	//筛选刷卡信息
	@RequestMapping("getSwipeDataByParams.do")
	@ResponseBody
	public Map<String, Object> getSwipeDataByParams(String pono,
			Integer groupid, Integer position, String swipedate,String serialnum,
			Integer rows,Integer page, String sort, String order){
		return swipeServer.getDataByCondition(pono, groupid, position, swipedate, serialnum, rows, page, sort, order);
	}
	
	
	//增加一条product_mian,并将刷卡器和订单绑定
	@RequestMapping("startQCPPandBindpono.do")
	@ResponseBody
	public Integer startQCPPandBindpono(ProductMain pm){
		return swipeServer.startQCPPandBindpono(pm);
	}
	
	//更新product_mian的结束时间,并解除刷卡器和订单的绑定
	@RequestMapping("endQCPPandUnbindpono.do")
	@ResponseBody
	public boolean endQCPPandUnbindpono(ProductMain pm){
		return swipeServer.endQCPPandUnbindpono(pm);
	}
	
	//暴露给外面的方法,没有过滤
	@RequestMapping("loginprint.do")
	@ResponseBody
	public String printest(String cserialnum,String printname,String code){
		//防止恶意访问打印方法定义一个code,不满足条件的code不处理
		if(code==null||!code.equals("123456")||printname==null||cserialnum==null){
			return "-1";
		}
		try {
			PrintUtil.UtilPrint(cserialnum, printname);
			return "0";
		} catch (Exception e) {
			e.printStackTrace();
			return "1";
		}		
	}
	
	//测试打印的方法
	@RequestMapping("print.do")
	@ResponseBody
	public String print(String cserialnum,String printname){
		String result="false";
		if(cserialnum==null||cserialnum.trim().equals("")){
			cserialnum="打印测试";
		}
		try {
			PrintUtil.UtilPrint(cserialnum, printname);
			result="true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	//卡机的增删改,重复检查
	@RequestMapping("addSMachine.do")
	@ResponseBody
	public boolean addSMachine(Integer mgid,Integer mgroupid,String mgroupname,
			String mpono,String msequence,String mprintname){
		return swipeServer.addMachine(mgid, mgroupid, mgroupname, mpono, msequence, mprintname);
	}
	@RequestMapping("updateSMachine.do")
	@ResponseBody
	public boolean updateSMachine(Integer mgid,Integer mgroupid,String mgroupname,
			String mpono,String msequence,String mprintname){
		return swipeServer.updateMachine(mgid, mgroupid, mgroupname, mpono, msequence, mprintname);
	}
	@RequestMapping("deleteSMachine.do")
	@ResponseBody
	public boolean deleteSMachine(Integer mgid){
		return swipeServer.deleteMachineByGid(mgid);
	}
	@RequestMapping("checkMgid.do")
	@ResponseBody
	public boolean checkMgid(int mgid){
		return !swipeServer.checkMgid(mgid);
	}
	
	
	/**
	 * 插入检测信息
	 * @param serialnum 订单批号
	 * @param pono  订单号
	 * @param groupname 组别名称
	 * @param qcid  检测项目编码
	 * @param groupid 组别id
	 * @return
	 */
	@RequestMapping("productCheck.do")
	@ResponseBody
	public String productCheck(String serialnum,String pono,
			String groupname,String qcid,
			Integer groupid){
		
		log.info("insert  check postion  pono :"+pono+" groupname:"+groupname+" qcid"+qcid);
		Integer position=Const.CHECKPOSITION;
		
		String ispono=swipeServer.checkSerialNum(position, serialnum);
		//是否已经刷卡
		if(!StringUtils.isEmpty(ispono)){
			return "fail03";
		}
		//检查订单批号和订单号是否一致
		if(!serialnum.contains(ZUtil.replaceP(pono))){
			return "fail01";
		}
		//检查是否存在对应的项目编码
		QCCheckProject qcProject = this.checkProjectService.selectByPrimaryKey(qcid);
		if(qcProject==null){
			return "fail02";
		}
		try {
			swipeServer.addCheckData(serialnum, groupid, groupname, pono, position, qcid);
			return "success";
		} catch (Exception e) {
			log.error(e.getMessage());
			return e.getMessage();
		}
	}
	@RequestMapping("checkData.do")
	@ResponseBody
	public  List<Map<String, Object>> checkData(Integer groupid){
			return swipeServer.getCheckNum(groupid, Const.CHECKPOSITION);
	}
	
	
	@RequestMapping("getFailureBySerialnum.do")
	@ResponseBody
	public List<Map<String, Object>> getFailureBySerialnum(String serialnum) {
		return swipeServer.getFailureBySerialnum(serialnum);
	}

	@RequestMapping("addRepairRecord.do")
	@ResponseBody
	public boolean addRepairRecord(String serialnum, String badcode,
			String result, String description, String repairman) {
		return swipeServer.addRepairRecord(serialnum, badcode, result, description, repairman);
	}

	@RequestMapping("getRepairRecordByManAndDate.do")
	@ResponseBody
	public List<Map<String, Object>> getRepairRecordByManAndDate(String serialnum,
			String repairman, String repairdate) {
		return swipeServer.getRepairRecordByManAndDate(serialnum,repairman,repairdate);
	}

	@RequestMapping("getRepairRecordNum.do")
	@ResponseBody
	public int getRepairRecordNum(String repairman, String repairdate) {
		return swipeServer.getRepairRecordNum(repairman, repairdate);
	}
	
	
	//生产日报v2
	//QC检测详情
	@RequestMapping("getQCCheckDetail.do")
	@ResponseBody
	public Map<String, Object> getQCCheckDetail(String qcid,String pono,String swipedate,
			Integer rows,Integer page,String sort,String order) {
		return swipeServer.getQCCheckDetail(qcid, pono, swipedate, rows, page, sort, order);
	}
	//工位扫描数据
	@RequestMapping("getStationCount.do")
	@ResponseBody
	public List<Map<String, Object>> getStationCount(Integer groupid) {
		return swipeServer.getStationCount(groupid);
	}
	
}
