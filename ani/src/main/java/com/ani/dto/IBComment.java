package com.ani.dto;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter

public class IBComment {
	
	private int ibc_num;
	private String ibc_content;
	private Date ibc_write_date;
	private int ib_num;
	private int memberno;
	private int ibc_delete;
	
	
}
