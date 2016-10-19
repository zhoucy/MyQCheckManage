package com.gangdian.qc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductMain implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String productDate;

    private String pono;

    private String model;

    private Integer sumWorker;

    private Integer targetProduct;

    private Integer standardProduct;

    private Integer groupid;

    private String prodectType;
    
    private Integer progress;
    
    private Date productTime;//插入时间
    
    private Date endTime;//订单结束时间
    
    private QCProgress qcprogress; //生产工序 1对1
    
    private Integer productid;
    
    private  Department dpt; //生产部门1对1

	private List<QCFailDetail> failList=new ArrayList<QCFailDetail>(0); // 失败工时 1对多
    
    private List<QCCheckRecord> recordList=new ArrayList<QCCheckRecord>(0); //qc检测 1对多
    
    private List<QCWorkerDetail>  workerDetails=new ArrayList<QCWorkerDetail>(0);//人员调动1对多
    
    
 
    
    
    public Department getDpt() {
		return dpt;
	}

	public void setDpt(Department dpt) {
		this.dpt = dpt;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}
    
    
    public List<QCWorkerDetail> getWorkerDetails() {
		return workerDetails;
	}

	public void setWorkerDetails(List<QCWorkerDetail> workerDetails) {
		this.workerDetails = workerDetails;
	}

	public List<QCFailDetail> getFailList() {
		return failList;
	}

	public void setFailList(List<QCFailDetail> failList) {
		this.failList = failList;
	}

	public List<QCCheckRecord> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<QCCheckRecord> recordList) {
		this.recordList = recordList;
	}

	public QCProgress getQcprogress() {
		return qcprogress;
	}

	public void setQcprogress(QCProgress qcprogress) {
		this.qcprogress = qcprogress;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getProductTime() {
		return productTime;
	}

	public void setProductTime(Date productTime) {
		this.productTime = productTime;
	}

	

    public Integer getProgress() {
		return progress;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}



	

	public ProductMain(Integer id, String productDate, String pono,
			String model, Integer sumWorker, Integer targetProduct,
			Integer standardProduct, Integer groupid, String prodectType,
			Integer progress, Date productTime, Date endTime,
			QCProgress qcprogress, Integer productid, Department dpt,
			List<QCFailDetail> failList, List<QCCheckRecord> recordList,
			List<QCWorkerDetail> workerDetails) {
		super();
		this.id = id;
		this.productDate = productDate;
		this.pono = pono;
		this.model = model;
		this.sumWorker = sumWorker;
		this.targetProduct = targetProduct;
		this.standardProduct = standardProduct;
		this.groupid = groupid;
		this.prodectType = prodectType;
		this.progress = progress;
		this.productTime = productTime;
		this.endTime = endTime;
		this.qcprogress = qcprogress;
		this.productid = productid;
		this.dpt = dpt;
		this.failList = failList;
		this.recordList = recordList;
		this.workerDetails = workerDetails;
	}
	
	

	public ProductMain(Integer id, String productDate, String pono,
			String model, Integer sumWorker, Integer targetProduct,
			Integer standardProduct, Integer groupid, String prodectType,
			Integer progress, Date productTime, Date endTime,
			QCProgress qcprogress, Integer productid, Department dpt) {
		super();
		this.id = id;
		this.productDate = productDate;
		this.pono = pono;
		this.model = model;
		this.sumWorker = sumWorker;
		this.targetProduct = targetProduct;
		this.standardProduct = standardProduct;
		this.groupid = groupid;
		this.prodectType = prodectType;
		this.progress = progress;
		this.productTime = productTime;
		this.endTime = endTime;
		this.qcprogress = qcprogress;
		this.productid = productid;
		this.dpt = dpt;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

   

	public String getProductDate() {
		return productDate;
	}

	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}

	public String getPono() {
		return pono;
	}

	public void setPono(String pono) {
		this.pono = pono;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Integer getSumWorker() {
		return sumWorker;
	}

	public void setSumWorker(Integer sumWorker) {
		this.sumWorker = sumWorker;
	}

	public Integer getTargetProduct() {
		return targetProduct;
	}

	public void setTargetProduct(Integer targetProduct) {
		this.targetProduct = targetProduct;
	}

	public Integer getStandardProduct() {
		return standardProduct;
	}

	public void setStandardProduct(Integer standardProduct) {
		this.standardProduct = standardProduct;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getProdectType() {
		return prodectType;
	}

	public void setProdectType(String prodectType) {
		this.prodectType = prodectType;
	}

	public ProductMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ProductMain [id=" + id + ", productDate=" + productDate
				+ ", pono=" + pono + ", model=" + model + ", sumWorker="
				+ sumWorker + ", targetProduct=" + targetProduct
				+ ", standardProduct=" + standardProduct + ", groupid="
				+ groupid + ", prodectType=" + prodectType + ", progress="
				+ progress + ", productTime=" + productTime + ", endTime="
				+ endTime + ", qcprogress=" + qcprogress + ", productid="
				+ productid + ", dpt=" + dpt + ", failList=" + failList
				+ ", recordList=" + recordList + ", workerDetails="
				+ workerDetails + "]";
	}

}