package com.CusTomSoft.demo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.dto.MemberDto;

@Mapper
public interface MemberMapper {

	int idcheck(String custom_user_nick);

	int doJoin(MemberDto memberdto);

	List<Map<Object, Object>> doLogin(MemberDto inputDto);

	List<MemberDto> getGrid();

	List<Map<String, Object>> dolist();

	int checkemail(String custom_user_email);
}
