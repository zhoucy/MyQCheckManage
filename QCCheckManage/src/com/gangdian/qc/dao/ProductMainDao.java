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
     * �����������ڻ�ȡ�ĵ������ж���
     * @param productDate
     * @return
     */
    List<ProductMain> selectByDate(String productDate);
    /**
     * ���ݵ�ǰ���ں�����ȡ���еĶ�����
     * @param productDate
     * @return
     */
    List<ProductMain> selectByGroupId(@Param("groupid")String groupid,@Param("progress")Integer progress);
    /**
     * ��ѯ���ж�����Ϣ
     * @param ProductMain  main
     * @return list
     */
    List<ProductMain> selectAllMain(ProductMain main);
    
    /**
     * ��¼����
     * @param main
     * @return
     */
    List<ProductMain> getMainPageSize(ProductMain main);
    /**
     * ��ҳ��ѯ��Ϣ
     * @param main
     * @return
     */
    List<ProductMain> getMainPageList(@Param("record")ProductMain record,
    		@Param("rows")	Integer rows, @Param("page") Integer page,
    		@Param("sort") String sort,@Param("order")   String order);
    /**
     * ���ݵ��Ż�ȡ�õ������е��������
     * @param pono
     * @return
     */
    int  selectByPono(String pono);
    

    Map<Object, Object> selectProductNum(ProductMain main);
    
    /**
     *                  �������id��ȡ�����������Ϣ(product_mian)
     * @param groupid
     * @return
     */
    List<Map<String, Object>> getTodayPMByGroupid(@Param("groupid") Integer groupid);
    
    /**
     *                 �������id��ȡ���������е�product_main id
     * @param groupid
     * @return
     */
    List<Map<String, Object>> lockProducingQCPM(@Param("groupid") Integer groupid);
    
}