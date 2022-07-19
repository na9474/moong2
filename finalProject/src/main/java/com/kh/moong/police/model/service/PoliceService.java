package com.kh.moong.police.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.police.model.vo.Police;
import com.kh.moong.police.model.vo.PoliceCmt;

public interface PoliceService {
	
	//게시글 신고하기
	int addPolice(Police p);
	
	//게시글 신고삭제
	public abstract int deletePolice(int p_No);
	
	//게시글 전체 신고수
	int policeListCount();
	
	//게시글 신고 리스트
	ArrayList<Police> policeList(PageInfo pi);
	
	//댓글 신고하기
	int addPoliceCmt(PoliceCmt pc);
	
	//댓글 신고삭제
	public abstract int deletePoliceCmt(int pc_No);
	
	//댓글 전체 신고수
	int policeCmtListCount();
	
	//댓글 신고 리스트
	ArrayList<PoliceCmt> policeCmtList(PageInfo pi);
}
