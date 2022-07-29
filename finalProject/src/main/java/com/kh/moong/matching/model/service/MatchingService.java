package com.kh.moong.matching.model.service;

import java.util.ArrayList;

import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;
import com.kh.moong.matching.model.vo.Talarm;

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

	int cheifCheck(int userNo);

	Matching cheifCheck2(int userNo);

	int sendUrl(int groupNo);

	Room selectUrl(int groupNo);

	int checkUrl(int userNo);

	int insertTAlarm(Talarm t);

	ArrayList<Talarm> checkGroupNo(int userNo);

	Matching matchingInfo(int groupNo);

	Room matchingURL(int groupNo);

	int updateSendUrl(int groupNo);

	int talarmStatusUpdate(int groupNo);

	int checkSendUrl(int userNo);

	int checkSendUrlUpdate(int userNo);

	int checkSendUrl2(int userNo);

	

	

	

}
