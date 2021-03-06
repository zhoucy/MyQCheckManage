package com.gangdian.qc.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCFailDetail;
import com.gangdian.qc.model.QCWorkerDetail;
import com.gangdian.qc.service.DepartmentService;
import com.gangdian.qc.service.ProductMainService;
import com.gangdian.qc.service.QCCheckRecordService;
import com.gangdian.qc.service.QCFailDetailService;
import com.gangdian.qc.service.QCWorkDetailService;
import com.springmvc.sys.DateUtil;


@Controller
@RequestMapping(value="qc")
public class ProductBoardController {
	
	private Logger log= Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private QCFailDetailService failDetailService;
	@Autowired
	private QCWorkDetailService workerDetailService;
	@Autowired
	private ProductMainService mainService;
	@Autowired
	private QCCheckRecordService checkRecordService;
	@Autowired
	private DepartmentService dptservice;
	
	//添加失败工时
	@RequestMapping(value = "addFailHours")
	@ResponseBody
	public Map addFailHours(@RequestParam("groupid") String groupid,QCFailDetail fail) throws Exception {
	
		String setime=fail.getFailureEndHour();
		String sbtime=fail.getFailureStartHour();
	    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	  
	    int  morning=0;
		int  afternoon=0;
	    long etime=sdf.parse(setime).getTime();
	    long btime= sdf.parse(sbtime).getTime();
	    System.out.println((etime-btime)/(1000*60));
	    //如果是pm则将时间换成 24小时制+12个小时
	    if(setime.indexOf("PM")>=1 ){
			 etime=sdf.parse(setime).getTime()+12*60*1000*60;
			
		}
	    if(sbtime.indexOf("PM")>=1){
	    	btime=sdf.parse(sbtime).getTime()+12*60*1000*60;
	    }
	    //判断中午休息时间
		if(btime<5*3600*1000&&etime>5*3600*1000){
				 morning=5400000;
		}
		//判断晚上休息时间
		if(btime<37800000&&etime>37800000){
			afternoon=3600000; 
		}
	    //计算失败工时起止相差的时间
	    float diff=0;
	    if(sbtime!=null&&setime!=null){
	    	 diff = (etime - btime-morning-afternoon)/(1000*60);
	    }
	    Map<String, Object> map=new HashMap<String, Object>();
	    String message="";
	    if(diff<0){
	    	message="时间起："+sbtime+" 大于 时间止 ："+setime +"请确认";
	    }else{
			    BigDecimal diffb=new BigDecimal(diff);
				fail.setFailureCountHours(diffb);
				if(fail.getUseWorkers()!=null){
					fail.setUseSumHours(diffb.multiply(new BigDecimal(fail.getUseWorkers())));
				}else fail.setUseSumHours(new BigDecimal(0));
				 try{
					 //如果id为空 则为新增否则为更新
					  if(fail.getId()==null){
						  this.failDetailService.insertSelective(fail);
					    }else this.failDetailService.updateFailById(fail);
					
					message= "success";
				 }catch(Exception e) {
					 message= e.getMessage();
					 log.error(message);
				 }
			}
		  map.put("message", message);
			//md.addObject("message", message);
			return map;
		
	}
	
	/**
	 * 插入（更新）调入调出信息
	 * (由于初始已经插入所有调入调出信息，所以 是更新)
	 * @param groupid
	 * @param qcWorkerDetail
	 * @return	message  提示信息
	 * @throws Exception
	 */
	
	@RequestMapping(value = "addWorkersDetail")
	@ResponseBody
	public String  addWorkerDetail(
			Integer oldStandardProd,Integer oldWorker,
			QCWorkerDetail qcWorkerDetail) throws Exception {
		 Map<String, Object> map=new HashMap<String, Object>();
		 String message="";
		 //多选时间段分离
		 String sourceStr = qcWorkerDetail.getHourperiod();
		 if(sourceStr.isEmpty()){
			 message="请选择时间段";
			 return message;
		 }
	     String[] periodArray = sourceStr.split(",");
		
		 int workAmount= qcWorkerDetail.getWorkerAmount()==null?0:qcWorkerDetail.getWorkerAmount();
		 int workMinte=qcWorkerDetail.getWorkMinute()==null?0:qcWorkerDetail.getWorkMinute();
		 int borrowWorker= qcWorkerDetail.getBorrowWorkers()==null?0:qcWorkerDetail.getBorrowWorkers();
		 int borrowWorkerM=qcWorkerDetail.getBorrowWorkersM()==null?0:qcWorkerDetail.getBorrowWorkersM();
		 int getWorker=qcWorkerDetail.getGetWorkers()==null?0:qcWorkerDetail.getGetWorkers();
		 int getWorkerM=qcWorkerDetail.getGetWorkersM()==null?0:qcWorkerDetail.getGetWorkersM();
		 //总时间=原人数*时间+借入人数*时间-借出人数*时间
		 int workMinuts=workAmount*workMinte-
				 borrowWorker*borrowWorkerM
				 +getWorker*getWorkerM;
		 //实时标准产能=原标准产能*(总时间）/(原人数*原时间)
		 int standProd=Integer.valueOf(oldStandardProd)*(workMinuts)/(oldWorker*60);
		 qcWorkerDetail.setStandardProduct(standProd);
		try {
			this.workerDetailService.updateByPrimaryKeySelective(qcWorkerDetail,periodArray);
			message="success";
		} catch (Exception e) {
			log.error(message);
			message=e.getMessage();
		}
		return message;
	
	}
	/**
	 * 生成生产日报看板
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="getReportBoard")
	@ResponseBody
	public Map<String, Object> getReportBoard(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		Integer groupid = Integer.valueOf(request.getParameter("groupid"));
		String  idString =request.getParameter("id");
		Integer id=null;
		if(!StringUtils.isEmpty(idString)){
			id=Integer.valueOf(idString);
		}
		String  progressString =request.getParameter("progress");
		Integer progress=null;
		if(!StringUtils.isEmpty(progressString)){
			progress=Integer.valueOf(progressString);
		}
				
		String productDate=DateUtil.dateToStr(new Date());
		DecimalFormat df = new DecimalFormat("0.00");//格式化小数  
		ProductMain mainNew=new ProductMain();
		mainNew.setId(id);
		mainNew.setGroupid(groupid);
		mainNew.setProductDate(productDate);
		mainNew.setProgress(progress);
		//获取当前组别当前日期最近订单号
		ProductMain main=this.mainService.selectByOtherMax(mainNew);
		if(main==null){
			main=new ProductMain();
		}
		main.setDpt(dptservice.getDeptById(main.getGroupid()));
		//获取失败工时记录
		List<QCFailDetail> failList=this.failDetailService.selectByParentId(main.getId());
		//获取员工分布详细记录
		List<QCWorkerDetail>  workerDetails=this.workerDetailService.selectBySumGroup(main.getGroupid(),id,progress);
		List<Map<String, Object>> reportRecord=this.checkRecordService.queryReportRecord(groupid,id,progress);
		Map<Object, Object> productNum=this.mainService.selectProductNum(mainNew);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("report/QCDateBoard", Boolean.TRUE);
        map.put("sumRecord", reportRecord);
		map.put("failList",failList );
		map.put("main", main);
        map.put("workerDetails", workerDetails);
        map.put("productNum", productNum);
        return map;
	}
	
	/**
	 * 生成生产日报看板2
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="getReportBoard2")
	@ResponseBody
	public Map<String, Object> getReportBoard2(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		Integer groupid = Integer.valueOf(request.getParameter("groupid"));
		String  idString =request.getParameter("id");
		Integer id=null;
		if(!StringUtils.isEmpty(idString)){
			id=Integer.valueOf(idString);
		}
		String  progressString =request.getParameter("progress");
		Integer progress=null;
		if(!StringUtils.isEmpty(progressString)){
			progress=Integer.valueOf(progressString);
		}
		
		String productDate=DateUtil.dateToStr(new Date());
		DecimalFormat df = new DecimalFormat("0.00");//格式化小数  
		ProductMain mainNew=new ProductMain();
		mainNew.setId(id);
		mainNew.setGroupid(groupid);
		mainNew.setProductDate(productDate);
		mainNew.setProgress(progress);
		//获取当前组别当前日期最近订单号
		ProductMain main=this.mainService.selectByOtherMax(mainNew);
		if(main==null){
			main=new ProductMain();
		}
		main.setDpt(dptservice.getDeptById(main.getGroupid()));
		//获取失败工时记录
		List<QCFailDetail> failList=this.failDetailService.selectByParentId(main.getId());
		//获取员工分布详细记录
		List<QCWorkerDetail>  workerDetails=this.workerDetailService.selectBySumGroup(main.getGroupid(),id,progress);
		List<Map<String, Object>> reportRecord=this.checkRecordService.dateReport2(groupid, id);
		Map<Object, Object> productNum=this.mainService.selectProductNum(mainNew);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("report/QCDateBoard", Boolean.TRUE);
		map.put("sumRecord", reportRecord);
		map.put("failList",failList );
		map.put("main", main);
		map.put("workerDetails", workerDetails);
		map.put("productNum", productNum);
		return map;
	}
	
	@RequestMapping(value="getProductionBoard")
	@ResponseBody
	public List<Map<String, Object>> getProductionBoard(HttpServletRequest request,
			HttpServletResponse response,Integer belongid) throws Exception{
		List<Map<String, Object>> production = checkRecordService.queryDateProduction(belongid);
		return production;
	}
	
	/**
	 * 按id删除失败工时
	 * @param request
	 * @param response
	 * @param failId 失败工时id
	 * @return message 提示信息
	 */
	@RequestMapping(value="deleteFail")
	@ResponseBody
	public String  deleteFail(HttpServletRequest request,
			HttpServletResponse response,Integer failId) {
		String message="";
		try {
			failDetailService.deleteByPrimaryKey(failId);
			message="success";
		} catch (Exception e) {
			message=e.getMessage();
			log.error(message);
		}
		
		return message;
	}
	
	@RequestMapping(value="toReportBoard")
	public String toReportBoard(@RequestParam("groupid") Integer groupid ,Model model){
		model.addAttribute("groupid",groupid);
		ProductMain main=new ProductMain();
		main.setGroupid(groupid);
		main.setProductDate(DateUtil.dateToStr(new Date()));
		List<ProductMain> mainList = mainService.selectAllMain(main);
		List<Object> progressList=new ArrayList<Object>();
		if(mainList!=null&&mainList.size()>0){
			for(int i=0;i<mainList.size();i++){
				progressList.add(mainList.get(i).getProgress());
			}
		}
		model.addAttribute("progressList",progressList);
		return "/board/QCDateBoard";
		
	}
	
	@RequestMapping(value="toReportBoard2")
	public String toReportBoard2(@RequestParam("groupid") Integer groupid ,Model model){
		model.addAttribute("groupid",groupid);
		ProductMain main=new ProductMain();
		main.setGroupid(groupid);
		main.setProductDate(DateUtil.dateToStr(new Date()));
		List<ProductMain> mainList = mainService.selectAllMain(main);
		List<Object> progressList=new ArrayList<Object>();
		if(mainList!=null&&mainList.size()>0){
			for(int i=0;i<mainList.size();i++){
				progressList.add(mainList.get(i).getProgress());
			}
		}
		model.addAttribute("progressList",progressList);
		return "/board/QCDateBoard2";
		
	}
	
	@RequestMapping(value="getDatePono")
	@ResponseBody
	public List<ProductMain>   getDatePono(String groupid,Integer progress){
		
		return mainService.selectByGroupId(groupid,progress);
	}
	
	@RequestMapping(value="getParentId")
	@ResponseBody
	public ProductMain   getParentId(ProductMain main){
		
		return mainService.selectByOther(main);
	}
	

}
