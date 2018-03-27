package com.ani.dto;

import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Pattern.Flag;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.ani.common.RegularExpressionUtil;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
 

@Data
@Getter @Setter
public class Member { 
	 
 
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	@Length(min=2, max=30, message="아이디는 2~30글자 이하여야 합니다")
	@Pattern(regexp=RegularExpressionUtil.reg_a0,flags= {Pattern.Flag.CASE_INSENSITIVE }
	,message="아이디에는 알파벳과 언더스코어, 숫자만 입력 해 주세요.")
	private String id;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String passwd;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String nickname;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String name;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String breeds;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")

	private String email;
	private Boolean avtive;
	private Boolean usertype;
	 
} 
