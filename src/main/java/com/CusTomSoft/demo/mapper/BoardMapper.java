package com.CusTomSoft.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.CusTomSoft.demo.dto.BoardDto;

@Mapper
public interface BoardMapper {

	int writeBoard(BoardDto dto);
	
	List<BoardDto> listBoard(String searchKeyword); 
}
