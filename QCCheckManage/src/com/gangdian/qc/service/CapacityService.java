package com.gangdian.qc.service;


import java.text.ParseException;
import java.util.List;
import java.util.Map;




public interface CapacityService {
	
	//˫�������ʾ������Ϣ
	public Map<String, Object> getDefective(String date,String hour,String pono,String groupname,String belongname);
	//˫�������ʾ������Ϣ
	public Map<String, Object> getDept(String deptname);
	//˫�������ʾ������Ϣ
	public Map<String, Object> getPonoInfo(String deptname,String date,String pono);
	
	
	
	//��Ʒ��ͳ��ͼhighcharts
	public Map<String, Object> getHighCharts(String date,String timetype
			,String producttype,Integer groupid,Integer belong) throws ParseException;
	
	//��Ʒ����ͳ��ͼhighcharts
	public Map<String, Object> getProductTypeHighCharts(String date,String timetype
			,String producttype,Integer groupid,Integer belong) throws ParseException;
	
	
	
	//����ͳ��(��ʱ��)���������
	public Map<String, Object> getCapaCityDetailByHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono);
	//����ͳ��(������Сʱ)���������
	public Map<String, Object> getCapaCityDetailByWorkHour(String proDate,String groupname,String belongname,String pono,
			String showdate,String showgroup,String showbelong,String showpono);
	
	
	
	//��ҳ��ȡ��������������Ķ�����Ϣ
	public List<Map<String, Object>> getTodayOrderOfIndex();
	//��ҳ��ȡ����ÿ��Сʱ�ܲ��ܵ���Ϣ
	public Map<String, Object> getTodayCapacityOfIndex(String compareDay);
	//��ҳ��ȡ�����Ʒ���ͱ�ͼ��Ϣ
	public List<Map<String, Object>> getTodayTypeOfIndex();
	
	//��ȡ��������Ϣ,ѡ�񶩵�ʱ,ͬʱ����Ʒmodel�Ͳ�Ʒ���͸�ֵ
	public List<Map<String, Object>> getPonoAndUnion();
}
