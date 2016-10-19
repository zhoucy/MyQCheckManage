package com.gangdian.qc.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gangdian.qc.model.ProductMain;

public interface SwipeServer {

	//����һ��������¼product_main���ҽ���������������,����������¼��id
	public Integer startQCPPandBindpono(ProductMain pm);
	//������¼���������ʱ��,���ҽ��������������
	public boolean endQCPPandUnbindpono(ProductMain pm);
	
	
	
	
	//id��
	//ɾ��ȫ��id������Ϣ
	public boolean deleteAllCard();
	//��ȡȫ����id����Ϣ
	public List<Map<String, Object>> getAllCard();
	
	//ˢ����(���Ͷ���)
	//����
	public boolean addMachine(Integer mgid,Integer mgroupid,String mgroupname,String mpono,String msequence,String mprintname);
	//ɾ��	
	public boolean deleteMachineByGid(Integer gid);
	//����
	public boolean updateMachine(Integer mgid,Integer mgroupid,String mgroupname,String mpono,String msequence,String mprintname);
	//��ȡȫ����ˢ������Ϣ
	public List<Map<String, Object>> getAllMachine();
	//����id��ȡˢ��������Ϣ
	public List<Map<String, Object>> getMachineById(Integer gid);
	//gid�ظ����
	public boolean checkMgid(int gid);
	
	//ˢ������
	//��ȡȫ��������
	public List<Map<String, Object>> getAllData();
	//����������ȡ
	public Map<String, Object> getDataByCondition(String pono,Integer groupid,Integer position,String swipedate,String serialnum,
			Integer rows,Integer page, String sort, String order);
	
	//����qcˢ����¼ -zhoucy
	int addCheckData( String serialnum, Integer groupid,
			String groupname,String pono,
			Integer position, String qcid) throws Exception;
	//�������͹�λ��ȡ����Ĺ�λ����
	
	List<Map<String, Object>> getCheckNum( Integer groupid,Integer position);
	
	
	/**
	 * �����ָ����λ�Ƿ���ڶ������� 
	 * @param position ��λid
	 * @param serialnum ��������
	 * @return
	 */
	String checkSerialNum(@Param("position") Integer position,
			@Param("serialnum") String serialnum);
	
	
	
	
	//�������кŻ�ȡ����
	public List<Map<String, Object>> getFailureBySerialnum(String serialnum);
	
	//����һ��ά�޼�¼
	public boolean addRepairRecord(String serialnum,String badcode,String result,
			String description,String repairman);
	
	//����ά���ߺ�ά�����ڻ�ȡά�޼�¼
	public List<Map<String, Object>> getRepairRecordByManAndDate(String serialnum,String repairman,String repairdate);
	
	//����ά���ߺ�ά�����ڻ�ȡά����
	public int getRepairRecordNum(String repairman,String repairdate);
	
	
	
	//�����ձ�v2
	//QC�������
	public Map<String, Object> getQCCheckDetail(String qcid,String pono,String swipedate,
			Integer rows,Integer page,String sort,String order);
	//��λɨ������
	public List<Map<String, Object>> getStationCount(Integer groupid);
}