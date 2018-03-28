package com.ani.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class Adoption {
	int adoptionno;
	int anino;
	int memberno;
	String phone;
	String address;
	String addressDetail;
	String postcode;
	String reason;
}
