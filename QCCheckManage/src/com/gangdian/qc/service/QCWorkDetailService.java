package com.gangdian.qc.service;

import java.util.List;

import com.gangdian.qc.model.QCWorkerDetail;

public interface QCWorkDetailService {

	int insert(QCWorkerDetail record);

    int insertSelective(QCWorkerDetail record);
    
    /**
     * ��ʱ��κ�������id����
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(QCWorkerDetail record);
    
  /**
   * ��ʱ��κ�������id����
   * @param record 	 QCWorkerDetail �����������
   * @param period  String[] ʱ�������
   * @return
   */
    boolean updateByPrimaryKeySelective(QCWorkerDetail record,String[] period);
    
    
    int updateByPrimaryKey(QCWorkerDetail record);
    
    /**
     * ����������id��ȡ��ǰ��Ա���ֲ�
     * @param parentId
     * @return
     */
    List<QCWorkerDetail> selectByParentId(Integer parentId);
    
    
    /**
     * ��������ȡԱ����Ϣ����Ļ�����Ϣ
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectByGroup(Integer groupid);
    
    
    /**
     * ��������ȡԱ����Ϣ�������ϸ��Ϣ
     * @param groupid
     * @return
     */
    List<QCWorkerDetail> selectBySumGroup(Integer groupid,Integer id,Integer progress);
}
