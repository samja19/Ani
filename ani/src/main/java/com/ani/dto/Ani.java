package com.ani.dto;

import java.sql.Date;
import java.util.ArrayList;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
 

public class Ani { 
	
	//ani와 aniAttach, aniComment간의 1:Many 관계를 구현하는 필드
	//private ArrayList<AniComment> comments;
	private ArrayList<AniAttach> attachments;
	
	private int aniNo;
	private Date aniRegdate;
	private int aniDel;
	private int aniHits;
	private int attention;
	private int memberNo;
	
	@NotNull(message="필수 선택 항목 입니다.")
	private int speciesNo;	

	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String aniBreed;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String aniName;
	
	@NotNull(message="필수 입력 항목 입니다.")
	private Date aniBirth; 
	
	@NotNull(message="필수 선택 항목 입니다.")
	private String aniGender;	
	
	@NotNull(message="필수 선택 항목 입니다.")
	private String neuter;	
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String aniSite;
	
	@NotNull(message="필수 입력 항목 입니다.")
	@NotBlank(message="필수 입력 항목 입니다.")
	private String aniInfo;

	
	public ArrayList<AniAttach> getAttachments() {
		return attachments;
	}

	public void setAttachments(ArrayList<AniAttach> attachments) {
		this.attachments = attachments;
	}
	
	public int getAniNo() {
		return aniNo;
	}

	public void setAniNo(int aniNo) {
		this.aniNo = aniNo;
	}

	public Date getAniRegdate() {
		return aniRegdate;
	}

	public void setAniRegdate(Date aniRegdate) {
		this.aniRegdate = aniRegdate;
	}

	public int getAniDel() {
		return aniDel;
	}

	public void setAniDel(int aniDel) {
		this.aniDel = aniDel;
	}

	public int getAniHits() {
		return aniHits;
	}

	public void setAniHits(int aniHits) {
		this.aniHits = aniHits;
	}

	public int getAttention() {
		return attention;
	}

	public void setAttention(int attention) {
		this.attention = attention;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getSpeciesNo() {
		return speciesNo;
	}

	public void setSpeciesNo(int speciesNo) {
		this.speciesNo = speciesNo;
	}

	public String getAniBreed() {
		return aniBreed;
	}

	public void setAniBreed(String aniBreed) {
		this.aniBreed = aniBreed;
	}

	public String getAniName() {
		return aniName;
	}

	public void setAniName(String aniName) {
		this.aniName = aniName;
	}

	public Date getAniBirth() {
		return aniBirth;
	}

	public void setAniBirth(Date aniBirth) {
		this.aniBirth = aniBirth;
	}

	public String getAniGender() {
		return aniGender;
	}

	public void setAniGender(String aniGender) {
		this.aniGender = aniGender;
	}

	public String getNeuter() {
		return neuter;
	}

	public void setNeuter(String neuter) {
		this.neuter = neuter;
	}

	public String getAniSite() {
		return aniSite;
	}

	public void setAniSite(String aniSite) {
		this.aniSite = aniSite;
	}

	public String getAniInfo() {
		return aniInfo;
	}

	public void setAniInfo(String aniInfo) {
		this.aniInfo = aniInfo;
	}


	
	

}
