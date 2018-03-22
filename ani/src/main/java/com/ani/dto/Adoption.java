package com.ani.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class Adoption {
	int adoptionno;
	int anino;
	String phone;
	String address;
	String reason;
}