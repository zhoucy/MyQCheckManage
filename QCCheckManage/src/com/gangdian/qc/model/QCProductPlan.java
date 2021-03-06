package com.gangdian.qc.model;

import java.io.Serializable;

public class QCProductPlan implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String pono;

    private String model;

    private String productSpecific;

    private Integer orderNumber;

    private Integer finishNumber;

    private String preProductDate;
    
    private String preShipmentDate;

    private String productStatus;
    
    private String lastUpUser;
    
    private Integer productId;  //产品表id
    
    private Long  packbarcode;//彩盒条形码
    
    private Long  boxbarcode ;//箱子条形码
    
    private Integer boxcapacity;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getProductSpecific() {
		return productSpecific;
	}

	public void setProductSpecific(String productSpecific) {
		this.productSpecific = productSpecific;
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getFinishNumber() {
		return finishNumber;
	}

	public void setFinishNumber(Integer finishNumber) {
		this.finishNumber = finishNumber;
	}

	public String getPreProductDate() {
		return preProductDate;
	}

	public void setPreProductDate(String preProductDate) {
		this.preProductDate = preProductDate;
	}

	public String getPreShipmentDate() {
		return preShipmentDate;
	}

	public void setPreShipmentDate(String preShipmentDate) {
		this.preShipmentDate = preShipmentDate;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public String getLastUpUser() {
		return lastUpUser;
	}

	public void setLastUpUser(String lastUpUser) {
		this.lastUpUser = lastUpUser;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Long getPackbarcode() {
		return packbarcode;
	}

	public void setPackbarcode(Long packbarcode) {
		this.packbarcode = packbarcode;
	}

	public Long getBoxbarcode() {
		return boxbarcode;
	}

	public void setBoxbarcode(Long boxbarcode) {
		this.boxbarcode = boxbarcode;
	}

	public Integer getBoxcapacity() {
		return boxcapacity;
	}

	public void setBoxcapacity(Integer boxcapacity) {
		this.boxcapacity = boxcapacity;
	}

	@Override
	public String toString() {
		return "QCProductPlan [id=" + id + ", pono=" + pono + ", model="
				+ model + ", productSpecific=" + productSpecific
				+ ", orderNumber=" + orderNumber + ", finishNumber="
				+ finishNumber + ", preProductDate=" + preProductDate
				+ ", preShipmentDate=" + preShipmentDate + ", productStatus="
				+ productStatus + ", lastUpUser=" + lastUpUser + ", productId="
				+ productId + ", packbarcode=" + packbarcode + ", boxbarcode="
				+ boxbarcode + ", boxcapacity=" + boxcapacity + "]";
	}

	
}