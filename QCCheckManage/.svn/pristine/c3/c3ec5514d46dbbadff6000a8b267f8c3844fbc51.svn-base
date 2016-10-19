package com.gangdian.qc.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class QCFailDetail implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer parentId;

    private String failureStartHour;

    private String failureEndHour;

    private BigDecimal failureCountHours;

    private Integer useWorkers;

    private BigDecimal useSumHours;

    private String failureReason;

    private String leadPerson;

    private String solution;
    
    private String remark;
    

    public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

    public String getFailureStartHour() {
        return failureStartHour;
    }

    public void setFailureStartHour(String failureStartHour) {
        this.failureStartHour = failureStartHour == null ? null : failureStartHour.trim();
    }

    public String getFailureEndHour() {
        return failureEndHour;
    }

    public void setFailureEndHour(String failureEndHour) {
        this.failureEndHour = failureEndHour == null ? null : failureEndHour.trim();
    }

    public BigDecimal getFailureCountHours() {
        return failureCountHours;
    }

    public void setFailureCountHours(BigDecimal failureCountHours) {
        this.failureCountHours = failureCountHours;
    }

    public Integer getUseWorkers() {
        return useWorkers;
    }

    public void setUseWorkers(Integer useWorkers) {
        this.useWorkers = useWorkers;
    }

    public BigDecimal getUseSumHours() {
        return useSumHours;
    }

    public void setUseSumHours(BigDecimal useSumHours) {
        this.useSumHours = useSumHours;
    }

    public String getFailureReason() {
        return failureReason;
    }

    public void setFailureReason(String failureReason) {
        this.failureReason = failureReason == null ? null : failureReason.trim();
    }

    public String getLeadPerson() {
        return leadPerson;
    }

    public void setLeadPerson(String leadPerson) {
        this.leadPerson = leadPerson == null ? null : leadPerson.trim();
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution == null ? null : solution.trim();
    }

	@Override
	public String toString() {
		return "QCFailDetail [id=" + id + ", parentId=" + parentId
				+ ", failureStartHour=" + failureStartHour
				+ ", failureEndHour=" + failureEndHour + ", failureCountHours="
				+ failureCountHours + ", useWorkers=" + useWorkers
				+ ", useSumHours=" + useSumHours + ", failureReason="
				+ failureReason + ", leadPerson=" + leadPerson + ", solution="
				+ solution + "]";
	}
    
}