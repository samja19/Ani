package com.ani.dto;

import java.sql.Date;
import java.util.ArrayList;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonFormat;
 

public class Ani { 
	
	//ani�� aniAttach, aniComment媛꾩쓽 1:Many 愿�怨꾨�� 援ы쁽�븯�뒗 �븘�뱶
	//private ArrayList<AniComment> comments;
	private ArrayList<AniAttach> attachments;
	
	private int aniNo;
	
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date aniRegdate;
	private int aniDel;
	private int aniHits;
	private int attention;
	private int memberNo;
    private String speciesName;
	
	@NotNull(message="�븘�닔 �꽑�깮 �빆紐� �엯�땲�떎.")
	private int speciesNo;	

	@NotNull(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	@NotBlank(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	private String aniBreed;
	
	@NotNull(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	@NotBlank(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	private String aniName;
	
	@JsonFormat
    (shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@NotNull(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	private Date aniBirth; 
	
	@NotNull(message="�븘�닔 �꽑�깮 �빆紐� �엯�땲�떎.")
	private String aniGender;	
	
	@NotNull(message="�븘�닔 �꽑�깮 �빆紐� �엯�땲�떎.")
	private String neuter;	
	
	@NotNull(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	@NotBlank(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	private String aniSite;
	
	@NotNull(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
	@NotBlank(message="�븘�닔 �엯�젰 �빆紐� �엯�땲�떎.")
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

	public String getSpeciesName() {
		return speciesName;
	}

	public void setSpeciesName(String speciesName) {
		this.speciesName = speciesName;
	}
	
	

	
	

}
