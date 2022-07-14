package com.kh.moong.police.model.service;

import java.util.ArrayList;

import com.kh.moong.common.model.vo.PageInfo;
import com.kh.moong.police.model.vo.Police;

public interface PoliceService {
	
	//신고하기
	int addPolice(Police p);
	
	//신고삭제
	public abstract int deletePolice(int soltionNo);

	//신고 리스트
	
}
