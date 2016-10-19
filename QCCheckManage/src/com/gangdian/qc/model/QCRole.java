package com.gangdian.qc.model;

import java.io.Serializable;
import java.util.List;

public class QCRole implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String name;

    private Integer permissionID;
    
    private List<Integer> permission;
    
    
    private List<User2Role> user2Role;
    private List<QCPermission>  permissionList;

    
    
	public List<Integer> getPermission() {
		return permission;
	}

	public void setPermission(List<Integer> permission) {
		this.permission = permission;
	}

	public List<QCPermission> getPermissionList() {
		return permissionList;
	}

	public void setPermissionList(List<QCPermission> permissionList) {
		this.permissionList = permissionList;
	}

	public Integer getId() {
        return id;
    }

    public List<User2Role> getUser2Role() {
		return user2Role;
	}

	public void setUser2Role(List<User2Role> user2Role) {
		this.user2Role = user2Role;
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

	public Integer getPermissionID() {
		return permissionID;
	}

	public void setPermissionID(Integer permissionID) {
		this.permissionID = permissionID;
	}

	@Override
	public String toString() {
		return "QCRole [id=" + id + ", name=" + name + ", permissionID="
				+ permissionID + ", permission=" + permission + ", user2Role="
				+ user2Role + ", permissionList=" + permissionList + "]";
	}

	

	
   
}