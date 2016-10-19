package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.Department;
import com.gangdian.qc.model.ProductMain;

public interface ProductMainDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductMain record);

    int insertSelective(ProductMain record);

    ProductMain selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductMain record);

    int updateByPrimaryKey(ProductMain record);
    
    int  queryMaxId();
    
    ProductMain selectByOther(ProductMain main);
    
    ProductMain selectByOtherMax(ProductMain main);
    /**
     * 根据生产日期获取的当天所有订单
     * @param productDate
     * @return
     */
    List<ProductMain> selectByDate(String productDate);
    /**
     * 根据当前日期和组别获取所有的订单号
     * @param productDate
     * @return
     */
    List<ProductMain> selectByGroupId(@Param("groupid")String groupid,@Param("progress")Integer progress);
    /**
     * 查询所有订单信息
     * @param ProductMain  main
     * @return list
     */
    List<ProductMain> selectAllMain(ProductMain main);
    
    /**
     * 记录条数
     * @param main
     * @return
     */
    List<ProductMain> getMainPageSize(ProductMain main);
    /**
     * 分页查询信息
     * @param main
     * @return
     */
    List<ProductMain> getMainPageList(@Param("record")ProductMain record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    /**
     * 根据单号获取该单号所有的完成数量
     * @param pono
     * @return
     */
    int  selectByPono(String pono);
    

    Map<Object, Object> selectProductNum(ProductMain main);
    
    /**
     *                  根据组别id获取当天的生产信息(product_mian)
     * @param groupid
     * @return
     */
    List<Map<String, Object>> getTodayPMByGroupid(@Param("groupid") Integer groupid);
    
    /**
     *                 根据组别id获取当天生产中的product_main id
     * @param groupid
     * @return
     */
    List<Map<String, Object>> lockProducingQCPM(@Param("groupid") Integer groupid);
    
}