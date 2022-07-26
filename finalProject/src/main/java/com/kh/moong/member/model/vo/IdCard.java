package com.kh.moong.member.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IdCard {

	private int icNo;
	private String icOriginName;
	private String icSysName;
	private String status;
	private int userNo;
}
