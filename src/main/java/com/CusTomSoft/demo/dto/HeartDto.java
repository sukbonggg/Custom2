package com.CusTomSoft.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class HeartDto {
	
	private int board_seq;
	private String custom_user_nick;
	
	
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getCustom_user_nick() {
		return custom_user_nick;
	}
	public void setCustom_user_nick(String custom_user_nick) {
		this.custom_user_nick = custom_user_nick;
	}
	
	
	

}
