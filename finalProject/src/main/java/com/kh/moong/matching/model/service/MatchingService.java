package com.kh.moong.matching.model.service;

import java.util.ArrayList;

import com.kh.moong.matching.model.vo.Matching;

public interface MatchingService {

	int checkMatching(Matching m);

	int insertMatching(Matching m);

	int joinMatching(Matching m);

	int countMatching(int groupNo);

	int checkSubject(Matching m);

	ArrayList<Matching> completeMatchingList(int groupNo);

	int completeMatching(int groupNo);

	ArrayList<Matching> alarmList(int userNo);

	int matchingAlarm(int userNo);

	int matchingAlarm2(int userNo);

	int updateAlarm(int maNo);

	int tlistCheck(int userNo);

	Matching selectcomparison(int userNo);

	

	int deleteMatching(int maNo);

	

}
