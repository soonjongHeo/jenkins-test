package com.example.spring01.model.dto;

import java.util.Date;

public class AdminDTO {
	private String adminId;
	private String passwd;
	private String name;
	private String email;
	private Date joinDate;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	public AdminDTO() {
	}
	
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", passwd=" + passwd + ", name=" + name + ", email=" + email
				+ ", joinDate=" + joinDate + "]";
	}
	
	
}
