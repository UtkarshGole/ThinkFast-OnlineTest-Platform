package com.online.jdbc.dto;

import java.io.Serializable;

public class StudentsDto implements Serializable {
    private String studid;
    private String sname;
    private String password;
    private String email;
    
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStudid() {
		return studid;
	}
	public void setStudid(String studid) {
		this.studid = studid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
}
