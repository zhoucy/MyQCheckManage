package com.gangdian.qc.model;

import java.io.Serializable;
import java.util.Date;

public class BoxProduct implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;//自增id

    private String pono;//订单号

    private Date checkTime; //检查时间

    private Integer groupid;//组别id
    
    private Integer boxs;//每个箱子装产品的个数
    
    
    

    public Integer getBoxs() {
		return boxs;
	}

	public void setBoxs(Integer boxs) {
		this.boxs = boxs;
	}

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
        this.pono = pono == null ? null : pono.trim();
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Integer getGroupid() {
        return groupid;
    }

    public void setGroupid(Integer groupid) {
        this.groupid = groupid;
    }

	public BoxProduct(Integer id, String pono, Date checkTime, Integer groupid,
			Integer boxs) {
		super();
		this.id = id;
		this.pono = pono;
		this.checkTime = checkTime;
		this.groupid = groupid;
		this.boxs = boxs;
	}

	
	public BoxProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BoxProduct [id=" + id + ", pono=" + pono + ", checkTime="
				+ checkTime + ", groupid=" + groupid + ", boxs=" + boxs + "]";
	}
    
    
}