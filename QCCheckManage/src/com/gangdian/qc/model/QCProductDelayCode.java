package com.gangdian.qc.model;

import java.io.Serializable;

public class QCProductDelayCode implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String departmant;

    private String delayCode;

    private String description;

    private String range;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmant() {
        return departmant;
    }

    public void setDepartmant(String departmant) {
        this.departmant = departmant == null ? null : departmant.trim();
    }

    public String getDelayCode() {
        return delayCode;
    }

    public void setDelayCode(String delayCode) {
        this.delayCode = delayCode == null ? null : delayCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range == null ? null : range.trim();
    }

	@Override
	public String toString() {
		return "QCProductDelayCode [id=" + id + ", departmant=" + departmant
				+ ", delayCode=" + delayCode + ", description=" + description
				+ ", range=" + range + "]";
	}
    
    
}