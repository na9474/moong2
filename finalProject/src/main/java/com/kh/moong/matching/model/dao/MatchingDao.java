package com.kh.moong.matching.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.moong.matching.model.vo.Matching;
import com.kh.moong.matching.model.vo.Room;
import com.kh.moong.matching.model.vo.Talarm;

@Repository
public class MatchingDao {

	public int checkMatching(SqlSessionTemplate sqlSession, Matching m) {
		
		
		try{
			int result = sqlSession.selectOne("MatchingMapper.checkMatching",m);
			System.out.println(result);
		return result;
	}catch (NullPointerException e){
	    return 0;
	}
	}

	public int insertMatching(SqlSessionTemplate sqlSession, Matching m) {
		
			return  sqlSession.insert("MatchingMapper.insertMatching",m);
	}

	public int joinMatching(SqlSessionTemplate sqlSession, Matching m) {
		return sqlSession.insert("MatchingMapper.joinMatching",m);
	}

	public int countMatching(SqlSessionTemplate sqlSession,int groupNo) {
		
		return sqlSession.selectOne("MatchingMapper.countMatching",groupNo);
	}

	public int checkSubject(SqlSessionTemplate sqlSession, Matching m) {
	
		return sqlSession.selectOne("MatchingMapper.checkSubject",m);
	}

	public ArrayList<Matching> completeMatchingList(SqlSessionTemplate sqlSession, int groupNo) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.completeMatchingList",groupNo);
	}

	public int completeMatching(SqlSessionTemplate sqlSession, int groupNo) {
		
		return sqlSession.update("MatchingMapper.completeMatching",groupNo);
	}

	public ArrayList<Matching> alarmList(SqlSessionTemplate sqlSession, int userNo) {
		
		return (ArrayList)sqlSession.selectList("MatchingMapper.alarmList",userNo);
	}

	public int matchingAlarm(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("MatchingMapper.matchingAlarm",userNo);
	}

	public int matchingAlarm2(SqlSessionTemplate sqlSession, int userNo) {
		
		try{
			int result = sqlSession.selectOne("MatchingMapper.matchingAlarm2",userNo);
			
		return result;
	}catch (NullPointerException e){
	    return 0;
	}
	}

	public int updateAlarm(SqlSessionTemplate sqlSession, int maNo) {
		
		return sqlSession.update("MatchingMapper.updateAlarm",maNo);
	}

	public int tlistCheck(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("MatchingMapper.tlistCheck",userNo);
	}

	public Matching selectComparison(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("MatchingMapper.selectComparison",userNo);
	}

public int deleteMatching(SqlSessionTemplate sqlSession, int maNo) {
		
		return sqlSession.delete("MatchingMapper.deleteMatching",maNo);
	}

public int cheifCheck(SqlSessionTemplate sqlSession, int userNo) {
	
	return sqlSession.selectOne("MatchingMapper.cheifCheck",userNo);
}

public Matching cheifCheck2(SqlSessionTemplate sqlSession, int userNo) {
	
	return sqlSession.selectOne("MatchingMapper.cheifCheck2",userNo);
}

public int sendUrl(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.update("MatchingMapper.sendUrl",groupNo);
}

public Room selectUrl(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.selectOne("RoomMapper.selectUrl",groupNo);
}

public int checkUrl(SqlSessionTemplate sqlSession, int userNo) {

	return sqlSession.update("MatchingMapper.checkUrl",userNo);
}

public int insertTAlarm(SqlSessionTemplate sqlSession, Talarm t) {
	
	return sqlSession.insert("MatchingMapper.insertTAlarm",t);
}

public ArrayList<Talarm> checkGroupNo(SqlSessionTemplate sqlSession, int userNo) {
	ArrayList<Talarm> t = null;
		
	try {
		 t= (ArrayList)sqlSession.selectList("MatchingMapper.checkGroupNo",userNo);
		 return t;
	}catch(NullPointerException e) {
		return t;
	}
	
	
}

public Matching matchingInfo(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.selectOne("MatchingMapper.matchingInfo",groupNo);
}

public Room matchingURL(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.selectOne("RoomMapper.selectUrl",groupNo);
}

public int updateSendUrl(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.update("MatchingMapper.updateSendUrl",groupNo);
}

public int talarmStatusUpdate(SqlSessionTemplate sqlSession, int groupNo) {
	
	return sqlSession.update("MatchingMapper.talarmStatusUpdate",groupNo);
}

public int checkSendUrl(SqlSessionTemplate sqlSession, int userNo) {
	
	return sqlSession.selectOne("MatchingMapper.checkSendUrl",userNo);
}

public int checkSendUrlUpdate(SqlSessionTemplate sqlSession, int userNo) {
	
	return sqlSession.update("MatchingMapper.checkSendUrlUpdate",userNo);
}

public int checkSendUrl2(SqlSessionTemplate sqlSession, int userNo) {
	
	return sqlSession.selectOne("MatchingMapper.checkSendUrl2",userNo);
}


}
