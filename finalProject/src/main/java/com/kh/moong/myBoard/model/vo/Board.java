package com.kh.moong.myBoard.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private int userNo;
	private int categoryNo;
	private String title;
	private String content;
	private int count;
	private int likeCount;
	private Date enrollDate;
	private String status;
	
	private String categoryName;
}
