package com.gangdian.qc.model;

import java.io.Serializable;

public class QCUser implements Serializable{
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		private String id;

	    private String name;

	    private String password;

	    private Integer groupid;

	    private Integer departmentid;
	    
	    private User2Role user2Role;
	    
	    private Department  dpt;
	    
	    
	    

	    public Department getDpt() {
			return dpt;
		}

		public void setDpt(Department dpt) {
			this.dpt = dpt;
		}

		public User2Role getUser2Role() {
			return user2Role;
		}

		public void setUser2Role(User2Role user2Role) {
			this.user2Role = user2Role;
		}

		public String getId() {
	        return id;
	    }

	    public void setId(String id) {
	        this.id = id == null ? null : id.trim();
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name == null ? null : name.trim();
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password == null ? null : password.trim();
	    }

	    public Integer getGroupid() {
	        return groupid;
	    }

	    public void setGroupid(Integer groupid) {
	        this.groupid = groupid;
	    }

	    public Integer getDepartmentid() {
	        return departmentid;
	    }

	    public void setDepartmentid(Integer departmentid) {
	        this.departmentid = departmentid;
	    }

	    
	    
		public QCUser(String name, String password) {
			super();
			this.name = name;
			this.password = password;
		}

		public QCUser() {
			super();
			// TODO Auto-generated constructor stub
		}

		@Override
		public String toString() {
			return "QCUser [id=" + id + ", name=" + name + ", password="
					+ password + ", groupid=" + groupid + ", departmentid="
					+ departmentid + ", user2Role=" + user2Role + "]";
		}
	    
	}