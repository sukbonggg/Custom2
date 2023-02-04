package com.CusTomSoft.demo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.MemberDto;
import com.CusTomSoft.demo.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper membermapper;
	
	public int idcheck(String custom_user_nick) {
		System.out.println("idcheck service--=");
		return membermapper.idcheck(custom_user_nick);
	}

	public int doJoin(MemberDto memberdto) {
		System.out.println("doJoin check");
		return membermapper.doJoin(memberdto);
	}

}
