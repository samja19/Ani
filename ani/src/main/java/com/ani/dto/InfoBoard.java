package com.ani.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class InfoBoard {
	
	private int ib_num;
	private String ib_title;
	private String ib_content;
	private Date ib_date;
	private int ib_hits;
	private int ib_delete;
	private int memberno;
	private int in_cat_num;
	private String cat_in;
	private String id;
	
 
	private List<IBFileAttach> attachments;
	private InfoCategory category;
	public Object getInfoboardNum() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
