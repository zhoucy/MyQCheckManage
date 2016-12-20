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
	     * 根据日期和组别获取当前最近的订单
	     * @param main
	     * @return
	     */
	    ProductMain selectByOtherMax(ProductMain main);
	    
	    /**
	     * 根据生产日期获取的当天所有订单
	     * @param productDate
	     * @return
	     */
	    List<ProductMain> selectByDate(String productDate);
	    /**
	     * 根据单号获取该单号所有的完成数量
	     * @param pono
	     * @return
	     */
	    int  selectByPono(String pono);
	    
	    /**
	     * 根据当前日期和组别获取所有的订单号
	     * @param productDate
	     * @return
	     */
	    List<ProductMain> selectByGroupId(String groupid,Integer progress);
	    
	    
	    List<ProductMain> selectAllMain(ProductMain main);
	    
	    
	   
	    /**
	     * 分页查询信息
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
