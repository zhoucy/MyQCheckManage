package com.gangdian.qc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;



public interface CapacityDao {

	
	
	//��ȡ������Ϣ
	List<Map<String, Object>> getDefective(@Param("date") String date,@Param("hour") String hour,
		@Param("pono") String pono,@Param("groupname") String groupname,@Param("belongname") String belongname);
	//��ȡ������ϸ��Ϣ
	List<Map<String, Object>> getDept(@Param("deptname") String deptname);
	//��ȡ������Ϣ
	List<Map<String, Object>> getPonoInfo(@Param("deptname") String deptname,@Param("date") String date,
			@Param("pono") String pono);
	

	
	//���ݲ��ŵ�id��ȡ���ŵ���Ϣ(ͳ��ͼ���õķ���)
	List<Map<String, Object>> getDeptById(@Param("deptNO") Integer deptNO);
	//highcharts��Ʒ������ͼ
	List<Map<String, Object>> getBadrateHighCharts(@Param("startday") String startday
			,@Param("endday") String endday,@Param("producttype") String producttype,
			@Param("groupid") Integer groupid,@Param("belong") Integer belong,@Param("timetype") String timetype);
	//highcharts��Ʒ��������ͼ
	List<Map<String, Object>> getProductTypeHighCharts(@Param("startday") String startday
			,@Param("endday") String endday,@Param("producttype") String producttype,
			@Param("groupid") Integer groupid,@Param("belong") Integer belong,@Param("timetype") String timetype);
	
	
	
	//����ͳ��(��ʱ��)���������
	//����1:1.���� 2.��� 3.���� 4.����
	//����2:1.�Ƿ���ʾ��� 2.�Ƿ���ʾ���� 3.�Ƿ���ʾ���� 4�Ƿ���ʾ����(��ʱ����,ֻ��ռλ)
	List<Map<String, Object>> getCapaCityDetailByHour(@Param("proDate") String proDate,@Param("groupname") String groupname,
			@Param("belongname") String belongname,@Param("pono") String pono,
			@Param("showdate") String showdate,@Param("showgroup") String showgroup,
			@Param("showbelong") String showbelong,@Param("showpono") String showpono);
	
	//����ͳ��(������Сʱ)���������
	//����1:1.���� 2.��� 3.���� 4.����
	//����2:1.�Ƿ���ʾ��� 2.�Ƿ���ʾ���� 3.�Ƿ���ʾ���� 4�Ƿ���ʾ����(��ʱ����,ֻ��ռλ)
	List<Map<String, Object>> getCapaCityDetailByWorkHour(@Param("proDate") String proDate,@Param("groupname") String groupname,
			@Param("belongname") String belongname,@Param("pono") String pono,
			@Param("showdate") String showdate,@Param("showgroup") String showgroup,
			@Param("showbelong") String showbelong,@Param("showpono") String showpono);
	
	
	//��ҳ��ȡ��������������Ķ�����Ϣ
	List<Map<String, Object>> getTodayOrderOfIndex();
	//��ҳ��ȡ����ÿ��Сʱ�ܲ�����ͼ����Ϣ
	List<Map<String, Object>> getTodayCapacityOfIndex(@Param("startday") String startday,@Param("endday") String endday);
	//��ҳ��ȡ�����Ʒ���ͱ�ͼ��Ϣ
	List<Map<String, Object>> getTodayTypeOfIndex();
	
	//��ȡ��������Ϣ,ѡ�񶩵�ʱ,ͬʱ����Ʒmodel�Ͳ�Ʒ���͸�ֵ
	List<Map<String, Object>> getPonoAndUnion();
}
