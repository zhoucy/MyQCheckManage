package com.gangdian.qc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gangdian.qc.model.ProductMain;
import com.gangdian.qc.service.ProductMainService;

@Controller
@RequestMapping("qc")
public class ProductMainController {
	
	@Autowired
	private ProductMainService mainService;
	
	/**
	 *           ɾ��һ����¼
	 * @param id ��ɾ�������id
	 * @return   ���
	 */
	@RequestMapping("deleteMain.do")
	@ResponseBody
	public boolean deleteMain(Integer id){
		return mainService.deleteByPrimaryKey(id);
	}
	
	/**
	 *               ����һ����¼
	 * @param Main   ʵ����
	 * @return       ���
	 */
	@RequestMapping("updateMain.do")
	@ResponseBody
	public boolean updateMain(ProductMain main){
		return mainService.updateByPrimaryKeySelective(main);
	}
	
	/**
	 *                    ��ҳ������ѯ
	 * @param main        ʵ����
	 * @param rows        ÿҳ��С
	 * @param page        ҳ��
	 * @param sort        ������
	 * @param order       ������
	 * @return            ���������ļ�¼
	 */
	@RequestMapping("searchMain.do")
	@ResponseBody
	public Map<String, Object> searchMain(ProductMain main, Integer rows,Integer page, String sort, String order){
		return mainService.getMainPageList(main, rows, page, sort, order);
	}
	
	//��������ȡ����Ķ���������Ϣ(����ˢ�����к�����)
	@RequestMapping("getTodayPMByGroupid.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayPMByGroupid(Integer groupid){
		return mainService.getTodayPMByGroupid(groupid);
	}
	
	// ��������ȡ����Ķ���������Ϣ(�������ɼƻ��������������)
	@RequestMapping("getTodayPMByGroupidFromPlan.do")
	@ResponseBody
	public List<Map<String, Object>> getTodayPMByGroupidFromPlan(Integer groupid,String productDate) {
		return mainService.getTodayPMByGroupidFromPlan(groupid,productDate);
	}
	
	//��������ȡ�������������еĶ�����id
	@RequestMapping("lockProducingQCPM.do")
	@ResponseBody
	public Map<String, Object> lockProducingQCPM(Integer groupid){
		return mainService.lockProducingQCPM(groupid);
	}
	//��������ȡ��ǰ����
	@RequestMapping("nowProduction.do")
	@ResponseBody
	public ProductMain nowProduction(Integer groupid){
		ProductMain main=new ProductMain();
		main.setGroupid(groupid);
		return mainService.selectByOtherMax(main);
	}
	
	//�����������ڻ�ȡpm
	@RequestMapping("getPMByGroupidAndProductDate.do")
	@ResponseBody
	public List<Map<String, Object>> getPMByGroupidAndProductDate(Integer groupid,String productDate){
		return mainService.getPMByGroupidAndProductDate(groupid, productDate);
	}
}

