package com.CusTomSoft.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class BoardDto {
	private int board_seq	;	/*시퀀스*/
	private String board_title;	/*게시판 제목*/
	private String board_text;    /*게시판 내용*/
	private String board_writer;	/*게시판 작성자*/
	private String board_reg_date;    /*게시판 등록시간*/
	private String board_mod_date;	/*유저 생년월일*/
	private String board_img_path;	/*유저 휴대폰번호*/
	private String board_del_yn; /*게시글 삭제여부*/
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(String board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getBoard_mod_date() {
		return board_mod_date;
	}
	public void setBoard_mod_date(String board_mod_date) {
		this.board_mod_date = board_mod_date;
	}
	public String getBoard_img_path() {
		return board_img_path;
	}
	public void setBoard_img_path(String board_img_path) {
		this.board_img_path = board_img_path;
	}
	public String getBoard_del_yn() {
		return board_del_yn;
	}
	public void setBoard_del_yn(String board_del_yn) {
		this.board_del_yn = board_del_yn;
	}

}
