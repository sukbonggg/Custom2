package com.CusTomSoft.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CusTomSoft.demo.dto.BoardDto;
import com.CusTomSoft.demo.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardmapper;

	//게시물 작성
	public int writeBoard(BoardDto dto) {
		return boardmapper.writeBoard(dto);
	}
	//게시물 리스트 ,검색기능
	public List<BoardDto> listBoard(String searchKeyword) {
		return  boardmapper.listBoard(searchKeyword);
	}


}
