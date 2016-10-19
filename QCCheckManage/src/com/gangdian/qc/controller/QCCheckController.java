package com.gangdian.qc.controller;



import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.BoxProduct;
import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.model.QCCheckProject;
import com.gangdian.qc.model.QCCheckRecord;
import com.gangdian.qc.model.QCProductPlan;
import com.gangdian.qc.model.QCProgressManHour;
import com.gangdian.qc.model.QCWorkerDetail;
import com.gangdian.qc.service.BoxProductService;
import com.gangdian.qc.service.ProductMainService;
import com.gangdian.qc.service.QCCheckProjectService;
import com.gangdian.qc.service.QCCheckRecordService;
import com.gangdian.qc.service.QCProductPlanService;
import com.gangdian.qc.service.QCProgressManHourService;
import com.mysql.jdbc.StringUtils;
import com.springmvc.sys.DateUtil;



@Controller
@RequestMapping("qc")
public class QCCheckController {

	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private  QCCheckRecordService recordService;//QC检测
	@Autowired
	private ProductMainService mainService;//QC生产订单
	@Autowired
	private QCProgressManHourService proManHourService;//工时工序
	@Autowired
	private QCCheckProjectService checkProjectService;//不良项
	@Autowired
	private QCProductPlanService planService;//生产计划
	@Autowired
	private BoxProductService boxService;//产品装箱信息

	/**
	 * 获取页面传进来的参数QCCheckProjectID、
	 * 检查是否在不良项目表中存在这个不良项目 如果存在 检查是否有当前的生产型号相关数据
	 * 没有则返回错误信息
	 * 和对应的订单信息 查询是否存在对应的订单信息ProductMain
	 * 1.如果订单信息不存在  则新增一条订单信息 同时 新增默认的11条人员调动信息
	 * 并且获取当前 订单信息中最大的id值，id值+1 为当前新增信息的id
	 * 2.如果订单信息存在 ，则插入对应的qc检测记录 parent_id 为ProductMain的id值
	 *  
	 * 
	 * 
	 * */
	
	@RequestMapping(value = "insertQCDetailRecord1", method = RequestMethod.POST)
	@ResponseBody
	public Map insertQCDetailRecord1(HttpServletRequest request,
			HttpServletResponse response,ProductMain main) throws Exception{
		String QCCheckProjectID = request.getParameter("qccheckprojectid");//项目编码
		String packbarcode = request.getParameter("packbarcode");//彩盒条形码
		
		
		String hiddenID = request.getParameter("hiddenID");
		String prodectType = main.getProdectType();
		Map<String, Object> jsonResult=new HashMap<String, Object>();
		String message="";
		Map<String, Object> map = new HashMap<String, Object>();
		
		//项目编码不为空且条形码不为空 则为包装良品，判断彩盒编码是否与生产计划中的彩盒编码一致
		if(StringUtils.isNullOrEmpty(QCCheckProjectID)&&!StringUtils.isNullOrEmpty(packbarcode)){
			QCCheckProjectID="P01";
			 QCProductPlan plan = planService.getByPono(main.getPono());
			    if(plan!=null&&plan.getPackbarcode()!=null){
			    	if(!plan.getPackbarcode().equals(packbarcode)){
			    		message="彩盒编码："+packbarcode+"不正确";
			    		jsonResult.put("message", message);
			    		return jsonResult;
			    	}
			    }else {
			    	message="未找到对应彩盒编码";
			    	jsonResult.put("message", message);
			    	return jsonResult;
			    }
			    
		}
		//查询是否有相应的不良项编码
		QCCheckProject qcProject = this.checkProjectService.selectByPrimaryKey(QCCheckProjectID);
		
		if (qcProject!= null) {
			//订单主表不存在 则新增主表并且新增qc记录详细否则 只新增qc记录详细
			QCCheckRecord record=new QCCheckRecord();
			Integer parentID = null;
			record.setQccheckprojectid(QCCheckProjectID);
			if(hiddenID==null||"".equals(hiddenID)){
				main.setProductDate( DateUtil.dateToStr(new Date()));
				Date productTime=new Date();
				//查询是否存在对应的订单主表
				ProductMain product = this.mainService.selectByOther(main);
				main.setProductTime(productTime);
				//查询当前最大的主订单id 
				int fid = this.mainService.queryMaxId();
				//订单不存在则新增员工分布信息 订单信息 从工时工序表中获取对应的标准工时
				if (null==product) {
					fid++;
					main.setId(fid);
					QCWorkerDetail workerDetail=new QCWorkerDetail(fid);
					workerDetail.setStandardProduct(main.getStandardProduct());
					record.setParentId(fid);
					parentID=fid;
						//this.recordService.insertSelective(record);
						try {
							//新增记录信息 添加一条主订单信息 新增默认人员调动
							this.recordService.insertNewRecord(main, record,workerDetail);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
							message="插入失败";
							jsonResult.put("message", message);
							return jsonResult;
						}
					
					}else{
							parentID=product.getId();
					}
				}else{
					parentID=Integer.valueOf(hiddenID);
				}
			record.setParentId(parentID);
			this.recordService.insertSelective(record);
			int recordid=record.getId();
			//查询相应的良品不良品汇总
			map = this.recordService.querySumRecord(parentID);
			jsonResult.put("hiddenID",parentID);
			jsonResult.put("recordid", recordid+"");
			jsonResult.put("qcProjectList", qcProject);
			}else{
				message="未找到相应编码:"+QCCheckProjectID;
			}
		if (map != null && map.size() > 0) {
			int goodNum =  (Integer) map.get("goodNum");
			int badNum = (Integer)map.get("badNum");
			jsonResult.put("goodNum", goodNum);
			jsonResult.put("badNum", badNum);
		
		}
		jsonResult.put("message", message);
		
		return jsonResult;
	}

	@RequestMapping(value="getProductNum")
	@ResponseBody
	public Map<String ,Object> getProductNum(@RequestParam("productid") Integer productid,
			@RequestParam("progress")Integer progress,
			@RequestParam("sumWorker")Integer sumWorker){
	
	QCProgressManHour proManHour=new QCProgressManHour(productid, progress);
	//查询是否存在对应的工时工序工序信息 
	proManHour= proManHourService.selectByOther(proManHour);
	Map<String, Object> map=null;
	if(proManHour!=null){
		map=new HashMap<String, Object>();
		//标准产能=单位产能*人数
		double  standardProduct=(proManHour.getManHour()).doubleValue()*sumWorker;
		int standardProductI=Integer.parseInt(new java.text.DecimalFormat("0")
							.format(standardProduct));
		//目标产能=标准产能/0.8
		double  targetProduct =standardProductI/0.8;
		map.put("standardProduct", standardProductI);
		map.put("targetProduct", Integer.parseInt(new java.text.DecimalFormat("0").format(targetProduct)));
	}
		return map;
	}
	/**
	 * 根据订单号查询产品型号
	 * @param pono
	 * @return
	 */
	@RequestMapping(value="checkBox.do")
	@ResponseBody
	public Map<String, Object> checkBox(BoxProduct boxProduct){
		Map<String, Object> map=new HashMap<String, Object>();	
		String message="";
		try{
			boxProduct.setCheckTime(new Date());
			boxService.insertSelective(boxProduct);
			int boxNum=boxService.getPageSize(boxProduct);
			map.put("boxNum", boxNum);
		}catch(Exception e){
			log.error(e.getMessage());
			message="插入失败";
		}
		map.put("message", message);
		return map;
		
			
		
	}
	/**
	/**
	 * 根据订单号查询产品型号
	 * @param pono
	 * @return
	 */
	@RequestMapping(value="getPlanModel.do")
	@ResponseBody
	public Map<String, Object> getQCPlanNo(@RequestParam("pono") String pono){
		
		return recordService.getModelTypeByPono(pono);
		
	}
	/**
	 * 获取所有的订单号
	 * @return
	 */
	@RequestMapping(value="getPlanPonos.do")
	@ResponseBody
	public List<String> getPlanPonos(){
		return this.planService.getAllPonos();
	}
	/**
	 * 换单 更新主表 订单结束时间
	 * @return
	 */
	@RequestMapping(value="changePono.do")
	@ResponseBody
	public void getPlanPonos(@RequestParam("hiddenID") Integer hiddenID){
		if(hiddenID!=null&&!hiddenID.equals("")){
			
			ProductMain record=new ProductMain();
			record.setId(hiddenID);
			record.setEndTime(new Date());
			mainService.updateByPrimaryKeySelective(record);
		}
	}
	
	@RequestMapping("addQCPM.do")
	@ResponseBody
	public boolean addQCPM(ProductMain pm){
		return false;
	}
	@RequestMapping("delRecord.do")
	@ResponseBody
	public String delRecord(Integer id){
		String message="";
		try {
			recordService.deleteByPrimaryKey(id);
			message="删除成功";
		} catch (Exception e) {
			message=e.getMessage();
			log.error(message);
		}
		return message;
		
	}
	
}
