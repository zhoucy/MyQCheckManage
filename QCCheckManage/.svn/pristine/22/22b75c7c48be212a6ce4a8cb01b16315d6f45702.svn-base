package com.gangdian.qc.model;

import java.io.Serializable;

public class User2Role implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String userId;

    private Integer roleId;
    
    private QCRole role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public QCRole getRole() {
		return role;
	}

	public void setRole(QCRole role) {
		this.role = role;
	}

	public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

	public User2Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User2Role(Integer id, String userId, Integer roleId, QCRole role) {
		super();
		this.id = id;
		this.userId = userId;
		this.roleId = roleId;
		this.role = role;
	}

	@Override
	public String toString() {
		return "User2Role [id=" + id + ", userId=" + userId + ", roleId="
				+ roleId + ", role=" + role + "]";
	}
    
    
}