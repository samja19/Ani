package com.ani.dto;

import java.util.Date;

public class IBComment {
	
	private int ibc_num;
	private String ibc_content;
	private Date ibc_write_date;
	private String id;
	private int ib_num;
	private int ib_member_no;
	private int ibc_delete;
	
	public int getIbc_delete() {
		return ibc_delete;
	}
	public void setIbc_delete(int ibc_delete) {
		this.ibc_delete = ibc_delete;
	}
	public int getIbc_num() {
		return ibc_num;
	}
	public void setIbc_num(int ibc_num) {
		this.ibc_num = ibc_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIb_num() {
		return ib_num;
	}
	public void setIb_num(int ib_num) {
		this.ib_num = ib_num;
	}
	public String getIbc_content() {
		return ibc_content;
	}
	public void setIbc_content(String ibc_content) {
		this.ibc_content = ibc_content;
	}
	public Date getIbc_write_date() {
		return ibc_write_date;
	}
	public void setIbc_write_date(Date ibc_write_date) {
		this.ibc_write_date = ibc_write_date;
	}
	
	public int getIb_member_no() {
		return ib_member_no;
	}
	public void setIb_member_no(int ib_member_no) {
		this.ib_member_no = ib_member_no;
	}
}
