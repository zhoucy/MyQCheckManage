package com.gangdian.qc.model;

import java.util.ArrayList;
import java.util.List;

import java.io.Serializable;

/**
 * 产品档案表
 * 描述产品名称和产品型号
 * @author zhoucy
 *
 */
public class QCProductRecord implements Serializable{
  
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;//自增长id
	
	private String materialCode;  //物料编码

    private String model;//产品名称


	private String productSpecific;//产品型号
    
    private String productType;//产品类型编号  S:直发器  C：卷发器  D：定型器
    
	private List<QCProgressManHour> progressManHours= new ArrayList<QCProgressManHour>(0);
    
    public String getMaterialCode() {
		return materialCode;
	}

	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}

    public String getProductType() {
		return productType;
	}



	public void setProductType(String productType) {
		this.productType = productType;
	}


    
    public QCProductRecord() {
  		super();
  		// TODO Auto-generated constructor stub
  	}

    

    public QCProductRecord(Integer id, String materialCode, String model,
			String productSpecific, String productType,
			List<QCProgressManHour> progressManHours) {
		super();
		this.id = id;
		this.materialCode = materialCode;
		this.model = model;
		this.productSpecific = productSpecific;
		this.productType = productType;
		this.progressManHours = progressManHours;
	}

	public QCProductRecord(Integer id, String model, String productSpecific) {
		super();
		this.id = id;
		this.model = model;
		this.productSpecific = productSpecific;
	}

    


	public QCProductRecord(String model) {
		super();
		this.model = model;
	}

	

	public List<QCProgressManHour> getProgressManHours() {
		return progressManHours;
	}



	public void setProgressManHours(List<QCProgressManHour> progressManHours) {
		this.progressManHours = progressManHours;
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
        this.model = model == null ? null : model.trim();
    }

    public String getProductSpecific() {
        return productSpecific;
    }

    public void setProductSpecific(String productSpecific) {
        this.productSpecific = productSpecific == null ? null : productSpecific.trim();
    }



	@Override
	public String toString() {
		return "QCProductRecord [id=" + id + ", model=" + model
				+ ", productSpecific=" + productSpecific
				+ ", progressManHours=" + progressManHours + "]";
	}
    
}