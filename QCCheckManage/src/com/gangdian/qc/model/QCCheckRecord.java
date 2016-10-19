package com.gangdian.qc.model;

import java.io.Serializable;
import java.util.Date;

public class QCCheckRecord implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String qccheckprojectid;

    private Integer id;

    private Integer parentId;

    private Date insertdate;
    
    

    public QCCheckRecord() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QCCheckRecord(String qccheckprojectid, Integer id, Integer parentId,
			Date insertdate) {
		super();
		this.qccheckprojectid = qccheckprojectid;
		this.id = id;
		this.parentId = parentId;
		this.insertdate = insertdate;
	}

	@Override
	public String toString() {
		return "QCCheckRecord [qccheckprojectid=" + qccheckprojectid + ", id="
				+ id + ", parentId=" + parentId + ", insertdate=" + insertdate
				+ "]";
	}

	public String getQccheckprojectid() {
        return qccheckprojectid;
    }

    public void setQccheckprojectid(String qccheckprojectid) {
        this.qccheckprojectid = qccheckprojectid == null ? null : qccheckprojectid.trim();
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

    public Date getInsertdate() {
        return insertdate;
    }

    public void setInsertdate(Date insertdate) {
        this.insertdate = insertdate;
    }
    
}