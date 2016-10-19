package com.gangdian.qc.model;

import java.io.Serializable;
import java.math.BigDecimal;
/**
 * 产品工时工序表 连接产品档案和工序表
 * 生产表通过这个表获取相关工时
 * @author zhoucy
 *
 */
public class QCProgressManHour implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String model;//品名

    private Integer progressid;//工序id

    private Integer manMinute;//每个产品单人完成时间分钟

    private BigDecimal manHour;//每个产品单人完成时间小时

    private BigDecimal balance;//平衡系数 单人与产线的差距  默认为1
    
    private QCProductRecord  productRecord ; //对应的产品
    
    private QCProgress progress;//工序
    
    private Integer productId;

    public QCProgressManHour() {
		super();
	}

    
	public QCProgressManHour(Integer productId, Integer progressid) {
		super();
		this.productId = productId;
		this.progressid = progressid;
	}


	public QCProgressManHour(Integer id, String model, Integer progressid,
			Integer manMinute, BigDecimal manHour, BigDecimal balance,
			QCProductRecord productRecord) {
		super();
		this.id = id;
		this.model = model;
		this.progressid = progressid;
		this.manMinute = manMinute;
		this.manHour = manHour;
		this.balance = balance;
		this.productRecord = productRecord;
	}
		
	public QCProgressManHour(Integer id, String model, Integer progressid,
			Integer manMinute, BigDecimal manHour, BigDecimal balance,
			QCProductRecord productRecord, QCProgress progress) {
		super();
		this.id = id;
		this.model = model;
		this.progressid = progressid;
		this.manMinute = manMinute;
		this.manHour = manHour;
		this.balance = balance;
		this.productRecord = productRecord;
		this.progress = progress;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public Integer getProgressid() {
		return progressid;
	}


	public void setProgressid(Integer progressid) {
		this.progressid = progressid;
	}


	public Integer getManMinute() {
		return manMinute;
	}


	public void setManMinute(Integer manMinute) {
		this.manMinute = manMinute;
	}


	public BigDecimal getManHour() {
		return manHour;
	}


	public void setManHour(BigDecimal manHour) {
		this.manHour = manHour;
	}


	public BigDecimal getBalance() {
		return balance;
	}


	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}


	public QCProductRecord getProductRecord() {
		return productRecord;
	}


	public void setProductRecord(QCProductRecord productRecord) {
		this.productRecord = productRecord;
	}


	public QCProgress getProgress() {
		return progress;
	}


	public void setProgress(QCProgress progress) {
		this.progress = progress;
	}


	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}


	@Override
	public String toString() {
		return "QCProgressManHour [id=" + id + ", model=" + model
				+ ", progressid=" + progressid + ", manMinute=" + manMinute
				+ ", manHour=" + manHour + ", balance=" + balance
				+ ", productRecord=" + productRecord + ", progress=" + progress
				+ ", productId=" + productId + "]";
	}

	
    
}