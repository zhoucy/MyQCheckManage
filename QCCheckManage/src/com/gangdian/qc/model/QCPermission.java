package com.gangdian.qc.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class QCPermission implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String name;

    private Integer fatherid;

    private String url;
    
    private  List<QCRole> qcRoles=new ArrayList<QCRole>(0);

    
    public Integer getId() {
        return id;
    }

    public List<QCRole> getQcRoles() {
		return qcRoles;
	}

	public void setQcRoles(List<QCRole> qcRoles) {
		this.qcRoles = qcRoles;
	}

	public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getFatherid() {
        return fatherid;
    }

    public void setFatherid(Integer fatherid) {
        this.fatherid = fatherid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

	@Override
	public String toString() {
		return "QCPermission [id=" + id + ", name=" + name + ", fatherid="
				+ fatherid + ", url=" + url + ", qcRoles=" + qcRoles + "]";
	}
    
    
}