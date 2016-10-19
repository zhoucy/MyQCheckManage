package com.gangdian.qc.model;

import java.io.Serializable;

public class QCWorkerDetail implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer parentId;

    private String hourperiod;

    private Integer workerAmount;

    private Integer getWorkers;

    private String getWorkersGroup;

    private Integer borrowWorkers;

    private String borrowWorkersGroup;
    
    private Integer workMinute;//该时间段工作的时间（分钟）
    
    private Integer borrowWorkersM; //借出分钟数
    
    private Integer getWorkersM;//借入分钟数
    
    private String  borrowRemark;//借入备注
    
    private String  getRemark;//借出备注
    
    private Integer packageNum;//包装数
    
    private Integer standardProduct;//标准产能 根据实际的工作时间来计算=人数*时间*60/标准工时（秒）
    
    
    
    
    public String getBorrowRemark() {
		return borrowRemark;
	}

	public void setBorrowRemark(String borrowRemark) {
		this.borrowRemark = borrowRemark;
	}

	public String getGetRemark() {
		return getRemark;
	}

	public void setGetRemark(String getRemark) {
		this.getRemark = getRemark;
	}

	public Integer getStandardProduct() {
		return standardProduct;
	}

	public void setStandardProduct(Integer standardProduct) {
		this.standardProduct = standardProduct;
	}

	public Integer getPackageNum() {
		return packageNum;
	}

	public void setPackageNum(Integer packageNum) {
		this.packageNum = packageNum;
	}

	public Integer getBorrowWorkersM() {
		return borrowWorkersM;
	}

	public void setBorrowWorkersM(Integer borrowWorkersM) {
		this.borrowWorkersM = borrowWorkersM;
	}

	public Integer getGetWorkersM() {
		return getWorkersM;
	}

	public void setGetWorkersM(Integer getWorkersM) {
		this.getWorkersM = getWorkersM;
	}

	public Integer getWorkMinute() {
		return workMinute;
	}

	public void setWorkMinute(Integer workMinute) {
		this.workMinute = workMinute;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getHourperiod() {
        return hourperiod;
    }

    public void setHourperiod(String hourperiod) {
        this.hourperiod = hourperiod == null ? null : hourperiod.trim();
    }

    public Integer getWorkerAmount() {
        return workerAmount;
    }

    public void setWorkerAmount(Integer workerAmount) {
        this.workerAmount = workerAmount;
    }

    public Integer getGetWorkers() {
        return getWorkers;
    }

    public void setGetWorkers(Integer getWorkers) {
        this.getWorkers = getWorkers;
    }

    public String getGetWorkersGroup() {
        return getWorkersGroup;
    }

    public void setGetWorkersGroup(String getWorkersGroup) {
        this.getWorkersGroup = getWorkersGroup == null ? null : getWorkersGroup.trim();
    }

    public Integer getBorrowWorkers() {
        return borrowWorkers;
    }

    public void setBorrowWorkers(Integer borrowWorkers) {
        this.borrowWorkers = borrowWorkers;
    }

    public String getBorrowWorkersGroup() {
        return borrowWorkersGroup;
    }

    public void setBorrowWorkersGroup(String borrowWorkersGroup) {
        this.borrowWorkersGroup = borrowWorkersGroup == null ? null : borrowWorkersGroup.trim();
    }

	public QCWorkerDetail(Integer id, Integer parentId, String hourperiod,
			Integer workerAmount, Integer getWorkers, String getWorkersGroup,
			Integer borrowWorkers, String borrowWorkersGroup) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.hourperiod = hourperiod;
		this.workerAmount = workerAmount;
		this.getWorkers = getWorkers;
		this.getWorkersGroup = getWorkersGroup;
		this.borrowWorkers = borrowWorkers;
		this.borrowWorkersGroup = borrowWorkersGroup;
	}

	public QCWorkerDetail() {
		super();
	}
    
	public QCWorkerDetail(Integer parentId) {
		super();
		this.parentId = parentId;
	}

	@Override
	public String toString() {
		return "QCWorkerDetail [id=" + id + ", parentId=" + parentId
				+ ", hourperiod=" + hourperiod + ", workerAmount="
				+ workerAmount + ", getWorkers=" + getWorkers
				+ ", getWorkersGroup=" + getWorkersGroup + ", borrowWorkers="
				+ borrowWorkers + ", borrowWorkersGroup=" + borrowWorkersGroup
				+ ", workMinute=" + workMinute + ", borrowWorkersM="
				+ borrowWorkersM + ", getWorkersM=" + getWorkersM
				+ ", borrowRemark=" + borrowRemark + ", getRemark=" + getRemark
				+ ", packageNum=" + packageNum + ", standardProduct="
				+ standardProduct + ", getBorrowRemark()=" + getBorrowRemark()
				+ ", getGetRemark()=" + getGetRemark()
				+ ", getStandardProduct()=" + getStandardProduct()
				+ ", getPackageNum()=" + getPackageNum()
				+ ", getBorrowWorkersM()=" + getBorrowWorkersM()
				+ ", getGetWorkersM()=" + getGetWorkersM()
				+ ", getWorkMinute()=" + getWorkMinute() + ", getId()="
				+ getId() + ", getParentId()=" + getParentId()
				+ ", getHourperiod()=" + getHourperiod()
				+ ", getWorkerAmount()=" + getWorkerAmount()
				+ ", getGetWorkers()=" + getGetWorkers()
				+ ", getGetWorkersGroup()=" + getGetWorkersGroup()
				+ ", getBorrowWorkers()=" + getBorrowWorkers()
				+ ", getBorrowWorkersGroup()=" + getBorrowWorkersGroup()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
}