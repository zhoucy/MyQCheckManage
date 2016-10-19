package com.gangdian.qc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProductRecord;
import com.gangdian.qc.service.QCProductRecordService;
import com.springmvc.common.ProductTypeEnum;

@Controller
@RequestMapping(value="product")
public class QCProductRecordController {
	@Autowired
	private QCProductRecordService productRecordService;
	
	/**
	 *               增加一条记录
	 * @param qcpc   实体类
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="addProduct.do")
	@ResponseBody
	public boolean addQCPC(QCProductRecord record){
		return productRecordService.insertSelective(record);
	}
	/**
	 *               删除一条记录
	 * @param id     需要删除的id
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="deleteProduct.do")
	@ResponseBody
	public boolean deleteQCPC(@RequestParam("id") String id){
		if(id!=null&&!id.equals("")){
			return productRecordService.deleteByPrimaryKey(Integer.parseInt(id));
		}else{
			return false;
		}
		
	}
	/**
	 *               更新一条记录
	 * @param qcpc   实体类
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="updateProduct.do")
	@ResponseBody
	public boolean updateProduct(QCProductRecord record){
		return productRecordService.updateByPrimaryKeySelective(record);
	}
	/**
	 *               分页条件查询
	 * @param qcpc   责任代码实体类(查询条件)
	 * @param rows   easyui定义的参数,每页大小
	 * @param page   easyui定义的参数,页数(第几页)
	 * @param sort   easyui定义的参数,需要排序的字段
	 * @param order  easyui定义的参数,排序升序还是降序
	 *        total  easyui定义的参数,需要后台获取给到前台,就是getPageSize返回的结果
	 * @return       返回符合条件的集合list
	 */
	@RequestMapping(value="searchProduct.do")
	@ResponseBody
	public Map<String, Object> searchProduct(QCProductRecord record,
			Integer rows,Integer page,String sort,String order){
		//实体类和数据库字段不对应,转换一下
		Map<String, Object> map=new HashMap<String, Object>();
		if(sort!=null&&sort.equals("productSpecific")){
			sort="product_specific";
		}
		if(sort!=null&&sort.equals("productType")){
			sort="product_type";
		}
		if(sort!=null&&sort.equals("materialCode")){
			sort="material_code";
		}
		List<QCProductRecord> products=null;
		int rows1=productRecordService.getPageSize(record);
		if(rows!=null&&page!=null){
			  products = productRecordService.productGetProgressPage(record, rows, page, sort, order);
			  
		}else{
			products =  productRecordService.productGetProgressPage(record, null, null, sort, order);
		}
		map.put("total", rows1);
		map.put("rows", products);
		return map;
		
	}
	/**
	 *                重复检查
	 * @param code    责任编码
	 * @return        返回有还是没有
	 */
	@RequestMapping(value="checkProduct.do")
	@ResponseBody
	public boolean checkQCPC(@RequestParam("model") String model){
		
		QCProductRecord recode=new QCProductRecord(model);
		recode=productRecordService.checkProduct(recode);
		if(recode!=null) return false;
		else return true;
	}
	
	@RequestMapping(value="getProductType.do")
	@ResponseBody
	public ProductTypeEnum[] getProductType(){
		ProductTypeEnum[] type=	ProductTypeEnum.values();
		return type;
	}
	
	@RequestMapping(value="getAllQCPR.do")
	@ResponseBody
	public List<QCProductRecord> getAllQCPR(){
		return productRecordService.getAllQCPR();
	}

}
