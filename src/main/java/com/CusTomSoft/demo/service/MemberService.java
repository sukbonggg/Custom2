package com.CusTomSoft.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.MemberDto;
import com.CusTomSoft.demo.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper membermapper;
	//중복체크
	public int idcheck(String custom_user_nick) {
		System.out.println("idcheck service--=");
		return membermapper.idcheck(custom_user_nick);
	}
	//회원가입
	public int doJoin(MemberDto memberdto) {
		System.out.println("doJoin check");
		return membermapper.doJoin(memberdto);
	}

	
	  //로그인 
//	public MemberDto doLogin(String custom_user_nick, String custom_user_pwsd) {  
//		return membermapper.doLogin(custom_user_nick,custom_user_pwsd); }
	
	
	/**
	  public MemberDto doLogin(MemberDto inputDto) {
		  return membermapper.doLogin(inputDto); 
		 
	  }
	**/
	 

	  public List<Map<Object, Object>> doLogin(MemberDto inputDto) {
		  return membermapper.doLogin(inputDto); 
		 
	  }
		
	 

}
