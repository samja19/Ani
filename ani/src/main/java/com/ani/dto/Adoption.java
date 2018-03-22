package com.ani.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter @Setter
public class Adoption {
	int adopttionno;
	int anino;
	String phone;
	String address;
	String reason;
}
