package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;





import com.gangdian.qc.model.ProductMain;

public interface ProductMainService {
	
		boolean deleteByPrimaryKey(Integer id);

	    boolean insert(ProductMain record);

	    boolean insertSelective(ProductMain record);

	    ProductMain selectByPrimaryKey(Integer id);

	    boolean updateByPrimaryKeySelective(ProductMain record);

	    boolean updateByPrimaryKey(ProductMain record);
	    
	    int  queryMaxId();
	    
	    ProductMain selectByOther(ProductMain main);
	    /**
	     * �������ں�����ȡ��ǰ����Ķ���
	     * @param main
	     * @return
	     */
	    ProductMain selectByOtherMax(ProductMain main);
	    
	    /**
	     * �����������ڻ�ȡ�ĵ������ж���
	     * @param productDate
	     * @return
	     */
	    List<ProductMain> selectByDate(String productDate);
	    /**
	     * ���ݵ��Ż�ȡ�õ������е��������
	     * @param pono
	     * @return
	     */
	    int  selectByPono(String pono);
	    
	    /**
	     * ���ݵ�ǰ���ں�����ȡ���еĶ�����
	     * @param productDate
	     * @return
	     */
	    List<ProductMain> selectByGroupId(String groupid,Integer progress);
	    
	    
	    List<ProductMain> selectAllMain(ProductMain main);
	    
	    
	   
	    /**
	     * ��ҳ��ѯ��Ϣ
	     * @param main
	     * @return
	     */
		Map<String, Object> getMainPageList(ProductMain main,
									    	Integer rows, Integer page,
									    	String sort,  String order);
									
		
		 Map<Object, Object> selectProductNum(ProductMain main);
	    

		public List<Map<String, Object>> getTodayPMByGroupid(Integer groupid);
		
		public List<Map<String, Object>> getTodayPMByGroupidFromPlan(Integer groupid,String productDate);
		
		public Map<String, Object> lockProducingQCPM(Integer groupid);
		
		public List<Map<String, Object>> getPMByGroupidAndProductDate(Integer groupid,String productDate);
}
