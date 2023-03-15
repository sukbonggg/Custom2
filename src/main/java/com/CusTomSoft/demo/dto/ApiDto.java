package com.CusTomSoft.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class ApiDto {
	private String korean;
	private String chinese;
	private String english;



	public String getChinese() {
		return chinese;
	}

	public void setChinese(String chinese) {
		this.chinese = chinese;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public String getKorean() {
		return korean;
	}

	public void setKorean(String korean) {
		this.korean = korean;
	}

	@Override
	public String toString() {
		return "ApiDto [korean=" + korean + ", chinese=" + chinese + ", english=" + english + "]";
	}

}
