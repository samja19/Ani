package com.ani.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InfoBoard {
	
	private int ib_num;
	private String id;
	private String ib_title;
	private String ib_content;
	private Date ib_date;
	private int ib_hits;
	private String ib_delete;
	private int ib_member_no;
	
	private int in_cat_num;
	private List<IBFileAttach> attachments;
	
	public List<IBFileAttach> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<IBFileAttach> attachments) {
		this.attachments = attachments;
	}
	private String cat_in;
	
	public String getCat_in() {
		return cat_in;
	}
	public void setCat_in(String cat_in) {
		this.cat_in = cat_in;
	}
	public int getIb_num() {
		return ib_num;
	}
	public void setIb_num(int ib_num) {
		this.ib_num = ib_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIb_title() {
		return ib_title;
	}
	public void setIb_title(String ib_title) {
		this.ib_title = ib_title;
	}
	public String getIb_content() {
		return ib_content;
	}
	public void setIb_content(String ib_content) {
		this.ib_content = ib_content;
	}
	public Date getIb_date() {
		return ib_date;
	}
	public void setIb_date(Date ib_date) {
		this.ib_date = ib_date;
	}
	public int getIb_hits() {
		return ib_hits;
	}
	public void setIb_hits(int ib_hits) {
		this.ib_hits = ib_hits;
	}
	public String getIb_delete() {
		return ib_delete;
	}
	public void setIb_delete(String ib_delete) {
		this.ib_delete = ib_delete;
	}
	public int getIb_member_no() {
		return ib_member_no;
	}
	public void setIb_member_no(int ib_member_no) {
		this.ib_member_no = ib_member_no;
	}
	
	public int getIn_cat_num() {
		return in_cat_num;
	}
	public void setIn_cat_num(int in_cat_num) {
		this.in_cat_num = in_cat_num;
	}
	public int getinfoboardHits() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
