package com.kh.moong.matching.model.service;

import java.util.ArrayList;

import com.kh.moong.matching.model.vo.Matching;

public interface MatchingService {

	int checkMatching(Matching m);

	int insertMatching(Matching m);

	int joinMatching(Matching m);

	int countMatching(Matching m);

	int checkSubject(Matching m);

	ArrayList<Matching> completeMatching(Matching m);

}
