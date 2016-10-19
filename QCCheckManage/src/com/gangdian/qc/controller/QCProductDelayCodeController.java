package com.gangdian.qc.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.QCProductDelayCode;
import com.gangdian.qc.service.QCProductDelayCodeService;
import com.gangdian.qc.service.impl.QCProductDelayCodeServiceImpl;


@Controller
@RequestMapping(value="/qc")
public class QCProductDelayCodeController {

	@Autowired
	private QCProductDelayCodeService qcpcService;
	
	/**
	 *               增加一条记录
	 * @param qcpc   实体类
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="addQCPC.do")
	@ResponseBody
	public boolean addQCPC(QCProductDelayCode qcpc){
		return qcpcService.addQCPC(qcpc);
	}
	/**
	 *               删除一条记录
	 * @param id     需要删除的id
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="deleteQCPC.do")
	@ResponseBody
	public boolean deleteQCPC(@RequestParam("id") String id){
		if(id!=null&&!id.equals("")){
			return qcpcService.deleteQCPC(Integer.parseInt(id));
		}else{
			return false;
		}
		
	}
	/**
	 *               更新一条记录
	 * @param qcpc   实体类
	 * @return       返回成功还是失败
	 */
	@RequestMapping(value="updateQCPC.do")
	@ResponseBody
	public boolean updateQCPC(QCProductDelayCode qcpc){
		return qcpcService.updateCPC(qcpc);
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
	@RequestMapping(value="searchQCPC.do")
	@ResponseBody
	public Map<String, Object> searchQCPC(QCProductDelayCode qcpc,
			String rows,String page,String sort,String order){
		//实体类和数据库字段不对应,还要麻烦胡转换一下
		if(sort!=null&&sort.equals("delayCode")){
			sort="delay_Code";
		}
		if(rows!=null&&!rows.trim().equals("")&&page!=null&&!page.trim().equals("")){
			return qcpcService.searchQCPC(qcpc, Integer.parseInt(rows), Integer.parseInt(page), sort, order);
		}else{
			return qcpcService.searchQCPC(qcpc, null, null, sort, order);
		}
		
	}
	/**
	 *                重复检查
	 * @param code    责任编码
	 * @return        返回有还是没有
	 */
	@RequestMapping(value="checkQCPC.do")
	@ResponseBody
	public boolean checkQCPC(@RequestParam("delayCode") String code){
		return !qcpcService.checkQCPC(code);
	}
	
	/**
	 * 获取所有的生产延误代码供添加失败工时时选择
	 * @return
	 */
	@RequestMapping(value="getDelayCodes")
	@ResponseBody
	public List<String[]> getDelayCodes(){
		return qcpcService.getAllCodes();
		
		
	}
	
	/**
	 * 通过代码获取相应部门
	 * @param delayCode
	 * @return
	 */
	@RequestMapping(value="getDepartment")
	@ResponseBody
	public String getDepartment( @RequestParam("delayCode")String delayCode){
		return qcpcService.getDepartmentByCode(delayCode);
		
		
	}
}
