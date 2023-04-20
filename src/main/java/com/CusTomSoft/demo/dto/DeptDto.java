package com.CusTomSoft.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
public class DeptDto {
	private String DEPT_CD;
	private String DEPT_NM;
	private String DEPTINFO_CD;
	private String DEPTINFO_NM;
	private String COMPANY_CD;
	private String INSERT_DATE;
	private String INSERT_UID;
	private String UPDATE_DATE;
	private String UPDATE_UID;
	public String getDEPT_CD() {
		return DEPT_CD;
	}
	public void setDEPT_CD(String dEPT_CD) {
		DEPT_CD = dEPT_CD;
	}
	public String getDEPT_NM() {
		return DEPT_NM;
	}
	public void setDEPT_NM(String dEPT_NM) {
		DEPT_NM = dEPT_NM;
	}
	public String getCOMPANY_CD() {
		return COMPANY_CD;
	}
	public void setCOMPANY_CD(String cOMPANY_CD) {
		COMPANY_CD = cOMPANY_CD;
	}
	public String getINSERT_DATE() {
		return INSERT_DATE;
	}
	public void setINSERT_DATE(String iNSERT_DATE) {
		INSERT_DATE = iNSERT_DATE;
	}
	public String getINSERT_UID() {
		return INSERT_UID;
	}
	public void setINSERT_UID(String iNSERT_UID) {
		INSERT_UID = iNSERT_UID;
	}
	public String getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(String uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	public String getUPDATE_UID() {
		return UPDATE_UID;
	}
	public void setUPDATE_UID(String uPDATE_UID) {
		UPDATE_UID = uPDATE_UID;
	}
	public String getDEPTINFO_CD() {
		return DEPTINFO_CD;
	}
	public void setDEPTINFO_CD(String dEPTINFO_CD) {
		DEPTINFO_CD = dEPTINFO_CD;
	}
	public String getDEPTINFO_NM() {
		return DEPTINFO_NM;
	}
	public void setDEPTINFO_NM(String dEPTINFO_NM) {
		DEPTINFO_NM = dEPTINFO_NM;
	}



}
