package com.gangdian.qc.model;

import java.io.Serializable;

public class QCProgress implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String progressName;  //¹¤ÐòÃû³Æ

    private Integer progressCode;  //¹¤Ðò±àÂë

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProgressName() {
        return progressName;
    }

    public void setProgressName(String progressName) {
        this.progressName = progressName == null ? null : progressName.trim();
    }

    public Integer getProgressCode() {
        return progressCode;
    }

    public void setProgressCode(Integer progressCode) {
        this.progressCode = progressCode ;
    }

	@Override
	public String toString() {
		return "QCProgress [id=" + id + ", progressName=" + progressName
				+ ", progressCode=" + progressCode + "]";
	}
    
}