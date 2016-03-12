package com.jdk2010.util;

import java.util.Date;

public class Member {
	private int id;
	private String cloginname;
	private String cnickname;
	private String cname;
	private String csex;
	private Date dbirthday;
	private String ctel;
	private String cemail;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCloginname() {
		return cloginname;
	}

	public void setCloginname(String cloginname) {
		this.cloginname = cloginname;
	}

	public String getCnickname() {
		return cnickname;
	}

	public void setCnickname(String cnickname) {
		this.cnickname = cnickname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCsex() {
		return csex;
	}

	public void setCsex(String csex) {
		this.csex = csex;
	}

	public Date getDbirthday() {
		return dbirthday;
	}

	public void setDbirthday(Date dbirthday) {
		this.dbirthday = dbirthday;
	}

	public String getCtel() {
		return ctel;
	}

	public void setCtel(String ctel) {
		this.ctel = ctel;
	}

	public String getCemail() {
		return cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

}
