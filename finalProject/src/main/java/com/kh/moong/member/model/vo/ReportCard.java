package com.kh.moong.member.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportCard {
	
	private int rcNo;
	private String rcOriginName;
	private String rcSysName;
	private String status;
	private int userNo;
}
