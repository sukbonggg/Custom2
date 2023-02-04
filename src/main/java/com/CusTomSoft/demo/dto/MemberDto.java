package com.CusTomSoft.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class MemberDto {
	private int custom_user_seq	;	/*시퀀스*/
	private String custom_user_name;	/*유저 이름*/
	private String custom_user_nick;    /*유저 닉네임*/
	private String custom_user_email;	/*유저 메일*/
	private String custom_user_pwsd;    /*유저 비밀번호*/
	private String custom_user_brith;	/*유저 생년월일*/
	private String custom_user_phone;	/*유저 휴대폰번호*/
	private String custom_user_addr; /*유저 주소	*/
	private String custom_user_auth ;   /*유저 권한*/
	private String custom_user_del_yn;	/*유저 삭제여부*/
	public int getCustom_user_seq() {
		return custom_user_seq;
	}
	public void setCustom_user_seq(int custom_user_seq) {
		this.custom_user_seq = custom_user_seq;
	}
	public String getCustom_user_name() {
		return custom_user_name;
	}
	public void setCustom_user_name(String custom_user_name) {
		this.custom_user_name = custom_user_name;
	}
	public String getCustom_user_nick() {
		return custom_user_nick;
	}
	public void setCustom_user_nick(String custom_user_nick) {
		this.custom_user_nick = custom_user_nick;
	}
	public String getCustom_user_email() {
		return custom_user_email;
	}
	public void setCustom_user_email(String custom_user_email) {
		this.custom_user_email = custom_user_email;
	}
	public String getCustom_user_pwsd() {
		return custom_user_pwsd;
	}
	public void setCustom_user_pwsd(String custom_user_pwsd) {
		this.custom_user_pwsd = custom_user_pwsd;
	}
	public String getCustom_user_brith() {
		return custom_user_brith;
	}
	public void setCustom_user_brith(String custom_user_brith) {
		this.custom_user_brith = custom_user_brith;
	}
	public String getCustom_user_phone() {
		return custom_user_phone;
	}
	public void setCustom_user_phone(String custom_user_phone) {
		this.custom_user_phone = custom_user_phone;
	}
	public String getCustom_user_addr() {
		return custom_user_addr;
	}
	public void setCustom_user_addr(String custom_user_addr) {
		this.custom_user_addr = custom_user_addr;
	}
	public String getCustom_user_auth() {
		return custom_user_auth;
	}
	public void setCustom_user_auth(String custom_user_auth) {
		this.custom_user_auth = custom_user_auth;
	}
	public String getCustom_user_del_yn() {
		return custom_user_del_yn;
	}
	public void setCustom_user_del_yn(String custom_user_del_yn) {
		this.custom_user_del_yn = custom_user_del_yn;
	}
	
	
	
	  
	 


}
