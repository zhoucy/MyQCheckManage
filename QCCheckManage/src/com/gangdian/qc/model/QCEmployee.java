package com.gangdian.qc.model;

import java.io.Serializable;

public class QCEmployee implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;                //id

    private Integer employeeno;        //产品编号

    private String employeename;       //产品名称

    private String password;           //密码

    private String sex;                //性别

    private String birthday;           //生日

    private String identityno;         //身份证号

    private String address;            //地址

    private String mobile;             //mobile

    private String qq;                 //qq

    private String email;              //email

    private Integer positionid;        //职位id(预留字段)

    private String positionname;       //职位名称

    private String photosrc;           //图片src

    private String positionstatus;     //状态

    private String entrydate;          //入职日期

    private String leavedate;          //离职日期

    private String isdel;              //是否删除

    private Integer deptid;            //部门id

    private String company;            //公司名称

    private String islogin;            //是否允许登录

    private String others;             //其他备注

    private String leavereason;        //离职原因

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmployeeno() {
        return employeeno;
    }

    public void setEmployeeno(Integer employeeno) {
        this.employeeno = employeeno;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename == null ? null : employeename.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getIdentityno() {
        return identityno;
    }

    public void setIdentityno(String identityno) {
        this.identityno = identityno == null ? null : identityno.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname == null ? null : positionname.trim();
    }

    public String getPhotosrc() {
        return photosrc;
    }

    public void setPhotosrc(String photosrc) {
        this.photosrc = photosrc == null ? null : photosrc.trim();
    }

    public String getPositionstatus() {
        return positionstatus;
    }

    public void setPositionstatus(String positionstatus) {
        this.positionstatus = positionstatus == null ? null : positionstatus.trim();
    }

    public String getEntrydate() {
        return entrydate;
    }

    public void setEntrydate(String entrydate) {
        this.entrydate = entrydate == null ? null : entrydate.trim();
    }

    public String getLeavedate() {
        return leavedate;
    }

    public void setLeavedate(String leavedate) {
        this.leavedate = leavedate == null ? null : leavedate.trim();
    }

    public String getIsdel() {
        return isdel;
    }

    public void setIsdel(String isdel) {
        this.isdel = isdel == null ? null : isdel.trim();
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public String getIslogin() {
        return islogin;
    }

    public void setIslogin(String islogin) {
        this.islogin = islogin == null ? null : islogin.trim();
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others == null ? null : others.trim();
    }

    public String getLeavereason() {
        return leavereason;
    }

    public void setLeavereason(String leavereason) {
        this.leavereason = leavereason == null ? null : leavereason.trim();
    }

	@Override
	public String toString() {
		return "QCEmployee [id=" + id + ", employeeno=" + employeeno
				+ ", employeename=" + employeename + ", password=" + password
				+ ", sex=" + sex + ", birthday=" + birthday + ", identityno="
				+ identityno + ", address=" + address + ", mobile=" + mobile
				+ ", qq=" + qq + ", email=" + email + ", positionid="
				+ positionid + ", positionname=" + positionname + ", photosrc="
				+ photosrc + ", positionstatus=" + positionstatus
				+ ", entrydate=" + entrydate + ", leavedate=" + leavedate
				+ ", isdel=" + isdel + ", deptid=" + deptid + ", company="
				+ company + ", islogin=" + islogin + ", others=" + others
				+ ", leavereason=" + leavereason + "]";
	}
    
    
}